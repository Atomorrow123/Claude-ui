# 组件配方

所有示例只引用 [tokens.css](tokens.css) 中的语义变量。框架无关，可直接翻译为 Tailwind / CSS Modules / styled-components。
**原则：先用原生元素**（`<button>`、`<dialog>`、`<select>`、`<input type="checkbox">`、`popover`），再做样式；只有原生能力确实不够时才自己造轮子。

目录：按钮 · 输入框/表单 · 选择控件（Checkbox/Radio/Switch/Select）· 卡片 · 导航 · 标签页 · 下拉菜单 · Tooltip · 表格 · 分页 · 弹窗 · Toast · 空状态 · 徽标/Kbd · 头像 · 进度 · 骨架屏 · 命令面板 · Hero

---

## 按钮 Button

**层级**：Primary（每视图 1 个）› Secondary › Ghost › Link；Danger 独立。
**尺寸**：sm 32px / md 40px / lg 48px 高；水平内边距 ≈ 高度 × 0.4。

```css
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: var(--space-2);
  min-height: 40px; padding: 0 var(--space-4);
  font: var(--weight-medium) var(--text-sm)/1.2 var(--font-body);
  border-radius: var(--radius-sm);
  border: 1px solid transparent;
  cursor: pointer; white-space: nowrap;
  transition: background-color var(--duration-fast) var(--ease-out),
              border-color var(--duration-fast) var(--ease-out),
              transform var(--duration-fast) var(--ease-out);
}
.btn:active:not(:disabled) { transform: scale(0.98); }
.btn:disabled, .btn[aria-disabled="true"] { opacity: 0.5; cursor: not-allowed; }

.btn-primary   { background: var(--accent); color: var(--text-on-accent); }
.btn-primary:hover:not(:disabled) { background: var(--accent-hover); }

.btn-secondary { background: var(--surface); color: var(--text); border-color: var(--border-strong); box-shadow: var(--shadow-sm); }
.btn-secondary:hover:not(:disabled) { background: var(--surface-sunken); }

.btn-ghost     { background: transparent; color: var(--text-secondary); }
.btn-ghost:hover:not(:disabled) { background: var(--surface-sunken); color: var(--text); }

.btn-danger    { background: var(--danger); color: var(--text-on-danger); }

.btn-icon      { min-height: 0; width: 40px; height: 40px; padding: 0; }   /* 正方形图标按钮 */

/* 强制颜色模式下透明边框会变为可见边界，保证按钮轮廓不丢 */
@media (forced-colors: active) { .btn { border-color: ButtonText; } }
```

**要点**
- 图标 16px，与文字间距 8px；纯图标按钮为正方形并加 `aria-label`（或内含 `.sr-only` 文字）。
- Loading：保留原宽度，文字替换为 spinner 或 spinner + "保存中…"，并 `aria-busy="true"`；不要用 `disabled`（会丢焦点），改用 `aria-disabled="true"` 并在处理函数里忽略重复点击。
- 按钮组：主按钮在右（桌面对话框）或在上/全宽（移动端）。
- 文案：动词 + 宾语。"删除项目" 而不是 "确定"。
- 跳转用 `<a>`，操作用 `<button>`；样式可以一样，语义不能混。

---

## 输入框 Input / 表单

```css
.field { display: grid; gap: var(--space-2); }
.label { font-size: var(--text-sm); font-weight: var(--weight-medium); color: var(--text); }
.hint  { font-size: var(--text-sm); color: var(--text-secondary); }

.input {
  min-height: 40px; padding: var(--space-2) var(--space-3);
  font-size: var(--text-base); /* ≥16px 防止 iOS 聚焦时自动缩放 */
  color: var(--text);
  background: var(--surface);
  border: 1px solid var(--border-input);   /* 控件边界需 ≥ 3:1，不能用装饰性 --border */
  border-radius: var(--radius-sm);
  transition: border-color var(--duration-fast), box-shadow var(--duration-fast);
}
.input::placeholder { color: var(--text-tertiary); }
.input:hover  { border-color: var(--text-secondary); }
.input:focus-visible {
  outline: 2px solid transparent;            /* 强制颜色模式下会变成可见轮廓 */
  border-color: var(--accent);
  box-shadow: 0 0 0 3px color-mix(in oklab, var(--focus-ring) 35%, transparent);
}
.input:user-invalid,
.input[aria-invalid="true"] { border-color: var(--danger); }
.error { font-size: var(--text-sm); color: var(--danger); display: flex; gap: var(--space-1); align-items: center; }
textarea.input { min-height: 96px; resize: vertical; field-sizing: content; }  /* field-sizing：随内容增高（渐进增强） */
```

**要点**
- 标签永远可见，放在输入框上方；placeholder 只是示例，不是标签。
- 必填/选填：标注少数的那一方（大部分必填就标"选填"）。
- 校验时机：失焦后校验（`:user-invalid` 天然如此），修正时实时清除错误；不要用户一开始输入就报错。
- 错误信息：说清楚怎么改 —— "密码至少 8 位，需包含数字"，而不是 "格式错误"；用 `aria-describedby` 关联到输入框，错误 = 红色 + 图标 + 文字。
- 提交失败时：顶部给错误汇总并把焦点移到第一个出错字段。
- 相关字段分组，组间距 32px，组内字段间距 16–20px。
- 使用正确的 `type` / `inputmode` / `autocomplete`（`email`、`tel`、`one-time-code`、`new-password`…）。
- 字段宽度暗示内容长度：邮编、验证码用短输入框，不要所有字段都 100% 宽。

---

## 选择控件 Checkbox / Radio / Switch / Select

**优先原生 + `accent-color`**（tokens.css 已在 `:root` 设置 `accent-color: var(--accent)`），只在品牌要求极高时才自绘。

```css
.check { display: inline-flex; align-items: center; gap: var(--space-2); min-height: 32px; cursor: pointer; }
.check input { width: 18px; height: 18px; margin: 0; flex-shrink: 0; }

/* 原生 Select：统一外观，箭头用背景图 */
.select {
  appearance: none;
  min-height: 40px; padding: 0 var(--space-8) 0 var(--space-3);
  background: var(--surface) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='none' stroke='%23888' stroke-width='1.5'%3E%3Cpath d='m4 6 4 4 4-4'/%3E%3C/svg%3E") no-repeat right var(--space-3) center;
  border: 1px solid var(--border-input); border-radius: var(--radius-sm);
}
/* 可定制 Select（渐进增强：支持的浏览器获得完全自定义的下拉面板，不支持的保持上面的样式） */
@supports (appearance: base-select) {
  .select, .select::picker(select) { appearance: base-select; }
  .select { background-image: none; }
  .select::picker(select) {
    border: 1px solid var(--border); border-radius: var(--radius-md);
    background: var(--surface-raised); box-shadow: var(--shadow-lg); padding: var(--space-1);
  }
  .select option { padding: var(--space-2) var(--space-3); border-radius: var(--radius-xs); }
  .select option:hover, .select option:focus-visible { background: var(--surface-sunken); }
}
```

**要点**
- **Checkbox** = 多选 / 需要点"保存"才生效；**Switch** = 立即生效的开关；**Radio** = 互斥且选项 ≤ 5；选项 > 5 用 Select，> 15 用可搜索的 Combobox。
- Switch：`<input type="checkbox" switch>`（Safari 原生，其他浏览器按需加载 `input-switch-polyfill`），不要用 `<div>` 模拟。
- 整行（标签 + 控件）都应可点击：用 `<label>` 包裹。
- Radio 组用 `<fieldset>` + `<legend>` 提供组名。
- 不要用 Switch 表达"二选一的两个值"（如"月付/年付"），那是分段控件（Segmented Control）。

---

## 卡片 Card

```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
  container-type: inline-size;   /* 让卡片内部按自身宽度响应，而非视口 */
}
.card--interactive { position: relative; transition: border-color var(--duration-base) var(--ease-out), box-shadow var(--duration-base) var(--ease-out); }
.card--interactive:hover { border-color: var(--border-strong); box-shadow: var(--shadow-md); }
.card--interactive .card-link::after { content: ""; position: absolute; inset: 0; border-radius: inherit; } /* 整卡可点 */
.card--interactive:has(.card-link:focus-visible) { outline: 2px solid var(--focus-ring); outline-offset: 2px; }
.card--interactive .card-link:focus-visible { outline: none; } /* 焦点环画在整卡上 */

@container (min-width: 480px) {
  .card-media-row { display: grid; grid-template-columns: 160px 1fr; gap: var(--space-5); }
}
```

**要点**
- 卡片内层级：标题（`--text-lg` 600）→ 描述（`--text-sm` secondary）→ 元信息/操作。
- 整卡可点击时，用一个覆盖全卡的 `<a>`（伪元素扩展点击区域），不要嵌套多个可点击元素；卡内次要按钮需 `position: relative; z-index: 1` 浮于伪元素之上。
- 卡片列表的高度对齐：用 grid + `align-items: stretch`，操作区 `margin-top: auto` 贴底。
- 卡片网格：`grid-template-columns: repeat(auto-fill, minmax(min(280px, 100%), 1fr))`，无需断点。
- **避免**：卡片套卡片、每张卡片不同颜色、给静态卡片加 hover 上浮。

---

## 导航 Navigation

**顶部导航**
- 高度 56–64px；Logo 左、主导航中或左、操作右。
- 当前页：`aria-current="page"` + 文字变为主色/加粗 + 底部 2px 指示条，不要只靠颜色。
- 滚动后：`position: sticky` + 背景 `color-mix(in oklch, var(--bg) 85%, transparent)` + `backdrop-filter: blur(12px)` + 底部 1px 边框（这是毛玻璃**唯一**推荐使用场景）。
- 页面首个可聚焦元素放"跳到主要内容"链接（`.sr-only` + `:focus` 时显示）。

**侧边栏**
- 宽 240–280px，可折叠到 56–64px 图标模式（折叠后图标需 Tooltip 显示名称）。
- 项高 32–36px，图标 16–18px，分组标题用 `--text-xs` 大写宽字距 tertiary 色（中文分组标题不需要大写与宽字距）。
- 选中项：`--accent-subtle` 背景 + 主色文字或主文字色加粗。

**移动端**
- 主要目的地 ≤ 5 个：底部标签栏（高 56px + `env(safe-area-inset-bottom)`）。
- 更多：汉堡按钮打开抽屉（`<dialog>` 从侧边滑入），抽屉内焦点陷入，Esc/点遮罩关闭。

---

## 标签页 Tabs

```css
.tabs { display: flex; gap: var(--space-1); border-bottom: 1px solid var(--border); overflow-x: auto; scrollbar-width: none; }
.tab {
  position: relative; flex-shrink: 0; white-space: nowrap;
  padding: var(--space-3) var(--space-3); background: none; border: 0;
  color: var(--text-secondary); font-weight: var(--weight-medium); cursor: pointer;
}
.tab:hover { color: var(--text); }
.tab[aria-selected="true"] { color: var(--text); }
.tab[aria-selected="true"]::after {
  content: ""; position: absolute; inset: auto var(--space-3) -1px; height: 2px;
  background: var(--accent); border-radius: 2px 2px 0 0;
}
```

**要点**
- 语义：`role="tablist"` > `role="tab"`（`aria-selected`、`aria-controls`）+ `role="tabpanel"`；左右方向键切换，Tab 键进入面板。
- 只用于**同级、互斥**的视图切换；会跳转 URL 的是导航，不是 Tabs。
- 选项 2–6 个；更多时横向滚动，并在边缘给渐隐提示还有内容。
- 分段控件（Segmented）用于 2–4 个筛选视图：整体 `--surface-sunken` 底 + 选中项 `--surface` 底 + `--shadow-sm`，圆角满足嵌套公式。

---

## 下拉菜单 Dropdown Menu

```html
<button class="btn btn-ghost" type="button" aria-haspopup="menu" aria-expanded="false"
        commandfor="row-menu" command="toggle-popover">更多操作</button>
<div id="row-menu" class="menu" popover="auto">
  <button type="button" class="menu-item">重命名<span class="hint" aria-hidden="true">R</span></button>
  <button type="button" class="menu-item">复制链接</button>
  <hr>
  <button type="button" class="menu-item menu-item--danger">删除</button>
</div>
```

```css
.menu {
  min-width: 200px; margin: 0; padding: var(--space-1);
  background: var(--surface-raised); color: var(--text);
  border: 1px solid var(--border); border-radius: var(--radius-md); box-shadow: var(--shadow-lg);
}
@supports (position-area: block-end) {
  .menu { inset: auto; margin-top: var(--space-1); position-area: block-end span-inline-end; position-try-fallbacks: flip-block, flip-inline; }
}
.menu-item {
  display: flex; align-items: center; gap: var(--space-2); width: 100%;
  min-height: 32px; padding: 0 var(--space-3); border: 0; border-radius: var(--radius-xs);
  background: none; text-align: start; cursor: pointer;
}
.menu-item:hover, .menu-item:focus-visible { background: var(--surface-sunken); outline: none; }
.menu-item--danger { color: var(--danger); }
.menu .hint { margin-inline-start: auto; color: var(--text-tertiary); font-size: var(--text-xs); }
.menu hr { border: 0; border-top: 1px solid var(--border); margin: var(--space-1) 0; }
```

**要点**
- 用 `popover="auto"`（自带 top layer、点外部/Esc 关闭）+ 触发按钮 `commandfor`；弹层紧跟在按钮后面。
- 定位用 CSS 锚点定位（`position-area`）并加 `@supports` 守卫；不支持时用 JS 计算坐标，**不要**让菜单居中显示在视口里。
- 菜单项 32–36px 高，图标槽固定宽度保证文字对齐；危险项放最后并用分隔线隔开。
- 键盘：↑↓ 移动、Home/End、Esc 关闭并把焦点还给触发按钮；`aria-expanded` 随开关同步。
- 动效：opacity + 4px 位移，打开 ≤ 150ms。

---

## Tooltip

- **只放补充信息**：图标按钮的名称、截断文本的全文、术语解释。必须看到才能完成任务的信息不能放 Tooltip（触屏用户看不到）。
- 触发：hover **与** focus 都要触发；延迟 300–500ms 出现，离开 100ms 后消失；鼠标可移入 Tooltip 内部（WCAG 1.4.13）。
- 样式：`--text-xs`/`--text-sm`，最大宽 240px，反色底（`--text` 底 + `--bg` 字）或 `--surface-raised` + 边框；圆角 `--radius-xs`/`--radius-sm`；不要加箭头以外的装饰。
- 实现：`popover="hint"` + `interestfor`（Chromium 原生，其他浏览器按需加载 `interestfor` polyfill）；或用成熟库（Floating UI / Radix）。不要只用 `title` 属性当 Tooltip（键盘与触屏不可用）。

---

## 表格 Table

```css
.table-wrap { overflow-x: auto; border: 1px solid var(--border); border-radius: var(--radius-lg); }
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
.table tr:last-child td { border-bottom: 0; }
.table tbody tr:hover td { background: var(--surface-sunken); }
.table .num { text-align: right; font-variant-numeric: tabular-nums; }
.table th:first-child, .table td:first-child { position: sticky; left: 0; background: inherit; } /* 窄屏首列固定（按需） */
:lang(zh) .table th { text-transform: none; letter-spacing: 0; font-size: var(--text-sm); }
```

**要点**
- 数字右对齐，文本左对齐，状态用徽标（Badge）而不是纯彩色文字；表头对齐方式与该列内容一致。
- 含中文单位的数字列用 `--font-body` + `tabular-nums`，不要直接套用纯西文 `--font-mono`。
- 行操作：hover 时显示或收进 "⋯" 菜单，减少视觉噪音（但键盘聚焦到该行时也要显示）。
- 可排序列：表头为 `<button>`，`aria-sort` 标注方向，显示 ↑↓ 图标。
- 批量选择：首列复选框 + 选中后顶部出现批量操作栏（"已选 3 项 · 删除 · 导出"）。
- 空表格显示空状态，加载中显示骨架行（3–5 行）。
- 窄屏：横向滚动容器 + 首列 sticky，或转为卡片列表。
- 密度：舒适 48px / 默认 40px / 紧凑 32px 行高，B 端可提供切换。

---

## 分页 Pagination

- 列表 < 50 条：不分页。可浏览的 feed：无限滚动或"加载更多"（保持页脚可达）。需要定位/跳转的数据：页码分页。
- 页码：`‹ 1 … 4 5 [6] 7 8 … 20 ›`，当前页 `aria-current="page"` + `--accent-subtle` 底；按钮 ≥ 32px（移动端 ≥ 44px）。
- 显示总量与范围："第 51–75 条，共 1,284 条"；每页条数选择器放在右侧。
- 翻页后滚动回列表顶部，并保留筛选条件到 URL。

---

## 弹窗 Dialog / Modal

- 优先使用原生 `<dialog>` + `showModal()`（自带焦点管理、Esc 关闭、top layer）；`closedby="any"` 启用点遮罩关闭（不支持时用 JS 兜底）。
- 宽度：确认框 400–480px，表单 520–640px；最大高度 `85vh`，内容区滚动；移动端可改为底部抽屉（Sheet）。
- 结构：标题（`--text-lg`）→ 描述 → 内容 → 底部操作（右对齐，主按钮在最右）。
- 遮罩 `oklch(0% 0 0 / 0.4)`；面板 `--surface-raised` + `--shadow-xl` + `--radius-xl`。
- 进入：opacity 0→1 + scale 0.96→1，200ms ease-out；退出更快 150ms。用 `@starting-style` 实现。
- 危险确认：重述后果 —— "删除后，项目中的 12 个文件将无法恢复"；高危操作要求输入名称确认。
- **能撤销就别弹确认**：删除后给"已删除 · 撤销"Toast，比确认弹窗打断更少。
- 打开时 `body` 加 `overflow: hidden`（或 `html:has(dialog[open]) { overflow: hidden; }`）防止背景滚动。

```css
dialog {
  padding: var(--space-6); border: 1px solid var(--border); border-radius: var(--radius-xl);
  background: var(--surface-raised); color: var(--text); box-shadow: var(--shadow-xl);
  width: min(560px, calc(100vw - 2 * var(--gutter))); max-height: 85vh;
  opacity: 1; scale: 1;
  transition: opacity var(--duration-base) var(--ease-out), scale var(--duration-base) var(--ease-out),
              display var(--duration-base) allow-discrete, overlay var(--duration-base) allow-discrete;
}
dialog:not([open]) { opacity: 0; scale: 0.96; transition-duration: var(--duration-fast); }
@starting-style { dialog[open] { opacity: 0; scale: 0.96; } }
dialog::backdrop { background: oklch(0% 0 0 / 0.4); }
html:has(dialog[open]:modal) { overflow: hidden; }
```

---

## Toast / 通知

- 位置：桌面右下或顶部居中，移动端底部；最多同时 3 条，新的在上/下方堆叠。
- 自动消失 4–6s，hover/聚焦时暂停；错误类与含操作的不自动消失。
- 内容：图标 + 一句话 + 可选操作（"撤销"）。可撤销优于确认弹窗。
- 容器常驻 DOM 并设 `role="status"`（普通）或 `role="alert"`（错误），动态插入内容才会被读屏播报。
- 样式：`--surface-raised` + `--shadow-lg` + `--radius-md`；或反色（`--text` 底），不要用大面积彩色底。

---

## 空状态 Empty State

```
[ 简洁插画或 48px 图标（tertiary 色） ]
标题：还没有项目                       ← --text-lg, 600
描述：创建第一个项目，开始组织你的工作。  ← --text-sm, secondary, max 40ch
[ 创建项目 ]  了解更多 →               ← 一个主操作 + 可选次要链接
```
- 居中对齐（这是少数适合居中的场景），上下留足 64–96px。
- 区分：首次空（引导）、搜索无结果（建议修改条件 + 清除筛选）、出错（重试）、无权限（说明找谁开通）。

---

## 徽标 Badge / 标签与快捷键 Kbd

```css
.badge {
  display: inline-flex; align-items: center; gap: var(--space-1);
  min-height: 24px; padding: 2px var(--space-3);
  font-size: var(--text-xs); font-weight: var(--weight-medium);
  line-height: 1.35; white-space: nowrap; flex-shrink: 0;
  border-radius: var(--radius-full);
  background: var(--surface-sunken); color: var(--text-secondary);
}
.badge--success { background: var(--success-subtle); color: var(--success); }
.badge--warning { background: var(--warning-subtle); color: var(--warning); }
.badge--danger  { background: var(--danger-subtle);  color: var(--danger); }
.badge--dot::before { content: ""; width: 6px; height: 6px; border-radius: 50%; background: currentColor; }

kbd {
  display: inline-flex; align-items: center;
  padding: 2px 6px;
  font: var(--weight-regular) var(--text-xs)/1.2 var(--font-mono);
  white-space: nowrap; flex-shrink: 0;
  border-radius: var(--radius-xs);
  background: var(--surface-sunken); border: 1px solid var(--border-strong); color: var(--text-secondary);
}
```
- 用浅底 + 深字，不要实心饱和底色（太吵）。可加 6px 圆点表示状态。
- 用 `min-height` + 紧凑行高 + `white-space: nowrap` + `flex-shrink: 0`，避免写死 `height`；横向并排的父级 Flex 容器需加 `flex-wrap: wrap`，防止空间不足时文字折行冲出胶囊边界。
- 快捷键按平台显示：macOS `⌘K`，Windows/Linux `Ctrl K`。

---

## 头像 Avatar

- 尺寸阶梯：24 / 32 / 40 / 56 / 96px；圆形表示人，圆角方形表示组织/项目。
- 无图回退：姓名首字（中文取姓或名的最后一字，西文取首字母 1–2 个），底色由用户 ID 哈希到 `--chart-*` 的浅色调，保证同一人颜色稳定。
- 图片 `object-fit: cover` + 1px 内描边 `box-shadow: inset 0 0 0 1px var(--border)`，避免浅色头像融进背景。
- 头像组：负间距 -8px + 2px `--surface` 外环，超出显示 "+5"。

---

## 进度 Progress / Spinner

- 已知进度：`<progress>`（`accent-color` 着色）或 4–8px 圆角条；显示百分比或剩余时间。
- 未知进度 < 3s：Spinner（16/20/24px，2px 线宽，`currentColor`）；> 3s：骨架屏或带文字的进度说明（"正在分析 3/12 个文件…"）。
- 多步骤流程：步骤条（Stepper）显示 已完成 ✓ / 当前 / 未开始，最多 5–7 步。

---

## 骨架屏 Skeleton

```css
.skeleton {
  background: linear-gradient(90deg,
    var(--surface-sunken) 0%,
    color-mix(in oklab, var(--surface-sunken), var(--text) 6%) 50%,
    var(--surface-sunken) 100%);
  background-size: 200% 100%;
  animation: shimmer 1.4s ease-in-out infinite;
  border-radius: var(--radius-sm);
}
@keyframes shimmer { from { background-position: 200% 0; } to { background-position: -200% 0; } }
@media (prefers-reduced-motion: reduce) { .skeleton { animation: none; } }
```
- 形状与真实内容一致（标题条 60% 宽、正文条 100%/90%/70%）；亮暗模式都自动适配。
- 容器加 `aria-busy="true"`，骨架元素本身 `aria-hidden="true"`。

---

## 命令面板 Command Palette（⌘K）

- 适用：功能多的工具型产品（暗色精密 / 瑞士方向的签名细节）。
- 结构：`<dialog>` 顶部 1/5 处，宽 560–640px；顶部大号搜索框（无边框，`--text-lg`）→ 分组结果列表 → 底部快捷键提示条。
- 结果项 40px 高：图标 + 名称 + 右侧快捷键/类型；当前项 `--surface-sunken` 底。
- 交互：↑↓ 选择、Enter 执行、Esc 关闭；空查询时显示"最近使用"；无结果时给出建议。
- 语义：输入框 `role="combobox"` + `aria-activedescendant` 指向当前 `role="option"`。

---

## Hero 区块（落地页）

不要默认 "居中标题 + 副标题 + 两个按钮 + 渐变背景"。可选结构：
1. **左文右图**：7/5 分栏，标题左对齐，右侧放真实产品截图（带细边框与轻阴影，略微倾斜或裁切出画）。
2. **超大字排版**：标题占满宽度（`--text-4xl` 以上），下方一行说明 + 一个按钮，无图。
3. **产品即 Hero**：短标题 + 直接嵌入可交互的产品演示。

标题写具体价值，不写口号："把会议录音变成可搜索的笔记" 优于 "释放团队的无限潜能"。
Hero 图片是 LCP 元素：`fetchpriority="high"`、不要懒加载、给出 `width`/`height`。
