From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: [PATCHv4 25/29] drm/omap: displays: panel-dpi: Support for handling backlight devices
Date: Thu, 30 Mar 2017 14:15:25 +0300
Message-ID: <1490872529-23084-26-git-send-email-tomi.valkeinen@ti.com>
References: <1490872529-23084-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490872529-23084-1-git-send-email-tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>

The associated backlight device can be configured via DT by providing the
phandle to the device.

If the backlight device is configured, the driver can manage the backligt
along with the panel's power state, iow it can turn on the backlight when
the panel is enabled and turn it off when the panel is disabled.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../bindings/display/panel/panel-dpi.txt           |  3 ++
 drivers/gpu/drm/omapdrm/displays/panel-dpi.c       | 37 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
index d4add13e592d..6b203bc4d932 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
@@ -9,6 +9,7 @@ Optional properties:
 - enable-gpios: panel enable gpio
 - reset-gpios: GPIO to control the RESET pin
 - vcc-supply: phandle of regulator that will be used to enable power to the display
+- backlight: phandle of the backlight device
 
 Required nodes:
 - "panel-timing" containing video timings
@@ -22,6 +23,8 @@ lcd0: display@0 {
         compatible = "samsung,lte430wq-f0c", "panel-dpi";
         label = "lcd";
 
+        backlight = <&backlight>;
+
         port {
             lcd_in: endpoint {
                     remote-endpoint = <&dpi_out>;
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dpi.c b/drivers/gpu/drm/omapdrm/displays/panel-dpi.c
index 38003208d9ca..04ce8c5f2954 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dpi.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dpi.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
+#include <linux/backlight.h>
 
 #include <video/omap-panel-data.h>
 #include <video/of_display_timing.h>
@@ -30,6 +31,8 @@ struct panel_drv_data {
 
 	struct videomode vm;
 
+	struct backlight_device *backlight;
+
 	/* used for non-DT boot, to be removed */
 	int backlight_gpio;
 
@@ -97,6 +100,11 @@ static int panel_dpi_enable(struct omap_dss_device *dssdev)
 	if (gpio_is_valid(ddata->backlight_gpio))
 		gpio_set_value_cansleep(ddata->backlight_gpio, 1);
 
+	if (ddata->backlight) {
+		ddata->backlight->props.power = FB_BLANK_UNBLANK;
+		backlight_update_status(ddata->backlight);
+	}
+
 	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 	return 0;
@@ -113,6 +121,11 @@ static void panel_dpi_disable(struct omap_dss_device *dssdev)
 	if (gpio_is_valid(ddata->backlight_gpio))
 		gpio_set_value_cansleep(ddata->backlight_gpio, 0);
 
+	if (ddata->backlight) {
+		ddata->backlight->props.power = FB_BLANK_POWERDOWN;
+		backlight_update_status(ddata->backlight);
+	}
+
 	gpiod_set_value_cansleep(ddata->enable_gpio, 0);
 	regulator_disable(ddata->vcc_supply);
 
@@ -209,6 +222,7 @@ static int panel_dpi_probe_of(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct device_node *node = pdev->dev.of_node;
+	struct device_node *bl_node;
 	struct omap_dss_device *in;
 	int r;
 	struct display_timing timing;
@@ -236,10 +250,19 @@ static int panel_dpi_probe_of(struct platform_device *pdev)
 
 	ddata->backlight_gpio = -ENOENT;
 
+	bl_node = of_parse_phandle(node, "backlight", 0);
+	if (bl_node) {
+		ddata->backlight = of_find_backlight_by_node(bl_node);
+		of_node_put(bl_node);
+
+		if (!ddata->backlight)
+			return -EPROBE_DEFER;
+	}
+
 	r = of_get_display_timing(node, "panel-timing", &timing);
 	if (r) {
 		dev_err(&pdev->dev, "failed to get video timing\n");
-		return r;
+		goto error_free_backlight;
 	}
 
 	videomode_from_timing(&timing, &ddata->vm);
@@ -247,12 +270,19 @@ static int panel_dpi_probe_of(struct platform_device *pdev)
 	in = omapdss_of_find_source_for_first_ep(node);
 	if (IS_ERR(in)) {
 		dev_err(&pdev->dev, "failed to find video source\n");
-		return PTR_ERR(in);
+		r = PTR_ERR(in);
+		goto error_free_backlight;
 	}
 
 	ddata->in = in;
 
 	return 0;
+
+error_free_backlight:
+	if (ddata->backlight)
+		put_device(&ddata->backlight->dev);
+
+	return r;
 }
 
 static int panel_dpi_probe(struct platform_device *pdev)
@@ -321,6 +351,9 @@ static int __exit panel_dpi_remove(struct platform_device *pdev)
 
 	omap_dss_put_device(in);
 
+	if (ddata->backlight)
+		put_device(&ddata->backlight->dev);
+
 	return 0;
 }
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
