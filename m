From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 7/9] soc: mediatek: pwrap: add MediaTek MT6380 as one slave of
 pwrap
Date: Sat, 3 Jun 2017 01:55:48 +0800
Message-ID: <1be52eb2f97dc9152a27befca73208c4bc1a550b.1496425268.git.sean.wang@mediatek.com>
References: <cover.1496425268.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1496425268.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add MediaTek MT6380 regulator becoming one of PMIC wrapper slave
and also add extra new regmap_config of 32-bit mode for MT6380
since old regmap_config of 16-bit mode can't be fit into the need.

Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index d9b4a63..90b087f 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -501,6 +501,7 @@ enum pwrap_type {
 struct pwrap_slv_type {
 	const u32 *dew_regs;
 	enum pmic_type type;
+	const struct regmap_config *regmap;
 	/* pwrap operations are highly associated with the PMIC types,
 	 * so the pointers added increases flexibility allowing determination
 	 * which type is used by the detection through device tree.
@@ -1133,7 +1134,7 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static const struct regmap_config pwrap_regmap_config = {
+static const struct regmap_config pwrap_regmap_config16 = {
 	.reg_bits = 16,
 	.val_bits = 16,
 	.reg_stride = 2,
@@ -1142,10 +1143,19 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
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
-
+	.regmap = &pwrap_regmap_config16,
 	.pwrap_init = pwrap_init_mt6397,
 	.pwrap_read = pwrap_read16,
 	.pwrap_write = pwrap_write16,
@@ -1154,7 +1164,7 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 static const struct pwrap_slv_type pmic_mt6380 = {
 	.dew_regs = NULL,
 	.type = PMIC_MT6380,
-
+	.regmap = &pwrap_regmap_config32,
 	.pwrap_init = pwrap_init_mt6380,
 	.pwrap_read = pwrap_read32,
 	.pwrap_write = pwrap_write32,
@@ -1163,7 +1173,7 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 static const struct pwrap_slv_type pmic_mt6397 = {
 	.dew_regs = mt6397_regs,
 	.type = PMIC_MT6397,
-
+	.regmap = &pwrap_regmap_config16,
 	.pwrap_init = pwrap_init_mt6397,
 	.pwrap_read = pwrap_read16,
 	.pwrap_write = pwrap_write16,
@@ -1177,6 +1187,13 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
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
@@ -1346,7 +1363,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out2;
 
-	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, &pwrap_regmap_config);
+	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, wrp->slave->regmap);
 	if (IS_ERR(wrp->regmap))
 		return PTR_ERR(wrp->regmap);
 
-- 
1.9.1
