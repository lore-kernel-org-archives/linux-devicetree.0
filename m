From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: allwinner: h6: Add IR receiver node
Date: Fri, 31 May 2019 00:25:32 +0200
Message-ID: <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com> <20190528161440.27172-11-peron.clem@gmail.com>
 <20190530145550.amalnxmx7kpokykv@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530145550.amalnxmx7kpokykv@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ondrej,

On Thu, 30 May 2019 at 16:55, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> Hello Cl=C3=A9ment,
>
> On Tue, May 28, 2019 at 06:14:38PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 IR is similar to A31 and can use same driver.
> >
> > Add support for it.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 16c5c3d0fd81..649cbdfe452e 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -647,6 +647,25 @@
> >                               pins =3D "PL0", "PL1";
> >                               function =3D "s_i2c";
> >                       };
> > +
> > +                     r_ir_rx_pin: r-ir-rx-pin {
> > +                             pins =3D "PL9";
> > +                             function =3D "s_cir_rx";
> > +                     };
> > +             };
> > +
> > +             r_ir: ir@7040000 {
> > +                             compatible =3D "allwinner,sun50i-h6-ir",
> > +                                          "allwinner,sun6i-a31-ir";
> > +                             reg =3D <0x07040000 0x400>;
> > +                             interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&r_ccu CLK_R_APB1_IR>,
> > +                                      <&r_ccu CLK_IR>;
> > +                             clock-names =3D "apb", "ir";
> > +                             resets =3D <&r_ccu RST_R_APB1_IR>;
> > +                             pinctrl-names =3D "default";
> > +                             pinctrl-0 =3D <&r_ir_rx_pin>;
> > +                             status =3D "disabled";
> >               };
>
> Please make a comment here, that this is known broken on some boards and =
may
> result IRQ flood if enabled. Otherwise noone will know.

I'm planning to send a v4 next week with the IRQ_NONE return as Maxime
suggested it.
https://github.com/clementperon/linux/tree/h6_ir_v4

But maybe we could also use the bit 5 of the IRQ status.

Regards, Clement

>
> thanks,
>         o.
>
> >               r_i2c: i2c@7081400 {
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
