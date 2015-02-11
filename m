From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/5] drm/panel: Add support for Ampire AM-800480R3TMQW-A1H 800x480 7" panel
Date: Wed, 11 Feb 2015 18:50:09 +0100
Message-ID: <1423677011-17993-3-git-send-email-p.zabel@pengutronix.de>
References: <1423677011-17993-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423677011-17993-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the AM-800480R3TMQW-A1H 7" 800x480 panel to the
DRM simple panel driver.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/panel/ampire,am800480r3tmqwa1h.txt    |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/ampire,am800480r3tmqwa1h.txt

diff --git a/Documentation/devicetree/bindings/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/panel/ampire,am800480r3tmqwa1h.txt
new file mode 100644
index 0000000..83e2cae
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/ampire,am800480r3tmqwa1h.txt
@@ -0,0 +1,7 @@
+Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "ampire,am800480r3tmqwa1h"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1d9cb6f..aac9dc1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -327,6 +327,31 @@ static void panel_simple_shutdown(struct device *dev)
 	panel_simple_disable(&panel->base);
 }
 
+static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
+	.clock = 33333,
+	.hdisplay = 800,
+	.hsync_start = 800 + 0,
+	.hsync_end = 800 + 0 + 255,
+	.htotal = 800 + 0 + 255 + 0,
+	.vdisplay = 480,
+	.vsync_start = 480 + 2,
+	.vsync_end = 480 + 2 + 45,
+	.vtotal = 480 + 2 + 45 + 0,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc ampire_am800480r3tmqwa1h = {
+	.modes = &ampire_am800480r3tmqwa1h_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+};
+
 static const struct drm_display_mode auo_b101aw03_mode = {
 	.clock = 51450,
 	.hdisplay = 1024,
@@ -782,6 +807,9 @@ static const struct panel_desc samsung_ltn101nt05 = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		.compatible = "ampire,am800480r3tmqwa1h",
+		.data = &ampire_am800480r3tmqwa1h,
+	}, {
 		.compatible = "auo,b101aw03",
 		.data = &auo_b101aw03,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
