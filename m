From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v4 2/2] pinctrl: imx: add driver for i.MX8MQ
Date: Fri, 22 Jun 2018 10:59:23 +0000
Message-ID: <AM0PR04MB42111690585D73FBD800663380750@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1529497429-8576-1-git-send-email-abel.vesa@nxp.com>
 <1529497429-8576-3-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529497429-8576-3-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>
List-Id: devicetree@vger.kernel.org

Hi Abel,

The patch mostly looks good to me.
Only a few minor comments.

> -----Original Message-----
> From: Abel Vesa
> Sent: Wednesday, June 20, 2018 8:24 PM
> To: Lucas Stach <l.stach@pengutronix.de>; A.s. Dong
> <aisheng.dong@nxp.com>
> Cc: linux-gpio@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Shawn
> Guo <shawnguo@kernel.org>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Abel Vesa
> <abelvesa@linux.com>; Abel Vesa <abel.vesa@nxp.com>
> Subject: [PATCH v4 2/2] pinctrl: imx: add driver for i.MX8MQ
>=20
> From: Lucas Stach <l.stach@pengutronix.de>
>=20
> The i.MX8MQ pincontrol works in a similar way to the earlier i.MX SoCs.
> This driver builds on top of the generic pinconf handling introduced with=
 the
> i.MX7ULP pinctrl driver.

The commit message needs update as it does not build on top
of the generic pinconf now.

>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  drivers/pinctrl/freescale/Kconfig          |   7 +
>  drivers/pinctrl/freescale/Makefile         |   1 +
>  drivers/pinctrl/freescale/pinctrl-imx8mq.c | 356
> +++++++++++++++++++++++++++++
>  3 files changed, 364 insertions(+)
>  create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8mq.c
>=20
> diff --git a/drivers/pinctrl/freescale/Kconfig
> b/drivers/pinctrl/freescale/Kconfig
> index 0d8ba1e..dccf64c 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -117,6 +117,13 @@ config PINCTRL_IMX7ULP
>  	help
>  	  Say Y here to enable the imx7ulp pinctrl driver
>=20
> +config PINCTRL_IMX8MQ
> +	bool "IMX8MQ pinctrl driver"
> +	depends on SOC_IMX8MQ
> +	select PINCTRL_IMX
> +	help
> +	  Say Y here to enable the imx8mq pinctrl driver
> +
>  config PINCTRL_VF610
>  	bool "Freescale Vybrid VF610 pinctrl driver"
>  	depends on SOC_VF610
> diff --git a/drivers/pinctrl/freescale/Makefile
> b/drivers/pinctrl/freescale/Makefile
> index 368be8c..73175b3 100644
> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_PINCTRL_IMX6SX)	+=3D pinctrl-imx6sx.o
>  obj-$(CONFIG_PINCTRL_IMX6UL)	+=3D pinctrl-imx6ul.o
>  obj-$(CONFIG_PINCTRL_IMX7D)	+=3D pinctrl-imx7d.o
>  obj-$(CONFIG_PINCTRL_IMX7ULP)	+=3D pinctrl-imx7ulp.o
> +obj-$(CONFIG_PINCTRL_IMX8MQ)	+=3D pinctrl-imx8mq.o
>  obj-$(CONFIG_PINCTRL_VF610)	+=3D pinctrl-vf610.o
>  obj-$(CONFIG_PINCTRL_MXS)	+=3D pinctrl-mxs.o
>  obj-$(CONFIG_PINCTRL_IMX23)	+=3D pinctrl-imx23.o
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> new file mode 100644
> index 0000000..be2c9c2
> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017 NXP

2017-2018

> + * Copyright (C) 2018 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> +*/
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-imx.h"
> +
> +enum imx8mq_pads {
> +	MX8MQ_PAD_RESERVE0 =3D 0,
> +	MX8MQ_PAD_RESERVE1 =3D 1,
> +	MX8MQ_PAD_RESERVE2 =3D 2,
> +	MX8MQ_PAD_RESERVE3 =3D 3,
> +	MX8MQ_PAD_RESERVE4 =3D 4,
> +	MX8MQ_IOMUXC_PMIC_STBY_REQ_CCMSRCGPCMIX =3D 5,
> +	MX8MQ_IOMUXC_PMIC_ON_REQ_SNVSMIX =3D 6,
> +	MX8MQ_IOMUXC_ONOFF_SNVSMIX =3D 7,
> +	MX8MQ_IOMUXC_POR_B_SNVSMIX =3D 8,
> +	MX8MQ_IOMUXC_RTC_RESET_B_SNVSMIX =3D 9,
> +	MX8MQ_IOMUXC_GPIO1_IO00 =3D 10,
> +	MX8MQ_IOMUXC_GPIO1_IO01 =3D 11,
> +	MX8MQ_IOMUXC_GPIO1_IO02 =3D 12,
> +	MX8MQ_IOMUXC_GPIO1_IO03 =3D 13,
> +	MX8MQ_IOMUXC_GPIO1_IO04 =3D 14,
> +	MX8MQ_IOMUXC_GPIO1_IO05 =3D 15,
> +	MX8MQ_IOMUXC_GPIO1_IO06 =3D 16,
> +	MX8MQ_IOMUXC_GPIO1_IO07 =3D 17,
> +	MX8MQ_IOMUXC_GPIO1_IO08 =3D 18,
> +	MX8MQ_IOMUXC_GPIO1_IO09 =3D 19,
> +	MX8MQ_IOMUXC_GPIO1_IO10 =3D 20,
> +	MX8MQ_IOMUXC_GPIO1_IO11 =3D 21,
> +	MX8MQ_IOMUXC_GPIO1_IO12 =3D 22,
> +	MX8MQ_IOMUXC_GPIO1_IO13 =3D 23,
> +	MX8MQ_IOMUXC_GPIO1_IO14 =3D 24,
> +	MX8MQ_IOMUXC_GPIO1_IO15 =3D 25,
> +	MX8MQ_IOMUXC_ENET_MDC =3D 26,
> +	MX8MQ_IOMUXC_ENET_MDIO =3D 27,
> +	MX8MQ_IOMUXC_ENET_TD3 =3D 28,
> +	MX8MQ_IOMUXC_ENET_TD2 =3D 29,
> +	MX8MQ_IOMUXC_ENET_TD1 =3D 30,
> +	MX8MQ_IOMUXC_ENET_TD0 =3D 31,
> +	MX8MQ_IOMUXC_ENET_TX_CTL =3D 32,
> +	MX8MQ_IOMUXC_ENET_TXC =3D 33,
> +	MX8MQ_IOMUXC_ENET_RX_CTL =3D 34,
> +	MX8MQ_IOMUXC_ENET_RXC =3D 35,
> +	MX8MQ_IOMUXC_ENET_RD0 =3D 36,
> +	MX8MQ_IOMUXC_ENET_RD1 =3D 37,
> +	MX8MQ_IOMUXC_ENET_RD2 =3D 38,
> +	MX8MQ_IOMUXC_ENET_RD3 =3D 39,
> +	MX8MQ_IOMUXC_SD1_CLK =3D 40,
> +	MX8MQ_IOMUXC_SD1_CMD =3D 41,
> +	MX8MQ_IOMUXC_SD1_DATA0 =3D 42,
> +	MX8MQ_IOMUXC_SD1_DATA1 =3D 43,
> +	MX8MQ_IOMUXC_SD1_DATA2 =3D 44,
> +	MX8MQ_IOMUXC_SD1_DATA3 =3D 45,
> +	MX8MQ_IOMUXC_SD1_DATA4 =3D 46,
> +	MX8MQ_IOMUXC_SD1_DATA5 =3D 47,
> +	MX8MQ_IOMUXC_SD1_DATA6 =3D 48,
> +	MX8MQ_IOMUXC_SD1_DATA7 =3D 49,
> +	MX8MQ_IOMUXC_SD1_RESET_B =3D 50,
> +	MX8MQ_IOMUXC_SD1_STROBE =3D 51,
> +	MX8MQ_IOMUXC_SD2_CD_B =3D 52,
> +	MX8MQ_IOMUXC_SD2_CLK =3D 53,
> +	MX8MQ_IOMUXC_SD2_CMD =3D 54,
> +	MX8MQ_IOMUXC_SD2_DATA0 =3D 55,
> +	MX8MQ_IOMUXC_SD2_DATA1 =3D 56,
> +	MX8MQ_IOMUXC_SD2_DATA2 =3D 57,
> +	MX8MQ_IOMUXC_SD2_DATA3 =3D 58,
> +	MX8MQ_IOMUXC_SD2_RESET_B =3D 59,
> +	MX8MQ_IOMUXC_SD2_WP =3D 60,
> +	MX8MQ_IOMUXC_NAND_ALE =3D 61,
> +	MX8MQ_IOMUXC_NAND_CE0_B =3D 62,
> +	MX8MQ_IOMUXC_NAND_CE1_B =3D 63,
> +	MX8MQ_IOMUXC_NAND_CE2_B =3D 64,
> +	MX8MQ_IOMUXC_NAND_CE3_B =3D 65,
> +	MX8MQ_IOMUXC_NAND_CLE =3D 66,
> +	MX8MQ_IOMUXC_NAND_DATA00 =3D 67,
> +	MX8MQ_IOMUXC_NAND_DATA01 =3D 68,
> +	MX8MQ_IOMUXC_NAND_DATA02 =3D 69,
> +	MX8MQ_IOMUXC_NAND_DATA03 =3D 70,
> +	MX8MQ_IOMUXC_NAND_DATA04 =3D 71,
> +	MX8MQ_IOMUXC_NAND_DATA05 =3D 72,
> +	MX8MQ_IOMUXC_NAND_DATA06 =3D 73,
> +	MX8MQ_IOMUXC_NAND_DATA07 =3D 74,
> +	MX8MQ_IOMUXC_NAND_DQS =3D 75,
> +	MX8MQ_IOMUXC_NAND_RE_B =3D 76,
> +	MX8MQ_IOMUXC_NAND_READY_B =3D 77,
> +	MX8MQ_IOMUXC_NAND_WE_B =3D 78,
> +	MX8MQ_IOMUXC_NAND_WP_B =3D 79,
> +	MX8MQ_IOMUXC_SAI5_RXFS =3D 80,
> +	MX8MQ_IOMUXC_SAI5_RXC =3D 81,
> +	MX8MQ_IOMUXC_SAI5_RXD0 =3D 82,
> +	MX8MQ_IOMUXC_SAI5_RXD1 =3D 83,
> +	MX8MQ_IOMUXC_SAI5_RXD2 =3D 84,
> +	MX8MQ_IOMUXC_SAI5_RXD3 =3D 85,
> +	MX8MQ_IOMUXC_SAI5_MCLK =3D 86,
> +	MX8MQ_IOMUXC_SAI1_RXFS =3D 87,
> +	MX8MQ_IOMUXC_SAI1_RXC =3D 88,
> +	MX8MQ_IOMUXC_SAI1_RXD0 =3D 89,
> +	MX8MQ_IOMUXC_SAI1_RXD1 =3D 90,
> +	MX8MQ_IOMUXC_SAI1_RXD2 =3D 91,
> +	MX8MQ_IOMUXC_SAI1_RXD3 =3D 92,
> +	MX8MQ_IOMUXC_SAI1_RXD4 =3D 93,
> +	MX8MQ_IOMUXC_SAI1_RXD5 =3D 94,
> +	MX8MQ_IOMUXC_SAI1_RXD6 =3D 95,
> +	MX8MQ_IOMUXC_SAI1_RXD7 =3D 96,
> +	MX8MQ_IOMUXC_SAI1_TXFS =3D 97,
> +	MX8MQ_IOMUXC_SAI1_TXC =3D 98,
> +	MX8MQ_IOMUXC_SAI1_TXD0 =3D 99,
> +	MX8MQ_IOMUXC_SAI1_TXD1 =3D 100,
> +	MX8MQ_IOMUXC_SAI1_TXD2 =3D 101,
> +	MX8MQ_IOMUXC_SAI1_TXD3 =3D 102,
> +	MX8MQ_IOMUXC_SAI1_TXD4 =3D 103,
> +	MX8MQ_IOMUXC_SAI1_TXD5 =3D 104,
> +	MX8MQ_IOMUXC_SAI1_TXD6 =3D 105,
> +	MX8MQ_IOMUXC_SAI1_TXD7 =3D 106,
> +	MX8MQ_IOMUXC_SAI1_MCLK =3D 107,
> +	MX8MQ_IOMUXC_SAI2_RXFS =3D 108,
> +	MX8MQ_IOMUXC_SAI2_RXC =3D 109,
> +	MX8MQ_IOMUXC_SAI2_RXD0 =3D 110,
> +	MX8MQ_IOMUXC_SAI2_TXFS =3D 111,
> +	MX8MQ_IOMUXC_SAI2_TXC =3D 112,
> +	MX8MQ_IOMUXC_SAI2_TXD0 =3D 113,
> +	MX8MQ_IOMUXC_SAI2_MCLK =3D 114,
> +	MX8MQ_IOMUXC_SAI3_RXFS =3D 115,
> +	MX8MQ_IOMUXC_SAI3_RXC =3D 116,
> +	MX8MQ_IOMUXC_SAI3_RXD =3D 117,
> +	MX8MQ_IOMUXC_SAI3_TXFS =3D 118,
> +	MX8MQ_IOMUXC_SAI3_TXC =3D 119,
> +	MX8MQ_IOMUXC_SAI3_TXD =3D 120,
> +	MX8MQ_IOMUXC_SAI3_MCLK =3D 121,
> +	MX8MQ_IOMUXC_SPDIF_TX =3D 122,
> +	MX8MQ_IOMUXC_SPDIF_RX =3D 123,
> +	MX8MQ_IOMUXC_SPDIF_EXT_CLK =3D 124,
> +	MX8MQ_IOMUXC_ECSPI1_SCLK =3D 125,
> +	MX8MQ_IOMUXC_ECSPI1_MOSI =3D 126,
> +	MX8MQ_IOMUXC_ECSPI1_MISO =3D 127,
> +	MX8MQ_IOMUXC_ECSPI1_SS0 =3D 128,
> +	MX8MQ_IOMUXC_ECSPI2_SCLK =3D 129,
> +	MX8MQ_IOMUXC_ECSPI2_MOSI =3D 130,
> +	MX8MQ_IOMUXC_ECSPI2_MISO =3D 131,
> +	MX8MQ_IOMUXC_ECSPI2_SS0 =3D 132,
> +	MX8MQ_IOMUXC_I2C1_SCL =3D 133,
> +	MX8MQ_IOMUXC_I2C1_SDA =3D 134,
> +	MX8MQ_IOMUXC_I2C2_SCL =3D 135,
> +	MX8MQ_IOMUXC_I2C2_SDA =3D 136,
> +	MX8MQ_IOMUXC_I2C3_SCL =3D 137,
> +	MX8MQ_IOMUXC_I2C3_SDA =3D 138,
> +	MX8MQ_IOMUXC_I2C4_SCL =3D 139,
> +	MX8MQ_IOMUXC_I2C4_SDA =3D 140,
> +	MX8MQ_IOMUXC_UART1_RXD =3D 141,
> +	MX8MQ_IOMUXC_UART1_TXD =3D 142,
> +	MX8MQ_IOMUXC_UART2_RXD =3D 143,
> +	MX8MQ_IOMUXC_UART2_TXD =3D 144,
> +	MX8MQ_IOMUXC_UART3_RXD =3D 145,
> +	MX8MQ_IOMUXC_UART3_TXD =3D 146,
> +	MX8MQ_IOMUXC_UART4_RXD =3D 147,
> +	MX8MQ_IOMUXC_UART4_TXD =3D 148,
> +};
> +
> +/* Pad names for the pinmux subsystem */ static const struct
> +pinctrl_pin_desc imx8mq_pinctrl_pads[] =3D {
> +	IMX_PINCTRL_PIN(MX8MQ_PAD_RESERVE0),
> +	IMX_PINCTRL_PIN(MX8MQ_PAD_RESERVE1),
> +	IMX_PINCTRL_PIN(MX8MQ_PAD_RESERVE2),
> +	IMX_PINCTRL_PIN(MX8MQ_PAD_RESERVE3),
> +	IMX_PINCTRL_PIN(MX8MQ_PAD_RESERVE4),
> +
> 	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_PMIC_STBY_REQ_CCMSRCGP
> CMIX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_PMIC_ON_REQ_SNVSMIX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ONOFF_SNVSMIX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_POR_B_SNVSMIX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_RTC_RESET_B_SNVSMIX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO00),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO01),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO02),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO03),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO04),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO05),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO06),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO07),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO08),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO09),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO10),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO11),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO12),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO13),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO14),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_GPIO1_IO15),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_MDC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_MDIO),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_TD3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_TD2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_TD1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_TD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_TX_CTL),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_TXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_RX_CTL),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_RXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_RD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_RD1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_RD2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ENET_RD3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_CLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_CMD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA4),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA5),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA6),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_DATA7),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_RESET_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD1_STROBE),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_CD_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_CLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_CMD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_DATA0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_DATA1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_DATA2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_DATA3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_RESET_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SD2_WP),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_ALE),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_CE0_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_CE1_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_CE2_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_CE3_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_CLE),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA00),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA01),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA02),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA03),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA04),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA05),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA06),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DATA07),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_DQS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_RE_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_READY_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_WE_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_NAND_WP_B),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_RXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_RXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_RXD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_RXD1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_RXD2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_RXD3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI5_MCLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD4),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD5),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD6),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_RXD7),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD1),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD2),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD3),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD4),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD5),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD6),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_TXD7),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI1_MCLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_RXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_RXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_RXD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_TXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_TXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_TXD0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI2_MCLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_RXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_RXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_RXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_TXFS),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_TXC),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_TXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SAI3_MCLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SPDIF_TX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SPDIF_RX),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_SPDIF_EXT_CLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI1_SCLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI1_MOSI),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI1_MISO),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI1_SS0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI2_SCLK),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI2_MOSI),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI2_MISO),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_ECSPI2_SS0),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C1_SCL),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C1_SDA),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C2_SCL),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C2_SDA),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C3_SCL),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C3_SDA),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C4_SCL),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_I2C4_SDA),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART1_RXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART1_TXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART2_RXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART2_TXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART3_RXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART3_TXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART4_RXD),
> +	IMX_PINCTRL_PIN(MX8MQ_IOMUXC_UART4_TXD),
> +};
> +
> +static const struct imx_pinctrl_soc_info imx8mq_pinctrl_info =3D {
> +	.pins =3D imx8mq_pinctrl_pads,
> +	.npins =3D ARRAY_SIZE(imx8mq_pinctrl_pads),
> +	.gpr_compatible =3D "fsl,imx8mq-iomuxc-gpr", };
> +
> +static const struct of_device_id imx8mq_pinctrl_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx8mq-iomuxc", .data =3D
> &imx8mq_pinctrl_info, },
> +	{ /* sentinel */ }
> +};
> +
> +static int imx8mq_pinctrl_probe(struct platform_device *pdev) {
> +	const struct imx_pinctrl_soc_info *pinctrl_info;
> +
> +	pinctrl_info =3D of_device_get_match_data(&pdev->dev);
> +	if (!pinctrl_info)
> +		return -ENODEV;
> +
> +	return imx_pinctrl_probe(pdev, pinctrl_info); }

We don't have another pinctrl_info with a different compatible string.
So I guess a simple direct call just works fine as before:
imx_pinctrl_probe(&imx8mq_pinctrl_info).

> +
> +static struct platform_driver imx8mq_pinctrl_driver =3D {
> +	.driver =3D {
> +		.name =3D "imx8mq-pinctrl",
> +		.of_match_table =3D of_match_ptr(imx8mq_pinctrl_of_match),

Better with:
.suppress_bind_attrs =3D true,

> +	},
> +	.probe =3D imx8mq_pinctrl_probe,
> +};
> +
> +static int __init imx8mq_pinctrl_init(void) {
> +	return platform_driver_register(&imx8mq_pinctrl_driver);
> +}
> +arch_initcall(imx8mq_pinctrl_init);

Otherwise:
Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>

Regards
Dong Aisheng

> --
> 2.7.4
