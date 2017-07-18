From: <sean.wang@mediatek.com>
Subject: [PATCH v2 7/9] soc: mediatek: pwrap: add MediaTek MT6380 as one slave of pwrap
Date: Tue, 18 Jul 2017 17:49:27 +0800
Message-ID: <e738f6e6165aab383d810ed2822edab30a06107f.1500368529.git.sean.wang@mediatek.com>
References: <cover.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1500368529.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Add MediaTek MT6380 regulator becoming one of PMIC wrapper slave
and also add extra new regmap_config of 32-bit mode for MT6380
since old regmap_config of 16-bit mode can't be fit into the need.

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Chen Zhong <chen.zhong@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 1a62848..2439337 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -501,6 +501,7 @@ struct pmic_wrapper;
 struct pwrap_slv_type {
 	const u32 *dew_regs;
 	enum pmic_type type;
+	const struct regmap_config *regmap;
 	/* pwrap operations are highly associated with the PMIC types,
 	 * so the pointers added increases flexibility allowing determination
 	 * which type is used by the detection through device tree.
@@ -1109,7 +1110,7 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static const struct regmap_config pwrap_regmap_config = {
+static const struct regmap_config pwrap_regmap_config16 = {
 	.reg_bits = 16,
 	.val_bits = 16,
 	.reg_stride = 2,
@@ -1118,9 +1119,19 @@ static const struct regmap_config pwrap_regmap_config = {
 	.max_register = 0xffff,
 };
 
+static const struct regmap_config pwrap_regmap_config32 = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_read = pwrap_regmap_read,
+	.reg_write = pwrap_regmap_write,
+	.max_register = 0xffff,
+};
+
 static const struct pwrap_slv_type pmic_mt6323 = {
 	.dew_regs = mt6323_regs,
 	.type = PMIC_MT6323,
+	.regmap = &pwrap_regmap_config16,
 	.pwrap_read = pwrap_read16,
 	.pwrap_write = pwrap_write16,
 };
@@ -1128,6 +1139,7 @@ static const struct pwrap_slv_type pmic_mt6323 = {
 static const struct pwrap_slv_type pmic_mt6380 = {
 	.dew_regs = NULL,
 	.type = PMIC_MT6380,
+	.regmap = &pwrap_regmap_config32,
 	.pwrap_read = pwrap_read32,
 	.pwrap_write = pwrap_write32,
 };
@@ -1135,6 +1147,7 @@ static const struct pwrap_slv_type pmic_mt6380 = {
 static const struct pwrap_slv_type pmic_mt6397 = {
 	.dew_regs = mt6397_regs,
 	.type = PMIC_MT6397,
+	.regmap = &pwrap_regmap_config16,
 	.pwrap_read = pwrap_read16,
 	.pwrap_write = pwrap_write16,
 };
@@ -1147,6 +1160,13 @@ static const struct of_device_id of_slave_match_tbl[] = {
 		.compatible = "mediatek,mt6397",
 		.data = &pmic_mt6397,
 	}, {
+		/* The MT6380 slave device is directly pointed to regulator
+		 * device which is different from the cases MT6323 and MT6397
+		 * since they're one kind of MFDs.
+		 */
+		.compatible = "mediatek,mt6380-regulator",
+		.data = &pmic_mt6380,
+	}, {
 		/* sentinel */
 	}
 };
@@ -1319,7 +1339,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out2;
 
-	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, &pwrap_regmap_config);
+	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, wrp->slave->regmap);
 	if (IS_ERR(wrp->regmap))
 		return PTR_ERR(wrp->regmap);
 
-- 
2.7.4
