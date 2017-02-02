From: Breno Lima <breno.lima-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] drm/panel: simple: Add support for Seiko 43WVF1G
Date: Thu, 2 Feb 2017 18:04:00 -0200
Message-ID: <1486065840-13575-1-git-send-email-breno.lima@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brenomatheus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Breno Lima <breno.lima-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480)
TFT with Touch-Panel, which can be supported by the simple panel driver.

Data-sheet available at:
http://www.glyn.de/data/glyn/media/doc/43wvf1g-0.pdf

Signed-off-by: Breno Lima <breno.lima-3arQi8VN3Tc@public.gmane.org>
---
 .../bindings/display/panel/sii,43wvf1g.txt         |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sii,43wvf1g.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sii,43wvf1g.txt b/Documentation/devicetree/bindings/display/panel/sii,43wvf1g.txt
new file mode 100644
index 0000000..bbbc49f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sii,43wvf1g.txt
@@ -0,0 +1,7 @@
+Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
+
+Required properties:
+- compatible: should be "sii,43wvf1g"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 06aaf79..0e08c56 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -863,6 +863,31 @@ static const struct panel_desc hannstar_hsd070pww1 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
 };
 
+static const struct display_timing sii_43wvf1g_timing = {
+	.pixelclock = { 33500000, 33500000, 33500000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = {  164, 164, 164 },
+	.hback_porch = { 89, 89, 89 },
+	.hsync_len = { 10, 10, 10 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 10, 10, 10 },
+	.vback_porch = { 23, 23, 23 },
+	.vsync_len = { 10, 10, 10 },
+	.flags = DISPLAY_FLAGS_DE_LOW,
+};
+
+static const struct panel_desc sii_43wvf1g = {
+	.timings = &sii_43wvf1g_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 93,
+		.height = 57,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+};
+
 static const struct display_timing hannstar_hsd100pxn1_timing = {
 	.pixelclock = { 55000000, 65000000, 75000000 },
 	.hactive = { 1024, 1024, 1024 },
@@ -1853,6 +1878,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "samsung,ltn140at29-301",
 		.data = &samsung_ltn140at29_301,
 	}, {
+		.compatible = "sii,43wvf1g",
+		.data = &sii_43wvf1g,
+	}, {
 		.compatible = "sharp,lq101k1ly04",
 		.data = &sharp_lq101k1ly04,
 	}, {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
