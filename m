From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Wed, 20 Apr 2016 15:02:31 +0530
Message-ID: <1461144755-10633-2-git-send-email-simhavcs@gmail.com>
References: <20160414171500.GA11505@rob-hp-laptop>
 <1461144755-10633-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461144755-10633-1-git-send-email-simhavcs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Vinay Simha BN <simhavcs@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add documentation for lt070me05000 panel

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
 .../bindings/display/panel/jdi,lt070me05000.txt    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
new file mode 100644
index 0000000..ffe0550
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
@@ -0,0 +1,43 @@
+JDI model LT070ME05000 1200x1920 7" DSI Panel
+
+Required properties:
+- compatible: should be "jdi,lt070me05000"
+- power-supply: phandle of the regulator that provides the supply voltage
+  IOVCC , power supply for LCM (1.8V)
+- vddp-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply (3-5V)
+- dcdc_en-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply enable, High active
+- reset-gpio: phandle of gpio for reset line
+  This should be 8mA, gpio can be configured using mux and pinctrl.
+  XRES, Reset, Low active
+- enable-gpio: phandle of gpio for enable line
+  LED_EN, LED backlight enable, High active
+- vcc-gpio: phandle of regulator/gpio that provides the supply voltage
+  VDD, LED power supply (3-5V)
+
+Optional properties:
+- pwm-gpio: phandle of gpio/pwm
+  pwm backlight control, this should be mapped to the backlight level
+  display brightness (0x51)
+
+Example:
+
+	dsi0: qcom,mdss_dsi@4700000 {
+		panel@0 {
+			compatible = "jdi,lt070me05000";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&dsi_panel_pinctrl>;
+
+			power-supply = <&pm8921_lvs5>;
+			vddp-supply = <&pm8921_l17>;
+			dcdc_en-supply = <&pm8921_lvs7>;
+
+			reset-gpio = <&tlmm_pinmux 54 0>;
+			enable-gpio = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
+			vcc-gpio = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
+
+			pwm-gpio = <&pm8921_gpio 26 GPIO_ACTIVE_HIGH>;
+		};
+	};
-- 
2.1.2
