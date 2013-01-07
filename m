From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] ARM i.MX53: add dts for the TQ tqma53 module
Date: Mon,  7 Jan 2013 16:16:00 +0100
Message-ID: <1357571760-487-3-git-send-email-s.trumtrar@pengutronix.de>
References: <1357571760-487-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357571760-487-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The tqma53 is an embedded module that has some features on board (e.g. emmc),
but mostly just provides access to them on its interface.
Going along with the imx53.dtsi, the tqma53.dtsi specifies the existing
devices and their pinctrl for this module. All devices that are not on the
module are disabled by default and need to be enabled in a baseboard DT.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx53-tqma53.dtsi |  207 +++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-tqma53.dtsi

diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
new file mode 100644
index 0000000..41a6277
--- /dev/null
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -0,0 +1,207 @@
+/*
+ * Copyright 2012 Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix
+ * Copyright 2012 Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/include/ "imx53.dtsi"
+
+/ {
+	model = "TQ TQMa53";
+	compatible = "tq,tqma53", "fsl,imx53";
+
+	memory {
+		reg = <0x70000000 0x40000000>; /* Up to 1GiB */
+	};
+
+	soc {
+		aips@50000000 {
+			spba@50000000 {
+				esdhc2: esdhc@50008000 {
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_esdhc2_1>;
+					wp-gpios = <&gpio1 2 0>;
+					cd-gpios = <&gpio1 4 0>;
+					status = "disabled";
+				};
+
+				uart3: serial@5000c000 {
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_uart3_2>;
+					status = "disabled";
+				};
+
+				ecspi1: ecspi@50010000 {
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_ecspi1_1>;
+					fsl,spi-num-chipselects = <4>;
+					cs-gpios = <&gpio2 30 0>, <&gpio3 19 0>,
+						   <&gpio3 24 0>, <&gpio3 25 0>;
+					status = "disabled";
+				};
+
+				esdhc3: esdhc@50020000 { /* EMMC */
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_esdhc3_1>;
+					vmmc-supply = <&reg_3p3v>;
+					non-removable;
+					bus-width = <8>;
+					status = "okay";
+				};
+			};
+
+			usbphy1: usbphy@1 {
+				compatible = "nop-usbphy";
+				status = "okay";
+			};
+
+			usbphy2: usbphy@2 {
+				compatible = "nop-usbphy";
+				status = "okay";
+			};
+
+			usbotg: usb@53f80000 {
+				fsl,usbphy = <&usbphy1>;
+				phy-mode-utmi;
+				dr_mode = "peripheral";
+				status = "disabled";
+			};
+
+			usbh1: usb@53f80200 {
+				fsl,usbphy = <&usbphy2>;
+				phy-mode-utmi;
+				status = "disabled";
+			};
+
+			wdog1: wdog@53f98000 {
+				status = "okay";
+			};
+
+			iomuxc@53fa8000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_hog>;
+
+				i2s {
+					pinctrl_i2s_1: i2s-grp1 {
+						fsl,pins = <
+							 1   0x10000	/* I2S_MCLK */
+							 10  0x10000	/* I2S_SCLK */
+							 17  0x10000	/* I2S_DOUT */
+							 23  0x10000	/* I2S_LRCLK*/
+							 30  0x10000	/* I2S_DIN  */
+						>;
+					};
+				};
+
+				hog {
+					pinctrl_hog: hoggrp {
+						fsl,pins = <
+							 610  0x10000	/* MX53_PAD_EIM_CS1__IPU_DI1_PIN6 (VSYNC)*/
+							 711  0x10000	/* MX53_PAD_EIM_DA15__IPU_DI1_PIN4 (HSYNC)*/
+							 873  0x10000	/* MX53_PAD_PATA_DA_1__GPIO7_7 (LCD_BLT_EN)*/
+							 878  0x10000	/* MX53_PAD_PATA_DA_2__GPIO7_8 (LCD_RESET)*/
+							 922  0x10000	/* MX53_PAD_PATA_DATA5__GPIO2_5 (LCD_POWER)*/
+							 928  0x10000	/* MX53_PAD_PATA_DATA6__GPIO2_6 (PMIC_INT)*/
+							 982  0x10000	/* MX53_PAD_PATA_DATA14__GPIO2_14 (CSI_RST)*/
+							 989  0x10000	/* MX53_PAD_PATA_DATA15__GPIO2_15 (CSI_PWDN)*/
+							 1069 0x10000	/* MX53_PAD_GPIO_0__GPIO1_0 (SYSTEM_DOWN)*/
+							 1093 0x10000	/* MX53_PAD_GPIO_3__GPIO1_3 */
+						>;
+					};
+				};
+			};
+
+			uart1: serial@53fbc000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart1_2>;
+				fsl,uart-has-rtscts;
+				status = "disabled";
+			};
+
+			uart2: serial@53fc0000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart2_1>;
+				status = "disabled";
+			};
+
+			can1: can@53fc8000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_can1_2>;
+				status = "disabled";
+			};
+
+			can2: can@53fcc000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_can2_1>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@53fec000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c3_1>;
+				status = "disabled";
+			};
+		};
+
+		aips@60000000 {
+			cspi: cspi@63fc0000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_cspi_1>;
+				fsl,spi-num-chipselects = <3>;
+				cs-gpios = <&gpio1 18 0>, <&gpio1 19 0>,
+					   <&gpio1 21 0>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@63fc4000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c2_1>;
+				status = "okay";
+
+				pmic: mc34708@8 {
+					compatible = "fsl,mc34708";
+					reg = <0x8>;
+					fsl,mc13xxx-uses-rtc;
+					interrupt-parent = <&gpio2>;
+					interrupts = <6 8>; /* PDATA_DATA6, low active */
+				};
+
+				sensor1: lm75@48 {
+					compatible = "lm75";
+					reg = <0x48>;
+				};
+
+				eeprom: 24c64@50 {
+					compatible = "at,24c64";
+					pagesize = <32>;
+					reg = <0x50>;
+				};
+			};
+
+			fec: ethernet@63fec000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_fec_1>;
+				phy-mode = "rmii";
+				status = "disabled";
+			};
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+
+		reg_3p3v: 3p3v {
+			compatible = "regulator-fixed";
+			regulator-name = "3P3V";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+	};
+};
-- 
1.7.10.4
