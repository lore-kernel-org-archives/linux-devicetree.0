From: Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: imx6q-logicpd: Fix 3.3V regulator on SDHC1
Date: Tue,  1 Oct 2019 19:37:12 -0500
Message-ID: <20191002003713.21332-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: adam.ford@logicpd.com, shawnguo@kernel.org, Adam Ford <aford173@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

NVCC_SD1 is driven by a selector which chooses between 3.3V and
1.8.  Currently, this is pulled down by a 10k resistor, but
occasionally, voltage spikes on this rail cause the regulator to
jump between 1.8 and 3.3V.

This patch explicitly sets GPIO_19 to choose the 3.3V rail by
forcing this IO pin low to stabilize NVCC_SD1.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/imx6-logicpd-som.dtsi
index 547fb141ec0c..233762acbaaf 100644
--- a/arch/arm/boot/dts/imx6-logicpd-som.dtsi
+++ b/arch/arm/boot/dts/imx6-logicpd-som.dtsi
@@ -15,6 +15,18 @@
 		reg = <0x10000000 0x80000000>;
 	};
 
+	reg_sdhc1: regulator-sdhc1 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_sdhc1>;
+		regulator-name = "reg_sdhc1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 5 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
+
 	reg_wl18xx_vmmc: regulator-wl18xx {
 		compatible = "regulator-fixed";
 		regulator-name = "vwl1837";
@@ -267,6 +279,12 @@
 		>;
 	};
 
+	pinctrl_reg_sdhc1: regsdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_19__GPIO4_IO05	0x1b0b0
+		>;
+	};
+
 	pinctrl_tempsense: tempsensegrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_CS2__GPIO6_IO15 0x1b0b0
@@ -343,7 +361,9 @@
 	non-removable;
 	keep-power-in-suspend;
 	wakeup-source;
+	no-1-8-v;
 	vmmc-supply = <&sw2_reg>;
+	vqmmc-supply = <&reg_sdhc1>;
 	status = "okay";
 };
 
-- 
2.17.1
