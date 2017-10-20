From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] display: panel: Add Tianma tm070rvhg71 display support (800x480)
Date: Sat, 21 Oct 2017 00:10:03 +0200
Message-ID: <1508537403-878-1-git-send-email-lukma@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
---
 .../bindings/display/panel/tianma,tm070rvhg71.txt  |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
new file mode 100644
index 0000000..b84217f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
@@ -0,0 +1,7 @@
+Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "tianma,tm070rvhg71
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3d2cb8b..07188dc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1831,6 +1831,30 @@ static const struct panel_desc tianma_tm070jdhg30 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
 };
 
+static const struct display_timing tianma_tm070rvhg71_timing = {
+	.pixelclock = { 27700000, 29200000, 39600000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 12, 40, 212 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 1, 1, 40 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 1, 13, 88 },
+	.vback_porch = { 32, 32, 32 },
+	.vsync_len = { 1, 1, 3 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc tianma_tm070rvhg71 = {
+	.timings = &tianma_tm070rvhg71_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct drm_display_mode tpk_f07a_0102_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -2113,6 +2137,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,
 	}, {
+		.compatible = "tianma,tm070rvhg71",
+		.data = &tianma_tm070rvhg71,
+	}, {
 		.compatible = "tpk,f07a-0102",
 		.data = &tpk_f07a_0102,
 	}, {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
