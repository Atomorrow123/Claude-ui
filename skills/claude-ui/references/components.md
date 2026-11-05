# 组件配方

所有示例只引用 [tokens.css](tokens.css) 中的语义变量。框架无关，可直接翻译为 Tailwind / CSS Modules / styled-components。

---

## 按钮 Button

**层级**：Primary（每视图 1 个）› Secondary › Ghost › Link；Danger 独立。
**尺寸**：sm 32px / md 40px / lg 48px 高；水平内边距 ≈ 高度 × 0.4。

```css
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: var(--space-2);
  height: 40px; padding: 0 var(--space-4);
  font: var(--weight-medium) var(--text-sm)/1 var(--font-body);
  border-radius: var(--radius-sm);
  border: 1px solid transparent;
  cursor: pointer; white-space: nowrap;
  transition: background-color var(--duration-fast) var(--ease-out),
              border-color var(--duration-fast) var(--ease-out),
              transform var(--duration-fast) var(--ease-out);
}
.btn:active:not(:disabled) { transform: scale(0.98); }
.btn:disabled { opacity: 0.5; cursor: not-allowed; }

.btn-primary   { background: var(--accent); color: var(--text-on-accent); }
.btn-primary:hover:not(:disabled) { background: var(--accent-hover); }

.btn-secondary { background: var(--surface); color: var(--text); border-color: var(--border-strong); box-shadow: var(--shadow-sm); }
.btn-secondary:hover:not(:disabled) { background: var(--surface-sunken); }

.btn-ghost     { background: transparent; color: var(--text-secondary); }
.btn-ghost:hover:not(:disabled) { background: var(--surface-sunken); color: var(--text); }

.btn-danger    { background: var(--danger); color: white; }
```

**要点**
- 图标 16px，与文字间距 8px；纯图标按钮为正方形并加 `aria-label`。
- Loading：保留原宽度，文字替换为 spinner 或 spinner + "保存中…"，并 `aria-busy="true"`。
- 按钮组：主按钮在右（桌面对话框）或在上/全宽（移动端）。
- 文案：动词 + 宾语。"删除项目" 而不是 "确定"。

---

## 输入框 Input / 表单

```css
.field { display: grid; gap: var(--space-2); }
.label { font-size: var(--text-sm); font-weight: var(--weight-medium); color: var(--text); }
.hint  { font-size: var(--text-sm); color: var(--text-secondary); }

.input {
  height: 40px; padding: 0 var(--space-3);
  font: inherit; font-size: var(--text-base); /* ≥16px 防止 iOS 自动缩放 */
  color: var(--text);
  background: var(--surface);
  border: 1px solid var(--border-strong);
  border-radius: var(--radius-sm);
  transition: border-color var(--duration-fast), box-shadow var(--duration-fast);
}
.input::placeholder { color: var(--text-tertiary); }
.input:hover  { border-color: var(--text-tertiary); }
.input:focus  { outline: none; border-color: var(--accent);
                box-shadow: 0 0 0 3px var(--accent-subtle); } /* 用环替代 outline，仍然清晰可见 */
.input[aria-invalid="true"] { border-color: var(--danger); }
.error { font-size: var(--text-sm); color: var(--danger); display: flex; gap: var(--space-1); }
```

**要点**
- 标签永远可见，放在输入框上方；placeholder 只是示例，不是标签。
- 必填/选填：标注少数的那一方（大部分必填就标"选填"）。
- 校验时机：失焦后校验，修正时实时清除错误；不要用户一开始输入就报错。
- 错误信息：说清楚怎么改 —— "密码至少 8 位，需包含数字"，而不是 "格式错误"。
- 相关字段分组，组间距 32px，组内字段间距 16–20px。
- 使用正确的 `type` / `inputmode` / `autocomplete`。

---

## 卡片 Card

```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
}
.card--interactive { transition: border-color var(--duration-base) var(--ease-out), box-shadow var(--duration-base) var(--ease-out); }
.card--interactive:hover { border-color: var(--border-strong); box-shadow: var(--shadow-md); }
```

**要点**
- 卡片内层级：标题（`--text-lg` 600）→ 描述（`--text-sm` secondary）→ 元信息/操作。
- 整卡可点击时，用一个覆盖全卡的 `<a>`（伪元素扩展点击区域），不要嵌套多个可点击元素。
- 卡片列表的高度对齐：用 grid + `align-items: stretch`，操作区 `margin-top: auto` 贴底。
- **避免**：卡片套卡片、每张卡片不同颜色、给静态卡片加 hover 上浮。

---

## 导航 Navigation

**顶部导航**
- 高度 56–64px；Logo 左、主导航中或左、操作右。
- 当前页：文字变为主色/加粗 + 底部 2px 指示条，不要只靠颜色。
- 滚动后：`position: sticky` + 背景 `color-mix(in oklch, var(--bg) 85%, transparent)` + `backdrop-filter: blur(12px)` + 底部 1px 边框（这是毛玻璃**唯一**推荐使用场景）。

**侧边栏**
- 宽 240–280px，可折叠到 56–64px 图标模式。
- 项高 32–36px，图标 16–18px，分组标题用 `--text-xs` 大写宽字距 tertiary 色。
- 选中项：`--accent-subtle` 背景 + 主色文字或主文字色加粗。

---

## 表格 Table

```css
.table { width: 100%; border-collapse: collapse; font-size: var(--text-sm); }
.table th {
  text-align: left; font-weight: var(--weight-medium);
  color: var(--text-secondary); font-size: var(--text-xs);
  text-transform: uppercase; letter-spacing: var(--tracking-wide);
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--border-strong);
  position: sticky; top: 0; background: var(--surface);
}
.table td { padding: var(--space-3) var(--space-4); border-bottom: 1px solid var(--border); }
.table tr:hover td { background: var(--surface-sunken); }
.table .num { text-align: right; font-variant-numeric: tabular-nums; }
```

**要点**
- 数字右对齐，文本左对齐，状态用徽标（Badge）而不是纯彩色文字。
- 行操作：hover 时显示或收进 "⋯" 菜单，减少视觉噪音。
- 空表格显示空状态，加载中显示骨架行（3–5 行）。
- 窄屏：横向滚动容器 + 首列 sticky，或转为卡片列表。

---

## 弹窗 Dialog / Modal

- 优先使用原生 `<dialog>` + `showModal()`（自带焦点管理、Esc 关闭、top layer）。
- 宽度：确认框 400–480px，表单 520–640px；最大高度 `85vh`，内容区滚动。
- 结构：标题（`--text-lg`）→ 描述 → 内容 → 底部操作（右对齐，主按钮在最右）。
- 遮罩 `oklch(0% 0 0 / 0.4)`；面板 `--surface-raised` + `--shadow-xl` + `--radius-xl`。
- 进入：opacity 0→1 + scale 0.96→1，200ms ease-out；退出更快 150ms。用 `@starting-style` 实现。
- 危险确认：重述后果 —— "删除后，项目中的 12 个文件将无法恢复"。

```css
dialog { opacity: 1; scale: 1; transition: opacity var(--duration-base) var(--ease-out), scale var(--duration-base) var(--ease-out), display var(--duration-base) allow-discrete, overlay var(--duration-base) allow-discrete; }
@starting-style { dialog[open] { opacity: 0; scale: 0.96; } }
dialog:not([open]) { opacity: 0; scale: 0.96; }
dialog::backdrop { background: oklch(0% 0 0 / 0.4); }
```

---

## Toast / 通知

- 位置：桌面右下或顶部居中，移动端底部；最多同时 3 条。
- 自动消失 4–6s，hover 时暂停；错误类不自动消失。
- 内容：图标 + 一句话 + 可选操作（"撤销"）。可撤销优于确认弹窗。
- `role="status"`（普通）或 `role="alert"`（错误）。

---

## 空状态 Empty State

```
[ 简洁插画或 48px 图标（tertiary 色） ]
标题：还没有项目                       ← --text-lg, 600
描述：创建第一个项目，开始组织你的工作。  ← --text-sm, secondary, max 40ch
[ 创建项目 ]  了解更多 →               ← 一个主操作 + 可选次要链接
```
- 居中对齐（这是少数适合居中的场景），上下留足 64–96px。
- 区分：首次空（引导）、搜索无结果（建议修改条件 + 清除筛选）、出错（重试）。

---

## 徽标 Badge / 标签

```css
.badge {
  display: inline-flex; align-items: center; gap: var(--space-1);
  height: 22px; padding: 0 var(--space-2);
  font-size: var(--text-xs); font-weight: var(--weight-medium);
  border-radius: var(--radius-full);
  background: var(--surface-sunken); color: var(--text-secondary);
}
.badge--success { background: color-mix(in oklch, var(--success) 14%, transparent); color: var(--success); }
```
- 用浅底 + 深字，不要实心饱和底色（太吵）。可加 6px 圆点表示状态。

---

## 骨架屏 Skeleton

```css
.skeleton {
  background: linear-gradient(90deg, var(--surface-sunken) 0%, var(--gray-200) 50%, var(--surface-sunken) 100%);
  background-size: 200% 100%;
  animation: shimmer 1.4s ease-in-out infinite;
  border-radius: var(--radius-sm);
}
@keyframes shimmer { from { background-position: 200% 0; } to { background-position: -200% 0; } }
```
- 形状与真实内容一致（标题条 60% 宽、正文条 100%/90%/70%）。

---

## Hero 区块（落地页）

不要默认 "居中标题 + 副标题 + 两个按钮 + 渐变背景"。可选结构：
1. **左文右图**：7/5 分栏，标题左对齐，右侧放真实产品截图（带细边框与轻阴影，略微倾斜或裁切出画）。
2. **超大字排版**：标题占满宽度（`--text-4xl` 以上），下方一行说明 + 一个按钮，无图。
3. **产品即 Hero**：短标题 + 直接嵌入可交互的产品演示。

标题写具体价值，不写口号："把会议录音变成可搜索的笔记" 优于 "释放团队的无限潜能"。
