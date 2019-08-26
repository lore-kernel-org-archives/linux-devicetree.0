From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 02/12] ARM: dts: imx7d: cl-som-imx7: add phy-reset-gpios
Date: Mon, 26 Aug 2019 16:37:50 +0100
Message-ID: <20190826153800.35400-2-git@andred.net>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826153800.35400-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

According to the design team:
* reset input PHY0 is directly connected to the
  corresponding pin GPIO1_4 in the i.MX7
* reset for PHY1 is done using the gpio expander bit 4

While touching this area, also add a 'compatible'
to the phy to make it more clear what this is and
which driver handles this - an Ethernet phy attached
to mdio, handled by of_mdio.c

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 6f7e85cf0c28..e0432a3aa36f 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -30,13 +30,14 @@
 
 &fec1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_enet1>;
+	pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1phy>;
 	assigned-clocks = <&clks IMX7D_ENET1_TIME_ROOT_SRC>,
 			  <&clks IMX7D_ENET1_TIME_ROOT_CLK>;
 	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
 	assigned-clock-rates = <0>, <100000000>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
+	phy-reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	fsl,magic-packet;
 	status = "okay";
 
@@ -45,10 +46,12 @@
 		#size-cells = <0>;
 
 		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 		};
 
 		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 		};
 	};
@@ -63,6 +66,7 @@
 	assigned-clock-rates = <0>, <100000000>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy1>;
+	phy-reset-gpios = <&pca9555 4 GPIO_ACTIVE_LOW>;
 	fsl,magic-packet;
 	status = "okay";
 };
@@ -262,3 +266,11 @@
 		>;
 	};
 };
+
+&iomuxc_lpsr {
+	pinctrl_enet1phy: enet1phygrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x34
+		>;
+	};
+};
-- 
2.23.0.rc1
