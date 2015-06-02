From: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v3 2/2] ARM: dts: sabrelite: add CAN support
Date: Tue,  2 Jun 2015 21:07:17 +0200
Message-ID: <1433272037-6744-2-git-send-email-ps.report@gmx.net>
References: <1433272037-6744-1-git-send-email-ps.report@gmx.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433272037-6744-1-git-send-email-ps.report@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
v1:
 - do the same for the sabrelite board as suggested/tested
   by Eric Nelson
---
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index e00c44f..fe01059 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -53,6 +53,17 @@
 			gpio = <&gpio3 22 0>;
 			enable-active-high;
 		};
+
+		reg_can_xcvr: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "CAN XCVR";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_can_xcvr>;
+			gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	gpio-keys {
@@ -148,6 +159,13 @@
 	status = "okay";
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	xceiver-supply = <&reg_can_xcvr>;
+	status = "okay";
+};
+
 &ecspi1 {
 	fsl,spi-num-chipselects = <1>;
 	cs-gpios = <&gpio3 19 0>;
@@ -239,6 +257,20 @@
 			>;
 		};
 
+		pinctrl_can1: can1grp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b0
+				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
+			>;
+		};
+
+		pinctrl_can_xcvr: can-xcvrgrp {
+			fsl,pins = <
+				/* Flexcan XCVR enable */
+				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
+			>;
+		};
+
 		pinctrl_ecspi1: ecspi1grp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-- 
2.1.4
