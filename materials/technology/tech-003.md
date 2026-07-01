---
id: "TECH-003"
title: "遥感 AI 技术路径"
category: "技术路线"
source_document: "archive/农业AI技术咨询_资料库与报告底稿.md"
source_line: 901
migrated_at: "2026-07-01"
---

# TECH-003：遥感 AI 技术路径


素材类型：技术路线  
路径：

1. 数据获取：Sentinel-2、Landsat、无人机、SAR。
2. 预处理：云掩膜、辐射校正、几何校正、地块裁剪。
3. 特征构建：NDVI、NDRE、EVI、LAI、纹理、时序曲线。
4. 建模：随机森林、XGBoost、CNN、Transformer、时序模型、作物机理模型融合。
5. 输出：长势图、异常图、产量预测、灾害评估、风险分区。
6. 验证：地面样本、历史产量、专家巡田、抽样测产。

关键风险：云覆盖、地块边界不准、地面真值不足、跨年泛化差。

