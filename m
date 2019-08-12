From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 1/3] arm64: dts: allwinner: Add SPDIF
 node for Allwinner H6
Date: Mon, 12 Aug 2019 09:11:50 +0200
Message-ID: <CAJiuCccoxzjmuZLrD88NgKZmwWhWkNq5xD=bTF5fgkq6M0Qb4g@mail.gmail.com>
References: <20190811203144.5999-1-peron.clem@gmail.com> <20190811203144.5999-2-peron.clem@gmail.com>
 <CAGb2v67T3h_KTVZ20NVWNd78xqCa2ZhYiCJr4oOwYjUM3OaZXA@mail.gmail.com> <CAGb2v67N5Ykzo6myKqrNMgu6PCH2pJTzw9JJ5t0MGP_p=0ae9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v67N5Ykzo6myKqrNMgu6PCH2pJTzw9JJ5t0MGP_p=0ae9g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

On Mon, 12 Aug 2019 at 08:35, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> On Mon, Aug 12, 2019 at 12:52 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 12, 2019 at 4:31 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com> wrote:
> > >
> > > The Allwinner H6 has a SPDIF controller called OWA (One Wire Audio).
> > >
> > > Only one pinmuxing is available so set it as default.
> > >
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 38 ++++++++++++++++++=
++
> > >  1 file changed, 38 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-h6.dtsi
> > > index 7628a7c83096..677eb374678d 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > @@ -83,6 +83,24 @@
> > >                 method =3D "smc";
> > >         };
> > >
> > > +       sound-spdif {
> > > +               compatible =3D "simple-audio-card";
> > > +               simple-audio-card,name =3D "sun50i-h6-spdif";
> > > +
> > > +               simple-audio-card,cpu {
> > > +                       sound-dai =3D <&spdif>;
> > > +               };
> > > +
> > > +               simple-audio-card,codec {
> > > +                       sound-dai =3D <&spdif_out>;
> > > +               };
> > > +       };
> > > +
> > > +       spdif_out: spdif-out {
> > > +               #sound-dai-cells =3D <0>;
> > > +               compatible =3D "linux,spdif-dit";
> > > +       };
> > > +
> >
> > We've always had this part in the board dts. It isn't relevant to board=
s
> > that don't have SPDIF output.
> >
> > Also, not so relevant here, but there are different simple sound card
> > constructs. Some support multiple audio streams with dynamic PCM routin=
g.
> > How these are configured really depends on what interfaces are usable.
> >
> > So keeping this at the board level is IMO a better choice.

I Agree, I try to keep coherency with sun50i-a64.dtsi.
But sound routing is really at board level not SoC one.

Regards,
Cl=C3=A9ment

>
> Forgot to mention. Both patches and all parts in this patch are OK. It's
> just the parts the need to be moved.
>
>
> > ChenYu
> >
> >
> > >         timer {
> > >                 compatible =3D "arm,armv8-timer";
> > >                 interrupts =3D <GIC_PPI 13
> > > @@ -282,6 +300,11 @@
> > >                                 bias-pull-up;
> > >                         };
> > >
> > > +                       spdif_tx_pin: spdif-tx-pin {
> > > +                               pins =3D "PH7";
> > > +                               function =3D "spdif";
> > > +                       };
> > > +
> > >                         uart0_ph_pins: uart0-ph-pins {
> > >                                 pins =3D "PH0", "PH1";
> > >                                 function =3D "uart0";
> > > @@ -411,6 +434,21 @@
> > >                         };
> > >                 };
> > >
> > > +               spdif: spdif@5093000 {
> > > +                       #sound-dai-cells =3D <0>;
> > > +                       compatible =3D "allwinner,sun50i-h6-spdif";
> > > +                       reg =3D <0x05093000 0x400>;
> > > +                       interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIG=
H>;
> > > +                       clocks =3D <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SP=
DIF>;
> > > +                       clock-names =3D "apb", "spdif";
> > > +                       resets =3D <&ccu RST_BUS_SPDIF>;
> > > +                       dmas =3D <&dma 2>;
> > > +                       dma-names =3D "tx";
> > > +                       pinctrl-names =3D "default";
> > > +                       pinctrl-0 =3D <&spdif_tx_pin>;
> > > +                       status =3D "disabled";
> > > +               };
> > > +
> > >                 usb2otg: usb@5100000 {
> > >                         compatible =3D "allwinner,sun50i-h6-musb",
> > >                                      "allwinner,sun8i-a33-musb";
> > > --
> > > 2.20.1
> > >
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > To view this discussion on the web, visit https://groups.google.com/d=
/msgid/linux-sunxi/20190811203144.5999-2-peron.clem%40gmail.com.
