From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mm: Init rates and parents configs for
 clocks
Date: Tue, 2 Jul 2019 13:26:48 +0000
Message-ID: <20190702132647.3kyfl5gx6ghdiizl@fsr-ub1664-175>
References: <1561469191-26840-1-git-send-email-abel.vesa@nxp.com>
 <CAEnQRZCVQ0+pRh6akiZJXU-fRugEXmnthZp8Q2=aXFXCO3vcUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZCVQ0+pRh6akiZJXU-fRugEXmnthZp8Q2=aXFXCO3vcUg@mail.gmail.com>
Content-Language: en-US
Content-ID: <68D9BFBA281D044CB62C7880411AF8C1@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

On 19-06-26 15:45:15, Daniel Baluta wrote:
> On Tue, Jun 25, 2019 at 4:42 PM Abel Vesa <abel.vesa@nxp.com> wrote:
> >
> > Add the initial configuration for clocks that need default parent and r=
ate
> > setting. This is based on the vendor tree clock provider parents and ra=
tes
> > configuration except this is doing the setup in dts rather than using c=
lock
> > consumer API in a clock provider driver.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 36 +++++++++++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mm.dtsi
> > index 232a741..ab92108 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -451,6 +451,42 @@
> >                                          <&clk_ext3>, <&clk_ext4>;
> >                                 clock-names =3D "osc_32k", "osc_24m", "=
clk_ext1", "clk_ext2",
> >                                               "clk_ext3", "clk_ext4";
> > +                               assigned-clocks =3D <&clk IMX8MM_CLK_AU=
DIO_AHB>,
> > +                                               <&clk IMX8MM_CLK_IPG_AU=
DIO_ROOT>,
> > +                                               <&clk IMX8MM_SYS_PLL3>,
> > +                                               <&clk IMX8MM_VIDEO_PLL1=
>,
> > +                                               <&clk IMX8MM_CLK_NOC>,
> > +                                               <&clk IMX8MM_CLK_PCIE1_=
CTRL>,
> > +                                               <&clk IMX8MM_CLK_PCIE1_=
PHY>,
> > +                                               <&clk IMX8MM_CLK_CSI1_C=
ORE>,
> > +                                               <&clk IMX8MM_CLK_CSI1_P=
HY_REF>,
> > +                                               <&clk IMX8MM_CLK_CSI1_E=
SC>,
> > +                                               <&clk IMX8MM_CLK_DISP_A=
XI>,
> > +                                               <&clk IMX8MM_CLK_DISP_A=
PB>;
> > +                               assigned-clock-parents =3D <&clk IMX8MM=
_SYS_PLL1_800M>,
> > +                                               <0>,
> Isn't there a macro for 0? (dummy clock?)

I don't know about any such macro. If you're referring to IMX8MM_CLK_DUMMY,
that can't be used here since all I want here is to skip setting a parent t=
o
the  IMX8MM_CLK_IPG_AUDIO_ROOT. If I use IMX8MM_CLK_DUMMY (along with &clk)
it will set the parent to IMX8MM_CLK_DUMMY and that's not what's needed her=
e.

This is in accordance to the documentation:

Documentation/devicetree/bindings/clock/clock-bindings.txt:

"To skip setting parent or rate of a clock its corresponding entry should b=
e
set to 0, or can be omitted if it is not followed by any non-zero entry."

>=20
>=20
> > +                                               <0>,
> > +                                               <0>,
> > +                                               <&clk IMX8MM_SYS_PLL3_O=
UT>,
> > +                                               <&clk IMX8MM_SYS_PLL2_2=
50M>,
> > +                                               <&clk IMX8MM_SYS_PLL2_1=
00M>,
> > +                                               <&clk IMX8MM_SYS_PLL2_1=
000M>,
> > +                                               <&clk IMX8MM_SYS_PLL2_1=
000M>,
> > +                                               <&clk IMX8MM_SYS_PLL1_8=
00M>,
> > +                                               <&clk IMX8MM_SYS_PLL2_1=
000M>,
> > +                                               <&clk IMX8MM_SYS_PLL1_8=
00M>;
> > +                               assigned-clock-rates =3D <400000000>,
> > +                                                       <400000000>,
> > +                                                       <750000000>,
> > +                                                       <594000000>,
> > +                                                       <0>,
> > +                                                       <0>,
> > +                                                       <0>,
> > +                                                       <0>,
> > +                                                       <0>,
> > +                                                       <0>,
> > +                                                       <500000000>,
> > +                                                       <200000000>;
> >                         };
> >
> >                         src: reset-controller@30390000 {
> > --
> > 2.7.4
> >=
