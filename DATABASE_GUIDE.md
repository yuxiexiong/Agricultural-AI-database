# Agricultural AI Database Guide

本文件是本 repository 的长期维护总纲。后续新增资料、拆分素材、接入自动化脚本或加入多模态资源时，优先遵循这里的规则。

## 设计目标

这个资料库服务三个目标：

1. 咨询报告：支持国际农业大数据 + AI 技术咨询、行业研究、项目方案和月度情报。
2. IP 内容：支持公众号、短视频、演讲、直播和销售话术。
3. 技术方案：支持数据底座、AI 技术选型、场景试点、平台架构和风险控制。

默认比例是：咨询报告 50%，IP 内容 30%，技术方案 20%。如果未来项目目标变化，应先更新本文件，再调整目录和字段。

## 目录职责

| 路径 | 职责 | 不应放入 |
|---|---|---|
| `database/schema/` | 标签、字段、质量等级、编号规则 | 具体案例和素材正文 |
| `database/resources/` | 外部来源索引，按资源类型拆分 | 长篇报告正文、改写话术 |
| `database/knowledge/` | 结构化知识：观点、场景、ROI、风险、内容角度 | 原始来源全文 |
| `database/multimodal/` | 图片、视频、PDF、图表、数据文件等多模态资源元数据 | 大型二进制文件本体 |
| `materials/` | 人类可读素材卡片，按政策、市场、技术、案例等分类 | 机器字段规范 |
| `reports/` | 报告、月报、方案、PPT 的输出模板和大纲 | 外部来源总索引 |
| `archive/` | 历史底稿、迁移前备份、旧结构文件 | 新增活跃素材 |

## 分层原则

每条内容只放在最合适的一层：

- 来源事实：放入 `database/resources/`。
- 可引用观点：放入 `database/knowledge/claims.yml`。
- 应用场景：放入 `database/knowledge/scenarios.yml`。
- 案例拆解：结构化卡片放入 `database/resources/cases.yml`，人类可读长素材放入 `materials/cases/`。
- 报告表达：放入 `reports/` 或 `materials/copywriting/`。
- 图片、视频、PDF、图表：先放元数据到 `database/multimodal/`，本体是否下载另行决定。

不要把一个文件同时变成“来源索引 + 报告正文 + 话术库 + 项目计划”。这会导致后期检索、自动化和人工维护都变慢。

## 来源索引规则

`database/resources/` 下的文件只记录外部来源元数据，不下载外部内容。

当前来源文件：

- `policy_reports.yml`：政策、国际组织页面、趋势报告。
- `data_sources.yml`：数据平台、数据目录、API、文献索引、词表。
- `standards.yml`：标准、互操作框架、数据规范。
- `case_sources.yml`：企业案例、产品页面、商业平台。
- `papers.yml`：论文、预印本、综述。
- `projects.yml`：公共项目、开源项目、国际合作项目。
- `datasets.yml`：数据源的二次结构化卡片，解释尺度、用途和限制。
- `cases.yml`：标杆案例的二次结构化卡片。
- `vendors.yml`：企业/项目生态观察对象。

新增来源必须包含：

- `id`
- `title`
- `title_zh`
- `url`
- `source_name`
- `source_type`
- `resource_type`
- `quality_tier`
- `verification_status`
- `verified_at`
- `region`
- `tags`
- `summary_zh`
- `why_it_matters_zh`
- `best_for`
- `local_downloaded`

## 编号规则

| 类型 | 前缀 | 示例 |
|---|---|---|
| 外部来源 | `RES` | `RES-0047` |
| 数据源卡片 | `DATASET` | `DATASET-013` |
| 案例卡片 | `CASEDB` | `CASEDB-011` |
| 场景卡片 | `SCENARIO` | `SCENARIO-013` |
| 观点卡片 | `CLAIM` | `CLAIM-011` |
| 企业/项目观察 | `VENDOR` | `VENDOR-011` |
| 多模态资源 | `MEDIA` | `MEDIA-0001` |
| 人类素材卡片 | 使用主题目录 + 标题 | `materials/cases/john-deere-see-spray.md` |

编号只递增，不复用。被废弃的条目应标记 `verification_status: rejected` 或迁入 archive，不要删除后复用编号。

## 质量等级

| 等级 | 来源类型 | 使用方式 |
|---|---|---|
| A | 国际组织、政府、标准组织、公共数据集、权威科研项目 | 可作为咨询报告主依据 |
| B | 企业官网、产品官网、项目官网 | 可作为案例和商业趋势依据 |
| C | 学术论文、预印本、开源项目 | 可作为方法论和技术趋势参考 |
| D | 媒体、二手市场报告、未核验材料 | 只作线索，公开交付前必须复核 |

对外交付时，关键结论至少应有一个 A 级来源，或两个以上相互印证的 B/C 级来源。

## 多模态资源规则

后续加入图片、视频、PDF、图表或数据文件时，先记录元数据，不默认下载本体。

多模态条目必须包含：

- `id`
- `media_type`
- `title`
- `source_url`
- `source_name`
- `license_or_usage_note`
- `local_downloaded`
- `local_path`
- `related_resource_ids`
- `related_scenario_ids`
- `description_zh`
- `best_for`
- `risk_note_zh`

如果下载到本地，优先放入未来的 `assets/` 或 `downloads/`，并在 `.gitignore` 中控制大型文件、缓存和版权敏感文件。当前阶段保持 link-only。

## 更新流程

新增资料建议按这个顺序：

1. 判断来源类型和质量等级。
2. 加入 `database/resources/` 对应来源文件。
3. 如果来源能支撑观点，加入或更新 `database/knowledge/claims.yml`。
4. 如果来源能支撑场景，加入或更新 `database/knowledge/scenarios.yml`。
5. 如果适合长文案或 PPT，写入 `materials/` 下对应分类。
6. 如果用于交付物，更新 `reports/` 模板或报告大纲。
7. 运行 YAML 校验和引用完整性检查。

## 引用和风险边界

- 不把企业宣传数字改写成已验证事实。
- 不把预印本包装成行业共识。
- 不直接输出农药、兽药、疾病诊断、金融保险等高风险建议。
- 不把公开数据源等同于商业可部署系统，必须说明许可、成本、更新和本地适配。
- 涉及“最新”“当前”“今年”等时间敏感表述时，必须重新核验来源日期。

## 当前迁移状态

旧长文档已作为历史底稿保留在 `archive/`。它不再是主维护入口。未来应逐步把其中的素材拆成 `materials/` 分类卡片，并把可结构化的内容补入 `database/knowledge/`。
