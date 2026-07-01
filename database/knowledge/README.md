# Knowledge Layer

本目录保存已经被整理成观点、场景和方法论的结构化知识。它不直接替代来源文件，而是把来源转化为可用于咨询报告、IP 内容和技术方案的“可调用知识”。

## 文件职责

| 文件 | 内容 |
|---|---|
| `claims.yml` | 可引用观点，必须绑定来源和风险边界 |
| `scenarios.yml` | 应用场景，包含数据需求、AI 方法、业务价值、风险和试点建议 |
| `roi.yml` | ROI 模型、验收指标、价值测算模板 |
| `risks.yml` | 风险库、反方观点、合规边界 |
| `content_angles.yml` | IP 选题、短视频角度、公众号标题方向 |

## 维护规则

- 每条观点必须有 `resource_ids`。
- 每条场景必须写清楚 `data_needs`、`ai_methods`、`business_value_zh`、`implementation_risks_zh` 和 `first_pilot_zh`。
- 每条 ROI 模型必须绑定场景、来源、基准指标、验收指标和风险边界。
- 每条风险必须写清楚 severity、风险内容、适用边界和缓解方式。
- 每条内容角度必须能回连来源和场景，避免脱离证据链写标题。
- 高风险场景应明确 caution，不输出未经专家确认的处方、诊断、金融或保险决策。
