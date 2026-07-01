# Agricultural AI Knowledge Base

国际农业大数据 + 人工智能技术咨询资料库  
International Agricultural Big Data + AI Consulting Knowledge Base

## 项目定位

这个 repository 是一个面向“农业 AI”咨询与内容生产的长期资料库，用于支持国际农业大数据 + 人工智能场景下的技术咨询、行业研究、标杆案例整理、月度情报和 IP 内容生产。

核心判断：农业行业并不只是“缺 AI 模型”，更常见的瓶颈是数据分散、标准不统一、场景复杂、ROI 难量化，以及模型建议无法进入真实农事工作流。

本仓库采用分层结构管理资料，避免单一长文档无限膨胀。

## 快速入口

| 路径 | 用途 |
|---|---|
| [DATABASE_GUIDE.md](./DATABASE_GUIDE.md) | 资料库总纲：目录职责、编号规则、质量等级、多模态规则、更新流程 |
| [database/index.md](./database/index.md) | 结构化 database 导航 |
| [database/resources/](./database/resources/) | 外部来源、数据源、案例、企业和论文索引 |
| [database/knowledge/](./database/knowledge/) | 可引用观点和应用场景 |
| [database/schema/](./database/schema/) | 标签、字段和质量规则 |
| [database/multimodal/](./database/multimodal/) | 图片、视频、PDF、图表等多模态资源元数据 |
| [materials/](./materials/) | 人类可读素材卡片，按政策、市场、技术、案例、ROI 等分类 |
| [materials/index.md](./materials/index.md) | 从旧长文档拆分出的 84 条素材总索引 |
| [reports/](./reports/) | 咨询报告、月报和实施方案模板 |
| [archive/](./archive/) | 历史底稿和旧结构备份 |

## 当前结构

```text
Agri AI/
├── README.md
├── DATABASE_GUIDE.md
├── database/
│   ├── index.md
│   ├── schema/
│   ├── resources/
│   ├── knowledge/
│   └── multimodal/
├── materials/
├── reports/
└── archive/
```

## 如何使用

### 写咨询报告

优先读取：

1. [reports/consulting_report_outline.md](./reports/consulting_report_outline.md)
2. [database/knowledge/claims.yml](./database/knowledge/claims.yml)
3. [database/knowledge/scenarios.yml](./database/knowledge/scenarios.yml)
4. [database/resources/](./database/resources/)

### 做农业 AI IP 内容

优先读取：

1. `database/knowledge/claims.yml` 的 `content_angle_zh`
2. `database/resources/cases.yml` 的案例拆解
3. `materials/copywriting/`
4. `materials/visuals/`

### 做技术方案

优先读取：

1. `database/knowledge/scenarios.yml`
2. `database/resources/datasets.yml`
3. `database/resources/data_sources.yml`
4. `database/resources/standards.yml`
5. [reports/implementation_plan_template.md](./reports/implementation_plan_template.md)

### 做月度行业情报

优先读取：

1. [reports/monthly_intelligence_template.md](./reports/monthly_intelligence_template.md)
2. `database/resources/policy_reports.yml`
3. `database/resources/case_sources.yml`
4. `database/resources/vendors.yml`

## 当前覆盖主题

- 农业 AI 技术地图：计算机视觉、遥感、时序预测、生成式 AI、知识图谱、边缘 AI、机器人、数字孪生。
- 农业数据底座：遥感、IoT、农机、气象、土壤、农艺记录、市场与供应链、文献和词表。
- 国际政策与趋势：FAO、OECD-FAO、欧盟 CAP、欧盟农业数据空间、AIM for Climate、WFP。
- 公开数据源：Sentinel-2、Landsat、NASA POWER、ERA5、OpenET、WaPOR、GAEZ、FAOSTAT、SoilGrids、USDA Quick Stats、USDA Census of Agriculture、ARMS、CropScape、NLCD。
- 标准与互操作：ISO 11783 / ISOBUS、ISOBUS Data Dictionary、AgGateway ADAPT、STAC、AGROVOC。
- 标杆案例：John Deere See & Spray、CropX、xFarm、ClimateAi、OpenET、Google Earth Engine、Carbon Robotics。
- 应用场景：智能灌溉、病虫害预警、精准喷洒、产量预测、农技助手、农业保险、供应链风险、农机互操作、区域作物适宜性、农场经营基准与 ROI。

## 维护原则

- 新增资料先读 [DATABASE_GUIDE.md](./DATABASE_GUIDE.md)。
- 外部来源进入 `database/resources/`，不要混入报告正文。
- 可复用观点进入 `database/knowledge/claims.yml`，并绑定来源。
- 应用场景进入 `database/knowledge/scenarios.yml`，并写清数据、方法、价值、风险和试点。
- 人类可读素材进入 `materials/`，按类型分文件。
- 多模态资源先进入 `database/multimodal/` 做元数据索引，不默认下载本体。
- 历史长文档只作为 archive，不再作为主维护入口。

## Repository Status

当前仓库是资料库型项目，不包含代码运行环境。主要交付物是 Markdown 与 YAML，可直接在 GitHub 阅读，也可被脚本、RAG 工具或文案生成工具读取。
