From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] arm64: dts: imx8qxp: fix mbox-cells
Date: Fri, 15 Mar 2019 10:23:33 +0000
Message-ID: <AM0PR04MB4211910FCC3CEDF11EE4B10380440@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190313093626.18589-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313093626.18589-1-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

> From: Peng Fan
>
> Subject: [PATCH] arm64: dts: imx8qxp: fix mbox-cells
>=20
> Currently lsio_mu1 is used by Linux Kernel with mbox-cells as 2, but actu=
ally
> mu0-4 could be used to communicate with SCU. So fix the mbox-cells.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 4c3dd95ed488..16766838ac77 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -328,7 +328,7 @@
>  			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
>  			reg =3D <0x5d1b0000 0x10000>;
>  			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> -			#mbox-cells =3D <0>;
> +			#mbox-cells =3D <2>;
>  			status =3D "disabled";
>  		};
>=20
> @@ -343,7 +343,7 @@
>  			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
>  			reg =3D <0x5d1e0000 0x10000>;
>  			interrupts =3D <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
> -			#mbox-cells =3D <0>;
> +			#mbox-cells =3D <2>;
>  			status =3D "disabled";
>  		};
>=20
> @@ -351,7 +351,7 @@
>  			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
>  			reg =3D <0x5d1f0000 0x10000>;
>  			interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> -			#mbox-cells =3D <0>;
> +			#mbox-cells =3D <2>;
>  			status =3D "disabled";
>  		};
>=20
> --
> 2.16.4
