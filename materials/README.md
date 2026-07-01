# Materials Layer

本目录保存人类可读的素材卡片。它面向写报告、做 PPT、写公众号和短视频脚本，而不是面向机器字段校验。

旧长文档第 8 章已经拆分为独立素材卡片。总索引见 [index.md](./index.md)。

## 分类

| 目录 | 内容 |
|---|---|
| `policy/` | 政策、监管、国际组织方向 |
| `market/` | 市场、宏观趋势、需求变化 |
| `technology/` | 技术路线、架构、模型、工程实践 |
| `data/` | 数据源、数据治理、数据平台 |
| `standards/` | 标准、互操作、数据空间 |
| `cases/` | 标杆案例、人类可读案例拆解 |
| `scenarios/` | 应用场景素材 |
| `roi/` | ROI、价值测算、验收指标 |
| `risks/` | 风险、反方观点、边界管理 |
| `copywriting/` | 可改写话术、标题、脚本素材 |
| `visuals/` | 图表、PPT 页面、视觉表达说明 |
| `operations/` | 试点实施、月度情报 SOP、项目角色配置 |
| `sources/` | 旧素材中的来源索引卡片 |

## 单条素材建议格式

```markdown
# 标题

## 素材类型

## 核心信息

## 可用角度

## 适合话术

## 关联来源

## 风险边界
```

旧长文档第 8 章素材已经拆分到这里。后续新增素材应直接创建独立卡片。

## 当前拆分结果

| 分类 | 数量 | 入口 |
|---|---:|---|
| 政策与监管 | 5 | [policy/](./policy/) |
| 市场与宏观 | 4 | [market/](./market/) |
| 数据源与数据治理 | 8 | [data/](./data/) |
| 标准与互操作 | 3 | [standards/](./standards/) |
| 技术路线 | 5 | [technology/](./technology/) |
| 标杆案例 | 5 | [cases/](./cases/) |
| 应用场景 | 10 | [scenarios/](./scenarios/) |
| ROI 与价值测算 | 3 | [roi/](./roi/) |
| 风险与反方观点 | 7 | [risks/](./risks/) |
| 可改写话术 | 10 | [copywriting/](./copywriting/) |
| 图表/PPT 页面素材 | 6 | [visuals/](./visuals/) |
| 落地运营 | 3 | [operations/](./operations/) |
| 来源索引 | 15 | [sources/](./sources/) |

## 维护规则

- 新增素材时优先创建独立 Markdown 文件，不再追加到归档长文档。
- 文件名使用小写编号，例如 `pol-001.md`、`case-001.md`。
- 如果素材有明确来源，应在卡片中保留 URL，并尽量回链到 `database/resources/`。
- 可直接对外使用的数字、政策和企业能力描述，发布前应再次核验。
