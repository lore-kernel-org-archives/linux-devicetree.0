From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/4] arm64: dts: imx8mq: Fix the fsl,imx8mq-sdma
 compatible string
Date: Fri, 29 Mar 2019 09:10:27 +0000
Message-ID: <AM0PR04MB421112C3EE79B279953A9252805A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190328133828.20999-1-angus@akkea.ca>
 <20190328133828.20999-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328133828.20999-2-angus@akkea.ca>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> From: Angus Ainslie (Purism) [mailto:angus@akkea.ca]
> Sent: Thursday, March 28, 2019 9:38 PM
>=20
> Fix a typo in the compatible string
>=20
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 81d5ce1b1ec1..07099f82965e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -720,7 +720,7 @@
>  			};
>=20
>  			sdma1: sdma@30bd0000 {
> -				compatible =3D "fsl, imx8mq-sdma","fsl,imx7d-sdma";
> +				compatible =3D "fsl,mx8mq-sdma","fsl,imx7d-sdma";

This is a bit strange.
If binding doc says like that, probably we'd better fix the typo in binding=
 doc
to use the same style.

Regards
Dong Aisheng

>  				reg =3D <0x30bd0000 0x10000>;
>  				interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clk IMX8MQ_CLK_SDMA1_ROOT>,
> --
> 2.17.1
