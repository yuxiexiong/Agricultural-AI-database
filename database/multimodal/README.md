# Multimodal Layer

本目录为未来的图片、视频、PDF、图表、音频和数据文件做元数据索引。当前阶段保持 link-only，不默认下载外部文件。

## 文件规划

| 文件 | 内容 |
|---|---|
| `images.yml` | 图片、图示、截图、遥感图、产品图 |
| `videos.yml` | 视频、演示、访谈、产品发布、课程 |
| `documents.yml` | PDF、白皮书、报告、政策文件 |
| `charts.yml` | 图表、信息图、可复用 PPT 图形 |
| `datasets_media.yml` | 大型数据文件、样例数据包、压缩包 |

## 维护规则

- 先记录元数据，再决定是否下载。
- 必须记录版权/许可/使用限制。
- 必须记录 `public_display` 和 `public_display_note_zh`，区分可公开展示、仅内部参考和需要授权的素材。
- 多模态条目应绑定 `related_resource_ids` 和 `scenario_ids`，避免素材脱离证据链。
- 对公开展示素材，优先使用官方可引用资源或自制图表。
- 不把版权不清晰的图片、视频或 PDF 直接提交到仓库。
