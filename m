From: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 3/4] drm/rockchip: dw_hdmi: introduce the VPLL clock setting
Date: Fri,  9 Jun 2017 11:18:22 +0800
Message-ID: <1496978302-32741-1-git-send-email-mark.yao@rock-chips.com>
References: <1496976070-29573-1-git-send-email-mark.yao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496976070-29573-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For RK3399 HDMI, there is an external clock need for HDMI PHY,
and it should keep the same clock rate with VOP DCLK.

VPLL have supported the clock for HDMI PHY, but there is no
clock divider bewteen VPLL and HDMI PHY. So we need to set the
VPLL rate manually in HDMI driver.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Changes in v2: describe vpll on Documentation.
---
 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |  2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 25 +++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
index 046076c..b76b7ee 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
@@ -30,7 +30,7 @@ Optional properties
   I2C master controller.
 - clock-names: See dw_hdmi.txt. The "cec" clock is optional.
 - clock-names: May contain "cec" as defined in dw_hdmi.txt.
-
+- clock-names: May contain "vpll", external clock for some hdmi phy.
 
 Example:
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 15a8989..69256cf 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -7,10 +7,12 @@
  * (at your option) any later version.
  */
 
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+
 #include <drm/drm_of.h>
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
@@ -44,6 +46,7 @@ struct rockchip_hdmi {
 	struct regmap *regmap;
 	struct drm_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
+	struct clk *vpll_clk;
 };
 
 #define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
@@ -160,6 +163,7 @@ struct rockchip_hdmi {
 static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 {
 	struct device_node *np = hdmi->dev->of_node;
+	int ret;
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
@@ -167,6 +171,22 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 		return PTR_ERR(hdmi->regmap);
 	}
 
+	hdmi->vpll_clk = devm_clk_get(hdmi->dev, "vpll");
+	if (PTR_ERR(hdmi->vpll_clk) == -ENOENT) {
+		hdmi->vpll_clk = NULL;
+	} else if (PTR_ERR(hdmi->vpll_clk) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(hdmi->vpll_clk)) {
+		dev_err(hdmi->dev, "failed to get grf clock\n");
+		return PTR_ERR(hdmi->vpll_clk);
+	}
+
+	ret = clk_prepare_enable(hdmi->vpll_clk);
+	if (ret) {
+		dev_err(hdmi->dev, "Failed to enable HDMI vpll: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -209,6 +229,9 @@ static void dw_hdmi_rockchip_encoder_mode_set(struct drm_encoder *encoder,
 					      struct drm_display_mode *mode,
 					      struct drm_display_mode *adj_mode)
 {
+	struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
+
+	clk_set_rate(hdmi->vpll_clk, adj_mode->clock * 1000);
 }
 
 static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
