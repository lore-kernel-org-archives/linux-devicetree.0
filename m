From: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3.1 1/3] drm/rockchip: dw_hdmi: add RK3399 HDMI support
Date: Thu, 22 Jun 2017 15:17:24 +0800
Message-ID: <1498115845-7177-1-git-send-email-mark.yao@rock-chips.com>
References: <1496992236-10634-1-git-send-email-mark.yao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496992236-10634-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

RK3399 and RK3288 shared the same HDMI IP controller, only some light
difference with GRF configure.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v3.1:
  Correct documentation compatible's format(Rob Herring).
Changes in v3:
  remove hdmi_phy_configure_dwc_hdmi_3d_tx callbak.

Changes in v2:
  reuse hdmi_phy_configure_dwc_hdmi_3d_tx for phy configure
  fixup Documentation

 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |  4 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 67 ++++++++++++++++++----
 2 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
index 046076c..7039a15 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
@@ -11,7 +11,9 @@ following device-specific properties.
 
 Required properties:
 
-- compatible: Shall contain "rockchip,rk3288-dw-hdmi".
+- compatible: should be one of the following:
+		"rockchip,rk3288-dw-hdmi"
+		"rockchip,rk3399-dw-hdmi"
 - reg: See dw_hdmi.txt.
 - reg-io-width: See dw_hdmi.txt. Shall be 4.
 - interrupts: HDMI interrupt number
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 63dab6f..90aaaf4 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -20,13 +20,30 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
 
-#define GRF_SOC_CON6                    0x025c
-#define HDMI_SEL_VOP_LIT                (1 << 4)
+#define RK3288_GRF_SOC_CON6		0x025C
+#define RK3288_HDMI_LCDC_SEL		BIT(4)
+#define RK3399_GRF_SOC_CON20		0x6250
+#define RK3399_HDMI_LCDC_SEL		BIT(6)
+
+#define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
+
+/**
+ * struct rockchip_hdmi_chip_data - splite the grf setting of kind of chips
+ * @lcdsel_grf_reg: grf register offset of lcdc select
+ * @lcdsel_big: reg value of selecting vop big for HDMI
+ * @lcdsel_lit: reg value of selecting vop little for HDMI
+ */
+struct rockchip_hdmi_chip_data {
+	u32	lcdsel_grf_reg;
+	u32	lcdsel_big;
+	u32	lcdsel_lit;
+};
 
 struct rockchip_hdmi {
 	struct device *dev;
 	struct regmap *regmap;
 	struct drm_encoder encoder;
+	const struct rockchip_hdmi_chip_data *chip_data;
 };
 
 #define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
@@ -198,17 +215,20 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
 	u32 val;
-	int mux;
+	int ret;
 
-	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
-	if (mux)
-		val = HDMI_SEL_VOP_LIT | (HDMI_SEL_VOP_LIT << 16);
+	ret = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
+	if (ret)
+		val = hdmi->chip_data->lcdsel_lit;
 	else
-		val = HDMI_SEL_VOP_LIT << 16;
+		val = hdmi->chip_data->lcdsel_big;
+
+	ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
+	if (ret != 0)
+		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
 
-	regmap_write(hdmi->regmap, GRF_SOC_CON6, val);
 	dev_dbg(hdmi->dev, "vop %s output to hdmi\n",
-		(mux) ? "LIT" : "BIG");
+		ret ? "LIT" : "BIG");
 }
 
 static int
@@ -232,16 +252,40 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
 	.atomic_check = dw_hdmi_rockchip_encoder_atomic_check,
 };
 
-static const struct dw_hdmi_plat_data rockchip_hdmi_drv_data = {
+static struct rockchip_hdmi_chip_data rk3288_chip_data = {
+	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
+	.lcdsel_big = HIWORD_UPDATE(0, RK3288_HDMI_LCDC_SEL),
+	.lcdsel_lit = HIWORD_UPDATE(RK3288_HDMI_LCDC_SEL, RK3288_HDMI_LCDC_SEL),
+};
+
+static const struct dw_hdmi_plat_data rk3288_hdmi_drv_data = {
+	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mpll_cfg   = rockchip_mpll_cfg,
+	.cur_ctr    = rockchip_cur_ctr,
+	.phy_config = rockchip_phy_config,
+	.phy_data = &rk3288_chip_data,
+};
+
+static struct rockchip_hdmi_chip_data rk3399_chip_data = {
+	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
+	.lcdsel_big = HIWORD_UPDATE(0, RK3399_HDMI_LCDC_SEL),
+	.lcdsel_lit = HIWORD_UPDATE(RK3399_HDMI_LCDC_SEL, RK3399_HDMI_LCDC_SEL),
+};
+
+static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
 	.mode_valid = dw_hdmi_rockchip_mode_valid,
 	.mpll_cfg   = rockchip_mpll_cfg,
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
+	.phy_data = &rk3399_chip_data,
 };
 
 static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
 	{ .compatible = "rockchip,rk3288-dw-hdmi",
-	  .data = &rockchip_hdmi_drv_data
+	  .data = &rk3288_hdmi_drv_data
+	},
+	{ .compatible = "rockchip,rk3399-dw-hdmi",
+	  .data = &rk3399_hdmi_drv_data
 	},
 	{},
 };
@@ -268,6 +312,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	match = of_match_node(dw_hdmi_rockchip_dt_ids, pdev->dev.of_node);
 	plat_data = match->data;
 	hdmi->dev = &pdev->dev;
+	hdmi->chip_data = plat_data->phy_data;
 	encoder = &hdmi->encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
