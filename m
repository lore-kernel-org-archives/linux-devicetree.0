From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 5/5] arm64: dts: imx8mq: Add the opp table and the
 cpu-supply nodes
Date: Thu, 14 Feb 2019 17:52:58 +0000
Message-ID: <20190214175257.id7yrrxxwev42p2p@fsr-ub1664-175>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
 <1550084693-9797-6-git-send-email-abel.vesa@nxp.com>
 <1550159428.2546.40.camel@pengutronix.de>
 <20190214171806.kufhw7ouguxt5jhq@fsr-ub1664-175>
 <1550165185.2546.48.camel@pengutronix.de>
 <1550165560.2546.50.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550165560.2546.50.camel@pengutronix.de>
Content-Language: en-US
Content-ID: <0286DB934C7C1F44A433C8B3FBC7A900@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 19-02-14 18:32:40, Lucas Stach wrote:
> Am Donnerstag, den 14.02.2019, 18:26 +0100 schrieb Lucas Stach:
> > Am Donnerstag, den 14.02.2019, 17:18 +0000 schrieb Abel Vesa:
> > > On 19-02-14 16:50:28, Lucas Stach wrote:
> > > > Hi Abel
> > > >=20
> > > > Am Mittwoch, den 13.02.2019, 19:05 +0000 schrieb Abel Vesa:
> > > > > Add the opp table containing only non over drive opps.
> > > > > Also add the cpu-supply nodes for the A53 cores in the EVK
> > > > > board.
> > > > >=20
> > > > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > > > ---
> > > > > =A0arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 17
> > > > > +++++++++++++++++
> > > > > =A0arch/arm64/boot/dts/freescale/imx8mq.dtsi=A0=A0=A0=A0| 23
> > > > > +++++++++++++++++++++++
> > > > > =A02 files changed, 40 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > > b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > > index 54737bf..114359e 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > > @@ -31,6 +31,23 @@
> > > > > =A0		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
> > > > > =A0		enable-active-high;
> > > > > =A0	};
> > > > > +
> > > > > +};
> > > > > +
> > > > > +&A53_0 {
> > > > > +	cpu-supply =3D <&sw1a_reg>;
> > > > > +};
> > > > > +
> > > > > +&A53_1 {
> > > > > +	cpu-supply =3D <&sw1a_reg>;
> > > > > +};
> > > > > +
> > > > > +&A53_2 {
> > > > > +	cpu-supply =3D <&sw1a_reg>;
> > > > > +};
> > > > > +
> > > > > +&A53_3 {
> > > > > +	cpu-supply =3D <&sw1a_reg>;
> > > > > =A0};
> > > >=20
> > > > This should be a separate patch.
> > > >=20
> > >=20
> > > OK, will send as separate patches in the next version.
> > >=20
> > > > And AFAICS this is wrong, sw1a on the MX8M-EVK is the GPU supply,
> > > > the
> > > > CPU is supplied by a dedicated switcher that is controlled via a
> > > > GPIO.
> > > >=20
> > >=20
> > > Hmm, I think you're right. At least this is what the following
> > > document says.
> > >=20
> > > https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.mouser.com%2Fds%2F2%2F302%2FIMX8MDQLQEVKHUG-1280333.pdf&amp;data=3D02%7=
C01%7Cabel.vesa%40nxp.com%7Cf7666164aff84f6f975d08d692a26c2a%7C686ea1d3bc2b=
4c6fa92cd99c5c301635%7C0%7C1%7C636857623628438873&amp;sdata=3DEJJdfD8ewEXVQ=
STf2FqjEeUqGJd%2BwW94OQag428lszY%3D&amp;reserved=3D0
> > >=20
> > > So I guess this means there will not be any cpu-supply properties.=A0
> >=20
> > There is a variable voltage CPU supply, but you need to model it as a
> > gpio-regulator in the DT, it's not part of the PMIC provided rails.
>=20
> In the schematics it's the line called PWM_LED (actually it's just
> GPIO1_IO13) that controls the voltage. This changes the feedback of the
> DCDC switcher, so it can toggle between 0.9V and 1.0V.
>=20

Thanks, will look into it tomorrow when I get back at the office.

> Regards,
> Lucas=
