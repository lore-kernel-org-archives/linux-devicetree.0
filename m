From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 02/15] drm/panel: lvds: Add support for the power-supply property
Date: Tue,  5 Dec 2017 16:10:14 +0100
Message-ID: <c8da8d3db18f096546d23a3378f844ea9a5b00d2.1512486553.git-series.maxime.ripard@free-electrons.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A significant number of panels need to power up a regulator in order to
operate properly. Add support for the power-supply property to enable and
disable such a regulator whenever needed.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-lvds.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index e2d57c01200b..57e38a9e7ab4 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 #include <drm/drmP.h>
@@ -39,6 +40,7 @@ struct panel_lvds {
 	bool data_mirror;
 
 	struct backlight_device *backlight;
+	struct regulator *supply;
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
@@ -69,6 +71,9 @@ static int panel_lvds_unprepare(struct drm_panel *panel)
 	if (lvds->enable_gpio)
 		gpiod_set_value_cansleep(lvds->enable_gpio, 0);
 
+	if (lvds->supply)
+		regulator_disable(lvds->supply);
+
 	return 0;
 }
 
@@ -76,6 +81,17 @@ static int panel_lvds_prepare(struct drm_panel *panel)
 {
 	struct panel_lvds *lvds = to_panel_lvds(panel);
 
+	if (lvds->supply) {
+		int err;
+
+		err = regulator_enable(lvds->supply);
+		if (err < 0) {
+			dev_err(lvds->dev, "failed to enable supply: %d\n",
+				err);
+			return err;
+		}
+	}
+
 	if (lvds->enable_gpio)
 		gpiod_set_value_cansleep(lvds->enable_gpio, 1);
 
@@ -196,6 +212,13 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	lvds->supply = devm_regulator_get_optional(lvds->dev, "power");
+	if (IS_ERR(lvds->supply)) {
+		ret = PTR_ERR(lvds->supply);
+		dev_err(lvds->dev, "failed to request regulator: %d\n", ret);
+		return ret;
+	}
+
 	/* Get GPIOs and backlight controller. */
 	lvds->enable_gpio = devm_gpiod_get_optional(lvds->dev, "enable",
 						     GPIOD_OUT_LOW);
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
