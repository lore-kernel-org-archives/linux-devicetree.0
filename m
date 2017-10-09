From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH] dt-bindings: pinctrl: mcp23s08 update binding doc
Date: Mon,  9 Oct 2017 14:03:00 +0200
Message-ID: <20171009120300.18251-1-poeschel@lemonage.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Lars Poeschel <poeschel@lemonage.de>
List-Id: devicetree@vger.kernel.org

The mcp23s08 driver moved to pinctrl recently. It accepts the
bias-pull-up pinctrl property since then. This updates the binding
doc to reflect that.
Thanks to Sebastian Reichel for the working example.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
 .../bindings/pinctrl/pinctrl-mcp23s08.txt          | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 8a5bf994379d..9c451c20dda4 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -82,3 +82,61 @@ gpiom1: gpio@0 {
         reg = <0>;
         spi-max-frequency = <1000000>;
 };
+
+Pull-up configuration
+=====================
+
+If pins are used as output, they can also be configured with pull-ups. This is
+done with pinctrl.
+
+Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
+for details of the common pinctrl bindings used by client devices,
+including the meaning of the phrase "pin configuration node".
+
+Optional Pinmux properties:
+--------------------------
+Following properties are required if default setting of pins are required
+at boot.
+- pinctrl-names: A pinctrl state named per <pinctrl-binding.txt>.
+- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
+		<pinctrl-binding.txt>.
+
+The pin configurations are defined as child of the pinctrl states node. Each
+sub-node have following properties:
+
+Required properties:
+------------------
+- pins: List of pins. Valid values of pins properties are:
+		      gpio0 ... gpio7 for the devices with 8 GPIO pins and
+		      gpio0 ... gpio15 for the devices with 16 GPIO pins.
+
+Optional properties:
+-------------------
+The following optional property is defined in the pinmux DT binding document
+<pinctrl-bindings.txt>. Absence of this property will leave the configuration
+in its default state.
+	bias-pull-up
+
+Example with pinctrl to pull-up output pins:
+gpio21: gpio@21 {
+	compatible = "microchip,mcp23017";
+	gpio-controller;
+	#gpio-cells = <0x2>;
+	reg = <0x21>;
+	interrupt-parent = <&socgpio>;
+	interrupts = <0x17 0x8>;
+	interrupt-names = "mcp23017@21 irq";
+	interrupt-controller;
+	#interrupt-cells = <0x2>;
+	microchip,irq-mirror;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2cgpio0irq &gpio21pullups>;
+
+	gpio21pullups: pinmux {
+		pins =	"gpio0", "gpio1", "gpio2", "gpio3",
+			"gpio4", "gpio5", "gpio6", "gpio7",
+			"gpio8", "gpio9", "gpio10", "gpio11",
+			"gpio12", "gpio13", "gpio14", "gpio15";
+		bias-pull-up;
+	};
+};
-- 
2.14.2

