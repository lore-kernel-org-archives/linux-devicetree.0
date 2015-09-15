From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 1/3] Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
Date: Tue, 15 Sep 2015 12:57:39 -0500
Message-ID: <1442339861-30300-2-git-send-email-afd@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442339861-30300-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65912 PMIC contains several regulators and a GPIO controller.
Add bindings for the TPS65912 PMIC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../devicetree/bindings/gpio/gpio-tps65912.txt     | 17 +++++++++
 Documentation/devicetree/bindings/mfd/tps65912.txt | 43 ++++++++++++++++++++++
 .../bindings/regulator/tps65912-regulator.txt      | 32 ++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
new file mode 100644
index 0000000..f65370b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
@@ -0,0 +1,17 @@
+* TPS65912 GPIO controller bindings
+
+Required properties:
+ - compatible : Should be "ti,tps65912-gpio".
+ - gpio-controller : Marks the device node as a gpio controller.
+ - #gpio-cells : Should be two.  The first cell is the pin number and
+     the second cell is used to specify the gpio polarity:
+       0 = active high
+       1 = active low
+
+Example:
+
+	gpio4: tps65912_gpio {
+		compatible = "ti,tps65912-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Documentation/devicetree/bindings/mfd/tps65912.txt
new file mode 100644
index 0000000..081af66
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
@@ -0,0 +1,43 @@
+* TPS65912 Power Management Integrated Circuit bindings
+
+Required properties:
+ - compatible : Should be "ti,tps65912".
+ - reg : Slave address or chip select number (I2C / SPI).
+ - interrupt-parent : The parent interrupt controller.
+ - interrupts : The interrupt line the device is connected to.
+ - interrupt-controller : Marks the device node as an interrupt controller.
+ - #interrupt-cells: the number of cells to describe an IRQ, this should be 2.
+     The first cell is the IRQ number.
+     The second cell is the flags, encoded as the trigger masks from
+     Documentation/devicetree/bindings/interrupts.txt
+
+Optional nodes:
+ - Regulators: Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
+ - GPIO: Documentation/devicetree/bindings/gpio/gpio-tps65912.txt.
+
+Example:
+
+	pmic: tps65912@2d {
+		compatible = "ti,tps65912";
+		reg = <0x2d>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		dcdc1: regulator-dcdc1 {
+			compatible = "ti,tps65912-dcdc1";
+			regulator-name = "vdd_core";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+		...
+
+		gpio4: tps65912_gpio {
+			compatible = "ti,tps65912-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
new file mode 100644
index 0000000..a417ff7
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
@@ -0,0 +1,32 @@
+* TPS65912 regulator bindings
+
+Required properties:
+ - compatible: Should be:
+   - "ti,tps65912-dcdc1" for DCDC1
+   - "ti,tps65912-dcdc2" for DCDC2
+   - "ti,tps65912-dcdc3" for DCDC3
+   - "ti,tps65912-dcdc4" for DCDC4
+   - "ti,tps65912-ldo1" for LDO1
+   - "ti,tps65912-ldo2" for LDO2
+   - "ti,tps65912-ldo3" for LDO3
+   - "ti,tps65912-ldo4" for LDO4
+   - "ti,tps65912-ldo5" for LDO5
+   - "ti,tps65912-ldo6" for LDO6
+   - "ti,tps65912-ldo7" for LDO7
+   - "ti,tps65912-ldo8" for LDO8
+   - "ti,tps65912-ldo9" for LDO9
+   - "ti,tps65912-ldo10" for LDO10
+
+Optional properties:
+ - Any optional property defined in bindings/regulator/regulator.txt
+
+Example:
+
+	xyz: regulator@0 {
+		compatible = "ti,tps65912-dcdc1";
+		regulator-name = "vdd_core";
+		regulator-min-microvolt = <912000>;
+		regulator-max-microvolt = <1144000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
-- 
1.9.1

