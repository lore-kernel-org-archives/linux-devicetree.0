From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH 6/8] drm/tilcdc: panel: Fix backlight devicetree support
Date: Fri, 11 Jul 2014 11:18:52 -0300
Message-ID: <1405088334-11215-7-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088334-11215-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current backlight support is broken; the driver expects a backlight-class
in the panel devicetree node. Fix this by implementing it properly, getting
an optional backlight from a phandle.

This shouldn't cause any backward-compatibility DT issue because the current
implementation doesn't work and is not even documented.

Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
---
 .../devicetree/bindings/drm/tilcdc/panel.txt       |  5 +++++
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 23 +++++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/drm/tilcdc/panel.txt b/Documentation/devicetree/bindings/drm/tilcdc/panel.txt
index 9301c33..10a06e8 100644
--- a/Documentation/devicetree/bindings/drm/tilcdc/panel.txt
+++ b/Documentation/devicetree/bindings/drm/tilcdc/panel.txt
@@ -18,6 +18,9 @@ Required properties:
    Documentation/devicetree/bindings/video/display-timing.txt for display
    timing binding details.
 
+Optional properties:
+- backlight: phandle of the backlight device attached to the panel
+
 Recommended properties:
  - pinctrl-names, pinctrl-0: the pincontrol settings to configure
    muxing properly for pins that connect to TFP410 device
@@ -29,6 +32,8 @@ Example:
 		compatible = "ti,tilcdc,panel";
 		pinctrl-names = "default";
 		pinctrl-0 = <&bone_lcd3_cape_lcd_pins>;
+		backlight = <&backlight>;
+
 		panel-info {
 			ac-bias           = <255>;
 			ac-bias-intrpt    = <0>;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index c716c12..3dcf08e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -342,7 +342,7 @@ static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
 
 static int panel_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *bl_node, *node = pdev->dev.of_node;
 	struct panel_module *panel_mod;
 	struct tilcdc_module *mod;
 	struct pinctrl *pinctrl;
@@ -358,6 +358,17 @@ static int panel_probe(struct platform_device *pdev)
 	if (!panel_mod)
 		return -ENOMEM;
 
+	bl_node = of_parse_phandle(node, "backlight", 0);
+	if (bl_node) {
+		panel_mod->backlight = of_find_backlight_by_node(bl_node);
+		of_node_put(bl_node);
+
+		if (!panel_mod->backlight)
+			return -EPROBE_DEFER;
+
+		dev_info(&pdev->dev, "found backlight\n");
+	}
+
 	mod = &panel_mod->base;
 	pdev->dev.platform_data = mod;
 
@@ -381,10 +392,6 @@ static int panel_probe(struct platform_device *pdev)
 
 	mod->preferred_bpp = panel_mod->info->bpp;
 
-	panel_mod->backlight = of_find_backlight_by_node(node);
-	if (panel_mod->backlight)
-		dev_info(&pdev->dev, "found backlight\n");
-
 	return 0;
 
 fail_timings:
@@ -392,6 +399,8 @@ fail_timings:
 
 fail_free:
 	tilcdc_module_cleanup(mod);
+	if (panel_mod->backlight)
+		put_device(&panel_mod->backlight->dev);
 	return ret;
 }
 
@@ -399,6 +408,10 @@ static int panel_remove(struct platform_device *pdev)
 {
 	struct tilcdc_module *mod = dev_get_platdata(&pdev->dev);
 	struct panel_module *panel_mod = to_panel_module(mod);
+	struct backlight_device *backlight = panel_mod->backlight;
+
+	if (backlight)
+		put_device(&backlight->dev);
 
 	display_timings_release(panel_mod->timings);
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
