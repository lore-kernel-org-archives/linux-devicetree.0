From: BOUGH CHEN <haibo.chen@nxp.com>
Subject: [PATCH 1/2] arm: dts: imx7d-sdb: add SD3.0 support for usdhc1
Date: Fri, 28 Dec 2018 09:28:30 +0000
Message-ID: <20181228093558.18434-1-haibo.chen@nxp.com>
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
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add usdhc1 support SD3.0.

Besides, add fsl,tuning-start-tap for all usdhc, imx usdhc IP
logic require the tuning-start-tap larger than 10, to make
sure the tuning logical can work normal.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 55 +++++++++++++++++++++++++++------
 arch/arm/boot/dts/imx7s.dtsi    |  6 ++++
 2 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 202922ed3754..ded43decf46c 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -87,6 +87,16 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_SD1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <200000>;
+		enable-active-high;
+	};
+
 	reg_brcm: regulator-brcm {
 		compatible = "regulator-fixed";
 		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
@@ -408,12 +418,13 @@
 };
 
 &usdhc1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
 	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
-	wakeup-source;
-	keep-power-in-suspend;
+	vmmc-supply = <&reg_sd1_vmmc>;
 	status = "okay";
 };
 
@@ -426,7 +437,6 @@
 	keep-power-in-suspend;
 	non-removable;
 	vmmc-supply = <&reg_brcm>;
-	fsl,tuning-step = <2>;
 	status = "okay";
 };
 
@@ -438,7 +448,6 @@
 	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
 	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
-	fsl,tuning-step = <2>;
 	non-removable;
 	status = "okay";
 };
@@ -638,6 +647,15 @@
 			>;
 		};
 
+		pinctrl_usdhc1_gpio: usdhc1_gpiogrp {
+			fsl,pins = <
+				MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59 /* CD */
+				MX7D_PAD_SD1_WP__GPIO5_IO1		0x59 /* WP */
+				MX7D_PAD_SD1_RESET_B__GPIO5_IO2		0x59 /* vmmc */
+				MX7D_PAD_GPIO1_IO08__SD1_VSELECT	0x59 /* VSELECT */
+			>;
+		};
+
 		pinctrl_usdhc1: usdhc1grp {
 			fsl,pins = <
 				MX7D_PAD_SD1_CMD__SD1_CMD		0x59
@@ -646,9 +664,28 @@
 				MX7D_PAD_SD1_DATA1__SD1_DATA1		0x59
 				MX7D_PAD_SD1_DATA2__SD1_DATA2		0x59
 				MX7D_PAD_SD1_DATA3__SD1_DATA3		0x59
-				MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59 /* CD */
-				MX7D_PAD_SD1_WP__GPIO5_IO1		0x59 /* WP */
-				MX7D_PAD_SD1_RESET_B__GPIO5_IO2		0x59 /* vmmc */
+			>;
+		};
+
+		pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
+			fsl,pins = <
+				MX7D_PAD_SD1_CMD__SD1_CMD		0x5a
+				MX7D_PAD_SD1_CLK__SD1_CLK		0x1a
+				MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5a
+				MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5a
+				MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5a
+				MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5a
+			>;
+		};
+
+		pinctrl_usdhc1_200mhz: usdhc1grp_200mhz {
+			fsl,pins = <
+				MX7D_PAD_SD1_CMD__SD1_CMD		0x5b
+				MX7D_PAD_SD1_CLK__SD1_CLK		0x1b
+				MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5b
+				MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5b
+				MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5b
+				MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5b
 			>;
 		};
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index e88f53a4c7f4..bee8dc2f614b 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -1036,6 +1036,8 @@
 					<&clks IMX7D_USDHC1_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
+				fsl,tuning-step = <2>;
+				fsl,tuning-start-tap = <20>;
 				status = "disabled";
 			};
 
@@ -1048,6 +1050,8 @@
 					<&clks IMX7D_USDHC2_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
+				fsl,tuning-step = <2>;
+				fsl,tuning-start-tap = <20>;
 				status = "disabled";
 			};
 
@@ -1060,6 +1064,8 @@
 					<&clks IMX7D_USDHC3_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
+				fsl,tuning-step = <2>;
+				fsl,tuning-start-tap = <20>;
 				status = "disabled";
 			};
 
-- 
2.17.1
