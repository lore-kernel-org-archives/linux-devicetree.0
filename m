From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] drm/panel: simple: Add support for Innolux ZJ070NA-01P
Date: Thu, 19 Mar 2015 12:22:44 +0100
Message-ID: <1426764164-30045-1-git-send-email-m.grzeschik@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Innolux ZJ070NA-01P is a 7.0" TFT LCD panel with an integrated LED
backlight unit.

This panel is used on the Technexion Toucan.

Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/panel/innolux,zj070na-01p.txt         |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/innolux,zj070na-01p.txt

diff --git a/Documentation/devicetree/bindings/panel/innolux,zj070na-01p.txt b/Documentation/devicetree/bindings/panel/innolux,zj070na-01p.txt
new file mode 100644
index 0000000..824f87f
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/innolux,zj070na-01p.txt
@@ -0,0 +1,7 @@
+Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
+
+Required properties:
+- compatible: should be "innolux,zj070na-01p"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 39806c3..3e9aa62 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -733,6 +733,29 @@ static const struct panel_desc innolux_n156bge_l21 = {
 	},
 };
 
+static const struct drm_display_mode innolux_zj070na_01p_mode = {
+	.clock = 51501,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 128,
+	.hsync_end = 1024 + 128 + 64,
+	.htotal = 1024 + 128 + 64 + 128,
+	.vdisplay = 600,
+	.vsync_start = 600 + 16,
+	.vsync_end = 600 + 16 + 4,
+	.vtotal = 600 + 16 + 4 + 16,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc innolux_zj070na_01p = {
+	.modes = &innolux_zj070na_01p_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 1024,
+		.height = 600,
+	},
+};
+
 static const struct drm_display_mode lg_lp129qe_mode = {
 	.clock = 285250,
 	.hdisplay = 2560,
@@ -835,6 +858,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "innolux,n156bge-l21",
 		.data = &innolux_n156bge_l21,
 	}, {
+		.compatible = "innolux,zj070na-01p",
+		.data = &innolux_zj070na_01p,
+	}, {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
