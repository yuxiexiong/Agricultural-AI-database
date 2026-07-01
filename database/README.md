# Database Layer

本目录是农业 AI 资料库的结构化索引层。它面向自动化读取、检索、RAG、报告生成和资料核验。

更高层的维护规则见 [../DATABASE_GUIDE.md](../DATABASE_GUIDE.md)。

## 子目录

| 子目录 | 职责 |
|---|---|
| [`schema/`](./schema/) | 标签、字段、质量等级和复核规则 |
| [`resources/`](./resources/) | 外部来源、数据源、案例、企业/项目和论文索引 |
| [`knowledge/`](./knowledge/) | 可引用观点、应用场景和方法论知识 |
| [`multimodal/`](./multimodal/) | 图片、视频、PDF、图表等多模态资源元数据 |

## 推荐读取顺序

### 咨询报告

1. `knowledge/claims.yml`
2. `knowledge/scenarios.yml`
3. `resources/policy_reports.yml`
4. `resources/cases.yml`
5. `resources/data_sources.yml`

### IP 内容

1. `knowledge/claims.yml`
2. `resources/cases.yml`
3. `resources/vendors.yml`
4. `../materials/copywriting/`
5. `../materials/visuals/`

### 技术方案

1. `knowledge/scenarios.yml`
2. `resources/datasets.yml`
3. `resources/data_sources.yml`
4. `resources/standards.yml`
5. `schema/fields.yml`

## 关系规则

- `resources/` 下的来源卡片使用 `RES-XXXX` 编号。
- `knowledge/claims.yml` 和 `knowledge/scenarios.yml` 通过 `resource_ids` 回链到来源卡片。
- `resources/datasets.yml`、`resources/cases.yml`、`resources/vendors.yml` 是二次结构化卡片，也通过 `resource_ids` 回链。
- `multimodal/` 通过 `related_resource_ids` 和 `related_scenario_ids` 连接来源和场景。

## 质量规则

- A 级来源可作为咨询报告主依据。
- B 级来源适合作为案例和商业趋势依据，但不把企业宣传当作独立验证事实。
- C 级来源适合作为方法论和技术趋势参考，正式引用前应核验版本和评审状态。
- D 级来源只作线索。

质量等级和证据等级定义见 [`schema/quality.yml`](./schema/quality.yml)。

## 追加规则

新增内容时：

1. 先判断它是来源、观点、场景、素材还是多模态资源。
2. 来源进入 `resources/` 对应文件。
3. 观点和场景进入 `knowledge/`。
4. 人类可读素材进入 `../materials/`。
5. 多模态资源先进入 `multimodal/` 做元数据索引。
6. 更新后运行 YAML 校验和引用完整性检查。
