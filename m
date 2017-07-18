From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 4/9] soc: mediatek: pwrap: add pwrap_read32 for reading in 32-bit mode
Date: Tue, 18 Jul 2017 17:49:24 +0800
Message-ID: <46b1d8483ace412dc6404aacaf34802e96016ad1.1500368529.git.sean.wang@mediatek.com>
References: <cover.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1500368529.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Some regulators such as MediaTek MT6380 has to be read in 32-bit mode.
So the patch adds pwrap_read32, rename old pwrap_read into pwrap_read16
and one function pointer is introduced for increasing flexibility allowing
the determination which mode is used by the pwrap slave detection through
device tree.

Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 54 +++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a5f1093..4385e8d 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -487,6 +487,7 @@ static int mt8135_regs[] = {
 
 enum pmic_type {
 	PMIC_MT6323,
+	PMIC_MT6380,
 	PMIC_MT6397,
 };
 
@@ -496,9 +497,15 @@ enum pwrap_type {
 	PWRAP_MT8173,
 };
 
+struct pmic_wrapper;
 struct pwrap_slv_type {
 	const u32 *dew_regs;
 	enum pmic_type type;
+	/* pwrap operations are highly associated with the PMIC types,
+	 * so the pointers added increases flexibility allowing determination
+	 * which type is used by the detection through device tree.
+	 */
+	int (*pwrap_read)(struct pmic_wrapper *wrp, u32 adr, u32 *rdata);
 };
 
 struct pmic_wrapper {
@@ -609,7 +616,7 @@ static int pwrap_write(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
 	return 0;
 }
 
-static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
+static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 {
 	int ret;
 
@@ -632,6 +639,39 @@ static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 	return 0;
 }
 
+static int pwrap_read32(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
+{
+	int ret, msb;
+
+	*rdata = 0;
+	for (msb = 0; msb < 2; msb++) {
+		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+		if (ret) {
+			pwrap_leave_fsm_vldclr(wrp);
+			return ret;
+		}
+
+		pwrap_writel(wrp, ((msb << 30) | (adr << 16)),
+			     PWRAP_WACS2_CMD);
+
+		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
+		if (ret)
+			return ret;
+
+		*rdata += (PWRAP_GET_WACS_RDATA(pwrap_readl(wrp,
+			   PWRAP_WACS2_RDATA)) << (16 * msb));
+
+		pwrap_writel(wrp, 1, PWRAP_WACS2_VLDCLR);
+	}
+
+	return 0;
+}
+
+static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
+{
+	return wrp->slave->pwrap_read(wrp, adr, rdata);
+}
+
 static int pwrap_regmap_read(void *context, u32 adr, u32 *rdata)
 {
 	return pwrap_read(context, adr, rdata);
@@ -752,6 +792,8 @@ static int pwrap_mt2701_init_reg_clock(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
 		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
 		break;
+	default:
+		break;
 	}
 
 	return 0;
@@ -815,6 +857,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_EN],
 			    0x1);
 		break;
+	default:
+		break;
 	}
 
 	/* wait for cipher data ready@AP */
@@ -1035,11 +1079,19 @@ static const struct regmap_config pwrap_regmap_config = {
 static const struct pwrap_slv_type pmic_mt6323 = {
 	.dew_regs = mt6323_regs,
 	.type = PMIC_MT6323,
+	.pwrap_read = pwrap_read16,
+};
+
+static const struct pwrap_slv_type pmic_mt6380 = {
+	.dew_regs = NULL,
+	.type = PMIC_MT6380,
+	.pwrap_read = pwrap_read32,
 };
 
 static const struct pwrap_slv_type pmic_mt6397 = {
 	.dew_regs = mt6397_regs,
 	.type = PMIC_MT6397,
+	.pwrap_read = pwrap_read16,
 };
 
 static const struct of_device_id of_slave_match_tbl[] = {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
