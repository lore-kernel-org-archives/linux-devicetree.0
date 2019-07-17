From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: Add support for i.MX8QXP
 AI_ML board
Date: Wed, 17 Jul 2019 17:04:35 +0530
Message-ID: <20190717113435.GA32330@Mani-XPS-13-9360>
References: <20190717061039.9271-1-manivannan.sadhasivam@linaro.org>
 <20190717061039.9271-4-manivannan.sadhasivam@linaro.org>
 <AM0PR04MB42116A61D7E32E6BA36D1CBA80C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42116A61D7E32E6BA36D1CBA80C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darshak Patel <Darshak.patel@einfochips.com>, Kinjan Patel <Kinjan.patel@einfochips.com>, Prajose John <Prajose.john@einfochips.com>
List-Id: devicetree@vger.kernel.org

Hi Dong,

On Wed, Jul 17, 2019 at 10:40:10AM +0000, Aisheng Dong wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Wednesday, July 17, 2019 2:11 PM
> > 
> > Add support for i.MX8QXP AI_ML board from Einfochips. This board is one of
> > the Consumer Edition boards of the 96Boards family based on i.MX8QXP SoC
> > from NXP/Freescale.
> > 
> > The initial support includes following peripherals which are tested and known
> > to be working:
> > 
> > 1. Debug serial via UART2
> > 2. uSD
> > 3. WiFi
> > 4. Ethernet
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> The patch looks good to me. Only a few nitpicks below.
> Otherwise,
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Regards
> Dong Aisheng
> 

Thanks for the review!

> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../boot/dts/freescale/imx8qxp-ai_ml.dts      | 249 ++++++++++++++++++
> >  2 files changed, 250 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 0bd122f60549..bd8460549d1a 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -24,4 +24,5 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb diff --git
> > a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
> > b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
> > new file mode 100644
> > index 000000000000..dcd36e57d916
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
> > @@ -0,0 +1,249 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2018 Einfochips
> > + * Copyright 2019 Linaro Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx8qxp.dtsi"
> > +
> > +/ {
> > +	model = "Einfochips i.MX8QXP AI_ML";
> > +	compatible = "einfochips,imx8qxp-ai_ml", "fsl,imx8qxp";
> > +
> > +	aliases {
> > +		serial1 = &adma_lpuart1;
> > +		serial2 = &adma_lpuart2;
> > +		serial3 = &adma_lpuart3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &adma_lpuart2;
> > +	};
> > +
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x00000000 0x80000000 0 0x80000000>;
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_leds>;
> > +
> > +		user_led1 {
> > +			label = "green:user1";
> > +			gpios = <&lsio_gpio4 16 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +
> > +		user_led2 {
> > +			label = "green:user2";
> > +			gpios = <&lsio_gpio0 6 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "none";
> > +		};
> > +
> > +		user_led3 {
> > +			label = "green:user3";
> > +			gpios = <&lsio_gpio0 7 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "mmc1";
> > +			default-state = "off";
> > +		};
> > +
> > +		user_led4 {
> > +			label = "green:user4";
> > +			gpios = <&lsio_gpio4 21 GPIO_ACTIVE_HIGH>;
> > +			panic-indicator;
> > +			linux,default-trigger = "none";
> > +		};
> > +
> > +		wlan_active_led {
> > +			label = "yellow:wlan";
> > +			gpios = <&lsio_gpio4 17 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "phy0tx";
> > +			default-state = "off";
> > +		};
> > +
> > +		bt_active_led {
> > +			label = "blue:bt";
> > +			gpios = <&lsio_gpio4 18 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "hci0-power";
> > +			default-state = "off";
> > +		};
> > +	};
> > +
> > +	sdio_pwrseq: sdio-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_wifi_reg_on>;
> > +		reset-gpios = <&lsio_gpio3 24 GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> > +/* BT */
> > +&adma_lpuart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpuart0>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +};
> > +
> > +/* LS-I2C0 */
> 
> Typo?
> 

Ah, yes. It should be LS-UART0, will fix it.

> > +&adma_lpuart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpuart1>;
> > +	status = "okay";
> > +};
> > +
> > +/* Debug */
> > +&adma_lpuart2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpuart2>;
> > +	status = "okay";
> > +};
> > +
> > +/* PCI-E */
> 
> A bit confusing for the comments...
> 

Hmm. How about, "PCI-E UART"?

> > +&adma_lpuart3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpuart3>;
> > +	status = "okay";
> > +};
> > +
> > +&fec1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_fec1>;
> > +	phy-mode = "rgmii-id";
> > +	phy-handle = <&ethphy0>;
> > +	fsl,magic-packet;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> > +		};
> > +	};
> > +};
> > +
> > +/* WiFi */
> > +&usdhc1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_usdhc1>;
> > +	bus-width = <4>;
> > +	no-sd;
> > +	non-removable;
> > +	mmc-pwrseq = <&sdio_pwrseq>;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> Nitpick: we usually put this two properties at the first place.
> 

Okay.

Thanks,
Mani

> > +	status = "okay";
> > +
> > +	brcmf: wifi@1 {
> > +		reg = <1>;
> > +		compatible = "brcm,bcm4329-fmac";
> > +	};
> > +};
> > +
> > +/* SD */
> > +&usdhc2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_usdhc2>;
> > +	bus-width = <4>;
> > +	cd-gpios = <&lsio_gpio4 22 GPIO_ACTIVE_LOW>;
> > +	status = "okay";
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_fec1: fec1grp {
> > +		fsl,pins = <
> > +			IMX8QXP_ENET0_MDC_CONN_ENET0_MDC
> > 	0x06000020
> > +			IMX8QXP_ENET0_MDIO_CONN_ENET0_MDIO
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2
> > 	0x06000020
> > +			IMX8QXP_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3
> > 	0x06000020
> > +		>;
> > +	};
> > +
> > +	pinctrl_leds: ledsgrp{
> > +		fsl,pins = <
> > +			IMX8QXP_ESAI0_TX2_RX3_LSIO_GPIO0_IO06
> > 	0x00000021
> > +			IMX8QXP_ESAI0_TX3_RX2_LSIO_GPIO0_IO07
> > 	0x00000021
> > +			IMX8QXP_EMMC0_DATA7_LSIO_GPIO4_IO16
> > 	0x00000021
> > +			IMX8QXP_USDHC1_WP_LSIO_GPIO4_IO21
> > 	0x00000021
> > +			IMX8QXP_EMMC0_STROBE_LSIO_GPIO4_IO17
> > 	0x00000021
> > +			IMX8QXP_EMMC0_RESET_B_LSIO_GPIO4_IO18
> > 	0x00000021
> > +		>;
> > +	};
> > +
> > +	pinctrl_lpuart0: lpuart0grp {
> > +		fsl,pins = <
> > +			IMX8QXP_UART0_RX_ADMA_UART0_RX
> > 	0X06000020
> > +			IMX8QXP_UART0_TX_ADMA_UART0_TX
> > 	0X06000020
> > +			IMX8QXP_FLEXCAN0_TX_ADMA_UART0_CTS_B
> > 	0x06000020
> > +			IMX8QXP_FLEXCAN0_RX_ADMA_UART0_RTS_B
> > 	0x06000020
> > +		>;
> > +	};
> > +
> > +	pinctrl_lpuart1: lpuart1grp {
> > +		fsl,pins = <
> > +			IMX8QXP_UART1_RX_ADMA_UART1_RX
> > 	0X06000020
> > +			IMX8QXP_UART1_TX_ADMA_UART1_TX
> > 	0X06000020
> > +		>;
> > +	};
> > +
> > +	pinctrl_lpuart2: lpuart2grp {
> > +		fsl,pins = <
> > +			IMX8QXP_UART2_RX_ADMA_UART2_RX
> > 	0X06000020
> > +			IMX8QXP_UART2_TX_ADMA_UART2_TX
> > 	0X06000020
> > +		>;
> > +	};
> > +
> > +	pinctrl_lpuart3: lpuart3grp {
> > +		fsl,pins = <
> > +			IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX
> > 	0X06000020
> > +			IMX8QXP_FLEXCAN2_TX_ADMA_UART3_TX
> > 	0X06000020
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins = <
> > +			IMX8QXP_EMMC0_CLK_CONN_EMMC0_CLK
> > 	0x06000041
> > +			IMX8QXP_EMMC0_CMD_CONN_EMMC0_CMD
> > 	0x00000021
> > +			IMX8QXP_EMMC0_DATA0_CONN_EMMC0_DATA0
> > 	0x00000021
> > +			IMX8QXP_EMMC0_DATA1_CONN_EMMC0_DATA1
> > 	0x00000021
> > +			IMX8QXP_EMMC0_DATA2_CONN_EMMC0_DATA2
> > 	0x00000021
> > +			IMX8QXP_EMMC0_DATA3_CONN_EMMC0_DATA3
> > 	0x00000021
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc2: usdhc2grp {
> > +		fsl,pins = <
> > +			IMX8QXP_USDHC1_CLK_CONN_USDHC1_CLK
> > 	0x06000041
> > +			IMX8QXP_USDHC1_CMD_CONN_USDHC1_CMD
> > 	0x00000021
> > +			IMX8QXP_USDHC1_DATA0_CONN_USDHC1_DATA0
> > 	0x00000021
> > +			IMX8QXP_USDHC1_DATA1_CONN_USDHC1_DATA1
> > 	0x00000021
> > +			IMX8QXP_USDHC1_DATA2_CONN_USDHC1_DATA2
> > 	0x00000021
> > +			IMX8QXP_USDHC1_DATA3_CONN_USDHC1_DATA3
> > 	0x00000021
> > +			IMX8QXP_USDHC1_VSELECT_CONN_USDHC1_VSELECT
> > 	0x00000021
> > +			IMX8QXP_USDHC1_CD_B_LSIO_GPIO4_IO22
> > 	0x00000021
> > +		>;
> > +	};
> > +
> > +	pinctrl_wifi_reg_on: wifiregongrp {
> > +		fsl,pins = <
> > +			IMX8QXP_QSPI0B_SS1_B_LSIO_GPIO3_IO24
> > 	0x00000021
> > +		>;
> > +	};
> > +};
> > --
> > 2.17.1
> 
