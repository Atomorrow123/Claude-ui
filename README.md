<p align="center">
  <img src="assets/logo.svg" width="96" alt="Claude UI logo">
</p>

<h1 align="center">Claude UI</h1>

<p align="center">一套有明确审美立场的前端 UI 构建指南 · 适用于任何支持 Agent Skills 的 AI 编程助手</p>

<p align="center">
  <a href="https://github.com/Atomorrow123/Claude-ui">GitHub</a> ·
  <a href="https://github.com/Atomorrow123/Claude-ui/releases">Releases</a> ·
  作者：齐天大圣123 &amp; Claude Code
</p>

---

## 这是什么

Claude UI 是一个 [Agent Skill](https://agentskills.io)（`SKILL.md` 标准格式）。安装后，当你让 AI 助手"做个好看的页面""优化 UI""去掉 AI 味"时，它会自动加载这套指南，按以下流程工作：

**设计简报 → Token 先行 → 灰度骨架 → 组件与全部状态 → 打磨 → 自检清单**

包含内容：

| 文件 | 内容 |
|---|---|
| `SKILL.md` | 核心信条、工作流、排版/色彩/间距/动效规范、中文排版、可访问性、反 AI 味清单、交付自检清单 |
| `references/tokens.css` | OKLCH 设计 token 模板（亮/暗模式、Tailwind v4 映射） |
| `references/aesthetic-directions.md` | 6 种审美方向：Claude 原生、编辑排版、瑞士极简、暗色精密、柔和亲和、新粗野主义 |
| `references/components.md` | 按钮、表单、卡片、导航、表格、弹窗、Toast、空状态等组件配方 |
| `references/anti-patterns.md` | 17 条"AI 味"反模式及替代方案 |

---

## 安装

### 方式一：安装脚本（推荐，自动识别已装的 Agent）

先获取代码：

```bash
git clone https://github.com/Atomorrow123/Claude-ui.git
cd Claude-ui
```

或从 [Releases](https://github.com/Atomorrow123/Claude-ui/releases) 下载 `claude-ui-<version>.zip` 解压。然后：

```powershell
# Windows
./install.ps1                          # 自动检测，安装到用户级
./install.ps1 -Agent claude,cursor     # 指定 Agent
./install.ps1 -Agent all -Scope project  # 安装到当前项目
./install.ps1 -Uninstall               # 卸载
```

```bash
# macOS / Linux
./install.sh                           # 自动检测，安装到用户级
./install.sh claude cursor             # 指定 Agent
./install.sh --project all             # 安装到当前项目
./install.sh --uninstall               # 卸载
```

支持的 Agent 与安装位置：

| Agent | 用户级 | 项目级 |
|---|---|---|
| Claude Code | `~/.claude/skills/claude-ui` | `.claude/skills/claude-ui` |
| OpenAI Codex | `~/.codex/skills/claude-ui` | `.codex/skills/claude-ui` |
| Cursor | `~/.cursor/skills/claude-ui` | `.cursor/skills/claude-ui` |
| Gemini CLI | `~/.gemini/skills/claude-ui` | `.gemini/skills/claude-ui` |
| Antigravity | `~/.gemini/config/plugins/claude-ui`（插件） | `.agents/skills/claude-ui` |
| 通用 (`.agents`) | `~/.agents/skills/claude-ui` | `.agents/skills/claude-ui` |

自定义路径：`./install.ps1 -Dest <skills目录>` / `./install.sh --dest <skills目录>`

### 方式二：各平台原生插件机制

本仓库同时是以下格式的合法包：

**Claude Code 插件市场**
```bash
claude plugin marketplace add Atomorrow123/Claude-ui
claude plugin install claude-ui@claude-ui-marketplace
```
或在 Claude Code 内：`/plugin marketplace add Atomorrow123/Claude-ui`

**Gemini CLI 扩展**
```bash
gemini extensions install https://github.com/Atomorrow123/Claude-ui
```

**Antigravity 插件**
```powershell
git clone https://github.com/Atomorrow123/Claude-ui.git; cd Claude-ui; ./install.ps1 -Agent antigravity
```
（即复制到 `~/.gemini/config/plugins/claude-ui/`），然后重启 Antigravity。

**Claude.ai / Claude 桌面版**
从 [Releases](https://github.com/Atomorrow123/Claude-ui/releases) 下载 `claude-ui-skill.zip`，在 *Settings → Capabilities → Skills* 上传。

### 方式三：手动

把 `skills/claude-ui/` 整个文件夹复制到你的 Agent 的 skills 目录即可。
不支持 Skills 的工具（如部分 IDE 助手）：把 `SKILL.md` 内容粘贴进其规则文件（`AGENTS.md`、`.cursorrules`、`.windsurfrules`、`.github/copilot-instructions.md` 等）。

---

## 使用

安装并重启 Agent 后，直接说：

- "用 Claude UI 给我做一个 AI 写作工具的落地页"
- "按 Claude UI 的自检清单审查当前页面"
- "这个后台太丑了，帮我按瑞士极简方向重构"
- "给项目生成一套亮/暗模式的设计 token"

---

## 打包

```powershell
./build.ps1   # 生成 dist/claude-ui-<version>.zip（完整包）和 dist/claude-ui-skill.zip（仅技能）
```

## 目录结构

```
claude-ui/
├── .claude-plugin/
│   ├── plugin.json          # Claude Code 插件清单
│   └── marketplace.json     # Claude Code 自托管市场
├── plugin.json              # Antigravity 插件清单
├── gemini-extension.json    # Gemini CLI 扩展清单
├── assets/logo.svg
├── skills/claude-ui/        # ← 技能本体（唯一事实来源）
│   ├── SKILL.md
│   └── references/
├── install.ps1 / install.sh # 跨 Agent 安装脚本
├── build.ps1                # 打包脚本
└── LICENSE
```

## 作者

- **齐天大圣123** — [@Atomorrow123](https://github.com/Atomorrow123)
- **Claude Code**

欢迎提 [Issue](https://github.com/Atomorrow123/Claude-ui/issues) 和 PR。

## License

[MIT](LICENSE) © 2026 齐天大圣123 & Claude Code
