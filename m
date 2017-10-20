From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v3] display: panel: Add Mitsubishi aa070mc01 display support (800x480)
Date: Sat, 21 Oct 2017 00:18:37 +0200
Message-ID: <1508537917-1723-1-git-send-email-lukma@denx.de>
References: <1508537169-402-1-git-send-email-lukma@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508537169-402-1-git-send-email-lukma-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds support for Mitsubishi aa070mc01 TFT panel working
with 8 bit ISP mode (pin 19 "mode" HIGH for 20 pin TFT connector).

Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
---
Changes for v2:
- Place the code sorted alphabetically
- Add missing ./Documentation/devicetree/binding/display properties
  description

Changes for v3:
- Fix typo in display name (in property description)

---
 .../display/panel/mitsubishi,aa070mc01.txt         |  7 +++++
 drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
new file mode 100644
index 0000000..4f5094f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
@@ -0,0 +1,7 @@
+Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "mitsubishi,aa070mc01-ca1"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 07188dc..72a20fc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1350,6 +1350,38 @@ static const struct panel_desc lg_lp129qe = {
 	},
 };
 
+static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
+	.clock = 30400,
+	.hdisplay = 800,
+	.hsync_start = 800 + 0,
+	.hsync_end = 800 + 1,
+	.htotal = 800 + 0 + 1 + 160,
+	.vdisplay = 480,
+	.vsync_start = 480 + 0,
+	.vsync_end = 480 + 48 + 1,
+	.vtotal = 480 + 48 + 1 + 0,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc mitsubishi_aa070mc01 = {
+	.modes = &mitsubishi_aa070mc01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+
+	.delay = {
+		.enable = 200,
+		.unprepare = 200,
+		.disable = 400,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct display_timing nec_nl12880bc20_05_timing = {
 	.pixelclock = { 67000000, 71000000, 75000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -2080,6 +2112,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
 	}, {
+		.compatible = "mitsubishi,aa070mc01-ca1",
+		.data = &mitsubishi_aa070mc01,
+	}, {
 		.compatible = "nec,nl12880bc20-05",
 		.data = &nec_nl12880bc20_05,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
