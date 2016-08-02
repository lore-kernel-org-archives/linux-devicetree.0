From: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH 01/01] Add nvd9128 as a simple panel
Date: Tue,  2 Aug 2016 15:28:59 +0200
Message-ID: <1470144542-23585-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add New Vision Display 7.0" 800 RGB x 480 TFT LCD panel

Upstream-Status: Pending

Signed-off-by: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 .../devicetree/bindings/display/panel/nvd,9128.txt |  7 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/nvd,9128.txt

diff --git a/Documentation/devicetree/bindings/display/panel/nvd,9128.txt b/Documentation/devicetree/bindings/display/panel/nvd,9128.txt
new file mode 100644
index 0000000..17bcd01
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nvd,9128.txt
@@ -0,0 +1,7 @@
+New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
+
+Required properties:
+- compatible: should be "nvd,9128"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 68391a4..2ed703a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -178,6 +178,7 @@ netgear	NETGEAR
 netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
 netxeon		Shenzhen Netxeon Technology CO., LTD
 newhaven	Newhaven Display International
+nvd	New Vision Display
 nintendo	Nintendo
 nokia	Nokia
 nuvoton	Nuvoton Technology Corporation
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 85143d1..eaed716 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1136,6 +1136,29 @@ static const struct panel_desc nec_nl4827hc19_05b = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
 
+static const struct drm_display_mode nvd_9128_mode = {
+	.clock = 29500,
+	.hdisplay = 800,
+	.hsync_start = 800 + 130,
+	.hsync_end = 800 + 130 + 98,
+	.htotal = 800 + 0 + 130 + 98,
+	.vdisplay = 480,
+	.vsync_start = 480 + 10,
+	.vsync_end = 480 + 10 + 50,
+	.vtotal = 480 + 0 + 10 + 50,
+};
+
+static const struct panel_desc nvd_9128 = {
+	.modes = &nvd_9128_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 156,
+		.height = 88,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct display_timing okaya_rs800480t_7x0gp_timing = {
 	.pixelclock = { 30000000, 30000000, 40000000 },
 	.hactive = { 800, 800, 800 },
@@ -1611,6 +1634,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "nec,nl4827hc19-05b",
 		.data = &nec_nl4827hc19_05b,
 	}, {
+		.compatible = "nvd,9128",
+		.data = &nvd_9128,
+	}, {
 		.compatible = "okaya,rs800480t-7x0gp",
 		.data = &okaya_rs800480t_7x0gp,
 	}, {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
