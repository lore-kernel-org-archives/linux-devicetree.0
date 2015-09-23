From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v2 1/3] Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
Date: Wed, 23 Sep 2015 11:07:37 -0500
Message-ID: <1443024459-15770-2-git-send-email-afd@ti.com>
References: <1443024459-15770-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443024459-15770-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65912 PMIC contains several regulators and a GPIO controller.
Add bindings for the TPS65912 PMIC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../devicetree/bindings/gpio/gpio-tps65912.txt     | 16 +++++++++
 Documentation/devicetree/bindings/mfd/tps65912.txt | 42 ++++++++++++++++++++++
 .../bindings/regulator/tps65912-regulator.txt      | 32 +++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
new file mode 100644
index 0000000..0c5c05c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
@@ -0,0 +1,16 @@
+* TPS65912 GPIO Controller bindings
+
+Required properties:
+ - compatible : Should be "ti,tps65912-gpio".
+ - gpio-controller : Marks the device node as a GPIO Controller.
+ - #gpio-cells : Should be two.  The first cell is the pin number and
+     the second cell is used to specify flags.
+     See include/dt-bindings/gpio/gpio.h for possible values.
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
index 0000000..a2c94b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
@@ -0,0 +1,42 @@
+* TPS65912 Power Management Integrated Circuit bindings
+
+Required properties:
+ - compatible : Should be "ti,tps65912".
+ - reg : Slave address or chip select number (I2C / SPI).
+ - interrupt-parent : The parent interrupt controller.
+ - interrupts : The interrupt line the device is connected to.
+ - interrupt-controller : Marks the device node as an interrupt controller.
+ - #interrupt-cells: The number of cells to describe an IRQ, this should be 2.
+     The first cell is the IRQ number.
+     The second cell is the flags, encoded as the trigger masks from
+     ../interrupt-controller/interrupts.txt
+
+Additional nodes defined in:
+ - Regulators: ../regulator/tps65912-regulator.txt
+ - GPIO: ../gpio/gpio-tps65912.txt.
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
+
+		gpio4: tps65912_gpio {
+			compatible = "ti,tps65912-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
new file mode 100644
index 0000000..e8c21f3
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
+ - Any optional property defined in ../regulator/regulator.txt
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
