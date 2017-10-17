From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 05/12] ARM: dts: imx6-tx6: improve ethernet related pinctrl setup
Date: Tue, 17 Oct 2017 10:53:27 +0200
Message-ID: <1508230414-8090-6-git-send-email-LW@KARO-electronics.de>
References: <1508230414-8090-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508230414-8090-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Remove the PHY INT and RESET pins from hog section and put them into
their own pinctrl nodes referenced by the appropriate driver nodes.
Also, the MDIO pins are required for probing the Ethernet PHY, so they
must be configured by the FEC driver, not by the PHY driver. Move the
corresponding pinctrl settings from the PHY subnode to the FEC node.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6qdl-tx6.dtsi | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
index a50bf71..aa32956 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -1,5 +1,5 @@
 /*
- * Copyright 2014-2016 Lothar Waßmann <LW@KARO-electronics.de>
+ * Copyright 2014-2017 Lothar Waßmann <LW@KARO-electronics.de>
  *
  * This file is dual-licensed: you can use it either under the terms
  * of the GPL or the X11 license, at your option. Note that this dual
@@ -241,7 +241,7 @@
 
 &fec {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_enet>;
+	pinctrl-0 = <&pinctrl_enet &pinctrl_enet_mdio &pinctrl_etnphy_rst>;
 	clocks = <&clks IMX6QDL_CLK_ENET>,
 		 <&clks IMX6QDL_CLK_ENET>,
 		 <&clks IMX6QDL_CLK_ENET_REF>,
@@ -261,7 +261,7 @@
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_enet_mdio>;
+			pinctrl-0 = <&pinctrl_etnphy_int>;
 			interrupts-extended = <&gpio7 1 IRQ_TYPE_EDGE_FALLING>;
 		};
 	};
@@ -334,8 +334,6 @@
 
 	pinctrl_hog: hoggrp {
 		fsl,pins = <
-			MX6QDL_PAD_SD3_DAT2__GPIO7_IO06		0x1b0b1 /* ETN PHY RESET */
-			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x1b0b1 /* ETN PHY INT */
 			MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b1 /* PWR BTN */
 		>;
 	};
@@ -453,12 +451,24 @@
 		>;
 	};
 
+	pinctrl_etnphy_int: etnphy-intgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x1b0b1 /* ETN PHY INT */
+		>;
+	};
+
 	pinctrl_etnphy_power: etnphy-pwrgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D20__GPIO3_IO20		0x1b0b1 /* ETN PHY POWER */
 		>;
 	};
 
+	pinctrl_etnphy_rst: etnphy-rstgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT2__GPIO7_IO06		0x1b0b1 /* ETN PHY RESET */
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX		0x1b0b0
-- 
2.1.4
