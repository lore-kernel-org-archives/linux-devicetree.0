From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
Date: Fri, 16 Oct 2015 11:59:10 -0500
Message-ID: <1445014753-15450-2-git-send-email-afd@ti.com>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445014753-15450-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65086 PMIC contains several regulators and a GPO controller.
Add bindings for the TPS65086 PMIC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../devicetree/bindings/gpio/gpio-tps65086.txt     | 17 ++++++++
 Documentation/devicetree/bindings/mfd/tps65086.txt | 46 ++++++++++++++++++++++
 .../bindings/regulator/tps65086-regulator.txt      | 36 +++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65086-regulator.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
new file mode 100644
index 0000000..15e4063
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
@@ -0,0 +1,17 @@
+* TPS65086 GPO Controller bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086-gpio".
+ - gpio-controller	: Marks the device node as a GPIO Controller.
+ - #gpio-cells		: Should be two.  The first cell is the pin number
+			  and the second cell is used to specify flags.
+			  See include/dt-bindings/gpio/gpio.h for possible
+			  values.
+
+Example:
+
+	gpio4: tps65086_gpio {
+		compatible = "ti,tps65086-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Documentation/devicetree/bindings/mfd/tps65086.txt
new file mode 100644
index 0000000..4b6aeb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
@@ -0,0 +1,46 @@
+* TPS65086 Power Management Integrated Circuit bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086".
+ - reg			: Slave address.
+ - interrupt-parent	: The parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, this
+			  should be 2. The first cell is the IRQ number.
+			  The second cell is the flags, encoded as the trigger
+			  masks from ../interrupt-controller/interrupts.txt.
+
+Additional nodes defined in:
+ - Regulators	: ../regulator/tps65086-regulator.txt.
+ - GPIO		: ../gpio/gpio-tps65086.txt.
+
+Example:
+
+	pmic: tps65086@5e {
+		compatible = "ti,tps65086";
+		reg = <0x5e>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "ti,tps65086-regulator";
+
+			buck1 {
+				regulator-name = "vcc1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-boot-on;
+				ti,regulator-decay;
+				ti,regulator-step-size-25mv;
+			};
+		};
+
+		gpio4: tps65086_gpio {
+			compatible = "ti,tps65086-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/regulator/tps65086-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
new file mode 100644
index 0000000..023cd73
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
@@ -0,0 +1,36 @@
+* TPS65086 regulator bindings
+
+Required properties:
+ - compatible	: Should be "ti,tps65086-regulator".
+ - list of regulators provided by this controller, must be named
+     after their hardware counterparts: buck[1-6], ldoa[1-3], swa1,
+     swb[1-2], and vtt.
+
+Optional properties:
+ - Per-regulator optional properties are defined in regulator.txt
+ - ti,regulator-step-size-25mv	: This is applicable for buck[1,2,6].
+				  Set this if the regulator is factory
+				  set with a 25mv step voltage mapping.
+ - ti,regulator-decay		: This is applicable for buck[1-6].
+				  Set this if the output needs to decay,
+				  default is for the output to slew down.
+
+Example:
+
+	regulators {
+		compatible = "ti,tps65086-regulator";
+
+		buck1 {
+			regulator-name = "vcc1";
+			regulator-min-microvolt = <1600000>;
+			regulator-max-microvolt = <1600000>;
+			regulator-boot-on;
+			ti,regulator-step-size-25mv;
+			ti,regulator-decay;
+		};
+
+		swa1 {
+			regulator-name = "ls1";
+			regulator-boot-on;
+		};
+	};
-- 
1.9.1
