From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 7/9] soc: mediatek: pwrap: add MediaTek MT6380 as one slave of pwrap
Date: Tue, 15 Aug 2017 17:09:19 +0800
Message-ID: <398d87c6ae2b414016fc0c0a9c6bada3ce746118.1502779753.git.sean.wang@mediatek.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502779753.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add MediaTek MT6380 regulator becoming one of PMIC wrapper slave
and also add extra new regmap_config of 32-bit mode for MT6380
since old regmap_config of 16-bit mode can't be fit into the need.

Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 1f8b69a..047e3d9 100644
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
@@ -1144,9 +1157,15 @@ static const struct of_device_id of_slave_match_tbl[] = {
 		.compatible = "mediatek,mt6323",
 		.data = &pmic_mt6323,
 	}, {
+		/* The MT6380 slave device is directly pointed to the regulator
+		 * device which is different from the cases MT6323 and MT6397
+		 * where they're one kind of MFDs.
+		 */
+		.compatible = "mediatek,mt6380-regulator",
+		.data = &pmic_mt6380,
+	}, {
 		.compatible = "mediatek,mt6397",
 		.data = &pmic_mt6397,
-	}, {
 		/* sentinel */
 	}
 };
@@ -1325,7 +1344,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out2;
 
-	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, &pwrap_regmap_config);
+	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, wrp->slave->regmap);
 	if (IS_ERR(wrp->regmap)) {
 		ret = PTR_ERR(wrp->regmap);
 		goto err_out2;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
