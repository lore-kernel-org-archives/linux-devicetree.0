From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 1/5] drm/panel: simple: add support for Ampire AM-800480AYTZQW-00H
Date: Tue,  2 Jan 2018 14:32:14 +0530
Message-ID: <1514883738-16297-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the Ampire AM-800480AYTZQW-00H 7.0" WGA LCD,
which can be supported by the simple panel driver.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 .../display/panel/ampire,am-800480aytzqw-00h.txt   |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-800480aytzqw-00h.txt

diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-800480aytzqw-00h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am-800480aytzqw-00h.txt
new file mode 100644
index 0000000..bfa7a70
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ampire,am-800480aytzqw-00h.txt
@@ -0,0 +1,7 @@
+Ampire AM-800480AYTZQW-00H 7.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "ampire,am-800480aytzqw-00h"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5591984..2ecc14b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -412,6 +412,30 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct display_timing ampire_am_800480aytzqw_00h_timing = {
+	.pixelclock = { 27700000, 29200000, 39600000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 12, 40, 212 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 1, 2, 40 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 1, 13, 88 },
+	.vback_porch = { 32, 32, 32 },
+	.vsync_len = { 1, 2, 3 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc ampire_am_800480aytzqw_00h = {
+	.timings = &ampire_am_800480aytzqw_00h_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+};
+
 static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -2028,6 +2052,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "ampire,am-480272h3tmqw-t01h",
 		.data = &ampire_am_480272h3tmqw_t01h,
 	}, {
+		.compatible = "ampire,am-800480aytzqw-00h",
+		.data = &ampire_am_800480aytzqw_00h,
+	}, {
 		.compatible = "ampire,am800480r3tmqwa1h",
 		.data = &ampire_am800480r3tmqwa1h,
 	}, {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
