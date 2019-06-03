From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: freescale: Add i.MX8MN DDR4 EVK board
 support
Date: Mon, 3 Jun 2019 07:33:57 +0000
Message-ID: <20190603073357.b3d3he5lbqt7xaei@fsr-ub1664-175>
References: <20190603012747.38921-1-Anson.Huang@nxp.com>
 <20190603012747.38921-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603012747.38921-3-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <E19139743FF337498099BF61FFEEE00E@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "marex@denx.de" <marex@denx.de>, Jacky Bai <ping.bai@nxp.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Leo Li <leoyang.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Pankaj Bansal <pankaj.bansal@nxp.com>, Vabhav Sharma <vabhav.sharma@nxp.com>
List-Id: devicetree@vger.kernel.org

On 19-06-03 09:27:47, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> This patch adds basic i.MM8MN DDR4 EVK board support.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  arch/arm64/boot/dts/freescale/Makefile            |   1 +
>  arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts | 217 ++++++++++++++++=
++++++
>  2 files changed, 218 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 0bd122f..2cdd4cc 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2088a-rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-rdb.dtb
> =20
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mn-ddr4-evk.dtb

Nitpick: Move this bellow imx8mm-evk.dtb to keep them alphabetically ordere=
d.

>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-rmb3.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts b/arch/arm=
64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> new file mode 100644
> index 0000000..da552c2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2019 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mn.dtsi"
> +
> +/ {
> +	model =3D "NXP i.MX8MNano DDR4 EVK board";
> +	compatible =3D "fsl,imx8mn-ddr4-evk", "fsl,imx8mn";
> +
> +	chosen {
> +		stdout-path =3D &uart2;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl-names =3D "default";
> +
> +	pinctrl_fec1: fec1grp {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC		0x3
> +			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO	0x3
> +			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3	0x1f
> +			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2	0x1f
> +			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1	0x1f
> +			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0	0x1f
> +			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3	0x91
> +			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2	0x91
> +			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1	0x91
> +			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0	0x91
> +			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
> +			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
> +			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
> +			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> +			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
> +			MX8MN_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2grpgpio {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
> +			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
> +			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
> +			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
> +			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
> +			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
> +			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
> +			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
> +			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
> +			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
> +			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
> +			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
> +			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
> +			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
> +			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
> +			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
> +			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
> +			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
> +			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000190
> +			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
> +			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
> +			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
> +			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
> +			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
> +			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
> +			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
> +			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
> +			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
> +			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000194
> +			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
> +			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
> +			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
> +			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
> +			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
> +			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
> +			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
> +			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
> +			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
> +			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000196
> +			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
> +			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
> +			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
> +			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
> +			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
> +			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
> +			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
> +			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
> +			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
> +			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins =3D <
> +			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0xc6
> +		>;
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_fec1>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy0>;
> +	fsl,magic-packet;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			at803x,led-act-blind-workaround;
> +			at803x,eee-disabled;
> +			at803x,vddio-1p8v;
> +		};
> +	};
> +};
> +
> +&uart2 { /* console */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart2>;
> +	status =3D "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios =3D <&gpio1 15 GPIO_ACTIVE_LOW>;
> +	bus-width =3D <4>;
> +	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +	status =3D "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status =3D "okay";
> +};
> --=20
> 2.7.4
> =
