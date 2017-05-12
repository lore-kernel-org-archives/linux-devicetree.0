From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 02/14] dt/bindings: Document gpio-ingenic
Date: Fri, 12 May 2017 18:52:55 +0200
Message-ID: <20170512165307.31369-2-paul@crapouillou.net>
References: <20170428200824.10906-2-paul@crapouillou.net>
 <20170512165307.31369-1-paul@crapouillou.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170512165307.31369-1-paul@crapouillou.net>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Maarten ter Huurne <maarten@treewalker.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This commit adds documentation for the devicetree bindings of the
gpio-ingenic driver, which handles GPIOs of the Ingenic SoCs
currently supported by the Linux kernel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/ingenic,gpio.txt      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/ingenic,gpio.txt

 v2: New patch
 v3: No changes
 v4: Update for the v4 version of the gpio-ingenic driver
 v5: Remove gpio-bank-... compatible strings, and add 'reg' property
 v6: No changes

diff --git a/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt b/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
new file mode 100644
index 000000000000..7988aeb725f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
@@ -0,0 +1,46 @@
+Ingenic jz47xx GPIO controller
+
+That the Ingenic GPIO driver node must be a sub-node of the Ingenic pinctrl
+driver node.
+
+Required properties:
+--------------------
+
+ - compatible: Must contain one of:
+    - "ingenic,jz4740-gpio"
+    - "ingenic,jz4770-gpio"
+    - "ingenic,jz4780-gpio"
+ - reg: The GPIO bank number.
+ - interrupt-controller: Marks the device node as an interrupt controller.
+ - interrupts: Interrupt specifier for the controllers interrupt.
+ - #interrupt-cells: Should be 2. Refer to
+   ../interrupt-controller/interrupts.txt for more details.
+ - gpio-controller: Marks the device node as a GPIO controller.
+ - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
+    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
+    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
+ - gpio-ranges: Range of pins managed by the GPIO controller. Refer to
+   'gpio.txt' in this directory for more details.
+
+Example:
+--------
+
+&pinctrl {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpa: gpio@0 {
+		compatible = "ingenic,jz4740-gpio";
+		reg = <0>;
+
+		gpio-controller;
+		gpio-ranges = <&pinctrl 0 0 32>;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <28>;
+	};
+};
-- 
2.11.0

