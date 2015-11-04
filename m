From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 1/6] Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
Date: Wed, 4 Nov 2015 11:12:10 -0600
Message-ID: <1446657135-7820-2-git-send-email-afd@ti.com>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446657135-7820-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65086 PMIC contains several regulators and a GPO controller.
Add bindings for the TPS65086 PMIC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/devicetree/bindings/mfd/tps65086.txt | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt

diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Documentation/devicetree/bindings/mfd/tps65086.txt
new file mode 100644
index 0000000..2fd5394
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
@@ -0,0 +1,46 @@
+* TPS65086 Power Management Integrated Circuit bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086".
+ - reg			: I2C slave address.
+ - interrupt-parent	: Phandle to he parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, this
+			    should be 2. The first cell is the IRQ number,
+			    the second cell is the flags, encoded as the trigger
+			    masks from <dt-bindings/interrupt-controller/irq.h>.
+
+Additional nodes defined in:
+ - Regulators	: ../regulator/tps65086-regulator.txt
+ - GPIO		: ../gpio/gpio-tps65086.txt
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
+		gpio4: gpio {
+			compatible = "ti,tps65086-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
-- 
1.9.1
