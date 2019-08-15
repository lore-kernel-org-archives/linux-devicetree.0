From: Anson.Huang@nxp.com
Subject: [PATCH] arm64: dts: imx8mn: Add gpio-ranges property
Date: Wed, 14 Aug 2019 22:57:30 -0400
Message-ID: <1565837850-1373-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, abel.vesa@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add "gpio-ranges" property to establish connections between GPIOs
and PINs on i.MX8MN pinctrl driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index f5eff35..1d8899b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -173,6 +173,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				gpio-ranges = <&iomuxc 0 10 30>;
 			};
 
 			gpio2: gpio@30210000 {
@@ -185,6 +186,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				gpio-ranges = <&iomuxc 0 40 21>;
 			};
 
 			gpio3: gpio@30220000 {
@@ -197,6 +199,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				gpio-ranges = <&iomuxc 0 61 26>;
 			};
 
 			gpio4: gpio@30230000 {
@@ -209,6 +212,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				gpio-ranges = <&iomuxc 21 108 11>;
 			};
 
 			gpio5: gpio@30240000 {
@@ -221,6 +225,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				gpio-ranges = <&iomuxc 0 119 30>;
 			};
 
 			wdog1: watchdog@30280000 {
-- 
2.7.4
