From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2 2/6] mfd: bd71837: Devicetree bindings for ROHM BD71837
 PMIC
Date: Mon, 28 May 2018 12:00:45 +0300
Message-ID: <20180528090045.GC8778@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Document devicetree bindings for ROHM BD71837 PMIC MFD.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
new file mode 100644
index 000000000000..bbc46d38b162
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
@@ -0,0 +1,52 @@
+* ROHM BD71837 Power Management Integrated Circuit bindings
+
+BD71837MWV is a programmable Power Management IC for powering single-core,
+dual-core, and quad-core SoC’s such as NXP-i.MX 8M. It is optimized for
+low BOM cost and compact solution footprint. It integrates 8 Buck
+egulators and 7 LDO’s to provide all the power rails required by the SoC and
+the commonly used peripherals.
+
+Required properties:
+ - compatible		: Should be "rohm,bd71837".
+ - reg			: I2C slave address.
+ - interrupt-parent	: Phandle to the parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, should be 1 or 2.
+			    The first cell is the IRQ number.
+			    The second cell if present is the flags, encoded as trigger
+			    masks from ../interrupt-controller/interrupts.txt.
+ - regulators:		: List of child nodes that specify the regulators
+			  Please see ../regulator/rohm,bd71837-regulator.txt
+ - clock:		: Please see ../clock/rohm,bd71837-clock.txt
+
+Example:
+
+	pmic: bd71837@4b {
+		compatible = "rohm,bd71837";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x4b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <29 GPIO_ACTIVE_LOW>;
+		interrupt-names = "irq";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-ramp-delay = <1250>;
+			};
+			...
+		};
+		clk: bd71837-32k-out {
+			compatible = "rohm,bd71837-clk";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "bd71837-32k-out";
+		};
+	};
-- 
2.14.3
