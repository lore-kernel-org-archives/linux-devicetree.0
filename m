From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 1/4] drm/panel: simple: add support for NEC NL12880B20-05
Date: Thu,  8 Jun 2017 20:07:55 +0200
Message-ID: <20170608180758.31020-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds support for the NEC LCD Technologies, Ltd. 12.1"
WXGA (1280x800) LVDS TFT LCD panel, which can be supported
by the simple panel driver.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
v2: new patch in V2
---
 .../bindings/display/panel/nec,nl12880b20-05.txt   |  8 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 30 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt

diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt b/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
new file mode 100644
index 000000000000..71cbc49ecfab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
@@ -0,0 +1,8 @@
+NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
+
+Required properties:
+- compatible: should be "nec,nl12880bc20-05"
+- power-supply: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c4566ce8fda7..585b37f9171a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1322,6 +1322,33 @@ static const struct panel_desc lg_lp129qe = {
 	},
 };
 
+static const struct display_timing nec_nl12880bc20_05_timing = {
+	.pixelclock = { 67000000, 71000000, 75000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 2, 30, 30 },
+	.hback_porch = { 6, 100, 100 },
+	.hsync_len = { 2, 30, 30 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 5, 5, 5 },
+	.vback_porch = { 11, 11, 11 },
+	.vsync_len = { 7, 7, 7 },
+};
+
+static const struct panel_desc nec_nl12880bc20_05 = {
+	.timings = &nec_nl12880bc20_05_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 261,
+		.height = 163,
+	},
+	.delay = {
+		.enable = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct drm_display_mode nec_nl4827hc19_05b_mode = {
 	.clock = 10870,
 	.hdisplay = 480,
@@ -1972,6 +1999,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
 	}, {
+		.compatible = "nec,nl12880bc20-05",
+		.data = &nec_nl12880bc20_05,
+	}, {
 		.compatible = "nec,nl4827hc19-05b",
 		.data = &nec_nl4827hc19_05b,
 	}, {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
