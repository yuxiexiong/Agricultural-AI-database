# Agricultural AI Database Index

这个目录是农业 AI 咨询和内容生产的结构化资料库。它不再采用单一大表，而是按 schema、resources、knowledge 和 multimodal 分层管理。

## 快速入口

| 路径 | 内容 | 当前用途 |
|---|---|---|
| [`schema/`](./schema/) | 标签、字段、质量规则 | 统一分类、字段和复核口径 |
| [`resources/`](./resources/) | 外部来源和资源卡片 | 查来源、数据源、案例、论文、企业生态 |
| [`knowledge/`](./knowledge/) | 观点和场景 | 写报告主张、方案场景、IP 内容 |
| [`multimodal/`](./multimodal/) | 多模态元数据 | 管理图片、视频、PDF、图表和数据文件 |
| [`README.md`](./README.md) | database 层说明 | 读取顺序和关系规则 |

## Resources 层

| 文件 | 内容 |
|---|---|
| [`resources/policy_reports.yml`](./resources/policy_reports.yml) | 政策、国际组织页面、趋势报告 |
| [`resources/data_sources.yml`](./resources/data_sources.yml) | 数据平台、API、公开数据目录、词表、文献索引 |
| [`resources/standards.yml`](./resources/standards.yml) | 标准、互操作框架、数据规范 |
| [`resources/case_sources.yml`](./resources/case_sources.yml) | 企业案例、产品页面、商业平台来源 |
| [`resources/papers.yml`](./resources/papers.yml) | 论文、预印本、综述 |
| [`resources/projects.yml`](./resources/projects.yml) | 公共项目、国际合作项目、开源项目 |
| [`resources/datasets.yml`](./resources/datasets.yml) | 数据源二次结构化卡片 |
| [`resources/cases.yml`](./resources/cases.yml) | 标杆案例二次结构化卡片 |
| [`resources/vendors.yml`](./resources/vendors.yml) | 企业和项目生态观察 |

当前来源层已按高可信来源优先扩展，新增资源应优先选择 A/B 级一手来源，并通过 `resource_ids` 进入可调用的 `datasets`、`claims` 或 `scenarios`。

## Knowledge 层

| 文件 | 内容 |
|---|---|
| [`knowledge/claims.yml`](./knowledge/claims.yml) | 可引用观点，绑定来源和 caution |
| [`knowledge/scenarios.yml`](./knowledge/scenarios.yml) | 应用场景，包含数据需求、AI 方法、业务价值、风险和试点 |

## 使用方式

### 写咨询报告

优先读取：

1. `knowledge/claims.yml`
2. `knowledge/scenarios.yml`
3. `resources/policy_reports.yml`
4. `resources/cases.yml`
5. `resources/data_sources.yml`

### 做农业 AI IP 内容

优先读取：

1. `knowledge/claims.yml` 的 `content_angle_zh`
2. `resources/cases.yml` 的 `reusable_angle_zh`
3. `knowledge/scenarios.yml` 的 `business_value_zh` 和 `implementation_risks_zh`
4. `../materials/copywriting/`
5. `../materials/visuals/`

### 做技术方案

优先读取：

1. `knowledge/scenarios.yml`
2. `resources/datasets.yml`
3. `resources/data_sources.yml`
4. `resources/standards.yml`
5. `schema/fields.yml`

## 维护提醒

- 新增外部来源：先加到 `resources/` 对应文件。
- 新增观点：写入 `knowledge/claims.yml`，必须绑定 `resource_ids` 和 `caution_zh`。
- 新增场景：写入 `knowledge/scenarios.yml`，必须写清数据需求、AI 方法、业务价值、风险和第一阶段试点。
- 新增人类可读素材：写入 `../materials/` 对应分类。
- 新增多模态资源：先写入 `multimodal/` 元数据文件，不默认下载本体。
