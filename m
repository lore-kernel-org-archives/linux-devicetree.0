From: Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ull-colibri: enable UHS-I for USDHC1
Date: Wed, 12 Jun 2019 17:29:26 +0300
Message-ID: <CAByghJaLgY9tStud7_JRoOF4s9fPtzn=mQu=6zvSSO4W4UF6Dw@mail.gmail.com>
References: <20190606090612.16685-1-igor.opaniuk@gmail.com>
 <3b84f3cc6cd5399f25ebd8e1c8559c58@agner.ch> <CAByghJZJzFN9c9V-o=SV0z07++RPqsB0R8MTsovbtLr3vqJgyw@mail.gmail.com>
 <20190612132705.GJ11086@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612132705.GJ11086@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, Marcel Ziswiler <marcel@ziswiler.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 4:39 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Wed, Jun 12, 2019 at 03:49:03PM +0300, Igor Opaniuk wrote:
> > Hi Stefan,
> >
> > On Wed, Jun 12, 2019 at 3:17 PM Stefan Agner <stefan@agner.ch> wrote:
> > >
> > > On 06.06.2019 11:06, Igor Opaniuk wrote:
> > > > From: Igor Opaniuk <igor.opaniuk@toradex.com>
> > > >
> > > > Allows to use the SD interface at a higher speed mode if the card
> > > > supports it. For this the signaling voltage is switched from 3.3V t=
o
> > > > 1.8V under the usdhc1's drivers control.
> > > >
> > > > Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>
> > > > ---
> > > >  arch/arm/boot/dts/imx6ul.dtsi                  |  4 ++++
> > > >  arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi | 11 +++++++++--
> > > >  arch/arm/boot/dts/imx6ull-colibri.dtsi         |  6 ++++++
> > > >  3 files changed, 19 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6=
ul.dtsi
> > > > index fc388b84bf22..91a0ced44e27 100644
> > > > --- a/arch/arm/boot/dts/imx6ul.dtsi
> > > > +++ b/arch/arm/boot/dts/imx6ul.dtsi
> > > > @@ -857,6 +857,8 @@
> > > >                                        <&clks IMX6UL_CLK_USDHC1>,
> > > >                                        <&clks IMX6UL_CLK_USDHC1>;
> > > >                               clock-names =3D "ipg", "ahb", "per";
> > > > +                             fsl,tuning-step=3D <2>;
> > > > +                             fsl,tuning-start-tap =3D <20>;
> > > >                               bus-width =3D <4>;
> > > >                               status =3D "disabled";
> > > >                       };
> > > > @@ -870,6 +872,8 @@
> > > >                                        <&clks IMX6UL_CLK_USDHC2>;
> > > >                               clock-names =3D "ipg", "ahb", "per";
> > > >                               bus-width =3D <4>;
> > > > +                             fsl,tuning-step=3D <2>;
> > > > +                             fsl,tuning-start-tap =3D <20>;
> > > >                               status =3D "disabled";
> > > >                       };
> > > >
> > > > diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> > > > b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> > > > index 006690ea98c0..7dc7770cf52c 100644
> > > > --- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> > > > +++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> > > > @@ -145,13 +145,20 @@
> > > >  };
> > > >
> > > >  &usdhc1 {
> > > > -     pinctrl-names =3D "default";
> > > > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz", =
"sleep";
> > > >       pinctrl-0 =3D <&pinctrl_usdhc1 &pinctrl_snvs_usdhc1_cd>;
> > > > -     no-1-8-v;
> > > > +     pinctrl-1 =3D <&pinctrl_usdhc1_100mhz &pinctrl_snvs_usdhc1_cd=
>;
> > > > +     pinctrl-2 =3D <&pinctrl_usdhc1_100mhz &pinctrl_snvs_usdhc1_cd=
>;
> > >
> > > Should that not be pinctrl_usdhc1_200mhz?
> > >
> >
> > Correct, thanks for pointing this out.
> > Taking into account that the patch was already accepted by Shawn, will
> > send another to fix this typo ASAP (added to my todo list).
>
> I just fixed it up on my branch.
>
> Shawn

Thanks a lot!

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk

mailto: igor.opaniuk@gmail.com
skype: igor.opanyuk
+380 (93) 836 40 67
http://ua.linkedin.com/in/iopaniuk
