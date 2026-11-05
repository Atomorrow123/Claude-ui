# 跨行业设计先例与实战代码样本库 (Style Samples)

本文件提供 **8 个不同行业与品牌先例的可直接复用样本**。每个样本均遵循 Claude UI 的底层语义 Token 秩序，但通过覆写少量的 CSS 变量与行业专属结构，呈现出截然不同的视觉性格。

> 想在浏览器中直接交互体验这几套风格的实时切换？请打开 [`../examples/style-showcase.html`](../examples/style-showcase.html)。

---

## 样本 01 · 食品与餐饮（McDonald's × Shake Shack 食欲波普风）

### 设计锚点
```text
领域与先例：连锁餐饮与精品汉堡点单 · 参考 McDonald's (Turner Duckworth) × Shake Shack
基底与变奏：暖奶油画布 (#fffdf7) + 拱门金 (#ffbc0d 配深棕黑字) 与番茄红 (#db0007) + 20px 饱满圆角
签名细节：  微距食物视觉 + 零思考负担的规格胶囊快选 + 底部常驻暖金结算条
```

### Token 覆写与组件样本
```html
<section class="sample-food" style="
  --bg: #fffdf7;
  --surface: #ffffff;
  --surface-sunken: #fff4d6;
  --text: #27251f;
  --text-secondary: #635c4f;
  --accent: #db0007;
  --accent-gold: #ffbc0d;
  --border: rgba(39, 37, 31, 0.10);
  --radius-card: 20px;
  --radius-pill: 9999px;
  background: var(--bg); color: var(--text); padding: 32px; border-radius: 24px;
">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 24px; align-items: center;">
    <!-- 左侧：情绪大标题与限时标签 -->
    <div>
      <span style="display: inline-flex; align-items: center; gap: 6px; background: var(--accent); color: #fff; padding: 4px 12px; border-radius: var(--radius-pill); font-size: 12px; font-weight: 600;">
        现烤出炉 · 黄金脆薯季
      </span>
      <h2 style="font-size: clamp(2rem, 4vw, 3rem); font-weight: 700; line-height: 1.12; margin: 16px 0 12px;">
        双层厚切安格斯，<br>每一口都汁水丰盈。
      </h2>
      <p style="color: var(--text-secondary); font-size: 16px; line-height: 1.7; margin-bottom: 24px;">
        100% 澳洲谷饲安格斯牛肉饼，配熟成切达芝士、焦糖洋葱与秘制烟熏酱，夹入现烘布里欧修黄油面包。
      </p>
      <!-- 规格快选胶囊组 -->
      <div role="group" aria-label="套餐规格选择" style="display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 24px;">
        <button type="button" style="background: var(--text); color: #fff; border: none; padding: 8px 16px; border-radius: var(--radius-pill); font-size: 14px; font-weight: 600; cursor: pointer;">
          单品汉堡 · ¥36
        </button>
        <button type="button" style="background: var(--surface-sunken); color: var(--text); border: 2px solid var(--accent-gold); padding: 8px 16px; border-radius: var(--radius-pill); font-size: 14px; font-weight: 600; cursor: pointer;">
          ★ 经典薯条可乐三件套 · ¥49
        </button>
      </div>
      <!-- 主行动点：金黄底色必须配深棕黑字以保证 10.8:1 高对比度 -->
      <button type="button" style="
        display: inline-flex; align-items: center; gap: 12px;
        background: var(--accent-gold); color: #27251f;
        border: none; min-height: 48px; padding: 0 28px;
        border-radius: var(--radius-pill); font-size: 16px; font-weight: 700;
        box-shadow: 0 4px 14px rgba(255, 188, 13, 0.35); cursor: pointer;
      ">
        <span>+ 加入今日餐盘</span>
        <span style="font-variant-numeric: tabular-nums;">¥49.00</span>
      </button>
    </div>

    <!-- 右侧：高食欲感营养与配料透明卡 -->
    <div style="background: var(--surface); border: 1px solid var(--border); border-radius: var(--radius-card); padding: 24px;">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
        <span style="font-weight: 600; font-size: 15px;">现点现做 · 定制你的口味</span>
        <span style="font-size: 12px; color: var(--text-secondary); font-variant-numeric: tabular-nums;">约 680 kcal</span>
      </div>
      <div style="display: grid; gap: 12px;">
        <label style="display: flex; justify-content: space-between; align-items: center; padding: 12px; background: var(--bg); border-radius: 12px; cursor: pointer;">
          <span>加一片熟成切达芝士</span>
          <span style="font-weight: 600; font-variant-numeric: tabular-nums;">+ ¥4.00</span>
        </label>
        <label style="display: flex; justify-content: space-between; align-items: center; padding: 12px; background: var(--bg); border-radius: 12px; cursor: pointer;">
          <span>酸黄瓜与生洋葱圈</span>
          <span style="font-size: 13px; color: #264f36; font-weight: 600;">标准配置 ✓</span>
        </label>
      </div>
    </div>
  </div>
</section>
```

---

## 样本 02 · 科技与智能硬件（Apple × Linear 光学精密风）

### 设计锚点
```text
领域与先例：AI 研发与硬件算力终端 · 参考 Apple Bento × Linear Dark Craft
基底与变奏：曜石深灰 (#08090a) + 1px 顶边微光倒角 + 紧凑字距大标题 + 等宽遥测指标
签名细节：  巨幅参数数字对比 + ⌘K 键盘快捷键徽标 + 零噪音状态指示灯
```

### Token 覆写与组件样本
```html
<section class="sample-tech" style="
  --bg: #08090a;
  --surface: #111215;
  --surface-raised: #181a1f;
  --text: #f3f4f6;
  --text-secondary: #8a8f98;
  --accent: #5e6ad2;
  --border: rgba(255, 255, 255, 0.08);
  background: var(--bg); color: var(--text); padding: 32px; border-radius: 16px;
">
  <!-- Bento 3 栏不等宽网格 -->
  <div style="display: grid; grid-template-columns: repeat(12, 1fr); gap: 16px;">
    <!-- 主卡 (Span 7) -->
    <article style="
      grid-column: span 7; background: var(--surface); border: 1px solid var(--border);
      box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.06);
      border-radius: 12px; padding: 28px; display: flex; flex-direction: column; justify-content: space-between;
    ">
      <div>
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
          <span style="font-family: monospace; font-size: 12px; color: #3ecfb4;">● ENGINE ONLINE · M4 ULTRA CLUSTER</span>
          <kbd style="background: var(--surface-raised); border: 1px solid var(--border); padding: 2px 8px; border-radius: 4px; font-size: 12px; color: var(--text-secondary);">⌘ K</kbd>
        </div>
        <h3 style="font-size: 26px; font-weight: 600; letter-spacing: -0.02em; margin: 0 0 10px;">
          端侧零延迟推理，吞吐量跃升一个数量级。
        </h3>
        <p style="color: var(--text-secondary); font-size: 14px; line-height: 1.65; margin: 0;">
          统一内存架构直接挂载 128GB 量化权重，无需经过公网 API 往返，代码补全与长文档检索在毫秒间完成。
        </p>
      </div>
      <div style="display: flex; gap: 32px; margin-top: 28px; padding-top: 20px; border-top: 1px solid var(--border);">
        <div>
          <span style="display: block; font-size: 28px; font-weight: 600; font-variant-numeric: tabular-nums;">14.2 ms</span>
          <span style="font-size: 12px; color: var(--text-secondary);">首 Token 响应延迟 (TTFT)</span>
        </div>
        <div>
          <span style="display: block; font-size: 28px; font-weight: 600; font-variant-numeric: tabular-nums;">840 tok/s</span>
          <span style="font-size: 12px; color: var(--text-secondary);">本地并发解码速率</span>
        </div>
      </div>
    </article>

    <!-- 副卡 (Span 5) -->
    <article style="
      grid-column: span 5; background: var(--surface); border: 1px solid var(--border);
      box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.06);
      border-radius: 12px; padding: 28px;
    ">
      <span style="font-family: monospace; font-size: 12px; color: var(--text-secondary);">TELEMETRY · 实时负载</span>
      <h4 style="font-size: 18px; font-weight: 600; margin: 8px 0 20px;">神经引擎核心分配</h4>
      <div style="display: grid; gap: 12px; font-family: monospace; font-size: 13px;">
        <div style="display: flex; justify-content: space-between;">
          <span>上下文索引池</span>
          <span style="color: #3ecfb4; font-variant-numeric: tabular-nums;">32.4 GB / 64 GB</span>
        </div>
        <div style="height: 6px; background: var(--surface-raised); border-radius: 999px; overflow: hidden;">
          <div style="width: 51%; height: 100%; background: var(--accent);"></div>
        </div>
      </div>
    </article>
  </div>
</section>
```

---

## 样本 03 · 艺术策展与哲学思想（MoMA × 瑞士外露网格风）

### 设计锚点
```text
领域与先例：当代艺术馆与哲学文献特展 · 参考 MoMA × Art Basel × 瑞士国际主义网格
基底与变奏：石膏暖白 (#f4f2ed) + 1px 纯黑贯穿外露网格线 + 0px 锋利直角 + 朱红展签点睛 (#d9381e)
签名细节：  博物馆馆藏展签编号 (FIG. 01) + 超大字号张力对比 + 思辨引文与展厅导览并置
```

### Token 覆写与组件样本
```html
<section class="sample-art" style="
  --bg: #f4f2ed;
  --text: #111111;
  --text-secondary: #4a4946;
  --accent: #d9381e;
  --grid-line: 1px solid #141413;
  background: var(--bg); color: var(--text); border-top: var(--grid-line); border-bottom: var(--grid-line);
">
  <!-- 顶部展签信息栏 -->
  <div style="display: flex; justify-content: space-between; padding: 12px 24px; border-bottom: var(--grid-line); font-family: monospace; font-size: 12px; letter-spacing: 0.06em;">
    <span>EXHIBITION ARCHIVE · 馆藏文献特展 #09</span>
    <span style="color: var(--accent);">2026.11.01 — 2027.02.28 · 三号展厅</span>
  </div>

  <!-- 外露网格主内容区 -->
  <div style="display: grid; grid-template-columns: 7fr 5fr;">
    <div style="padding: 40px 24px; border-right: var(--grid-line);">
      <span style="font-family: monospace; font-size: 12px; color: var(--accent); display: block; margin-bottom: 16px;">
        SECTION I · 机械复制时代的灵韵
      </span>
      <h2 style="font-family: 'Noto Serif SC', Georgia, serif; font-size: clamp(2.2rem, 4.5vw, 3.6rem); font-weight: 600; line-height: 1.1; margin: 0 0 24px;">
        观看的语法：从银版摄影到生成式矩阵
      </h2>
      <p style="font-size: 16px; line-height: 1.8; color: var(--text-secondary); max-width: 58ch; margin: 0;">
        当图像不再依赖化学显影的物理接触，我们对“在场”的哲学确信便发生了根本动摇。本次特展汇集 42 件先锋装置与手稿原件，追问技术媒介如何重塑人类感知的边界。
      </p>
    </div>

    <!-- 右侧展品卡片 -->
    <div style="padding: 40px 24px; display: flex; flex-direction: column; justify-content: space-between;">
      <div>
        <div style="font-family: monospace; font-size: 12px; color: var(--text-secondary); margin-bottom: 8px;">
          FIG. 04 · 装置原件
        </div>
        <h3 style="font-size: 20px; font-weight: 600; margin: 0 0 8px;">《未完成的光学棱镜》</h3>
        <p style="font-size: 14px; color: var(--text-secondary); margin: 0 0 20px;">
          林知夏，2025 · 阳极氧化铝、双面分光镜、定制恒流光源 · 180 × 120 × 45 cm
        </p>
      </div>
      <a href="#reserve" style="
        display: inline-flex; justify-content: space-between; align-items: center;
        border: var(--grid-line); padding: 14px 20px; color: var(--text);
        text-decoration: none; font-size: 14px; font-weight: 600;
      ">
        <span>预约策展人导览场次</span>
        <span aria-hidden="true">→</span>
      </a>
    </div>
  </div>
</section>
```

---

## 样本 04 · 服装与高定奢品（Cartier × Celine 展柜剧场风）

### 设计锚点
```text
领域与先例：高级珠宝腕表与时装屋 · 参考 Cartier × Hermès × Celine
基底与变奏：深邃丝绒黑 (#0c0b0a) + 香槟金 (#b89758) + 0px 绝对直角 + 宽字距大写眉标
签名细节：  古典高对比衬线标题 + 1px 金属感游丝细框 + 克制矜贵的沙龙预约行动点
```

### Token 覆写与组件样本
```html
<section class="sample-luxury" style="
  --bg: #0c0b0a;
  --surface: #141210;
  --text: #f7f4ed;
  --text-secondary: #a8a296;
  --gold: #c2a062;
  --border-gold: rgba(194, 160, 98, 0.28);
  background: var(--bg); color: var(--text); padding: 56px 32px; text-align: center;
  border: 1px solid var(--border-gold);
">
  <span style="display: block; font-size: 11px; letter-spacing: 0.22em; text-transform: uppercase; color: var(--gold); margin-bottom: 20px;">
    HAUTE HORLOGERIE · 2026 典藏系列
  </span>
  <h2 style="font-family: 'Playfair Display', 'Noto Serif SC', Georgia, serif; font-size: clamp(2rem, 4vw, 3.25rem); font-weight: 400; line-height: 1.2; margin: 0 auto 20px; max-width: 24ch;">
    光影在八角表圈上凝结成永恒的几何
  </h2>
  <p style="font-size: 15px; line-height: 1.85; color: var(--text-secondary); max-width: 48ch; margin: 0 auto 36px;">
    搭载自制 9601 MC 型镂空手动上链机械机芯，18K 玫瑰金表壳经 14 道手工拉丝与镜面倒角打磨，表冠镶嵌一颗凸圆形蓝宝石。
  </p>

  <!-- 典藏参数三栏细线陈列 -->
  <div style="display: grid; grid-template-columns: repeat(3, 1fr); max-width: 640px; margin: 0 auto 40px; border-top: 1px solid var(--border-gold); border-bottom: 1px solid var(--border-gold); padding: 20px 0;">
    <div>
      <span style="display: block; font-size: 11px; letter-spacing: 0.14em; color: var(--text-secondary); margin-bottom: 6px;">表壳厚度</span>
      <span style="font-family: 'Noto Serif SC', serif; font-size: 18px; font-variant-numeric: tabular-nums;">7.8 毫米</span>
    </div>
    <div style="border-left: 1px solid var(--border-gold); border-right: 1px solid var(--border-gold);">
      <span style="display: block; font-size: 11px; letter-spacing: 0.14em; color: var(--text-secondary); margin-bottom: 6px;">动力储存</span>
      <span style="font-family: 'Noto Serif SC', serif; font-size: 18px; font-variant-numeric: tabular-nums;">72 小时</span>
    </div>
    <div>
      <span style="display: block; font-size: 11px; letter-spacing: 0.14em; color: var(--text-secondary); margin-bottom: 6px;">全球限量</span>
      <span style="font-family: 'Noto Serif SC', serif; font-size: 18px; font-variant-numeric: tabular-nums;">50 枚编号</span>
    </div>
  </div>

  <!-- 0px 直角细框按钮 -->
  <div style="display: inline-flex; gap: 16px; flex-wrap: wrap; justify-content: center;">
    <button type="button" style="
      background: var(--gold); color: #0c0b0a; border: 1px solid var(--gold);
      border-radius: 0; min-height: 46px; padding: 0 32px;
      font-size: 13px; letter-spacing: 0.12em; font-weight: 600; cursor: pointer;
    ">
      预约私人沙龙鉴赏
    </button>
    <button type="button" style="
      background: transparent; color: var(--text); border: 1px solid var(--border-gold);
      border-radius: 0; min-height: 46px; padding: 0 32px;
      font-size: 13px; letter-spacing: 0.12em; cursor: pointer;
    ">
      探索机芯工艺手记
    </button>
  </div>
</section>
```

---

## 样本 05 · 运动与潮流街头（Nike SNKRS 竞技海报风）

### 设计锚点
```text
领域与先例：专业跑鞋发售与运动装备 · 参考 Nike SNKRS × Tracksmith
基底与变奏：高对比沥青黑 (#111111) 与纯白 + 竞技伏特黄 (#ceff00 配纯黑字) + 超粗浓缩标题
签名细节：  海报级字重张力 + 交互式尺码矩阵 (Size Matrix) + 碳板能量回馈指标条
```

### Token 覆写与组件样本
```html
<section class="sample-sport" style="
  --bg: #111111;
  --surface: #1c1c1e;
  --text: #ffffff;
  --text-secondary: #a1a1aa;
  --volt: #ceff00;
  background: var(--bg); color: var(--text); padding: 32px; border-radius: 8px;
">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 32px; align-items: start;">
    <div>
      <span style="display: inline-block; background: var(--volt); color: #111; font-weight: 800; font-size: 12px; padding: 4px 10px; letter-spacing: 0.05em;">
        MARATHON RACING · 破纪录碳板竞速
      </span>
      <h2 style="font-size: clamp(2.4rem, 5vw, 4rem); font-weight: 900; line-height: 0.98; letter-spacing: -0.03em; margin: 16px 0;">
        AEROFLY NEXT% 4<br>为破二而生。
      </h2>
      <p style="color: var(--text-secondary); font-size: 15px; line-height: 1.65; margin-bottom: 24px;">
        全掌铲形高模量碳纤维板搭配双腔室超临界发泡中底，整鞋仅重 168 克（男码 42.5），将每一步触地转化为推进爆发力。
      </p>
      <div style="font-size: 28px; font-weight: 800; font-variant-numeric: tabular-nums;">¥ 2,099</div>
    </div>

    <!-- 右侧：尺码矩阵选择器 -->
    <div style="background: var(--surface); padding: 24px; border-radius: 6px;">
      <div style="display: flex; justify-content: space-between; font-size: 13px; margin-bottom: 12px;">
        <span style="font-weight: 600;">选择尺码 (EU)</span>
        <span style="color: var(--text-secondary);">尺码对照表</span>
      </div>
      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 8px; margin-bottom: 20px; font-variant-numeric: tabular-nums;">
        <button type="button" style="height: 42px; background: transparent; color: var(--text); border: 1px solid #3f3f46; border-radius: 4px; font-weight: 600; cursor: pointer;">40</button>
        <button type="button" style="height: 42px; background: transparent; color: var(--text); border: 1px solid #3f3f46; border-radius: 4px; font-weight: 600; cursor: pointer;">41</button>
        <button type="button" style="height: 42px; background: var(--volt); color: #111; border: 1px solid var(--volt); border-radius: 4px; font-weight: 800; cursor: pointer;">42</button>
        <button type="button" style="height: 42px; background: transparent; color: var(--text); border: 1px solid #3f3f46; border-radius: 4px; font-weight: 600; cursor: pointer;">42.5</button>
      </div>
      <button type="button" style="
        width: 100%; min-height: 48px; background: #ffffff; color: #111111;
        border: none; border-radius: 9999px; font-size: 15px; font-weight: 800; cursor: pointer;
      ">
        立即选购 · 顺丰次日达
      </button>
    </div>
  </div>
</section>
```

---

## 样本 06 · 生活服务与酒旅康养（Aesop × Airbnb 大地温润风）

### 设计锚点
```text
领域与先例：山谷温泉行馆与芳疗预约 · 参考 Aesop (药房配方表) × Airbnb (透明预订卡)
基底与变奏：未漂白亚麻色 (#f6f2ea) + 药剂深褐 (#25231f) + 鼠尾草橄榄绿 (#3f5241)
签名细节：  药典式横线属性表 + 零隐藏费用的含税价格拆分卡
```

### Token 覆写与组件样本
```html
<section class="sample-service" style="
  --bg: #f6f2ea;
  --surface: #fdfbf7;
  --text: #25231f;
  --text-secondary: #635e54;
  --accent: #3f5241;
  --border: #d8d0c1;
  background: var(--bg); color: var(--text); padding: 32px; border-radius: 12px;
">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 32px;">
    <!-- 左侧：Aesop 式处方笺说明 -->
    <div>
      <span style="font-size: 12px; letter-spacing: 0.08em; color: var(--accent); font-weight: 600;">
        BOTANICAL SPA &amp; STAY · 栖霞山居
      </span>
      <h2 style="font-family: 'Noto Serif SC', Georgia, serif; font-size: 28px; font-weight: 500; margin: 10px 0 16px;">
        雪松与苦橙叶深层舒缓疗程
      </h2>
      <div style="border-top: 2px solid var(--text); font-size: 14px;">
        <div style="display: flex; justify-content: space-between; padding: 12px 0; border-bottom: 1px solid var(--border);">
          <span style="font-weight: 600;">适用状态</span>
          <span style="color: var(--text-secondary);">长途差旅后肩颈紧绷、睡眠浅</span>
        </div>
        <div style="display: flex; justify-content: space-between; padding: 12px 0; border-bottom: 1px solid var(--border);">
          <span style="font-weight: 600;">植物精粹</span>
          <span style="color: var(--text-secondary);">大西洋雪松、苦橙叶、冷压甜杏仁油</span>
        </div>
        <div style="display: flex; justify-content: space-between; padding: 12px 0; border-bottom: 1px solid var(--border);">
          <span style="font-weight: 600;">疗程时长</span>
          <span style="color: var(--text-secondary); font-variant-numeric: tabular-nums;">90 分钟（含 20 分钟私汤浸浴）</span>
        </div>
      </div>
    </div>

    <!-- 右侧：Airbnb 式透明预约摘要卡 -->
    <div style="background: var(--surface); border: 1px solid var(--border); border-radius: 12px; padding: 24px;">
      <div style="display: flex; align-items: baseline; gap: 6px; margin-bottom: 16px;">
        <span style="font-size: 24px; font-weight: 600; font-variant-numeric: tabular-nums;">¥ 680</span>
        <span style="font-size: 14px; color: var(--text-secondary);">/ 位（含全部茶点与私汤服务费）</span>
      </div>
      <div style="display: grid; grid-template-columns: 1fr 1fr; border: 1px solid var(--border); border-radius: 8px; margin-bottom: 16px; font-size: 13px;">
        <div style="padding: 10px 12px; border-right: 1px solid var(--border);">
          <div style="color: var(--text-secondary); font-size: 11px;">预约日期</div>
          <div style="font-weight: 600;">11月8日 (周日)</div>
        </div>
        <div style="padding: 10px 12px;">
          <div style="color: var(--text-secondary); font-size: 11px;">到店时段</div>
          <div style="font-weight: 600; font-variant-numeric: tabular-nums;">15:30 — 17:00</div>
        </div>
      </div>
      <button type="button" style="
        width: 100%; min-height: 44px; background: var(--accent); color: #ffffff;
        border: none; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer;
      ">
        锁定独立理疗茶室
      </button>
      <p style="font-size: 12px; color: var(--text-secondary); text-align: center; margin: 10px 0 0;">
        到店前 4 小时可免费改期或全额退订
      </p>
    </div>
  </div>
</section>
```

---

## 样本 07 · 互动教育与知识闯关（Duolingo × Brilliant 物理回弹风）

### 设计锚点
```text
领域与先例：互动算法与逻辑思维闯关 · 参考 Duolingo (3D 按压回弹) × Brilliant.org
基底与变奏：净白画布 + 闯关绿 (#46a302) / 宝石蓝 (#1cb0f6) / 连胜橙 (#ff9600) + 16px 圆角
签名细节：  带 4px 底边厚度的物理按压选项卡片 + 顶部连胜火焰进度条 + 即时解析反馈
```

### Token 覆写与组件样本
```html
<section class="sample-edu" style="
  --bg: #ffffff;
  --surface: #f7f8fa;
  --text: #1f2937;
  --text-secondary: #6b7280;
  --green: #46a302;
  --blue: #1cb0f6;
  --orange: #ff9600;
  background: var(--bg); color: var(--text); padding: 28px; border: 2px solid #e5e7eb; border-radius: 20px;
">
  <!-- 顶部进度条与连胜徽标 -->
  <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 24px;">
    <div style="flex: 1; height: 12px; background: #e5e7eb; border-radius: 999px; overflow: hidden;">
      <div style="width: 75%; height: 100%; background: var(--green); border-radius: 999px;"></div>
    </div>
    <span style="font-weight: 800; font-size: 14px; color: var(--orange); font-variant-numeric: tabular-nums;">
      🔥 14 天连胜
    </span>
  </div>

  <span style="font-size: 12px; font-weight: 700; color: var(--blue); text-transform: uppercase; letter-spacing: 0.06em;">
    第 3 关 · 二分查找的时间复杂度
  </span>
  <h3 style="font-size: 22px; font-weight: 700; margin: 8px 0 20px;">
    在包含 1,024 个有序元素的数组中查找目标值，最多需要比较多少次？
  </h3>

  <!-- 3D 物理厚度选项卡片组 -->
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(160px, 1fr)); gap: 12px; margin-bottom: 24px;">
    <button type="button" style="
      padding: 16px; background: #fff; color: var(--text);
      border: 2px solid #e5e7eb; border-bottom-width: 4px; border-radius: 14px;
      font-size: 16px; font-weight: 700; font-variant-numeric: tabular-nums; cursor: pointer;
    ">
      A. 512 次
    </button>
    <button type="button" style="
      padding: 16px; background: #eef9ff; color: #0b84c4;
      border: 2px solid var(--blue); border-bottom-width: 4px; border-radius: 14px;
      font-size: 16px; font-weight: 700; font-variant-numeric: tabular-nums; cursor: pointer;
    ">
      B. 10 次 ✓
    </button>
    <button type="button" style="
      padding: 16px; background: #fff; color: var(--text);
      border: 2px solid #e5e7eb; border-bottom-width: 4px; border-radius: 14px;
      font-size: 16px; font-weight: 700; font-variant-numeric: tabular-nums; cursor: pointer;
    ">
      C. 32 次
    </button>
  </div>

  <!-- 正向解析反馈条 -->
  <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px; background: #ecfdf3; border: 2px solid #abefc6; padding: 16px 20px; border-radius: 14px;">
    <div>
      <strong style="color: #067647; display: block; font-size: 15px;">回答正确！每次比较都将搜索区间折半</strong>
      <span style="font-size: 13px; color: #085d3a;">因为 2¹⁰ = 1,024，所以 log₂(1024) = 10 次即可锁定目标。</span>
    </div>
    <button type="button" style="
      background: var(--green); color: #fff; border: none; border-bottom: 4px solid #337800;
      padding: 10px 24px; border-radius: 12px; font-weight: 800; font-size: 14px; cursor: pointer;
    ">
      继续下一题 →
    </button>
  </div>
</section>
```

---

## 样本 08 · 现代金融与企服账单（Stripe × Wise 通透信任风）

### 设计锚点
```text
领域与先例：跨境结算与多币种企业账户 · 参考 Stripe × Wise
基底与变奏：清透冷白 (#f8fafc) + 深海蓝 (#0a2540) + 信任蓝紫 (#544dc9) + 多层悬浮柔影
签名细节：  实时汇率/手续费透明演算微件 + 严格 tabular-nums 对齐的数字对账单
```

### Token 覆写与组件样本
```html
<section class="sample-fintech" style="
  --bg: #f8fafc;
  --surface: #ffffff;
  --text: #0a2540;
  --text-secondary: #425466;
  --accent: #544dc9;
  --success: #00875a;
  background: var(--bg); color: var(--text); padding: 32px; border-radius: 16px;
">
  <div style="max-width: 480px; margin: 0 auto; background: var(--surface); padding: 28px; border-radius: 14px; box-shadow: 0 2px 5px rgba(10,37,64,0.06), 0 14px 36px rgba(10,37,64,0.08);">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
      <span style="font-size: 14px; font-weight: 600;">实时跨境转账清算</span>
      <span style="font-size: 12px; background: #e3fcef; color: var(--success); padding: 3px 10px; border-radius: 999px; font-weight: 600;">
        ● 银行中间价已锁定
      </span>
    </div>

    <div style="padding: 14px 16px; border: 1px solid #cbd5e1; border-radius: 10px; margin-bottom: 12px; display: flex; justify-content: space-between; align-items: center;">
      <div>
        <div style="font-size: 12px; color: var(--text-secondary);">你汇出 (CNY)</div>
        <div style="font-size: 22px; font-weight: 700; font-variant-numeric: tabular-nums;">¥ 50,000.00</div>
      </div>
      <span style="font-weight: 700; background: #f1f5f9; padding: 6px 12px; border-radius: 6px; font-size: 14px;">CNY 人民币</span>
    </div>

    <div style="font-size: 13px; color: var(--text-secondary); padding: 8px 16px; display: grid; gap: 6px; font-variant-numeric: tabular-nums;">
      <div style="display: flex; justify-content: space-between;">
        <span>固定通道手续费 (0.35%)</span>
        <span>− ¥ 175.00</span>
      </div>
      <div style="display: flex; justify-content: space-between;">
        <span>实时汇率 (1 USD = 7.1820 CNY)</span>
        <span style="color: var(--success); font-weight: 600;">无汇率加点</span>
      </div>
    </div>

    <div style="padding: 14px 16px; background: #f1f5f9; border-radius: 10px; margin: 12px 0 20px; display: flex; justify-content: space-between; align-items: center;">
      <div>
        <div style="font-size: 12px; color: var(--text-secondary);">收款方实收 (USD)</div>
        <div style="font-size: 22px; font-weight: 700; color: var(--accent); font-variant-numeric: tabular-nums;">$ 6,937.48</div>
      </div>
      <span style="font-weight: 700; background: #fff; padding: 6px 12px; border-radius: 6px; font-size: 14px;">USD 美元</span>
    </div>

    <button type="button" style="
      width: 100%; min-height: 44px; background: var(--accent); color: #ffffff;
      border: none; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer;
    ">
      确认汇率并生成付款凭证 →
    </button>
  </div>
</section>
```
