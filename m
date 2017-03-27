From: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv3 2/2] drm/panel: simple: Add support for Winstar WF35LTIACD
Date: Mon, 27 Mar 2017 12:33:23 +0200
Message-ID: <20170327103323.14526-1-richard.genoud@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the Winstar Display Co. WF35LTIACD 3.5" QVGA TFT
LCD panel, which can be supported by the simple panel driver.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changes since v2:
Remove status, reg and unit-addresses from example

Changes since v1:
Add power-supply property and an example in documentation

 .../bindings/display/panel/winstar,wf35ltiacd      | 48 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 28 +++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd

diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
new file mode 100644
index 000000000000..2a7e6e3ba64c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
@@ -0,0 +1,48 @@
+Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
+
+Required properties:
+- compatible: should be "winstar,wf35ltiacd"
+- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
+
+Example:
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&hlcdc_pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <0 31 63 95 127 159 191 223 255>;
+		default-brightness-level = <191>;
+		power-supply = <&bl_reg>;
+	};
+
+	bl_reg: backlight_regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight-power-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	panel: panel {
+		compatible = "winstar,wf35ltiacd", "simple-panel";
+		backlight = <&backlight>;
+		power-supply = <&panel_reg>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint {
+				remote-endpoint = <&hlcdc_panel_output>;
+			};
+		};
+	};
+
+	panel_reg: panel_regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-power-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 06aaf79de8c8..5d45664c6c0e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1713,6 +1713,31 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode winstar_wf35ltiacd_mode = {
+	.clock = 6410,
+	.hdisplay = 320,
+	.hsync_start = 320 + 20,
+	.hsync_end = 320 + 20 + 30,
+	.htotal = 320 + 20 + 30 + 38,
+	.vdisplay = 240,
+	.vsync_start = 240 + 4,
+	.vsync_end = 240 + 4 + 3,
+	.vtotal = 240 + 4 + 3 + 15,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc winstar_wf35ltiacd = {
+	.modes = &winstar_wf35ltiacd_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 70,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "ampire,am800480r3tmqwa1h",
@@ -1892,6 +1917,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "urt,umsh-8596md-20t",
 		.data = &urt_umsh_8596md_parallel,
 	}, {
+		.compatible = "winstar,wf35ltiacd",
+		.data = &winstar_wf35ltiacd,
+	}, {
 		/* sentinel */
 	}
 };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
