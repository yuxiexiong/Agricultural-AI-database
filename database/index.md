# Agricultural AI Database Index

这个目录是农业 AI 咨询和内容生产的结构化资料库。它采用“总资源索引 + 专题表”的方式组织：`resources.yml` 记录来源，其他表把来源转化为数据源、案例、场景、观点和企业生态。

## 快速入口

| 文件 | 内容 | 当前用途 |
|---|---|---|
| [`resources.yml`](./resources.yml) | 外部资源总索引 | 查来源、链接、可信度、标签 |
| [`datasets.yml`](./datasets.yml) | 数据源库 | 做数据底座、平台方案、模型特征设计 |
| [`cases.yml`](./cases.yml) | 标杆案例库 | 做 PPT 案例页、短视频拆解、客户教育 |
| [`scenarios.yml`](./scenarios.yml) | 应用场景库 | 做试点设计、方案范围、ROI 验收 |
| [`claims.yml`](./claims.yml) | 可引用观点库 | 写报告主张、公众号观点、演讲提纲 |
| [`vendors.yml`](./vendors.yml) | 企业/项目生态库 | 做竞品观察、生态地图、月度动态 |
| [`tags.yml`](./tags.yml) | 标签字典 | 统一分类、筛选和自动化口径 |
| [`README.md`](./README.md) | Schema 说明 | 维护规则、字段解释、质量等级 |

## 使用方式

### 写咨询报告

优先读取：

1. `claims.yml`：抽取可引用观点。
2. `scenarios.yml`：选择落地场景、数据需求和试点路径。
3. `cases.yml`：补充国际标杆案例。
4. `resources.yml`：追溯来源和可信度。

### 做农业 AI IP 内容

优先读取：

1. `claims.yml` 的 `content_angle_zh`。
2. `cases.yml` 的 `reusable_angle_zh`。
3. `scenarios.yml` 的 `business_value_zh` 和 `implementation_risks_zh`。
4. 主文档第 8 章的 `COPY` 和 `VIS` 素材。

### 做技术方案

优先读取：

1. `datasets.yml`：明确可用数据、尺度、限制和接入方式。
2. `scenarios.yml`：明确数据需求、AI 方法和试点边界。
3. `vendors.yml`：观察可参考的产品生态。
4. `resources.yml`：核验来源。

## 推荐筛选字段

| 目标 | 推荐筛选 |
|---|---|
| 客户咨询报告 | `best_for: consulting_report`、`fit_for: consulting_report` |
| 月度行业情报 | `best_for: monthly_intelligence` |
| 公众号/短视频 | `use_for: content_ip`、`content_angle_zh` |
| 技术选型 | `best_for: technology_selection`、`ai_methods` |
| 数据底座设计 | `best_for: data_architecture`、`data_domain`、`access_pattern` |
| ROI 测算 | `fit_for: roi_model`、`business_value_zh` |
| 风险控制 | `use_for: risk_control`、`caution_zh`、`implementation_risks_zh` |

## 当前第一轮重点

本轮按“咨询报告 50% + IP 内容 30% + 技术方案 20%”扩展，优先覆盖：

- 国际组织与政策背景：FAO、OECD-FAO、European Commission、AIM for Climate、WFP。
- 公共数据源：FAOSTAT、Sentinel-2、Landsat、ERA5、NASA POWER、SoilGrids、OpenET、USDA Quick Stats、CropScape。
- 标准与互操作：ISO 11783、ISOBUS、AgGateway ADAPT、STAC、AGROVOC。
- 标杆案例：John Deere、CropX、xFarm、ClimateAi、OpenET、Google Earth Engine、Carbon Robotics。
- 技术趋势：遥感 AI、边缘 AI、农业大模型评估、可信 AI、农机数据互操作。

## 维护提醒

- 新增外部来源：先加 `resources.yml`，再在专题表中引用 `resource_ids`。
- 新增观点：必须绑定至少一个 `resource_ids`，并填写 `caution_zh`。
- 新增案例：必须写清楚 `value_claim_zh` 和 `caveats_zh`，避免把企业宣传当作已验证事实。
- 新增场景：必须写清楚数据需求、AI 方法、业务价值、落地风险和第一阶段试点。
- 对政策、企业产品、市场规模和“最新”信息，应按 `refresh_cycles` 定期复核。
