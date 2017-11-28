From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 04/13] dt-bindings: pinctrl: Add bindings for Microsemi Ocelot
Date: Tue, 28 Nov 2017 16:26:34 +0100
Message-ID: <20171128152643.20463-5-alexandre.belloni@free-electrons.com>
References: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the documentation for the Microsemi Ocelot pinmuxing and gpio
controller.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
new file mode 100644
index 000000000000..24a210e0c59a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
@@ -0,0 +1,39 @@
+Microsemi Ocelot pin controller Device Tree Bindings
+----------------------------------------------------
+
+Required properties:
+ - compatible		: Should be "mscc,ocelot-pinctrl"
+ - reg			: Address and length of the register set for the device
+ - gpio-controller	: Indicates this device is a GPIO controller
+ - #gpio-cells		: Must be 2.
+			  The first cell is the pin number and the
+			  second cell specifies GPIO flags, as defined in
+			  <dt-bindings/gpio/gpio.h>.
+ - gpio-ranges		: Range of pins managed by the GPIO controller.
+
+
+The ocelot-pinctrl driver uses the generic pin multiplexing and generic pin
+configuration documented in pinctrl-bindings.txt.
+
+The following generic properties are supported:
+ - function
+ - pins
+
+Example:
+	gpio: pinctrl@71070034 {
+		compatible = "mscc,ocelot-pinctrl";
+		reg = <0x71070034 0x28>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&gpio 0 0 22>;
+
+		uart_pins: uart-pins {
+				pins = "GPIO_6", "GPIO_7";
+				function = "uart";
+		};
+
+		uart2_pins: uart2-pins {
+				pins = "GPIO_12", "GPIO_13";
+				function = "uart2";
+		};
+	};
-- 
2.15.0
