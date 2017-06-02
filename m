From: <sean.wang@mediatek.com>
Subject: [PATCH 6/9] soc: mediatek: pwrap: add pwrap_init pointer decided by the actual PMIC
Date: Sat, 3 Jun 2017 01:55:47 +0800
Message-ID: <4f690b20599fb107a64d6fecd438ab77682419b9.1496425268.git.sean.wang@mediatek.com>
References: <cover.1496425268.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1496425268.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

pwrap initialization is highly associated with the PMIC types, so
one additional function pointer in struct pwrap_slv_type is introduced for
increasing flexibility and selecting the proper way when the slave device
is detected.

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Chen Zhong <chen.zhong@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 03c0520..d9b4a63 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -505,6 +505,7 @@ struct pwrap_slv_type {
 	 * so the pointers added increases flexibility allowing determination
 	 * which type is used by the detection through device tree.
 	 */
+	int (*pwrap_init)(struct pmic_wrapper *wrp);
 	int (*pwrap_read)(struct pmic_wrapper *wrp, u32 adr, u32 *rdata);
 	int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
 };
@@ -983,7 +984,7 @@ static int pwrap_mt2701_init_soc_specific(struct pmic_wrapper *wrp)
 	return 0;
 }
 
-static int pwrap_init(struct pmic_wrapper *wrp)
+static int pwrap_init_mt6397(struct pmic_wrapper *wrp)
 {
 	int ret;
 	u32 rdata;
@@ -1081,6 +1082,43 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 	return 0;
 }
 
+static int pwrap_init_mt6380(struct pmic_wrapper *wrp)
+{
+	int ret;
+
+	reset_control_reset(wrp->rstc);
+
+	pwrap_writel(wrp, 1, PWRAP_WRAP_EN);
+	pwrap_writel(wrp, wrp->master->arb_en_all, PWRAP_HIPRIO_ARB_EN);
+	pwrap_writel(wrp, 1, PWRAP_WACS2_EN);
+
+	ret = wrp->master->init_reg_clock(wrp);
+	if (ret)
+		return ret;
+
+	pwrap_writel(wrp, 0x1, PWRAP_WACS0_EN);
+	pwrap_writel(wrp, 0x1, PWRAP_WACS1_EN);
+	pwrap_writel(wrp, 0x1, PWRAP_WACS2_EN);
+
+	if (wrp->master->init_soc_specific) {
+		ret = wrp->master->init_soc_specific(wrp);
+		if (ret)
+			return ret;
+	}
+
+	/* Setup the init done registers */
+	pwrap_writel(wrp, 1, PWRAP_INIT_DONE2);
+	pwrap_writel(wrp, 1, PWRAP_INIT_DONE0);
+	pwrap_writel(wrp, 1, PWRAP_INIT_DONE1);
+
+	return 0;
+}
+
+static int pwrap_init(struct pmic_wrapper *wrp)
+{
+	return wrp->slave->pwrap_init(wrp);
+}
+
 static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 {
 	u32 rdata;
@@ -1107,6 +1145,8 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 static const struct pwrap_slv_type pmic_mt6323 = {
 	.dew_regs = mt6323_regs,
 	.type = PMIC_MT6323,
+
+	.pwrap_init = pwrap_init_mt6397,
 	.pwrap_read = pwrap_read16,
 	.pwrap_write = pwrap_write16,
 };
@@ -1114,6 +1154,8 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 static const struct pwrap_slv_type pmic_mt6380 = {
 	.dew_regs = NULL,
 	.type = PMIC_MT6380,
+
+	.pwrap_init = pwrap_init_mt6380,
 	.pwrap_read = pwrap_read32,
 	.pwrap_write = pwrap_write32,
 };
@@ -1121,6 +1163,8 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 static const struct pwrap_slv_type pmic_mt6397 = {
 	.dew_regs = mt6397_regs,
 	.type = PMIC_MT6397,
+
+	.pwrap_init = pwrap_init_mt6397,
 	.pwrap_read = pwrap_read16,
 	.pwrap_write = pwrap_write16,
 };
-- 
1.9.1
