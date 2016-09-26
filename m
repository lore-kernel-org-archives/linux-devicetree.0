From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 6/6] ARM: dts: imx6qdl-icore: Add FEC support
Date: Tue, 27 Sep 2016 00:55:36 +0530
Message-ID: <1474917937-29336-6-git-send-email-jteki@openedev.com>
References: <1474917937-29336-1-git-send-email-jteki@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474917937-29336-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Add FEC support for Engicam i.CoreM6 dql modules.

Observed similar 'eth0: link is not ready' issue which was
discussed in [1] due rmii mode with external ref_clk, so added
clock node along with the properties mentioned by Shawn in [2]

FEC link log:
------------
$ ifconfig eth0 up
[   27.905187] SMSC LAN8710/LAN8720 2188000.ethernet:00: attached PHY driver
               [SMSC LAN8710/LAN8720] (mii_bus:phy_addr=2188000.ethernet:00, irq=-1)
[   27.918982] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready

[1] https://patchwork.kernel.org/patch/3491061/
[2] https://patchwork.kernel.org/patch/3490511/

Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
Changes for v6:
	- none
Changes for v5:
        - new patch

 arch/arm/boot/dts/imx6qdl-icore.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index 4e79858..972f48f 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -48,6 +48,18 @@
 		reg = <0x10000000 0x80000000>;
 	};
 
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmii_clk: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;  /* 25MHz for example */
+		};
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "3P3V";
@@ -93,6 +105,15 @@
 	assigned-clock-parents = <&clks IMX6QDL_CLK_OSC>;
 };
 
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+	phy-reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	clocks = <&clks 117>, <&clks 117>, <&rmii_clk>;
+	phy-mode = "rmii";
+	status = "okay";
+};
+
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
@@ -150,6 +171,22 @@
 };
 
 &iomuxc {
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN	0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x1b0b1
+			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
+			MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1	0x1b0b0
+			MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0	0x1b0b0
+			MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1	0x1b0b0
+			MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0	0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_REF_CLK__GPIO1_IO23	0x1b0b0
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x1b0b0
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX 0x1b020
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
