<#
.SYNOPSIS
  Install the Claude UI skill into one or more AI coding agents.

.EXAMPLE
  ./install.ps1                       # auto-detect installed agents, user scope
  ./install.ps1 -Agent claude,cursor  # specific agents
  ./install.ps1 -Agent all -Scope project   # into the current project
  ./install.ps1 -Dest D:\my\skills    # custom skills directory
  ./install.ps1 -Uninstall            # remove from detected agents
#>
[CmdletBinding()]
param(
  [ValidateSet('auto','all','claude','codex','cursor','gemini','antigravity','agents')]
  [string[]]$Agent = @('auto'),
  [ValidateSet('user','project')]
  [string]$Scope = 'user',
  [string]$Dest,
  [switch]$Uninstall
)

$ErrorActionPreference = 'Stop'
$Name    = 'claude-ui'
$Root    = $PSScriptRoot
$Skill   = Join-Path $Root "skills\$Name"
$HomeDir = if ($env:USERPROFILE) { $env:USERPROFILE } else { [Environment]::GetFolderPath('UserProfile') }
$Cwd     = (Get-Location).Path

if (-not (Test-Path (Join-Path $Skill 'SKILL.md'))) { throw "SKILL.md not found under $Skill" }

# agent -> (user skills dir, project skills dir, detection dir)
$Targets = [ordered]@{
  claude      = @("$HomeDir\.claude\skills",                "$Cwd\.claude\skills",  "$HomeDir\.claude")
  codex       = @("$HomeDir\.codex\skills",                 "$Cwd\.codex\skills",   "$HomeDir\.codex")
  cursor      = @("$HomeDir\.cursor\skills",                "$Cwd\.cursor\skills",  "$HomeDir\.cursor")
  gemini      = @("$HomeDir\.gemini\skills",                "$Cwd\.gemini\skills",  "$HomeDir\.gemini")
  antigravity = @("$HomeDir\.gemini\config\plugins",        "$Cwd\.agents\skills",  "$HomeDir\.gemini\antigravity")
  agents      = @("$HomeDir\.agents\skills",                "$Cwd\.agents\skills",  "$HomeDir\.agents")
}

function Install-To([string]$dir, [string]$label, [bool]$asPlugin) {
  $target = Join-Path $dir $Name
  if ($Uninstall) {
    if (Test-Path $target) { Remove-Item -Recurse -Force $target; Write-Host "  - removed  $label -> $target" -ForegroundColor Yellow }
    else { Write-Host "  · skipped  $label (not installed)" -ForegroundColor DarkGray }
    return
  }
  if (Test-Path $target) {
    try { Remove-Item -Recurse -Force $target -ErrorAction Stop }
    catch { Get-ChildItem -Path $target -Recurse -File | Remove-Item -Force -ErrorAction SilentlyContinue }
  }
  New-Item -ItemType Directory -Force $target | Out-Null
  if ($asPlugin) {
    # Antigravity plugin bundle: manifest + logo + skills
    Copy-Item -Force (Join-Path $Root 'plugin.json') $target
    Copy-Item -Force (Join-Path $Root 'README.md')   $target -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Force (Join-Path $target 'assets') | Out-Null
    Copy-Item -Force (Join-Path $Root 'assets\logo.svg') (Join-Path $target 'assets\logo.svg')
    New-Item -ItemType Directory -Force (Join-Path $target 'skills') | Out-Null
    Copy-Item -Recurse -Force $Skill (Join-Path $target 'skills')
  } else {
    Copy-Item -Recurse -Force "$Skill\*" $target
  }
  Write-Host "  + installed $label -> $target" -ForegroundColor Green
}

Write-Host ""
Write-Host "Claude UI $(if ($Uninstall) {'uninstaller'} else {'installer'})" -ForegroundColor Cyan

if ($Dest) {
  Install-To $Dest 'custom' $false
  return
}

$selected = @()
if ($Agent -contains 'all') { $selected = @($Targets.Keys) }
elseif ($Agent -contains 'auto') {
  $selected = @($Targets.Keys | Where-Object { Test-Path $Targets[$_][2] })
  # antigravity lives inside ~/.gemini; don't double-install gemini unless Gemini CLI is present
  if (($selected -contains 'antigravity') -and -not (Test-Path "$HomeDir\.gemini\settings.json")) {
    $selected = @($selected | Where-Object { $_ -ne 'gemini' })
  }
  if ($selected.Count -eq 0) { $selected = @('agents') }
}
else { $selected = $Agent }

$idx = if ($Scope -eq 'user') { 0 } else { 1 }
$projectDirsDone = @{}
foreach ($a in $selected) {
  $dir = $Targets[$a][$idx]
  if ($Scope -eq 'project') {
    if ($projectDirsDone.ContainsKey($dir)) { continue }  # antigravity & agents share .agents/skills
    $projectDirsDone[$dir] = $true
  }
  $asPlugin = ($a -eq 'antigravity' -and $Scope -eq 'user')
  Install-To $dir $a $asPlugin
}

Write-Host ""
if (-not $Uninstall) { Write-Host "Done. Restart your agent so it discovers the new skill." -ForegroundColor Cyan }
