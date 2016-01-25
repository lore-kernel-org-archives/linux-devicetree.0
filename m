From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v6 1/3] Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
Date: Mon, 25 Jan 2016 09:50:10 -0600
Message-ID: <1453737012-3130-2-git-send-email-afd@ti.com>
References: <1453737012-3130-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453737012-3130-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65086 PMIC contains several regulators and a GPO controller.
Add bindings for the TPS65086 PMIC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/tps65086.txt | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt

diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Documentation/devicetree/bindings/mfd/tps65086.txt
new file mode 100644
index 0000000..d370561
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
@@ -0,0 +1,55 @@
+* TPS65086 Power Management Integrated Circuit (PMIC) bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086".
+ - reg			: I2C slave address.
+ - interrupt-parent	: Phandle to the parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
+			    The first cell is the IRQ number.
+			    The second cell is the flags, encoded as trigger
+			    masks from ../interrupt-controller/interrupts.txt.
+ - gpio-controller      : Marks the device node as a GPIO Controller.
+ - #gpio-cells          : Should be two.  The first cell is the pin number and
+                            the second cell is used to specify flags.
+                            See ../gpio/gpio.txt for more information.
+ - regulators:          : List of child nodes that specify the regulator
+                            initialization data. Child nodes must be named
+                            after their hardware counterparts: buck[1-6],
+                            ldoa[1-3], swa1, swb[1-2], and vtt. Each child
+                            node is defined using the standard binding for
+                            regulators and the optional regulator properties
+                            defined below.
+
+Optional regulator properties:
+ - ti,regulator-step-size-25mv	: This is applicable for buck[1,2,6], set this
+				    if the regulator is factory set with a 25mv
+				    step voltage mapping.
+ - ti,regulator-decay		: This is applicable for buck[1-6], set this if
+				    the output needs to decay, default is for
+				    the output to slew down.
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
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		regulators {
+			buck1 {
+				regulator-name = "vcc1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-boot-on;
+				ti,regulator-decay;
+				ti,regulator-step-size-25mv;
+			};
+		};
+	};
-- 
2.7.0
