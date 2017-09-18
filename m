From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx: ventana: remove container node from iomuxc nodes
Date: Mon, 18 Sep 2017 13:11:01 -0700
Message-ID: <1505765461-12977-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The container node in the iomuxc node is no longer necessary and causes
pinctl errors on the Ventana boards with analog video capture
since aa12693e4156adafdef80a8bd134123a6419621b:

pinctrl core: initialized pinctrl subsystem
imx6q-pinctrl 20e0000.iomuxc: no groups defined in /soc/aips-bus@02000000/iomuxc@020e0000/adv7180grp
imx6q-pinctrl 20e0000.iomuxc: no groups defined in /soc/aips-bus@02000000/iomuxc@020e0000/ipu2_csi1grp
imx6q-pinctrl 20e0000.iomuxc: initialized IMX pinctrl driver
imx6q-pinctrl 20e0000.iomuxc: function 'iomuxc' not supported
imx6q-pinctrl 20e0000.iomuxc: invalid function iomuxc in map table
imx6q-pinctrl 20e0000.iomuxc: function 'iomuxc' not supported
imx6q-pinctrl 20e0000.iomuxc: invalid function iomuxc in map table

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-gw5400-a.dts  | 215 ++++++++++---------
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi | 300 +++++++++++++-------------
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 370 ++++++++++++++++----------------
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi | 356 ++++++++++++++++---------------
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 384 +++++++++++++++++-----------------
 arch/arm/boot/dts/imx6qdl-gw551x.dtsi | 182 ++++++++--------
 arch/arm/boot/dts/imx6qdl-gw552x.dtsi | 174 ++++++++-------
 7 files changed, 983 insertions(+), 998 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-gw5400-a.dts b/arch/arm/boot/dts/imx6q-gw5400-a.dts
index 9dbeea0..b281c19 100644
--- a/arch/arm/boot/dts/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/imx6q-gw5400-a.dts
@@ -392,127 +392,124 @@
 };
 
 &iomuxc {
-	imx6q-gw5400-a {
-
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
-				MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
-				MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
-				MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0 /* AUD4_MCK */
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
+			MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
+			MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
+			MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0 /* AUD4_MCK */
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0 /* SPINOR_CS0# */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0 /* SPINOR_CS0# */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0 /* user1 led */
-				MX6QDL_PAD_KEY_COL2__GPIO4_IO10		0x1b0b0 /* user2 led */
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0 /* user3 led */
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0 /* user1 led */
+			MX6QDL_PAD_KEY_COL2__GPIO4_IO10		0x1b0b0 /* user2 led */
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0 /* user3 led */
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0 /* PCIE IRQ */
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0 /* PCIE RST */
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0 /* PCIE IRQ */
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0 /* PCIE RST */
+		>;
+	};
 
-		pinctrl_pps: ppsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__GPIO1_IO05		0x1b0b0 /* GPS_PPS */
-			>;
-		};
+	pinctrl_pps: ppsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__GPIO1_IO05		0x1b0b0 /* GPS_PPS */
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* OTG_PWR_EN */
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* OTG_PWR_EN */
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
index 8855562..dea8fc4 100644
--- a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
@@ -332,175 +332,173 @@
 };
 
 &iomuxc {
-	imx6qdl-gw51xx {
-		pinctrl_adv7180: adv7180grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT5__GPIO5_IO23        0x0001b0b0
-				MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20     0x4001b0b0
-			>;
-		};
+	pinctrl_adv7180: adv7180grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT5__GPIO5_IO23        0x0001b0b0
+			MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20     0x4001b0b0
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-				MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x1b0b0 /* PHY Reset */
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+			MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x1b0b0 /* PHY Reset */
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_ipu1_csi0: ipu1csi0grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
-				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
-				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
-				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
-			>;
-		};
+	pinctrl_ipu1_csi0: ipu1csi0grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
+			MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
+			MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
+			MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
+		>;
+	};
 
-		pinctrl_pps: ppsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
-			>;
-		};
+	pinctrl_pps: ppsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* OTG_PWR_EN */
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* OTG_PWR_EN */
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
index 91991d6..932b613 100644
--- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
@@ -424,213 +424,211 @@
 };
 
 &iomuxc {
-	imx6qdl-gw52xx {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
-				MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
-				MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
-				MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1	0x130b0 /* AUD4_MCK */
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
+			MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
+			MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
+			MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1	0x130b0 /* AUD4_MCK */
+		>;
+	};
 
-		pinctrl_ecspi3: escpi3grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
-				MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
-				MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
-				MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24	0x100b1
-			>;
-		};
+	pinctrl_ecspi3: escpi3grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
+			MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
+			MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
+			MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24	0x100b1
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-				MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x1b0b0 /* PHY Reset */
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+			MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x1b0b0 /* PHY Reset */
+		>;
+	};
 
-		pinctrl_flexcan1: flexcan1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x4001b0b0 /* CAN_STBY */
-			>;
-		};
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x4001b0b0 /* CAN_STBY */
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__GPIO4_IO06  0x1b0b0
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07  0x1b0b0
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15  0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__GPIO4_IO06  0x1b0b0
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07  0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15  0x1b0b0
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0 /* PCIE_RST# */
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0 /* PCIE_RST# */
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
+		>;
+	};
 
-		pinctrl_pps: ppsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
-			>;
-		};
+	pinctrl_pps: ppsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22	0x1b0b0 /* OTG_PWR_EN */
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22	0x1b0b0 /* OTG_PWR_EN */
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x17059 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x17059 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
+		>;
+	};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x170b9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170b9 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
-			>;
-		};
+	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x170b9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170b9 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
+		>;
+	};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170f9 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170f9
-			>;
-		};
+	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170f9 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170f9
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
index 5bc6ed1..5e3b77d 100644
--- a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
@@ -416,205 +416,203 @@
 };
 
 &iomuxc {
-	imx6qdl-gw53xx {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
-				MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
-				MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
-				MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0 /* AUD4_MCK */
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
+			MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
+			MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
+			MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0 /* AUD4_MCK */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_flexcan1: flexcan1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x4001b0b0 /* CAN_STBY */
-			>;
-		};
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x4001b0b0 /* CAN_STBY */
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__GPIO4_IO06   0x1b0b0
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07   0x1b0b0
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15   0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__GPIO4_IO06   0x1b0b0
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07   0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15   0x1b0b0
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28 0x1b0b0 /* PCIE IRQ */
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29  0x1b0b0 /* PCIE RST */
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28 0x1b0b0 /* PCIE IRQ */
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29  0x1b0b0 /* PCIE RST */
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
+		>;
+	};
 
-		pinctrl_pps: ppsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
-			>;
-		};
+	pinctrl_pps: ppsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* PWR_EN */
-				MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0 /* OC */
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* PWR_EN */
+			MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0 /* OC */
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x17059 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x17059 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
+		>;
+	};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170b9 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
-			>;
-		};
+	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170b9 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
+		>;
+	};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170f9 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170f9
-			>;
-		};
+	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170f9 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170f9
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index 66fcf838..8c27abd 100644
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@ -469,221 +469,219 @@
 };
 
 &iomuxc {
-	imx6qdl-gw54xx {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
-				MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
-				MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
-				MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0 /* AUD4_MCK */
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
+			MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
+			MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
+			MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0 /* AUD4_MCK */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_ecspi2: escpi2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK	0x100b1
-				MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI	0x100b1
-				MX6QDL_PAD_EIM_OE__ECSPI2_MISO	0x100b1
-				MX6QDL_PAD_EIM_RW__GPIO2_IO26	0x100b1
-			>;
-		};
+	pinctrl_ecspi2: escpi2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK	0x100b1
+			MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI	0x100b1
+			MX6QDL_PAD_EIM_OE__ECSPI2_MISO	0x100b1
+			MX6QDL_PAD_EIM_RW__GPIO2_IO26	0x100b1
+		>;
+	};
 
-		pinctrl_flexcan1: flexcan1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x4001b0b0 /* CAN_STBY */
-			>;
-		};
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x4001b0b0 /* CAN_STBY */
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0 /* PCIE IRQ */
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0 /* PCIE RST */
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0 /* PCIE IRQ */
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0 /* PCIE RST */
+		>;
+	};
 
-		pinctrl_pps: ppsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
-			>;
-		};
+	pinctrl_pps: ppsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_9__PWM1_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__PWM1_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4_backlight: pwm4grpbacklight {
-			fsl,pins = <
-				/* LVDS_PWM J6.5 */
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4_backlight: pwm4grpbacklight {
+		fsl,pins = <
+			/* LVDS_PWM J6.5 */
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4_dio: pwm4grpdio {
-			fsl,pins = <
-				/* DIO3 J16.4 */
-				MX6QDL_PAD_SD4_DAT2__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4_dio: pwm4grpdio {
+		fsl,pins = <
+			/* DIO3 J16.4 */
+			MX6QDL_PAD_SD4_DAT2__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* PWR_EN */
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0 /* PWR_EN */
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x17059 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x17059 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x17059
+		>;
+	};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170b9 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
-			>;
-		};
+	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170b9 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170b9
+		>;
+	};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170f9 /* CD */
-				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170f9
-			>;
-		};
+	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x170f9 /* CD */
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x170f9
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT3__WDOG2_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT3__WDOG2_B		0x1b0b0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw551x.dtsi b/arch/arm/boot/dts/imx6qdl-gw551x.dtsi
index 405b4031..30d4662 100644
--- a/arch/arm/boot/dts/imx6qdl-gw551x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw551x.dtsi
@@ -320,110 +320,108 @@
 };
 
 &iomuxc {
-	imx6qdl-gw51xx {
-		pinctrl_flexcan1: flexcan1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x4001b0b0 /* CAN_STBY */
-			>;
-		};
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b1
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b1
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x4001b0b0 /* CAN_STBY */
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07   0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07   0x1b0b0
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0 /* PCIE RST */
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0 /* PCIE RST */
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw552x.dtsi b/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
index 67613dd..c67c106 100644
--- a/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
@@ -270,105 +270,103 @@
 };
 
 &iomuxc {
-	imx6qdl-gw552x {
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__GPIO4_IO06		0x1b0b0
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x1b0b0
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0001b0b0 /* PMIC_IRQ# */
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0
+		>;
 	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
