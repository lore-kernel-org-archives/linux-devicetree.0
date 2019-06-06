From: Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [PATCH 1/1] ARM: dts: imx6ull-colibri: enable UHS-I for USDHC1
Date: Thu,  6 Jun 2019 12:06:12 +0300
Message-ID: <20190606090612.16685-1-igor.opaniuk@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, marcel@ziswiler.com, marcel.ziswiler@toradex.com, stefan@agner.ch
List-Id: devicetree@vger.kernel.org

From: Igor Opaniuk <igor.opaniuk@toradex.com>

Allows to use the SD interface at a higher speed mode if the card
supports it. For this the signaling voltage is switched from 3.3V to
1.8V under the usdhc1's drivers control.

Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>
---
 arch/arm/boot/dts/imx6ul.dtsi                  |  4 ++++
 arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi | 11 +++++++++--
 arch/arm/boot/dts/imx6ull-colibri.dtsi         |  6 ++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index fc388b84bf22..91a0ced44e27 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -857,6 +857,8 @@
 					 <&clks IMX6UL_CLK_USDHC1>,
 					 <&clks IMX6UL_CLK_USDHC1>;
 				clock-names = "ipg", "ahb", "per";
+				fsl,tuning-step= <2>;
+				fsl,tuning-start-tap = <20>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -870,6 +872,8 @@
 					 <&clks IMX6UL_CLK_USDHC2>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
+				fsl,tuning-step= <2>;
+				fsl,tuning-start-tap = <20>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
index 006690ea98c0..7dc7770cf52c 100644
--- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
@@ -145,13 +145,20 @@
 };
 
 &usdhc1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1 &pinctrl_snvs_usdhc1_cd>;
-	no-1-8-v;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz &pinctrl_snvs_usdhc1_cd>;
+	pinctrl-2 = <&pinctrl_usdhc1_100mhz &pinctrl_snvs_usdhc1_cd>;
+	pinctrl-3 = <&pinctrl_usdhc1 &pinctrl_snvs_usdhc1_sleep_cd>;
 	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	wakeup-source;
 	keep-power-in-suspend;
 	vmmc-supply = <&reg_3v3>;
+	vqmmc-supply = <&reg_sd1_vmmc>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx6ull-colibri.dtsi
index 9ad1da159768..d56728f03c35 100644
--- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
@@ -545,6 +545,12 @@
 		>;
 	};
 
+	pinctrl_snvs_usdhc1_sleep_cd: snvs-usdhc1-cd-grp-slp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x0
+		>;
+	};
+
 	pinctrl_snvs_wifi_pdn: snvs-wifi-pdn-grp {
 		fsl,pins = <
 			MX6ULL_PAD_BOOT_MODE1__GPIO5_IO11	0x14
-- 
2.17.1
