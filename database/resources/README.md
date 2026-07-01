# Resource Layer

本目录保存外部来源和经过整理的资源卡片。它回答的问题是：资料从哪里来、可信度如何、适合支撑什么内容。

## 文件职责

| 文件 | 内容 |
|---|---|
| `policy_reports.yml` | 政策、国际组织页面、行业展望、政策报告 |
| `data_sources.yml` | 数据平台、API、公开数据目录、词表、文献索引 |
| `standards.yml` | 标准、互操作框架、数据规范 |
| `case_sources.yml` | 企业案例、产品页面、商业平台来源 |
| `papers.yml` | 论文、预印本、综述 |
| `projects.yml` | 公共项目、国际合作项目、开源项目 |
| `datasets.yml` | 对数据源的二次结构化说明 |
| `cases.yml` | 对标杆案例的二次结构化说明 |
| `vendors.yml` | 企业、平台和项目生态观察 |

## 维护规则

- 外部来源先进入 `policy_reports.yml`、`data_sources.yml`、`standards.yml`、`case_sources.yml`、`papers.yml` 或 `projects.yml`。
- 如果来源需要被解释成“可用数据源”，再补充到 `datasets.yml`。
- 如果来源需要被解释成“标杆案例”，再补充到 `cases.yml`。
- 如果来源对应一个长期观察对象，再补充到 `vendors.yml`。
- 所有专题卡片应通过 `resource_ids` 回链到来源文件中的 `RES-XXXX`。
