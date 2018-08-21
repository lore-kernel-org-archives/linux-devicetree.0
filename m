From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/8] dt-bindings: pinctrl: Update pinctrl-ingenic for JZ4725B and GPIO merge
Date: Tue, 21 Aug 2018 18:42:29 +0200
Message-ID: <20180821164236.21101-2-paul@crapouillou.net>
References: <20180821164236.21101-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821164236.21101-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The pinctrl-ingenic driver now supports the JZ4725B SoC.

Furthermore, the gpio-ingenic driver was dropped and the pinctrl-ingenic
driver is now responsible for providing the GPIO functionality.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 .../devicetree/bindings/gpio/ingenic,gpio.txt      | 46 ----------------------
 .../bindings/pinctrl/ingenic,pinctrl.txt           | 39 ++++++++++++++++--
 2 files changed, 35 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/ingenic,gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt b/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
deleted file mode 100644
index 7988aeb725f4..000000000000
--- a/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Ingenic jz47xx GPIO controller
-
-That the Ingenic GPIO driver node must be a sub-node of the Ingenic pinctrl
-driver node.
-
-Required properties:
---------------------
-
- - compatible: Must contain one of:
-    - "ingenic,jz4740-gpio"
-    - "ingenic,jz4770-gpio"
-    - "ingenic,jz4780-gpio"
- - reg: The GPIO bank number.
- - interrupt-controller: Marks the device node as an interrupt controller.
- - interrupts: Interrupt specifier for the controllers interrupt.
- - #interrupt-cells: Should be 2. Refer to
-   ../interrupt-controller/interrupts.txt for more details.
- - gpio-controller: Marks the device node as a GPIO controller.
- - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
-    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
-    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
- - gpio-ranges: Range of pins managed by the GPIO controller. Refer to
-   'gpio.txt' in this directory for more details.
-
-Example:
---------
-
-&pinctrl {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	gpa: gpio@0 {
-		compatible = "ingenic,jz4740-gpio";
-		reg = <0>;
-
-		gpio-controller;
-		gpio-ranges = <&pinctrl 0 0 32>;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <28>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index ca313a7aeaff..af20b0ec715c 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -20,16 +20,30 @@ Required properties:
 
  - compatible: One of:
     - "ingenic,jz4740-pinctrl"
+    - "ingenic,jz4725b-pinctrl"
     - "ingenic,jz4770-pinctrl"
     - "ingenic,jz4780-pinctrl"
  - reg: Address range of the pinctrl registers.
 
 
-GPIO sub-nodes
---------------
+Required properties for sub-nodes (GPIO chips):
+-----------------------------------------------
 
-The pinctrl node can have optional sub-nodes for the Ingenic GPIO driver;
-please refer to ../gpio/ingenic,gpio.txt.
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
+   ../gpio/gpio.txt for more details.
 
 
 Example:
@@ -38,4 +52,21 @@ Example:
 pinctrl: pin-controller@10010000 {
 	compatible = "ingenic,jz4740-pinctrl";
 	reg = <0x10010000 0x400>;
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
 };
-- 
2.11.0
