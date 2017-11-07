From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display support (800x480)
Date: Tue,  7 Nov 2017 16:30:58 +0100
Message-ID: <20171107153058.5554-1-lukma@denx.de>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>

---
Changes for v2:
- Provide more detailed ./Documentation/devicetree/bindings/display/panel
  entry to describe this panel device.
---
 .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
new file mode 100644
index 000000000000..02562867444d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
@@ -0,0 +1,29 @@
+Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "tianma,tm070rvhg71
+- power-supply: single regulator to provide the supply voltage
+- backlight: phandle of the backlight device attached to the panel
+
+Required nodes:
+- port: LVDS port mapping to connect this display
+
+This panel needs single power supply voltage. Its backlight is conntrolled
+via PWM signal.
+
+Example:
+--------
+
+Example device-tree definition when connected to iMX6Q based board
+
+	panel: panel-lvds0 {
+		compatible = "tianma,tm070rvhg71";
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_lvds>;
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3d2cb8bc4d94..07188dc084df 100644
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
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
