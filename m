From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH v2] arm64: dts: imx8mm-evk: Add BD71847 PMIC
Date: Tue, 23 Apr 2019 14:16:48 +0000
Message-ID: <d809d10676011d1d35c3f78fe3e0ec47b73398d6.1556028030.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Robin Gong <yibin.gong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The BUCK2 regulator is used for cpufreq voltage control, otherwise
configuration is mostly static.

This uses the newly-implemented rohm,reset-snvs-powered property to
properly handle the SNVS state of imx8mm.

Between BD71837 and BD71847 the BUCK3/4 regulators were removed but
datasheet and board schematics kept the names for BUCK5/6/7/8. The
driver however renumbered 5/6/7/8 to 3/4/5/6. Use the names from DT
bindings and add comments to signal this.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 131 +++++++++++++++++++
 1 file changed, 131 insertions(+)

Changes since v1:
 - Move compatible property first
 - Remove address/size numbering from regulators list
Link: https://marc.info/?l=linux-clk&m=155530430429151&w=2

Other imx8mm cpufreq patches in that series already accepted.

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index 2d5d89475b76..623254786c2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -37,10 +37,14 @@
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
 
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
@@ -93,10 +97,124 @@
 	pinctrl-0 = <&pinctrl_wdog>;
 	fsl,ext-reset-output;
 	status = "okay";
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		rohm,reset-snvs-powered;
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-compatible = "BUCK1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-compatible = "BUCK2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-compatible = "BUCK3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-compatible = "BUCK4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-compatible = "BUCK5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-compatible = "BUCK6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-compatible = "LDO1";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-compatible = "LDO2";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-compatible = "LDO3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-compatible = "LDO4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-compatible = "LDO6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
@@ -122,10 +240,23 @@
 		fsl,pins = <
 			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
 		>;
 	};
 
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_pmic: pmicirq {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 		>;
 	};
-- 
2.17.1
