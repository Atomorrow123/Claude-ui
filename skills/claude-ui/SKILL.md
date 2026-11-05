---
name: claude-ui
description: >-
  Claude UI —— 以 Claude 秩序美学为底座、支持全行业自适应变形与知名品牌先例借镜的前端 UI 构建指南。
  用于从零设计或重构网页/应用界面、落地页、电商、餐饮、科技、艺术、哲学出版、时尚奢品、教育、服务预约、
  仪表盘与设计 Token，或当用户要求"好看一点"、"更高级"、"有设计感"、"去 AI 味"、"参考某品牌风格"时激活。
---

# Claude UI · 自适应界面构建指南 (v1.2)

> **底层秩序如一，表层万象自适应。**
> 以 Claude 的克制、清晰与排版秩序为骨架，向 Apple、Nike、Cartier、McDonald's、Aesop、Linear、Stripe 等殿堂级先例汲取行业灵魂 —— 让科技精密、餐饮诱人、奢品矜贵、艺术先锋、哲思深邃。

---

## 0. 核心法则：底层不变量 vs. 风格自由度

Claude UI 采用 **「双层架构」**：底层守住可读性与工程秩序，表层彻底放开风格化限制。

### 底层不变量（Claude DNA · 永远坚守）
1. **意图先行，拒绝无意义堆砌。** 每一处留白、线条、色块和动效都有明确的信息或情绪职能。
2. **Token 驱动，告别魔法数字。** 颜色、字阶、间距、圆角、阴影、缓动全部走语义变量，改一处即可换肤。
3. **亲密性与对齐线。** 组内间距 < 组间间距 < 区块间距；建立清晰的视觉左轴或网格基准线。
4. **精致中西文混排。** 西文字体置前、中文字体殿后；中文行高更松弛、禁伪斜体与负字距；数字列强制等宽对齐（`tabular-nums`）。
5. **可读性与可访问性底线。** 正文对比度 ≥ 4.5:1，大字与控件边界 ≥ 3:1；支持键盘全流程、`:focus-visible` 焦点环、`prefers-reduced-motion`。
6. **真实文案与完整状态。** 杜绝 Lorem ipsum 与假大空口号；交互组件补齐 hover / active / focus / loading / empty / error。

### 放宽的风格自由度（Stylistic Freedom · 按行业大胆突破）
- **色彩不再死守 90% 灰白**：默认采用 60/30/10 克制配比；但在**餐饮快消**（McDonald's 暖金番茄红）、**潮流运动**（Nike 高对比撞色）、**互动教育**（Duolingo 鲜明语义色）或**先锋艺术**中，允许大面积品牌色块、情绪背景或受控光感网格（Stripe）唱主角，只需确保前景文字对比度达标。
- **主按钮不再死板限全屏 1 个**：从“全屏仅 1 个 Primary”放宽为 **“每个独立任务域 / 独立卡片聚焦 1 个主操作”**。多商品陈列、套餐选配、分栏工作台均可各自拥有清晰行动点。
- **字阶与字体不再受限于温和比例**：除常规 1.25 字阶外，允许在时尚奢品、艺术展签、运动海报中使用 **超大戏剧化字阶（`clamp(3rem, 8vw, 7.5rem)`）**、浓缩粗黑体、高对比古典衬线或硬件点阵等宽字。
- **几何与深度自由切换**：支持 `0px` 锋利刀锋（Cartier / 建筑画廊）、`8–12px` 现代精密（Linear / SaaS）、`16–28px` 饱满圆润（餐饮 / 消费 / 少儿），以及 `0 4px 0` 物理厚度硬阴影（游戏化 / 新粗野）。

---

## 1. 极简三步工作流（已清理冗杂步骤）

先看任务规模：**小修小改**（调按钮、修对齐、改局部色）直接沿用项目现有样式动手，**跳过简报与新 Token**。
**新建页面或大改版**，只走以下干净的 3 步：

### Step 1 · 定向与先例锚定（写 3 行设计锚点）
识别产品所属的**目标领域**与**参考品牌先例**（见 §2 与 [aesthetic-directions.md](references/aesthetic-directions.md)），在回复开头或代码注释写 3 行锚点：
```text
领域与先例：精品烘焙与轻食点单 · 参考 McDonald's (Turner Duckworth) × Tartine Bakery
基底与变奏：Claude 暖调排版秩序 + 高明度暖奶油底 + 焦糖金/番茄红食欲强调 + 饱满圆角卡片
签名细节：  微距食物实拍去底陈列 + 物理回弹加购胶囊 + 零认知负担的 3 步规格快选
```

### Step 2 · Token 调谐与结构搭建
从 [tokens.css](references/tokens.css) 与 [style-samples.md](references/style-samples.md) 选取对应预设，拨动 **6 个风格旋钮**，先搭好清晰的网格与信息层级，再上色：

| 风格旋钮 | 调节范围（从克制基准 → 风格化极值） |
|---|---|
| **① 画布与材质** | 暖米白书页 `#faf9f5` · 纯净画廊白 `#ffffff` · 亚麻大地色 `#f4efe6` · 曜石暗黑 `#090a0b` · 丝绒深炭 `#11100e` · 欢快品牌色块 |
| **② 排版张力** | 1.2 紧凑工具阶梯 ↔ 1.333 编辑阅读阶梯 ↔ 1.5+ 海报巨幅对比；人文无衬线 / 古典衬线 / 浓缩粗黑 / 工业等宽 |
| **③ 色彩预算** | 90/10 极简留白 ↔ 60/30/10 经典平衡 ↔ 高饱和主色场 + 高对比黑白字 |
| **④ 空间密度** | 高密度 B 端工作台（行高 36px，间距紧凑） ↔ 策展级呼吸感（区块间距 `96–160px`，大量负空间） |
| **⑤ 几何与触感** | `0px` 锋利直角 ↔ `6–12px` 精密倒角 ↔ `20–32px` 亲和圆角；1px 细线 / 多层环境柔影 / 1px 顶边内高光 / 物理硬投影 |
| **⑥ 动效性格** | `120ms` 机械瞬态（Linear） ↔ `240ms` 光学阻尼（Apple） ↔ `350ms` 轻快微弹（Duolingo） ↔ `500ms` 剧场慢镜头（Cartier） |

### Step 3 · 状态补齐与渲染核验
参考 [components.md](references/components.md) 补齐交互状态与无障碍属性，对照 §6 核心自检表收尾。若有浏览器工具，**直接打开真实页面截图审视**（桌面 + 移动窄屏 + 暗色/主题态）。

---

## 2. 全景行业自适应矩阵（12 大前端方向 × 品牌先例）

完整参数、配色方案与品牌拆解见 [references/aesthetic-directions.md](references/aesthetic-directions.md)，实战代码样本见 [references/style-samples.md](references/style-samples.md) 与 [examples/style-showcase.html](examples/style-showcase.html)。

| 目标行业 / 领域 | 推荐视觉基调 | 对标品牌先例（Precedents） | 核心视觉配方与签名细节 |
|---|---|---|---|
| **1. 哲学、思想与人文出版**<br>长文、文库、期刊、笔记工作台 | **知性书卷**<br>Warm Editorial | **Anthropic (Claude)** · *The New Yorker* · *Read.cv* | 暖米白画布 `#faf9f5` + 赤陶/墨绿点睛；高可读衬线标题 + 65ch 严整行宽；边栏文献批注、页码溯源、目录索引线 |
| **2. 科技、AI 与智能硬件**<br>SaaS、DevTools、AI 产品、数码 | **光学精密 / 暗色工艺**<br>Optical & Dark Craft | **Apple** · **Linear** · **Raycast** · **Teenage Engineering** | 亮色用 `#f5f5f7` 浅灰 Bento 卡配紧凑负字距大字（Apple）；暗色用 `#08090a` 曜石底 + 1px 顶边微光 + `⌘K` 快捷键徽标（Linear） |
| **3. 食品、餐饮与新消费快消**<br>快餐 QSR、咖啡烘焙、茶饮、生鲜 | **食欲波普 / 自然有机**<br>Appetite Pop & Organic | **McDonald's** · **Shake Shack** · **Oatly** · **Blue Bottle** | 快消用暖奶油底 + 金黄 `#ffbc0d` / 番茄红 `#db0007` + 饱满圆润字体与大圆角加购胶囊；精品咖啡用原木暖白 + 极简产地风味刻度条 |
| **4. 服装、时尚潮流与高定奢品**<br>高定珠宝、时装屋、街头运动 | **剧场奢华 / 竞技海报**<br>Haute Luxury & Kinetic | **Cartier** · **Hermès** · **Celine** · **Nike** | 奢品用深邃黑/香槟白 + `0px` 直角 + 宽字距大写眉标 + 高对比古典衬线（Cartier）；运动潮牌用超大浓缩粗黑体 + 全出血视觉（Nike） |
| **5. 艺术、策展与建筑空间**<br>美术馆、展览、建筑所、作品集 | **画廊留白 / 瑞士网格**<br>Curatorial & Swiss Grid | **MoMA** · **Art Basel** · **Vitra** · **Pentagram** | 纯净白或石膏灰画布；外露 1px 贯穿网格线；画作/摄影占绝对主导，搭配博物馆展签式等宽编号（`FIG. 01 / 2026`）与大胆不对称留白 |
| **6. 生活服务、酒旅康养与预约**<br>酒店民宿、医疗康养、沙龙、家政 | **温润松弛 / 空间信任**<br>Tactile Hospitality | **Airbnb** · **Aesop** · **Aman (安缦)** · **One Medical** | 亚麻/橄榄绿大地色系（Aesop）或暖白配珊瑚红锚点（Airbnb）；高清环境实拍 + 极简无摩擦的日期/时段/房型选择器与透明费用明细 |
| **7. 教育、知识学习与学术科研**<br>在线课程、语言/编程闯关、少儿 | **友好激励 / 清晰阶梯**<br>Playful Mastery & Clarity | **Duolingo** · **Brilliant** · **Khan Academy** · **MIT Media Lab** | 闯关类用明快语义色 + 带 `0 4px 0` 物理底座的 3D 选项按钮 + 连胜进度条；学术课程用清晰章节树 + 交互式公式/代码沙盒 |
| **8. 金融科技、企服与数据看板**<br>支付、数字银行、BI 仪表盘、ERP | **权威通透 / 高密秩序**<br>Fintech & High-Density | **Stripe** · **Wise** · **Mercury** · **Bloomberg** | 多层细腻环境阴影 + 受控色彩光晕背景（Stripe）；3–5 个结论级 KPI 卡 + 去除 chart junk 的净爽图表 + 严格右对齐 `tabular-nums` 账目表 |
| **9. 现代电商、DTC 与买手零售**<br>品牌独立站、家居美学、美妆潮玩 | **策展陈列 / 顺滑转化**<br>Curated Commerce | **MUJI (无印良品)** · **SSENSE** · ** Teenage Engineering Store** | 质感灰白底突出商品本体；悬停快速切换多角度实拍；清晰的材质/尺码切片选择器、库存状态提示与吸底/侧滑迷你购物袋 |
| **10. 影音流媒体、播客与娱乐**<br>音乐、播客、视频平台、演出票务 | **沉浸氛围 / 律动时间轴**<br>Immersive Media | **Spotify** · **Apple Music** · **Letterboxd** · **A24** | 暗色沉浸画布 + 从专辑/海报提取的低饱和环境氛围色；玻璃态常驻播放控制栏、波形进度条与高辨识度曲目/排期列表 |
| **11. 汽车出行、工业与精密装备**<br>新能源车、智驾 HMI、机器人 | **机械张力 / 仪表精密**<br>Industrial & Mobility | **Porsche** · **Rivian** · **Braun (博朗)** · **SpaceX** | 钛金属灰/深空黑背景 + 工业橙/荧光绿状态指示；3D/高清车体选配视图 + 等宽遥测参数面板（里程、功率、温控刻度） |
| **12. 公共市政、医疗健康与公益**<br>政务门户、医院挂号、环保 NGO | **普适无障碍 / 零歧义导视**<br>Civic & Universal Access | **GOV.UK** · **瑞士联邦铁路 (SBB)** · **Patagonia** | 超高对比度（AAA 级 7:1+）、大字号（正文 18px+）、醒目粗黑焦点框；以任务搜索和分步办事向导为核心，零装饰干扰 |

---

## 3. 排版、色彩与布局核心法则（精要）

### 排版 Typography
- **字号阶梯**：工具/后台用 `1.2`（小三度），通用/阅读用 `1.25`（大三度），营销/奢品/艺术海报可用 `1.333–1.618` 并搭配 `clamp()` 流体大字。移动端正文 **≥ 16px**。
- **行高与行宽**：正文行高西文 `1.5–1.65`、中文 `1.7–1.8`；标题行高 `1.05–1.25`；大段阅读行宽控制在 `60–75ch`（中文 35–45 字）。
- **中文排版铁律**：
  - 全局重置必加 `button, input, select, textarea { font: inherit; color: inherit; }`。
  - 西文字体写在中文字体**前面**；`--font-mono` 在 `monospace` 前必须补齐中文无衬线回退。
  - **中文禁设负字距、禁用伪斜体**；中英文、中数字之间留空格；标题用 `text-wrap: balance`。

### 色彩与亮暗主题 Color & Theme
- **告别刺眼纯黑纯白**（除特定高对比先锋艺术/奢品外）：文字优先用带色相的近黑（如 `#141413`），画布用暖米白、浅灰或大地色。
- **对比度硬指标**：正文 ≥ 4.5:1；大字、图标、**表单输入框边框与焦点环 ≥ 3:1**。品牌色做按钮底色时，单独校验其上文字的对比度（过浅的亮黄/珊瑚色按钮应配深色字，如 McDonald's 金黄按钮配深棕黑字）。
- **原生双模支持**：`<head>` 声明 `<meta name="color-scheme" content="light dark">`，`:root` 设置 `color-scheme: light dark`，通过 `light-dark(亮, 暗)` 定义语义色。

### 布局与组件 Layout & Components
- **打破套路构图**：用不对称分栏（5/7、4/8）、Bento 大小交错网格、杂志跨栏排版、或“产品即 Hero（直接嵌入可操作演示）”替代千篇一律的居中标题加三张等宽卡片。
- **优先原生语义**：操作用 `<button>`，跳转用 `<a>`；弹窗优先用 `<dialog>`，下拉与轻提示用 `popover`；胶囊徽标与快捷键 `<kbd>` 必加 `white-space: nowrap; flex-shrink: 0`。

---

## 4. 反“廉价 AI 味”红线（区分平庸套路与高级风格化）

详细对比见 [references/anti-patterns.md](references/anti-patterns.md)。**允许大胆风格化，但严禁以下无脑 AI 套路：**

| ❌ 廉价 AI 套路（严禁） | ✅ 有意图的风格化（鼓励） |
|---|---|
| 毫无理由的黑底配紫蓝霓虹渐变文字 | **Stripe 式**受控同色系柔光网格，或 **McDonald's / Nike 式**干脆利落的品牌平涂撞色 |
| 所有卡片、按钮无脑套 `backdrop-blur` + `rounded-3xl` + `shadow-2xl` | 仅粘性顶栏/浮动播放条用毛玻璃；圆角与阴影按行业性格定制（奢品 `0px` 无影，教育 `16px` 硬底影） |
| 🚀✨💡 等 Emoji 充当功能图标 | 统一线宽（1.5px / 1.75px / 2px）的 SVG 图标库，或博物馆/工业风的等宽序号（`01 / 02`） |
| 每张卡片换一种彩虹颜色 | 中性色构建骨架，强调色聚焦行动点；数据分类使用同明度错色相的 `--chart-1 ~ 6` |
| “释放无限潜能”、“赋能未来”等空洞口号与编造的 `99.9%` 数据 | 具体、可感知的真实业务场景、真实菜品/展品/文献名称（缺省真实数据时标明 `[待补充]`） |
| 删掉 `:focus` 轮廓、只用 placeholder 当标签 | `:focus-visible` 清晰双层焦点环；表单上方常驻标签 + 下方说明文字 |

---

## 5. 审查模式（当用户要求检查/优化现有 UI 时）

不擅自重写无关代码，按严重度输出可定位、可执行的报告：
- **P0 可用性与无障碍**（对比度崩坏、键盘不可达、无焦点环、破版溢出）
- **P1 视觉层级与行业契合度**（焦点模糊、主次倒置、风格与产品调性严重违和、典型 AI 套路）
- **P2 细节打磨**（间距/圆角魔法数字、中西混排断层、缺失加载/空状态）

---

## 6. 交付前极速自检（6 秒扫视）

1. **行业与品牌契合吗？** 眯眼看第一屏，它像一个真实的餐饮/科技/奢品/艺术/教育产品，还是又一个千篇一律的 AI 模板？
2. **层级清楚吗？** 每个任务区的视觉主角是否一目了然？
3. **对比度与字体稳吗？** 按钮文字、输入框边框是否清晰？中英文混排、数字等宽、表单字体继承是否正常？
4. **状态齐全吗？** hover / focus-visible / active / loading / empty 是否都已就位？
5. **窄屏与暗色破版吗？** 375px 移动端无横向滚动，亮暗模式表面层次自然？

---

## 参考文件与样本索引

| 文件 | 用途（按需查阅） |
|---|---|
| [references/aesthetic-directions.md](references/aesthetic-directions.md) | **核心必读**：12 大知名品牌先例深度拆解（Apple / Nike / McDonald's / Cartier / Aesop / Linear 等）+ 12 大前端行业全景适配矩阵 |
| [references/style-samples.md](references/style-samples.md) | **实战样本库**：8 大跨行业完整代码配方（含设计锚点、Token 覆写与 HTML/CSS 组件样本） |
| [examples/style-showcase.html](examples/style-showcase.html) | **可交互画廊**：单文件离线可运行的 7 大行业/品牌风格实时切换演示台 |
| [references/tokens.css](references/tokens.css) | **Token 引擎**：内置 9 套行业/品牌主题预设（`data-style` 一键切换）、OKLCH 原语与 `light-dark()` 双模 |
| [references/components.md](references/components.md) | **组件配方**：17 类常用组件与多风格变体（含锋利奢品态、物理按压态、海报 Hero 等） |
| [references/data-viz.md](references/data-viz.md) | **数据可视化**：KPI 卡、图表选型、去 chart junk、数字与金融格式规范 |
| [references/ux-writing.md](references/ux-writing.md) | **中文文案指南**：语气、全角标点与中西混排、按钮/报错/空状态文案、各行业真实感示例数据 |
| [references/anti-patterns.md](references/anti-patterns.md) | **反模式手册**：如何区分“廉价 AI 套路”与“有意图的品牌风格化” |
