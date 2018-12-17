From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v3 3/3] reset: imx7: Add support for i.MX8MQ IP block
 variant
Date: Mon, 17 Dec 2018 04:30:26 +0000
Message-ID: <AM0PR04MB42114239FC75F5514554B55280BC0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20181217023827.7947-1-andrew.smirnov@gmail.com>
 <20181217023827.7947-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217023827.7947-4-andrew.smirnov@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Andrey Smirnov [mailto:andrew.smirnov@gmail.com]
> Sent: Monday, December 17, 2018 10:38 AM
> To: linux-kernel@vger.kernel.org
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>; p.zabel@pengutronix.de;
> Fabio Estevam <fabio.estevam@nxp.com>; cphealy@gmail.com;
> l.stach@pengutronix.de; Leonard Crestez <leonard.crestez@nxp.com>; Aishen=
g
> Dong <aisheng.dong@nxp.com>; Richard Zhu <hongxing.zhu@nxp.com>; Rob
> Herring <robh@kernel.org>; devicetree@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org
> Subject: [PATCH v3 3/3] reset: imx7: Add support for i.MX8MQ IP block var=
iant
>=20
> Add bits and pieces needed to support IP block variant found on i.MX8MQ
> SoCs.
>=20
> Cc: p.zabel@pengutronix.de
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: cphealy@gmail.com
> Cc: l.stach@pengutronix.de
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  drivers/reset/Kconfig      |   2 +-
>  drivers/reset/reset-imx7.c | 106
> +++++++++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index
> c21da9fe51ec..4909aab7401b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -50,7 +50,7 @@ config RESET_HSDK
>  config RESET_IMX7
>  	bool "i.MX7 Reset Driver" if COMPILE_TEST
>  	depends on HAS_IOMEM
> -	default SOC_IMX7D
> +	default SOC_IMX7D || SOC_IMX8MQ

SOC_IMX8MQ has been removed in Shawn's tree.
I'd suggest simply using ARCH_MXC.

Regards
Dong Aisheng

>  	select MFD_SYSCON
>  	help
>  	  This enables the reset controller driver for i.MX7 SoCs.
> diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c inde=
x
> 3a36d5863891..bb826935db6d 100644
> --- a/drivers/reset/reset-imx7.c
> +++ b/drivers/reset/reset-imx7.c
> @@ -22,6 +22,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/regmap.h>
>  #include <dt-bindings/reset/imx7-reset.h>
> +#include <dt-bindings/reset/imx8mq-reset.h>
>=20
>  struct imx7_src_signal {
>  	unsigned int offset, bit;
> @@ -113,6 +114,110 @@ static const struct imx7_src_variant variant_imx7 =
=3D
> {
>  	.prepare =3D imx7_src_prepare,
>  };
>=20
> +enum imx8mq_src_registers {
> +	SRC_A53RCR0		=3D 0x0004,
> +	SRC_HDMI_RCR		=3D 0x0030,
> +	SRC_DISP_RCR		=3D 0x0034,
> +	SRC_GPU_RCR		=3D 0x0040,
> +	SRC_VPU_RCR		=3D 0x0044,
> +	SRC_PCIE2_RCR		=3D 0x0048,
> +	SRC_MIPIPHY1_RCR	=3D 0x004c,
> +	SRC_MIPIPHY2_RCR	=3D 0x0050,
> +	SRC_DDRC2_RCR		=3D 0x1004,
> +};
> +
> +static const struct imx7_src_signal
> imx8mq_src_signals[IMX8MQ_RESET_NUM] =3D {
> +	[IMX8MQ_RESET_A53_CORE_POR_RESET0]	=3D { SRC_A53RCR0, BIT(0) },
> +	[IMX8MQ_RESET_A53_CORE_POR_RESET1]	=3D { SRC_A53RCR0, BIT(1) },
> +	[IMX8MQ_RESET_A53_CORE_POR_RESET2]	=3D { SRC_A53RCR0, BIT(2) },
> +	[IMX8MQ_RESET_A53_CORE_POR_RESET3]	=3D { SRC_A53RCR0, BIT(3) },
> +	[IMX8MQ_RESET_A53_CORE_RESET0]		=3D { SRC_A53RCR0, BIT(4) },
> +	[IMX8MQ_RESET_A53_CORE_RESET1]		=3D { SRC_A53RCR0, BIT(5) },
> +	[IMX8MQ_RESET_A53_CORE_RESET2]		=3D { SRC_A53RCR0, BIT(6) },
> +	[IMX8MQ_RESET_A53_CORE_RESET3]		=3D { SRC_A53RCR0, BIT(7) },
> +	[IMX8MQ_RESET_A53_DBG_RESET0]		=3D { SRC_A53RCR0, BIT(8) },
> +	[IMX8MQ_RESET_A53_DBG_RESET1]		=3D { SRC_A53RCR0, BIT(9) },
> +	[IMX8MQ_RESET_A53_DBG_RESET2]		=3D { SRC_A53RCR0, BIT(10) },
> +	[IMX8MQ_RESET_A53_DBG_RESET3]		=3D { SRC_A53RCR0, BIT(11) },
> +	[IMX8MQ_RESET_A53_ETM_RESET0]		=3D { SRC_A53RCR0, BIT(12) },
> +	[IMX8MQ_RESET_A53_ETM_RESET1]		=3D { SRC_A53RCR0, BIT(13) },
> +	[IMX8MQ_RESET_A53_ETM_RESET2]		=3D { SRC_A53RCR0, BIT(14) },
> +	[IMX8MQ_RESET_A53_ETM_RESET3]		=3D { SRC_A53RCR0, BIT(15) },
> +	[IMX8MQ_RESET_A53_SOC_DBG_RESET]	=3D { SRC_A53RCR0, BIT(20) },
> +	[IMX8MQ_RESET_A53_L2RESET]		=3D { SRC_A53RCR0, BIT(21) },
> +	[IMX8MQ_RESET_SW_NON_SCLR_M4C_RST]	=3D { SRC_M4RCR, BIT(0) },
> +	[IMX8MQ_RESET_OTG1_PHY_RESET]		=3D { SRC_USBOPHY1_RCR,
> BIT(0) },
> +	[IMX8MQ_RESET_OTG2_PHY_RESET]		=3D { SRC_USBOPHY2_RCR,
> BIT(0) },
> +	[IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N]	=3D { SRC_MIPIPHY_RCR,
> BIT(1) },
> +	[IMX8MQ_RESET_MIPI_DSI_RESET_N]		=3D { SRC_MIPIPHY_RCR,
> BIT(2) },
> +	[IMX8MQ_RESET_MIPI_DIS_DPI_RESET_N]	=3D { SRC_MIPIPHY_RCR,
> BIT(3) },
> +	[IMX8MQ_RESET_MIPI_DIS_ESC_RESET_N]	=3D { SRC_MIPIPHY_RCR,
> BIT(4) },
> +	[IMX8MQ_RESET_MIPI_DIS_PCLK_RESET_N]	=3D { SRC_MIPIPHY_RCR,
> BIT(5) },
> +	[IMX8MQ_RESET_PCIEPHY]			=3D { SRC_PCIEPHY_RCR,
> +						    BIT(2) | BIT(1) },
> +	[IMX8MQ_RESET_PCIEPHY_PERST]		=3D { SRC_PCIEPHY_RCR,
> BIT(3) },
> +	[IMX8MQ_RESET_PCIE_CTRL_APPS_EN]	=3D { SRC_PCIEPHY_RCR,
> BIT(6) },
> +	[IMX8MQ_RESET_PCIE_CTRL_APPS_TURNOFF]	=3D { SRC_PCIEPHY_RCR,
> BIT(11) },
> +	[IMX8MQ_RESET_HDMI_PHY_APB_RESET]	=3D { SRC_HDMI_RCR, BIT(0) },
> +	[IMX8MQ_RESET_DISP_RESET]		=3D { SRC_DISP_RCR, BIT(0) },
> +	[IMX8MQ_RESET_GPU_RESET]		=3D { SRC_GPU_RCR, BIT(0) },
> +	[IMX8MQ_RESET_VPU_RESET]		=3D { SRC_VPU_RCR, BIT(0) },
> +	[IMX8MQ_RESET_PCIEPHY2]			=3D { SRC_PCIE2_RCR,
> +						    BIT(2) | BIT(1) },
> +	[IMX8MQ_RESET_PCIEPHY2_PERST]		=3D { SRC_PCIE2_RCR, BIT(3) },
> +	[IMX8MQ_RESET_PCIE2_CTRL_APPS_EN]	=3D { SRC_PCIE2_RCR, BIT(6) },
> +	[IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF]	=3D { SRC_PCIE2_RCR,
> BIT(11) },
> +	[IMX8MQ_RESET_MIPI_CSI1_CORE_RESET]	=3D { SRC_MIPIPHY1_RCR,
> BIT(0) },
> +	[IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET]	=3D { SRC_MIPIPHY1_RCR,
> BIT(1) },
> +	[IMX8MQ_RESET_MIPI_CSI1_ESC_RESET]	=3D { SRC_MIPIPHY1_RCR,
> BIT(2) },
> +	[IMX8MQ_RESET_MIPI_CSI2_CORE_RESET]	=3D { SRC_MIPIPHY2_RCR,
> BIT(0) },
> +	[IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET]	=3D { SRC_MIPIPHY2_RCR,
> BIT(1) },
> +	[IMX8MQ_RESET_MIPI_CSI2_ESC_RESET]	=3D { SRC_MIPIPHY2_RCR,
> BIT(2) },
> +	[IMX8MQ_RESET_DDRC1_PRST]		=3D { SRC_DDRC_RCR, BIT(0) },
> +	[IMX8MQ_RESET_DDRC1_CORE_RESET]		=3D { SRC_DDRC_RCR,
> BIT(1) },
> +	[IMX8MQ_RESET_DDRC1_PHY_RESET]		=3D { SRC_DDRC_RCR, BIT(2) },
> +	[IMX8MQ_RESET_DDRC2_PHY_RESET]		=3D { SRC_DDRC2_RCR, BIT(0) },
> +	[IMX8MQ_RESET_DDRC2_CORE_RESET]		=3D { SRC_DDRC2_RCR,
> BIT(1) },
> +	[IMX8MQ_RESET_DDRC2_PRST]		=3D { SRC_DDRC2_RCR, BIT(2) },
> +};
> +
> +static unsigned int
> +imx8mq_src_prepare(struct imx7_src *imx7src, unsigned long id, bool
> +assert) {
> +	const unsigned int bit =3D imx7src->variant->signals[id].bit;
> +	unsigned int value =3D assert ? bit : 0;
> +
> +	switch (id) {
> +	case IMX8MQ_RESET_PCIEPHY:
> +	case IMX8MQ_RESET_PCIEPHY2: /* fallthrough */
> +		/*
> +		 * wait for more than 10us to release phy g_rst and
> +		 * btnrst
> +		 */
> +		if (!assert)
> +			udelay(10);
> +		break;
> +
> +	case IMX8MQ_RESET_PCIE_CTRL_APPS_EN:
> +	case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:	/* fallthrough */
> +	case IMX8MQ_RESET_MIPI_DIS_PCLK_RESET_N:	/* fallthrough */
> +	case IMX8MQ_RESET_MIPI_DIS_ESC_RESET_N:	/* fallthrough */
> +	case IMX8MQ_RESET_MIPI_DIS_DPI_RESET_N:	/* fallthrough */
> +	case IMX8MQ_RESET_MIPI_DSI_RESET_N:	/* fallthrough */
> +	case IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N:	/* fallthrough */
> +		value =3D assert ? 0 : bit;
> +		break;
> +	}
> +
> +	return value;
> +}
> +
> +static const struct imx7_src_variant variant_imx8mq =3D {
> +	.signals =3D imx8mq_src_signals,
> +	.signals_num =3D ARRAY_SIZE(imx8mq_src_signals),
> +	.prepare =3D imx8mq_src_prepare,
> +};
> +
>  static struct imx7_src *to_imx7_src(struct reset_controller_dev *rcdev) =
 {
>  	return container_of(rcdev, struct imx7_src, rcdev); @@ -175,6 +280,7
> @@ static int imx7_reset_probe(struct platform_device *pdev)
>=20
>  static const struct of_device_id imx7_reset_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx7d-src", .data =3D &variant_imx7 },
> +	{ .compatible =3D "fsl,imx8mq-src", .data =3D &variant_imx8mq },
>  	{ /* sentinel */ },
>  };
>=20
> --
> 2.19.1
