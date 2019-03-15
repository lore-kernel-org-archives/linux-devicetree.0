From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] arm64: dts: imx8qxp: add lsio_mu2 node
Date: Fri, 15 Mar 2019 10:24:11 +0000
Message-ID: <AM0PR04MB4211FEB4C272759B84BCB6A180440@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190313093650.18693-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313093650.18693-1-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

> From: Peng Fan
>=20
> Add lsio_mu2 node which could be used communicate with SCU.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 16766838ac77..64eecd6cb1e9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -339,6 +339,14 @@
>  			#mbox-cells =3D <2>;
>  		};
>=20
> +		lsio_mu2: mailbox@5d1d0000 {
> +			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
> +			reg =3D <0x5d1d0000 0x10000>;
> +			interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
>  		lsio_mu3: mailbox@5d1e0000 {
>  			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
>  			reg =3D <0x5d1e0000 0x10000>;
> --
> 2.16.4
