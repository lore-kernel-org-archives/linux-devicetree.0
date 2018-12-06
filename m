From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 6/9] ARM: dts: imx7d-pico: Improve WiFi regulator name
Date: Thu,  6 Dec 2018 08:09:02 -0200
Message-ID: <20181206100905.15053-7-otavio@ossystems.com.br>
References: <20181206100905.15053-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206100905.15053-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

There are different models of WiFi being used in the SoM and the
handle name was too restrictive. This reworks it to a more generic and
meaningful name.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 arch/arm/boot/dts/imx7d-pico.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
index 35791a1adabf..417f034fb354 100644
--- a/arch/arm/boot/dts/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/imx7d-pico.dtsi
@@ -13,11 +13,11 @@
 		reg = <0x80000000 0>;
 	};
 
-	reg_ap6212: regulator-ap6212 {
+	reg_wlreg_on: regulator-wlreg_on {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_ap6212>;
-		regulator-name = "AP6212";
+		pinctrl-0 = <&pinctrl_reg_wlreg_on>;
+		regulator-name = "wlreg_on";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
@@ -241,7 +241,7 @@
 	non-removable;
 	keep-power-in-suspend;
 	wakeup-source;
-	vmmc-supply = <&reg_ap6212>;
+	vmmc-supply = <&reg_wlreg_on>;
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	status = "okay";
 };
@@ -302,7 +302,7 @@
 		>;
 	};
 
-	pinctrl_reg_ap6212: regap6212grp {
+	pinctrl_reg_wlreg_on: regregongrp {
 		fsl,pins = <
 			MX7D_PAD_ECSPI1_SCLK__GPIO4_IO16	0x59
 		>;
-- 
2.19.2
