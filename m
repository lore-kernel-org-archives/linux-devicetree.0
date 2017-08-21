From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 3/4] dt-bindings: gpio: max3191x: Document new driver
Date: Mon, 21 Aug 2017 15:12:00 +0200
Message-ID: <7fe7636eecba238d57ab6178cfa3f6b7deca98f1.1503319573.git.lukas@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Maxim MAX3191x industrial serializer.

Cc: Mathias Duckeck <m.duckeck@kunbus.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 .../devicetree/bindings/gpio/gpio-max3191x.txt     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
new file mode 100644
index 000000000000..18182ecaa199
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
@@ -0,0 +1,37 @@
+GPIO driver for Maxim MAX3191x industrial serializer
+
+Required properties:
+ - compatible:		"maxim,max31910", "maxim,max31911", "maxim,max31912",
+			"maxim,max31913", "maxim,max31953", "maxim,max31963"
+ - gpio-controller:	Marks the device node as a GPIO controller.
+ - #gpio-cells: 	Should be two. For consumer use see gpio.txt.
+
+Optional properties:
+ - maxim,nchips:	Number of chips in the daisy-chain (default is 1).
+ - modesel-gpios:	GPIO pins to configure modesel of each chip.
+			The number of GPIOs must be equal to "maxim,nchips".
+ - fault-gpios: 	GPIO pins to read undervoltage fault of each chip.
+ - db0-gpios:		GPIO pins to configure debounce of each chip.
+ - db1-gpios:		GPIO pins to configure debounce of each chip.
+ - maxim,modesel:	Mode to use if hardwired (and thus not selectable
+			through GPIOs): 0 for 16-bit mode, 1 for 8-bit mode.
+ - maxim,no-vcc24v:	Boolean, whether the chips are powered through 5VOUT
+			instead of VCC24V.
+
+For other required and optional properties of SPI slave nodes please refer to
+../spi/spi-bus.txt.
+
+Example:
+	gpio@0 {
+		compatible = "maxim,max31913";
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		modesel-gpios = <&gpio2 23>;
+		fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		db0-gpios     = <&gpio2 25>;
+		db1-gpios     = <&gpio2 26>;
+
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+	};
-- 
2.11.0

