From: <sean.wang@mediatek.com>
Subject: [PATCH v3 5/9] soc: mediatek: pwrap: add pwrap_write32 for writing in 32-bit mode
Date: Tue, 15 Aug 2017 17:09:17 +0800
Message-ID: <236a04acb383fc655549bc345a16a2d015e5727d.1502779753.git.sean.wang@mediatek.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1502779753.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Some regulators such as MediaTek MT6380 also has to be written in
32-bit mode. So the patch adds pwrap_write32, rename old pwrap_write
into pwrap_write16 and one additional function pointer is introduced
for increasing flexibility allowing the determination which mode is
used by the pwrap slave detection through device tree.

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Chen Zhong <chen.zhong@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 63 +++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 7cd581b..9d1f4c6 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -506,6 +506,7 @@ struct pwrap_slv_type {
 	 * which type is used by the detection through device tree.
 	 */
 	int (*pwrap_read)(struct pmic_wrapper *wrp, u32 adr, u32 *rdata);
+	int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
 };
 
 struct pmic_wrapper {
@@ -600,22 +601,6 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
 	} while (1);
 }
 
-static int pwrap_write(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
-{
-	int ret;
-
-	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
-	if (ret) {
-		pwrap_leave_fsm_vldclr(wrp);
-		return ret;
-	}
-
-	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
-			PWRAP_WACS2_CMD);
-
-	return 0;
-}
-
 static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 {
 	int ret;
@@ -672,6 +657,49 @@ static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 	return wrp->slave->pwrap_read(wrp, adr, rdata);
 }
 
+static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
+{
+	int ret;
+
+	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+	if (ret) {
+		pwrap_leave_fsm_vldclr(wrp);
+		return ret;
+	}
+
+	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
+		     PWRAP_WACS2_CMD);
+
+	return 0;
+}
+
+static int pwrap_write32(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
+{
+	int ret, msb, rdata;
+
+	for (msb = 0; msb < 2; msb++) {
+		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+		if (ret) {
+			pwrap_leave_fsm_vldclr(wrp);
+			return ret;
+		}
+
+		pwrap_writel(wrp, (1 << 31) | (msb << 30) | (adr << 16) |
+			     ((wdata >> (msb * 16)) & 0xffff),
+			     PWRAP_WACS2_CMD);
+
+		if (!msb)
+			pwrap_read(wrp, adr, &rdata);
+	}
+
+	return 0;
+}
+
+static int pwrap_write(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
+{
+	return wrp->slave->pwrap_write(wrp, adr, wdata);
+}
+
 static int pwrap_regmap_read(void *context, u32 adr, u32 *rdata)
 {
 	return pwrap_read(context, adr, rdata);
@@ -1080,18 +1108,21 @@ static const struct pwrap_slv_type pmic_mt6323 = {
 	.dew_regs = mt6323_regs,
 	.type = PMIC_MT6323,
 	.pwrap_read = pwrap_read16,
+	.pwrap_write = pwrap_write16,
 };
 
 static const struct pwrap_slv_type pmic_mt6380 = {
 	.dew_regs = NULL,
 	.type = PMIC_MT6380,
 	.pwrap_read = pwrap_read32,
+	.pwrap_write = pwrap_write32,
 };
 
 static const struct pwrap_slv_type pmic_mt6397 = {
 	.dew_regs = mt6397_regs,
 	.type = PMIC_MT6397,
 	.pwrap_read = pwrap_read16,
+	.pwrap_write = pwrap_write16,
 };
 
 static const struct of_device_id of_slave_match_tbl[] = {
-- 
2.7.4
