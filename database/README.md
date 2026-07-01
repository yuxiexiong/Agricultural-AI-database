# Database Schema

本目录是农业 AI 资料库的结构化索引层，用来支持自动写文案、生成咨询报告、生成 PPT、做月度行业情报，以及后续接入脚本或 RAG 工具。

## 设计原则

- 只保存公开资源的链接、摘要、标签和使用建议，不下载外部 PDF、网页、图片或数据集到本地。
- 优先记录一手来源，例如国际组织、政府机构、标准组织、项目官网、企业官网和论文主页。
- 每条资源都要能回答三个问题：它是什么、为什么重要、可以放进哪个咨询/内容场景。
- 市场规模、政策状态、企业产品能力等易变化信息必须保留核验日期和可信度等级。

## 文件说明

| 文件 | 用途 |
|---|---|
| `resources.yml` | 核心资源索引，每条记录是一个可引用、可检索、可复用的资料卡片。 |
| `datasets.yml` | 数据源库，记录数据域、尺度、接入方式、适用场景和限制。 |
| `cases.yml` | 标杆案例库，记录商业产品、公共项目、平台案例和可复用角度。 |
| `scenarios.yml` | 应用场景库，记录数据需求、AI 方法、业务价值、落地风险和试点建议。 |
| `claims.yml` | 可引用观点库，记录可直接写进报告/IP 内容的观点，并绑定来源。 |
| `vendors.yml` | 企业/项目生态库，记录农业 AI 相关企业、平台、项目和观察重点。 |
| `tags.yml` | 分类字典，统一资源类型、来源类型、应用场景、技术标签和可信度等级。 |
| `index.md` | GitHub 可读目录页，帮助人类读者快速理解 database 结构。 |

## resources.yml 字段

| 字段 | 说明 |
|---|---|
| `id` | 资源编号，格式为 `RES-0001`。 |
| `title` | 英文或原始标题。 |
| `title_zh` | 中文标题或中文解释。 |
| `url` | 原始来源链接。 |
| `source_name` | 来源机构、项目或公司。 |
| `source_type` | 来源类型，取值参考 `tags.yml`。 |
| `resource_type` | 资源类型，取值参考 `tags.yml`。 |
| `quality_tier` | 可信度等级，A-D。 |
| `verification_status` | 当前核验状态。 |
| `verified_at` | 最近核验日期。 |
| `publication_year` | 发布年份；持续更新页面可使用 `null`。 |
| `region` | 适用地区，例如 `global`、`eu`、`us`。 |
| `tags` | 检索标签。 |
| `linked_material_ids` | 对应主文档第 8 章素材编号。 |
| `summary_zh` | 资源内容摘要。 |
| `why_it_matters_zh` | 对农业 AI 咨询/IP 的价值。 |
| `best_for` | 最适合的使用场景。 |
| `local_downloaded` | 是否已下载到本地；本项目默认 `false`。 |

## 专题表关系

专题表通过 `resource_ids` 回链到 `resources.yml`：

- `datasets.yml` 回答“有哪些数据可用、适合什么模型和尺度”。
- `cases.yml` 回答“有哪些标杆案例、可复用角度是什么、风险是什么”。
- `scenarios.yml` 回答“某个农业 AI 场景需要什么数据、用什么方法、如何试点”。
- `claims.yml` 回答“报告/IP 可以引用什么观点、证据强弱如何、边界是什么”。
- `vendors.yml` 回答“应该持续观察哪些企业或项目生态”。

推荐原则：所有面向外部交付的观点都应能从 `claims.yml` 追溯到 `resources.yml` 的来源链接。

## 可信度等级

| 等级 | 定义 | 使用建议 |
|---|---|---|
| A | 官方、国际组织、政府、标准组织、公共数据集、权威科研项目 | 可作为咨询报告和客户交付的主要依据。 |
| B | 企业官网、产品官网、项目官网 | 可作为案例、产品能力和商业化趋势依据，但避免夸大效果。 |
| C | 学术论文、预印本、综述、技术报告 | 可作为技术趋势和方法论参考，正式引用前核验版本。 |
| D | 媒体、二手市场报告、未核验材料 | 仅作线索，公开交付前必须二次核验。 |

## 追加规则

新增资料时，优先追加到 `resources.yml`，再根据需要补充主文档第 8 章的素材条目。

建议流程：

1. 先判断来源是否是一手来源。
2. 填写 `source_type`、`resource_type`、`quality_tier` 和 `verified_at`。
3. 用 1-3 句话写清楚 `summary_zh` 和 `why_it_matters_zh`。
4. 通过 `tags` 和 `linked_material_ids` 把资源挂到政策、市场、技术、数据、标准、案例、场景、ROI 或风险素材上。
5. 对易变化内容，例如政策、价格、公司产品、市场规模，设置后续复核提醒。

专题表追加规则：

- 新增数据源：写入 `datasets.yml`，说明尺度、更新频率、接入方式和限制。
- 新增案例：写入 `cases.yml`，说明价值主张和 caveats，不直接复述企业宣传。
- 新增场景：写入 `scenarios.yml`，说明数据需求、AI 方法、业务价值、风险和第一阶段试点。
- 新增观点：写入 `claims.yml`，必须绑定来源和 caution。
- 新增企业/项目观察对象：写入 `vendors.yml`，说明优势和后续观察项。

## 推荐自动化用法

- 写咨询报告：筛选 `best_for` 包含 `consulting_report` 的资源。
- 做行业月报：筛选 `best_for` 包含 `monthly_intelligence` 的资源。
- 做短视频/公众号：筛选 `best_for` 包含 `content_ip` 的资源。
- 做技术方案：筛选 `tags` 包含 `data_platform`、`remote_sensing`、`iot`、`modeling`、`interoperability` 的资源。
- 做案例库：筛选 `resource_type: case` 或 `best_for` 包含 `benchmark_case` 的资源。
