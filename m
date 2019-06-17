From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/4] dt-bindings: mfd: Add Actions Semi ATC260x PMIC binding
Date: Mon, 17 Jun 2019 21:20:08 +0530
Message-ID: <20190617155011.15376-2-manivannan.sadhasivam@linaro.org>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org
Cc: afaerber@suse.de, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Actions Semi ATC260x PMICs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/mfd/atc260x.txt       | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atc260x.txt

diff --git a/Documentation/devicetree/bindings/mfd/atc260x.txt b/Documentation/devicetree/bindings/mfd/atc260x.txt
new file mode 100644
index 000000000000..c72790132ed7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atc260x.txt
@@ -0,0 +1,162 @@
+Actions Semi ATC260X PMIC
+
+The atc260x family current members:
+atc2609a
+
+Required properties:
+- compatible: "actions,atc2609a"
+- reg: I2C slave address
+- interrupts: The interrupt line the IRQ signal for the device is connected to
+
+Optional ATC2609A properties:
+- vcc0-supply:  The input supply for DCDC_REG0
+- vcc1-supply:  The input supply for DCDC_REG1
+- vcc2-supply:  The input supply for DCDC_REG2
+- vcc3-supply:  The input supply for DCDC_REG3
+- vcc4-supply:  The input supply for DCDC_REG4
+- vcc5-supply:  The input supply for LDO_REG0
+- vcc6-supply:  The input supply for LDO_REG1
+- vcc7-supply:  The input supply for LDO_REG2
+- vcc8-supply:  The input supply for LDO_REG3
+- vcc9-supply:  The input supply for LDO_REG4
+- vcc10-supply:  The input supply for LDO_REG5
+- vcc11-supply:  The input supply for LDO_REG6
+- vcc12-supply: The input supply for LDO_REG7
+- vcc13-supply: The input supply for LDO_REG8
+- vcc14-supply: The input supply for LDO_REG9
+
+Regulators: All the regulators of ATC260X to be instantiated shall be
+listed in a child node named 'regulators'. Each regulator is represented
+by a child node of the 'regulators' node.
+
+	regulator-name {
+		/* standard regulator bindings here */
+	};
+
+Following regulators of the ATC2609A PMIC regulators are supported. Note that
+the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
+number as described in ATC2609A datasheet.
+
+	- DCDC_REGn
+		- valid values for n are 0 to 4.
+	- LDO_REGn
+		- valid values for n are 0 to 9
+
+Standard regulator bindings are used inside regulator subnodes. Check
+  Documentation/devicetree/bindings/regulator/regulator.txt
+for more details
+
+Example:
+	atc260x: pmic@65 {
+		compatible = "actions,atc2609a";
+		reg = <0x65>;
+		interrupt-parent = <&sirq>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+
+		vcc0-supply = <&reg_5v0>;
+		vcc1-supply = <&reg_5v0>;
+		vcc2-supply = <&reg_5v0>;
+		vcc3-supply = <&reg_5v0>;
+		vcc4-supply = <&reg_5v0>;
+		vcc5-supply = <&reg_3v1>;
+		vcc6-supply = <&reg_5v0>;
+		vcc7-supply = <&reg_5v0>;
+		vcc9-supply = <&reg_5v0>;
+		vcc10-supply = <&reg_5v0>;
+		vcc11-supply = <&reg_3v1>;
+		vcc12-supply = <&reg_3v1>;
+		vcc13-supply = <&reg_5v0>;
+		vddio-supply = <&reg_3v1>;
+
+		regulators {
+			vdd_core: DCDC_REG0 {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vdd_cpu: DCDC_REG1 {
+				regulator-name = "vdd_cpu";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vddq_1v2: DCDC_REG2 {
+				regulator-name = "vddq_1v2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vcc_3v1: DCDC_REG3 {
+				regulator-name = "vcc_3v1";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vdd_cpum: DCDC_REG4 {
+				regulator-name = "vdd_cpum";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			sd_vcc: LDO_REG0 {
+				regulator-name = "sd_vcc";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			wifi_3v3: LDO_REG1 {
+				regulator-name = "wifi_3v3";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			avcc_3v1: LDO_REG2 {
+				regulator-name = "avcc_3v1";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			avcc_1v8: LDO_REG4 {
+				regulator-name = "avcc_1v8";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			avcc_1v0: LDO_REG6 {
+				regulator-name = "avcc_1v0";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vcc1v8_io: LDO_REG7 {
+				regulator-name = "vcc1v8_io";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <2200000>;
+			};
+
+			tpvcc_3v1: LDO_REG8 {
+				regulator-name = "tpvcc_3v1";
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
-- 
2.17.1
