From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] drm: panel: simple: add Toshiba LT089AC19000
Date: Wed, 18 Oct 2017 19:22:40 +0200
Message-ID: <20171018172240.8772-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Only exposes a single mode and not a complete display timing, as
the datasheet is rather vague about the minimum/maximum values.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- fix display size in documentation
- add bus flags
---
 .../display/panel/toshiba,lt089ac29000.txt         |  8 +++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt

diff --git a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
new file mode 100644
index 000000000000..4c0caaf246c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
@@ -0,0 +1,8 @@
+Toshiba 8.9" WXGA (1280x768) TFT LCD panel
+
+Required properties:
+- compatible: should be "toshiba,lt089ac29000.txt"
+- power-supply: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 474fa759e06e..a622aa468d2c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1831,6 +1831,30 @@ static const struct panel_desc tianma_tm070jdhg30 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 };
 
+static const struct drm_display_mode toshiba_lt089ac29000_mode = {
+	.clock = 79500,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 192,
+	.hsync_end = 1280 + 192 + 128,
+	.htotal = 1280 + 192 + 128 + 64,
+	.vdisplay = 768,
+	.vsync_start = 768 + 20,
+	.vsync_end = 768 + 20 + 7,
+	.vtotal = 768 + 20 + 7 + 3,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc toshiba_lt089ac29000 = {
+	.modes = &toshiba_lt089ac29000_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 194,
+		.height = 116,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode tpk_f07a_0102_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -2113,6 +2137,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,
 	}, {
+		.compatible = "toshiba,lt089ac29000",
+		.data = &toshiba_lt089ac29000,
+	}, {
 		.compatible = "tpk,f07a-0102",
 		.data = &tpk_f07a_0102,
 	}, {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
