From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH 8/8] drm/tilcdc: panel: Add support for enable GPIO
Date: Fri, 11 Jul 2014 11:18:54 -0300
Message-ID: <1405088334-11215-9-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088334-11215-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to support the "enable GPIO" available in many panel devices,
this commit adds a proper devicetree binding.

By providing an enable GPIO in the devicetree, the driver can now turn
off and on the panel device, and/or the backlight device. Both the
backlight and the GPIO are optional properties.

Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
---
 .../devicetree/bindings/drm/tilcdc/panel.txt       |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 37 +++++++++++++++++++---
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/drm/tilcdc/panel.txt b/Documentation/devicetree/bindings/drm/tilcdc/panel.txt
index 10a06e8..4ab9e23 100644
--- a/Documentation/devicetree/bindings/drm/tilcdc/panel.txt
+++ b/Documentation/devicetree/bindings/drm/tilcdc/panel.txt
@@ -20,6 +20,7 @@ Required properties:
 
 Optional properties:
 - backlight: phandle of the backlight device attached to the panel
+- enable-gpios: GPIO pin to enable or disable the panel
 
 Recommended properties:
  - pinctrl-names, pinctrl-0: the pincontrol settings to configure
@@ -33,6 +34,7 @@ Example:
 		pinctrl-names = "default";
 		pinctrl-0 = <&bone_lcd3_cape_lcd_pins>;
 		backlight = <&backlight>;
+		enable-gpios = <&gpio3 19 0>;
 
 		panel-info {
 			ac-bias           = <255>;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index f2a5b23..7a03158 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -18,6 +18,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
 #include <video/display_timing.h>
 #include <video/of_display_timing.h>
 #include <video/videomode.h>
@@ -29,6 +30,7 @@ struct panel_module {
 	struct tilcdc_panel_info *info;
 	struct display_timings *timings;
 	struct backlight_device *backlight;
+	struct gpio_desc *enable_gpio;
 };
 #define to_panel_module(x) container_of(x, struct panel_module, base)
 
@@ -55,13 +57,17 @@ static void panel_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct panel_encoder *panel_encoder = to_panel_encoder(encoder);
 	struct backlight_device *backlight = panel_encoder->mod->backlight;
+	struct gpio_desc *gpio = panel_encoder->mod->enable_gpio;
 
-	if (!backlight)
-		return;
+	if (backlight) {
+		backlight->props.power = mode == DRM_MODE_DPMS_ON ?
+					 FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
+		backlight_update_status(backlight);
+	}
 
-	backlight->props.power = mode == DRM_MODE_DPMS_ON
-				     ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-	backlight_update_status(backlight);
+	if (gpio)
+		gpiod_set_value_cansleep(gpio,
+					 mode == DRM_MODE_DPMS_ON ? 1 : 0);
 }
 
 static bool panel_encoder_mode_fixup(struct drm_encoder *encoder,
@@ -369,6 +375,25 @@ static int panel_probe(struct platform_device *pdev)
 		dev_info(&pdev->dev, "found backlight\n");
 	}
 
+	panel_mod->enable_gpio = devm_gpiod_get(&pdev->dev, "enable");
+	if (IS_ERR(panel_mod->enable_gpio)) {
+		ret = PTR_ERR(panel_mod->enable_gpio);
+		if (ret != -ENOENT) {
+			dev_err(&pdev->dev, "failed to request enable GPIO\n");
+			goto fail_backlight;
+		}
+
+		/* Optional GPIO is not here, continue silently. */
+		panel_mod->enable_gpio = NULL;
+	} else {
+		ret = gpiod_direction_output(panel_mod->enable_gpio, 0);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to setup GPIO\n");
+			goto fail_backlight;
+		}
+		dev_info(&pdev->dev, "found enable GPIO\n");
+	}
+
 	mod = &panel_mod->base;
 	pdev->dev.platform_data = mod;
 
@@ -401,6 +426,8 @@ fail_timings:
 
 fail_free:
 	tilcdc_module_cleanup(mod);
+
+fail_backlight:
 	if (panel_mod->backlight)
 		put_device(&panel_mod->backlight->dev);
 	return ret;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
