From: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 4/8] ARM: dts: imx7d: cl-som-imx7: add fec1 support
Date: Mon,  7 Dec 2015 09:14:35 +0200
Message-ID: <1449472479-2521-5-git-send-email-ilya@compulab.co.il>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449472479-2521-1-git-send-email-ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the 1-st Freescale Ethernet Controller (FEC1).

Signed-off-by: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 44849ab..97e96c6 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -43,6 +43,28 @@
 	arm-supply = <&sw1a_reg>;
 };
 
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>;
+	assigned-clocks = <&clks IMX7D_ENET1_TIME_ROOT_SRC>,
+			  <&clks IMX7D_ENET1_TIME_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
+	assigned-clock-rates = <0>, <100000000>;
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
@@ -167,6 +189,25 @@
 
 &iomuxc {
 	cl-som-imx7 {
+		pinctrl_enet1: enet1grp {
+			fsl,pins = <
+				MX7D_PAD_SD2_CD_B__ENET1_MDIO			0x3
+				MX7D_PAD_SD2_WP__ENET1_MDC			0x3
+				MX7D_PAD_ENET1_RGMII_TXC__ENET1_RGMII_TXC	0x1
+				MX7D_PAD_ENET1_RGMII_TD0__ENET1_RGMII_TD0	0x1
+				MX7D_PAD_ENET1_RGMII_TD1__ENET1_RGMII_TD1	0x1
+				MX7D_PAD_ENET1_RGMII_TD2__ENET1_RGMII_TD2	0x1
+				MX7D_PAD_ENET1_RGMII_TD3__ENET1_RGMII_TD3	0x1
+				MX7D_PAD_ENET1_RGMII_TX_CTL__ENET1_RGMII_TX_CTL	0x1
+				MX7D_PAD_ENET1_RGMII_RXC__ENET1_RGMII_RXC	0x1
+				MX7D_PAD_ENET1_RGMII_RD0__ENET1_RGMII_RD0	0x1
+				MX7D_PAD_ENET1_RGMII_RD1__ENET1_RGMII_RD1	0x1
+				MX7D_PAD_ENET1_RGMII_RD2__ENET1_RGMII_RD2	0x1
+				MX7D_PAD_ENET1_RGMII_RD3__ENET1_RGMII_RD3	0x1
+				MX7D_PAD_ENET1_RGMII_RX_CTL__ENET1_RGMII_RX_CTL	0x1
+			>;
+		};
+
 		pinctrl_i2c2: i2c2grp {
 			fsl,pins = <
 				MX7D_PAD_I2C2_SDA__I2C2_SDA		0x4000007f
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
