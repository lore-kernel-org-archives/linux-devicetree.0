From: Juergen Borleis <jbe@pengutronix.de>
Subject: [PATCH 7/9] ARM: dts: TQma53: move PMIC's IRQ pin control where it belongs to
Date: Thu,  7 Sep 2017 11:05:28 +0200
Message-ID: <20170907090530.1241-8-jbe@pengutronix.de>
References: <20170907090530.1241-1-jbe@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170907090530.1241-1-jbe@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

Signal needs SoC's internal pull down.

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 arch/arm/boot/dts/imx53-tqma53.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
index 02eb3f4b605de..1c5cd103ed841 100644
--- a/arch/arm/boot/dts/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -74,7 +74,6 @@
 				 MX53_PAD_PATA_DA_1__GPIO7_7     0x80000000 /* LCD_BLT_EN */
 				 MX53_PAD_PATA_DA_2__GPIO7_8     0x80000000 /* LCD_RESET */
 				 MX53_PAD_PATA_DATA5__GPIO2_5    0x80000000 /* LCD_POWER */
-				 MX53_PAD_PATA_DATA6__GPIO2_6    0x80000000 /* PMIC_INT */
 				 MX53_PAD_PATA_DATA14__GPIO2_14  0x80000000 /* CSI_RST */
 				 MX53_PAD_PATA_DATA15__GPIO2_15  0x80000000 /* CSI_PWDN */
 				 MX53_PAD_GPIO_19__GPIO4_5 	 0x80000000 /* #SYSTEM_DOWN */
@@ -205,6 +204,12 @@
 				MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
 			>;
 		};
+
+		pinctrl_pmic: pmicgrp {
+			fsl,pins = <
+				MX53_PAD_PATA_DATA6__GPIO2_6		0x000001c0
+			>;
+		};
 	};
 };
 
@@ -254,6 +259,8 @@
 
 	pmic: mc34708@8 {
 		compatible = "fsl,mc34708";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
 		reg = <0x8>;
 		fsl,mc13xxx-uses-rtc;
 		interrupt-parent = <&gpio2>;
-- 
2.11.0
