From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: h6: add r_watchog node
Date: Thu, 25 Apr 2019 09:34:36 +0200
Message-ID: <CAJiuCce_KZzYx5T3bq3i_PHGGSts_=Fh==c0CvqsuHhdqmsG-w@mail.gmail.com>
References: <20190411154534.25563-1-peron.clem@gmail.com> <20190411154534.25563-3-peron.clem@gmail.com>
 <CAJiuCcc2CrEBQEoon9p=pitrjqoy6tzOSjhjBY3=oXNCHdiZ5A@mail.gmail.com> <20190423160545.muolantrdppz35rz@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423160545.muolantrdppz35rz@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, 23 Apr 2019 at 18:05, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Fri, Apr 19, 2019 at 09:00:42PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > On Thu, 11 Apr 2019 at 17:34, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> > >
> > > Allwinner H6 has a r_watchdog similar to A64.
> > >
> > > Declare it in the device-tree.
> > >
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-h6.dtsi
> > > index 5c2f5451227b..66dc684a378e 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > @@ -622,6 +622,13 @@
> > >                         #reset-cells =3D <1>;
> > >                 };
> > >
> > > +               r_watchdog: watchdog@7020400 {
> > > +                       compatible =3D "allwinner,sun50i-a64-wdt",
> > > +                                    "allwinner,sun6i-a31-wdt";
> > > +                       reg =3D <0x07020400 0x20>;
> > > +                       interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HI=
GH>;
> > > +               };
> >
> > I have set the same compatible as A64 because regarding the User
> > Manual they have exactly the same memory mapping.
> > However we don't know really if it's the same IP version, maybe there
> > will be an errata one day.
> > So I would like to know if it's better to define the h6-wdt also
> >   compatible =3D  "allwinner,sun50i-h6-wdt", "allwinner,sun50i-a64-wdt"=
,
> >                                  "allwinner,sun6i-a31-wdt";
> >
> > I would say Yes, but with this logic we would have to had a new
> > compatible each time there is a  new SoC.
>
Hi,

> Why not just having the A31 compatible?
H6 has a lightly differences in registers with A31 but it's the same
as 64 (WDOG_KEY_FIELD)

As the A64 is already introduced if think it's a good solution to reuse it.

Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
