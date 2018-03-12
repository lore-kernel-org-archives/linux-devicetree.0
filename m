From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/3] phy: phy-mtk-tphy: add configurable parameters for
 slew rate calibrate
Date: Mon, 12 Mar 2018 13:25:39 +0800
Message-ID: <123d1a24659be168d0b040de4a67612acacf66f1.1520832210.git.chunfeng.yun@mediatek.com>
References: <c9679bc6e969ebf0f97a01c6d1aff3bbc0e8e4f7.1520832210.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <c9679bc6e969ebf0f97a01c6d1aff3bbc0e8e4f7.1520832210.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are two parameters, ref_clk and coefficient, for U2 slew rate
calibrate which may vary on different SoCs, here allow them to be
configurable

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 6073c25..38c281b 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -306,6 +306,8 @@ struct mtk_tphy {
 	const struct mtk_phy_pdata *pdata;
 	struct mtk_phy_instance **phys;
 	int nphys;
+	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
+	int src_coef; /* coefficient for slew rate calibrate */
 };
 
 static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
@@ -360,16 +362,17 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
 	writel(tmp, fmreg + U3P_U2FREQ_FMMONR1);
 
 	if (fm_out) {
-		/* ( 1024 / FM_OUT ) x reference clock frequency x 0.028 */
-		tmp = U3P_FM_DET_CYCLE_CNT * U3P_REF_CLK * U3P_SLEW_RATE_COEF;
-		tmp /= fm_out;
+		/* ( 1024 / FM_OUT ) x reference clock frequency x coef */
+		tmp = tphy->src_ref_clk * tphy->src_coef;
+		tmp = (tmp * U3P_FM_DET_CYCLE_CNT) / fm_out;
 		calibration_val = DIV_ROUND_CLOSEST(tmp, U3P_SR_COEF_DIVISOR);
 	} else {
 		/* if FM detection fail, set default value */
 		calibration_val = 4;
 	}
-	dev_dbg(tphy->dev, "phy:%d, fm_out:%d, calib:%d\n",
-		instance->index, fm_out, calibration_val);
+	dev_dbg(tphy->dev, "phy:%d, fm_out:%d, calib:%d (clk:%d, coef:%d)\n",
+		instance->index, fm_out, calibration_val,
+		tphy->src_ref_clk, tphy->src_coef);
 
 	/* set HS slew rate */
 	tmp = readl(com + U3P_USBPHYACR5);
@@ -1041,6 +1044,13 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		tphy->u3phya_ref = NULL;
 	}
 
+	tphy->src_ref_clk = U3P_REF_CLK;
+	tphy->src_coef = U3P_SLEW_RATE_COEF;
+	/* update parameters of slew rate calibrate if exist */
+	device_property_read_u32(dev, "mediatek,src-ref-clk-mhz",
+		&tphy->src_ref_clk);
+	device_property_read_u32(dev, "mediatek,src-coef", &tphy->src_coef);
+
 	port = 0;
 	for_each_child_of_node(np, child_np) {
 		struct mtk_phy_instance *instance;
-- 
1.9.1
