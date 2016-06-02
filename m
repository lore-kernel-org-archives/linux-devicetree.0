From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 2/2] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Thu,  2 Jun 2016 08:05:03 +0530
Message-ID: <1464834905-25407-2-git-send-email-simhavcs@gmail.com>
References: <1464834905-25407-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464834905-25407-1-git-send-email-simhavcs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Vinay Simha BN <simhavcs@gmail.com>, Archit Taneja <archit.taneja@gmail.com>, John Stultz <john.stultz@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add documentation for lt070me05000 panel

Cc: Archit Taneja <archit.taneja@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>

--
v2:
 * incorporated rob herring and thierry reviews
   gpio to gpios, gpio to regulator using fixed regulators
   and pwm backlight is removed, since it is controlled by
   dcs commands
---
 .../bindings/display/panel/jdi,lt070me05000.txt    | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
new file mode 100644
index 0000000..51068ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
@@ -0,0 +1,58 @@
+JDI model LT070ME05000 1200x1920 7" DSI Panel
+
+Required properties:
+- compatible: should be "jdi,lt070me05000"
+- vddp-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply (3-5V)
+- dcdc_en-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply enable, High active
+- vcc-supply: phandle of the regulator that provides the supply voltage
+  IOVCC , power supply for LCM (1.8V)
+- reset-gpios: phandle of gpio for reset line
+  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
+  XRES, Reset, Low active
+- enable-gpios: phandle of gpio for enable line
+  LED_EN, LED backlight enable, High active
+
+Example:
+
+	vcc_1p8v: regulator-fixed@2 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "vcc_1p8v";
+		regulator-type = "voltage";
+		startup-delay-us = <0>;
+		gpio = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	tlmm_pinmux: pinctrl@800000 {
+
+		dsi_panel_pinctrl: dsi-panel-pinctrl {
+			mux {
+				pins = "gpio54";
+				function = "gpio";
+				bias-pull-up;
+				drive-strength = <8>;
+			};
+		};
+	};
+
+	dsi0: qcom,mdss_dsi@4700000 {
+		panel@0 {
+			compatible = "jdi,lt070me05000";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&dsi_panel_pinctrl>;
+
+			vddp-supply = <&pm8921_l17>;
+			dcdc_en-supply = <&pm8921_lvs7>;
+			vcc-supply = <&vcc_1p8v>;
+
+			reset-gpios = <&tlmm_pinmux 54 0>;
+			enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
-- 
1.9.1
