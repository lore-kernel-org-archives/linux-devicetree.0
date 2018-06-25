From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
Date: Mon, 25 Jun 2018 05:53:59 +0000
Message-ID: <AM3PR04MB13150F33BC062890B4E87477F54A0@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1529930051-14122-1-git-send-email-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529930051-14122-1-git-send-email-yibin.gong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Gong <yibin.gong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Acked-by: Anson Huang <anson.huang@nxp.com>

I also saw such issue on i.MX6SLL evk board, and also sent out patch for i.=
MX6SLL.

Anson Huang
Best Regards!


> -----Original Message-----
> From: Robin Gong
> Sent: Monday, June 25, 2018 8:34 PM
> To: shawnguo@kernel.org; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> Anson Huang <anson.huang@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
>=20
> SW4 is one power rail for LPDDR2 on i.mx6sl-evk, so it should be kept alw=
ays on.
> But it's disabled after switch disabled interface implemented in pfuze dr=
iver
> 'commit 5fe156f1cab4
> ("regulator: pfuze100: add enable/disable for switch")'.Thus, it breaks k=
ernel
> bootup. Add 'regulator-always-on' for SW4.
>=20
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> ---
>  arch/arm/boot/dts/imx6sl-evk.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/imx6sl-evk.dts
> b/arch/arm/boot/dts/imx6sl-evk.dts
> index 37e792f..798df66 100644
> --- a/arch/arm/boot/dts/imx6sl-evk.dts
> +++ b/arch/arm/boot/dts/imx6sl-evk.dts
> @@ -199,6 +199,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt =3D <800000>;
>  				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
>  			};
>=20
>  			swbst_reg: swbst {
> --
> 2.7.4
