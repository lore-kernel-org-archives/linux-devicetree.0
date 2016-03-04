From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv3 2/2] ARM: dts: imx6ul: add support for Ka-Ro electronics TXUL mainboard
Date: Fri,  4 Mar 2016 13:37:23 +0100
Message-ID: <1457095043-14115-3-git-send-email-LW@KARO-electronics.de>
References: <1457095043-14115-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457095043-14115-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/Makefile                   |   3 +-
 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts | 271 +++++++++++++++++++=
++++++++
 2 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a5e21ae..9f6af0f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -376,7 +376,8 @@ dtb-$(CONFIG_SOC_IMX6SX) +=3D \
 dtb-$(CONFIG_SOC_IMX6UL) +=3D \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-tx6ul-0010.dtb \
-	imx6ul-tx6ul-0011.dtb
+	imx6ul-tx6ul-0011.dtb \
+	imx6ul-tx6ul-mainboard.dtb
 dtb-$(CONFIG_SOC_IMX7D) +=3D \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-sbc-imx7.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts b/arch/arm/bo=
ot/dts/imx6ul-tx6ul-mainboard.dts
new file mode 100644
index 0000000..d25899b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
@@ -0,0 +1,271 @@
+/*
+ * Copyright 2015 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "imx6ul.dtsi"
+#include "imx6ul-tx6ul.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TXUL-0010 Module on TXUL Mainboard";
+	compatible =3D "karo,imx6ul-tx6ul", "fsl,imx6ul";
+
+	aliases {
+		lcdif_24bit_pins_a =3D &pinctrl_disp0_3;
+		mmc0 =3D &usdhc1;
+		/delete-property/ mmc1;
+		serial2 =3D &uart3;
+		serial4 =3D &uart5;
+	};
+	/delete-node/ sound;
+};
+
+&can1 {
+	xceiver-supply =3D <&reg_3v3>;
+};
+
+&can2 {
+	xceiver-supply =3D <&reg_3v3>;
+};
+
+&ds1339 {
+	status =3D "disabled";
+};
+
+&fec1 {
+	pinctrl-0 =3D <&pinctrl_enet1 &pinctrl_etnphy0_rst>;
+	/delete-node/ mdio;
+};
+
+&fec2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_enet2 &pinctrl_enet2_mdio &pinctrl_etnphy1_rs=
t>;
+	phy-mode =3D "rmii";
+	phy-reset-gpios =3D <&gpio4 28 GPIO_ACTIVE_HIGH>;
+	phy-supply =3D <&reg_3v3_etn>;
+	phy-handle =3D <&etnphy1>;
+	status =3D "okay";
+
+	mdio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		etnphy0: ethernet-phy@0 {
+			compatible =3D "ethernet-phy-ieee802.3-c22";
+			reg =3D <0>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_etnphy0_int>;
+			interrupt-parent =3D <&gpio5>;
+			interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
+			interrupts-extended =3D <&gpio5 5 IRQ_TYPE_EDGE_FALLING>;
+			status =3D "okay";
+		};
+
+		etnphy1: ethernet-phy@2 {
+			compatible =3D "ethernet-phy-ieee802.3-c22";
+			reg =3D <2>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_etnphy1_int>;
+			interrupt-parent =3D <&gpio4>;
+			interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts-extended =3D <&gpio4 27 IRQ_TYPE_EDGE_FALLING>;
+			status =3D "okay";
+		};
+	};
+};
+
+&i2c_gpio {
+	status =3D "disabled";
+};
+
+&i2c2 {
+	/delete-node/ codec@0a;
+	/delete-node/ touchscreen@48;
+
+	rtc: mcp7940x@6f {
+		compatible =3D "microchip,mcp7940x";
+		reg =3D <0x6f>;
+	};
+};
+
+&kpp {
+	status =3D "disabled";
+};
+
+&lcdif {
+	pinctrl-0 =3D <&pinctrl_disp0_3>;
+};
+
+&reg_usbotg_vbus{
+	status =3D "disabled";
+};
+
+&usdhc1 {
+	pinctrl-0 =3D <&pinctrl_usdhc1>;
+	non-removable;
+	/delete-property/ cd-gpios;
+	cap-sdio-irq;
+};
+
+&uart1 {
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	/delete-property/ fsl,uart-has-rtscts;
+};
+
+&uart2 {
+	pinctrl-0 =3D <&pinctrl_uart2>;
+	/delete-property/ fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart3>;
+	status =3D "okay";
+};
+
+&uart4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart4>;
+	status =3D "okay";
+};
+
+&uart5 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart5>;
+	status =3D "okay";
+};
+
+&uart6 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart6>;
+	status =3D "okay";
+};
+
+&uart7 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart7>;
+	status =3D "okay";
+};
+
+&uart8 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart8>;
+	status =3D "disabled"; /* conflicts with LCDIF */
+};
+
+&iomuxc {
+	hoggrp {
+		fsl,pins =3D <
+			MX6UL_PAD_CSI_DATA01__GPIO4_IO22	0x0b0b0 /* WLAN_RESET */
+		>;
+	};
+
+	pinctrl_disp0_3: disp0grp-3 {
+		fsl,pins =3D <
+			MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x10 /* LSCLK */
+			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x10 /* OE_ACD */
+			MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC	0x10 /* HSYNC */
+			MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC	0x10 /* VSYNC */
+			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x10
+			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x10
+			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x10
+			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x10
+			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x10
+			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x10
+			/* LCD_DATA08..09 not wired */
+			MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x10
+			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x10
+			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x10
+			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x10
+			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x10
+			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x10
+			/* LCD_DATA16..17 not wired */
+			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x10
+			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x10
+			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x10
+			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x10
+			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x10
+			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x10
+		>;
+	};
+
+	pinctrl_enet2_mdio: enet2-mdiogrp {
+		fsl,pins =3D <
+			MX6UL_PAD_GPIO1_IO07__ENET2_MDC		0x0b0b0
+			MX6UL_PAD_GPIO1_IO06__ENET2_MDIO	0x1b0b0
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins =3D <
+			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x0b0b0
+			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x0b0b0
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins =3D <
+			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x0b0b0
+			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x0b0b0
+		>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins =3D <
+			MX6UL_PAD_CSI_MCLK__UART6_DCE_TX	0x0b0b0
+			MX6UL_PAD_CSI_PIXCLK__UART6_DCE_RX	0x0b0b0
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins =3D <
+			MX6UL_PAD_LCD_DATA16__UART7_DCE_TX	0x0b0b0
+			MX6UL_PAD_LCD_DATA17__UART7_DCE_RX	0x0b0b0
+		>;
+	};
+
+	pinctrl_uart8: uart8grp {
+		fsl,pins =3D <
+			MX6UL_PAD_LCD_DATA20__UART8_DCE_TX	0x0b0b0
+			MX6UL_PAD_LCD_DATA21__UART8_DCE_RX	0x0b0b0
+		>;
+	};
+};
--=20
2.1.4
