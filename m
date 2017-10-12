From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 4/5] dt-bindings: gpio: max3191x: Document new driver
Date: Thu, 12 Oct 2017 12:40:10 +0200
Message-ID: <57660f421f2080914940806394a9365ac959f5a8.1507797496.git.lukas@wunner.de>
References: <cover.1507797496.git.lukas@wunner.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1507797496.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Maxim MAX3191x industrial serializer.

Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
---
Changes v1 -> v2:

- Add vendor prefix to GPIO identifiers, use boolean instead of
  integer to select mode, rename boolean to ignore undervoltage
  alarms, separate compatible strings with newlines. (Rob Herring)

 .../devicetree/bindings/gpio/gpio-max3191x.txt     | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
new file mode 100644
index 000000000000..b3a6444b8f45
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
@@ -0,0 +1,59 @@
+GPIO driver for Maxim MAX3191x industrial serializer
+
+Required properties:
+ - compatible:		Must be one of:
+			"maxim,max31910"
+			"maxim,max31911"
+			"maxim,max31912"
+			"maxim,max31913"
+			"maxim,max31953"
+			"maxim,max31963"
+ - reg: 		Chip select number.
+ - gpio-controller:	Marks the device node as a GPIO controller.
+ - #gpio-cells: 	Should be two. For consumer use see gpio.txt.
+
+Optional properties:
+ - #daisy-chained-devices:
+			Number of chips in the daisy-chain (default is 1).
+ - maxim,modesel-gpios: GPIO pins to configure modesel of each chip.
+			The number of GPIOs must equal "#daisy-chained-devices"
+			(if each chip is driven by a separate pin) or 1
+			(if all chips are wired to the same pin).
+ - maxim,fault-gpios: 	GPIO pins to read fault of each chip.
+			The number of GPIOs must equal "#daisy-chained-devices"
+			or 1.
+ - maxim,db0-gpios:	GPIO pins to configure debounce of each chip.
+			The number of GPIOs must equal "#daisy-chained-devices"
+			or 1.
+ - maxim,db1-gpios:	GPIO pins to configure debounce of each chip.
+			The number of GPIOs must equal "maxim,db0-gpios".
+ - maxim,modesel-8bit:	Boolean whether the modesel pin of the chips is
+			pulled high (8-bit mode).  Use this if the modesel pin
+			is hardwired and consequently "maxim,modesel-gpios"
+			cannot be specified.  By default if neither this nor
+			"maxim,modesel-gpios" is given, the driver assumes
+			that modesel is pulled low (16-bit mode).
+ - maxim,ignore-undervoltage:
+			Boolean whether to ignore undervoltage alarms signaled
+			by the "maxim,fault-gpios" or by the status byte
+			(in 16-bit mode).  Use this if the chips are powered
+			through 5VOUT instead of VCC24V, in which case they
+			will constantly signal undervoltage.
+
+For other required and optional properties of SPI slave nodes please refer to
+../spi/spi-bus.txt.
+
+Example:
+	gpio@0 {
+		compatible = "maxim,max31913";
+		reg = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		maxim,modesel-gpios = <&gpio2 23>;
+		maxim,fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		maxim,db0-gpios     = <&gpio2 25>;
+		maxim,db1-gpios     = <&gpio2 26>;
+
+		spi-max-frequency = <25000000>;
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
