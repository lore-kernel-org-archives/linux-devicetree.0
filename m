From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCHv2 2/2] drm/panel: simple: Add support for Winstar WF35LTIACD
Date: Mon, 20 Mar 2017 14:32:22 +0100
Message-ID: <20170320133222.21773-1-richard.genoud@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds support for the Winstar Display Co. WF35LTIACD 3.5" QVGA TFT
LCD panel, which can be supported by the simple panel driver.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---

Changes since v1:
Add power-supply property and an example in documentation

 .../bindings/display/panel/winstar,wf35ltiacd      | 53 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd

diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
new file mode 100644
index 000000000000..9ff59b868b28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
@@ -0,0 +1,53 @@
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
+		status = "okay";
+	};
+
+	bl_reg: backlight_regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight-power-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		status = "okay";
+	};
+
+	panel: panel {
+		compatible = "winstar,wf35ltiacd", "simple-panel";
+		backlight = <&backlight>;
+		power-supply = <&panel_reg>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint@0 {
+				reg = <0>;
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
+		status = "okay";
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
