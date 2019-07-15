From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mq: Add MIPI D-PHY
Date: Mon, 15 Jul 2019 11:10:27 +0000
Message-ID: <20190715111027.a4wlpzex3taxymyr@fsr-ub1664-175>
References: <cover.1563187253.git.agx@sigxcpu.org>
 <30c7622bf590670190b93c9b5b6dd1e8f809bbb2.1563187253.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30c7622bf590670190b93c9b5b6dd1e8f809bbb2.1563187253.git.agx@sigxcpu.org>
Content-Language: en-US
Content-ID: <4AB6BC72093B9A4CBF3A5D208EC97346@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Lucas Stach <l.stach@pengutronix.de>, Anson Huang <anson.huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 19-07-15 12:43:05, Guido G=FCnther wrote:
> Add a node for the Mixel MIPI D-PHY, "disabled" by default.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> Acked-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index d09b808eff87..891ee7578c2d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -728,6 +728,19 @@
>  				status =3D "disabled";
>  			};
> =20
> +			dphy: dphy@30a00300 {
> +				compatible =3D "fsl,imx8mq-mipi-dphy";
> +				reg =3D <0x30a00300 0x100>;
> +				clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> +				clock-names =3D "phy_ref";
> +				assigned-clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> +				assigned-clock-parents =3D <&clk IMX8MQ_VIDEO_PLL1_OUT>;
> +				assigned-clock-rates =3D <24000000>;

We have the following in the clk-imx8mq in the vendor tree:

	clk_set_parent(clks[IMX8MQ_VIDEO_PLL1_BYPASS], clks[IMX8MQ_VIDEO_PLL1]);

This unbypasses the video pll 1. And then we also have this:

	/* config video_pll1 clock */
	clk_set_parent(clks[IMX8MQ_VIDEO_PLL1_REF_SEL], clks[IMX8MQ_CLK_27M]);
	clk_set_rate(clks[IMX8MQ_VIDEO_PLL1], 593999999);

But none of that is acceptable upstream since the clock provider should not
use clock consumer API.

So please update the assigned-clock* properties to something like this:
				assigned-clocks =3D <&clk IMX8MQ_VIDEO_PLL1_REF_SEL>,
						  <&clk IMX8MQ_VIDEO_PLL1_BYPASS>,
						  <&clk IMX8MQ_CLK_DSI_PHY_REF>,
						  <&clk IMX8MQ_VIDEO_PLL1>;
				assigned-clock-parents =3D <&clk IMX8MQ_CLK_27M>,
							 <&clk IMX8MQ_VIDEO_PLL1>,
							 <&clk IMX8MQ_VIDEO_PLL1_OUT>
							 <0>;
				assigned-clock-rates =3D <0>,
						       <0>,
						       <24000000>,            =20
						       <593999999>;

I've written this without testing, so please do test it on your setup.

> +				#phy-cells =3D <0>;
> +				power-domains =3D <&pgc_mipi>;
> +				status =3D "disabled";
> +			};
> +
>  			i2c1: i2c@30a20000 {
>  				compatible =3D "fsl,imx8mq-i2c", "fsl,imx21-i2c";
>  				reg =3D <0x30a20000 0x10000>;
> --=20
> 2.20.1
> =
