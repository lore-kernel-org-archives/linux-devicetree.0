From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add sai6 node
Date: Tue, 2 Jul 2019 11:45:43 +0000
Message-ID: <20190702114542.2eoc6nm2kyhode43@fsr-ub1664-175>
References: <20190702114102.1254-1-andradanciu1997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702114102.1254-1-andradanciu1997@gmail.com>
Content-Language: en-US
Content-ID: <F3B412D4A179564BBCAB6261F2913C80@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andra Danciu <andradanciu1997@gmail.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Anson Huang <anson.huang@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.>
List-Id: devicetree@vger.kernel.org

On 19-07-02 14:41:02, Andra Danciu wrote:

Missing commit message here. Please add one.

> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index d09b808eff87..1ff664523f56 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -278,6 +278,20 @@
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30000000 0x30000000 0x400000>;
> =20
> +			sai6: sai@30030000 {
> +				compatible =3D "fsl,imx8mq-sai",
> +					"fsl,imx6sx-sai";
> +				reg =3D <0x30030000 0x10000>;
> +				interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk IMX8MQ_CLK_SAI6_IPG>,
> +					<&clk IMX8MQ_CLK_SAI6_ROOT>,
> +					<&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> +				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
> +				dmas =3D <&sdma2 4 24 0>, <&sdma2 5 24 0>;
> +				dma-names =3D "rx", "tx";
> +				status =3D "disabled";
> +			};
> +
>  			gpio1: gpio@30200000 {
>  				compatible =3D "fsl,imx8mq-gpio", "fsl,imx35-gpio";
>  				reg =3D <0x30200000 0x10000>;
> --=20
> 2.11.0
> =
