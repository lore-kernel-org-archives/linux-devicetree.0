From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mq: Add the buck vdd_arm regulator
Date: Thu, 28 Feb 2019 14:29:16 +0000
Message-ID: <20190228142915.l76oaxyjrsosoh7x@fsr-ub1664-175>
References: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
 <1550254032-16451-3-git-send-email-abel.vesa@nxp.com>
 <20190228141543.GA29231@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228141543.GA29231@dragon>
Content-Language: en-US
Content-ID: <4E1545967CACDF48A213374551BB4ED4@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 19-02-28 22:15:46, Shawn Guo wrote:
> On Fri, Feb 15, 2019 at 06:07:23PM +0000, Abel Vesa wrote:
> > According to the schematics, this is a MP2147 switch converter
> > which is controlled by GPIO1_IO13. When set the gpio is set to
> > high the regulator output is set to 0.9V. When the gpio is set
> > to low the regulator output is set to 1V.
> >=20
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 36 ++++++++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/=
boot/dts/freescale/imx8mq-evk.dts
> > index 54737bf..e5da3dd 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > @@ -31,6 +31,35 @@
> >  		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
> >  		enable-active-high;
> >  	};
> > +
> > +	buck2_reg: buck2 {
>=20
> Please follow regulator-xxx naming convention.
>=20

Will do.

> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_buck2>;
> > +		compatible =3D "regulator-gpio";
> > +		regulator-name =3D "vdd_arm";
> > +		regulator-min-microvolt =3D <900000>;
> > +		regulator-max-microvolt =3D <1000000>;
> > +		gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > +		states =3D <1000000 0x0
> > +			  900000 0x1>;
> > +		enable-active-high;
>=20
> The property only makes sense when enable-gpio is present?
>=20

Will remove it.

> Shawn
>=20
> > +	};
> > +};
> > +
> > +&A53_0 {
> > +	cpu-supply =3D <&buck2_reg>;
> > +};
> > +
> > +&A53_1 {
> > +	cpu-supply =3D <&buck2_reg>;
> > +};
> > +
> > +&A53_2 {
> > +	cpu-supply =3D <&buck2_reg>;
> > +};
> > +
> > +&A53_3 {
> > +	cpu-supply =3D <&buck2_reg>;
> >  };
> > =20
> >  &fec1 {
> > @@ -203,6 +232,13 @@
> >  };
> > =20
> >  &iomuxc {
> > +	pinctrl_buck2: vddarmgrp {
> > +		fsl,pins =3D <
> > +			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
> > +		>;
> > +
> > +	};
> > +
> >  	pinctrl_fec1: fec1grp {
> >  		fsl,pins =3D <
> >  			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
> > --=20
> > 2.7.4
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
ts.infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=3D02%7C01=
%7Cabel.vesa%40nxp.com%7C7f571130a0114fb84fe408d69d87606f%7C686ea1d3bc2b4c6=
fa92cd99c5c301635%7C0%7C0%7C636869602101094479&amp;sdata=3DvsNlfbgqglUuVsFy=
ULjTMm5Hqwd6chpsVa0V05ugDG0%3D&amp;reserved=3D0=
