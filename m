From: Michael Heimpold <michael.heimpold@i2se.com>
Subject: [PATCH v4 6/9] ARM: dts: add support for I2SE Duckbill 2 boards
Date: Thu,  9 Feb 2017 08:42:46 +0100
Message-ID: <1486626169-20022-7-git-send-email-michael.heimpold@i2se.com>
References: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fabio.estevam@nxp.com, frowand.list@gmail.com, Michael Heimpold <mhei@heimpold.de>
List-Id: devicetree@vger.kernel.org

From: Michael Heimpold <mhei@heimpold.de>

This machine is an USB pen drive sized development board,
based on NXP's i.MX28 CPU. In contrast to the previous
model "Duckbill", the "Duckbill 2" series has internal
eMMC storage.

Signed-off-by: Michael Heimpold <mhei@heimpold.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/Makefile             |   1 +
 arch/arm/boot/dts/imx28-duckbill-2.dts | 183 +++++++++++++++++++++++++++++++++
 arch/arm/mach-mxs/mach-mxs.c           |   3 +-
 3 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx28-duckbill-2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f10fe85..fa4664b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -475,6 +475,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx28-cfa10056.dtb \
 	imx28-cfa10057.dtb \
 	imx28-cfa10058.dtb \
+	imx28-duckbill-2.dtb \
 	imx28-duckbill.dtb \
 	imx28-eukrea-mbmx283lc.dtb \
 	imx28-eukrea-mbmx287lc.dtb \
diff --git a/arch/arm/boot/dts/imx28-duckbill-2.dts b/arch/arm/boot/dts/imx28-duckbill-2.dts
new file mode 100644
index 0000000..7fa3d75
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-duckbill-2.dts
@@ -0,0 +1,183 @@
+/*
+ * Copyright (C) 2015-2017 I2SE GmbH <info@i2se.com>
+ * Copyright (C) 2016 Michael Heimpold <mhei@heimpold.de>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "imx28.dtsi"
+
+/ {
+	model = "I2SE Duckbill 2";
+	compatible = "i2se,duckbill-2", "fsl,imx28";
+
+	memory {
+		reg = <0x40000000 0x08000000>;
+	};
+
+	apb@80000000 {
+		apbh@80000000 {
+			ssp0: ssp@80010000 {
+				compatible = "fsl,imx28-mmc";
+				pinctrl-names = "default";
+				pinctrl-0 = <&mmc0_8bit_pins_a
+					&mmc0_cd_cfg &mmc0_sck_cfg>;
+				bus-width = <8>;
+				vmmc-supply = <&reg_3p3v>;
+				status = "okay";
+				non-removable;
+			};
+
+			ssp2: ssp@80014000 {
+				compatible = "fsl,imx28-mmc";
+				pinctrl-names = "default";
+				pinctrl-0 = <&mmc2_4bit_pins_b
+					&mmc2_cd_cfg &mmc2_sck_cfg_b>;
+				bus-width = <4>;
+				vmmc-supply = <&reg_3p3v>;
+				status = "okay";
+			};
+
+			pinctrl@80018000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&hog_pins_a>;
+
+				hog_pins_a: hog@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_LCD_D17__GPIO_1_17    /* Revision detection */
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
+				mac0_phy_reset_pin: mac0-phy-reset@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_GPMI_ALE__GPIO_0_26    /* PHY Reset */
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
+				mac0_phy_int_pin: mac0-phy-int@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_GPMI_D07__GPIO_0_7    /* PHY Interrupt */
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
+				led_pins: leds@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF0_MCLK__GPIO_3_20
+						MX28_PAD_SAIF0_LRCLK__GPIO_3_21
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+			};
+		};
+
+		apbx@80040000 {
+			lradc@80050000 {
+				status = "okay";
+			};
+
+			i2c0: i2c@80058000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&i2c0_pins_a>;
+				status = "okay";
+			};
+
+			auart0: serial@8006a000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&auart0_2pins_a>;
+				status = "okay";
+			};
+
+			duart: serial@80074000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&duart_pins_a>;
+				status = "okay";
+			};
+
+			usbphy0: usbphy@8007c000 {
+				status = "okay";
+			};
+		};
+	};
+
+	ahb@80080000 {
+		usb0: usb@80080000 {
+			status = "okay";
+			dr_mode = "peripheral";
+		};
+
+		mac0: ethernet@800f0000 {
+			phy-mode = "rmii";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mac0_pins_a>, <&mac0_phy_reset_pin>;
+			phy-supply = <&reg_3p3v>;
+			phy-reset-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
+			phy-reset-duration = <25>;
+			phy-handle = <&ethphy>;
+			status = "okay";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ethphy: ethernet-phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&mac0_phy_int_pin>;
+					interrupt-parent = <&gpio0>;
+					interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+					max-speed = <100>;
+				};
+			};
+		};
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		status-red {
+			label = "duckbill:red:status";
+			gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		status-green {
+			label = "duckbill:green:status";
+			gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
index e4f2108..1c6062d 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -419,7 +419,8 @@ static void __init mxs_machine_init(void)
 		crystalfontz_init();
 	else if (of_machine_is_compatible("eukrea,mbmx283lc"))
 		eukrea_mbmx283lc_init();
-	else if (of_machine_is_compatible("i2se,duckbill"))
+	else if (of_machine_is_compatible("i2se,duckbill") ||
+		 of_machine_is_compatible("i2se,duckbill-2"))
 		duckbill_init();
 	else if (of_machine_is_compatible("msr,m28cu3"))
 		m28cu3_init();
-- 
2.6.1
