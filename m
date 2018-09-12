From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 08/27] clk: sunxi-ng: Add support for H6 DE3 clocks
Date: Wed, 12 Sep 2018 16:55:07 +0200
Message-ID: <1702684.jtWEXlagAO@jernej-laptop>
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <1677668.BePkXd9qNa@jernej-laptop> <CAGb2v66kojjjM4f_tO9NwzkCzD3LMM2eiq+PJ6Bk=1Rra=UnYg@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBVGR4TOAKGQEKHVNU2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66kojjjM4f_tO9NwzkCzD3LMM2eiq+PJ6Bk=1Rra=UnYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne sreda, 12. september 2018 ob 14:20:08 CEST je Chen-Yu Tsai napisal(a):
> On Wed, Sep 5, 2018 at 1:46 AM Jernej =C5=A0krabec <jernej.skrabec@siol.n=
et>=20
wrote:
> > Dne torek, 04. september 2018 ob 11:04:21 CEST je Chen-Yu Tsai napisal(=
a):
> > > On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t>
> >=20
> > wrote:
> > > > Support for mixer0, mixer1, writeback and rotation units is added.
> > > >=20
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > > ---
> > > >=20
> > > >  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 65
> > > >  ++++++++++++++++++++++++++++
> > > >  drivers/clk/sunxi-ng/ccu-sun8i-de2.h |  1 +
> > > >  2 files changed, 66 insertions(+)
> > > >=20
> > > > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> > > > b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c index
> > > > bae5ee67a797..4535c1c27d27
> > > > 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> > > > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> > > > @@ -31,6 +31,8 @@ static SUNXI_CCU_GATE(bus_mixer1_clk, "bus-mixer1=
",
> > > > "bus-de",>
> > > >=20
> > > >                       0x04, BIT(1), 0);
> > > > =20
> > > >  static SUNXI_CCU_GATE(bus_wb_clk,      "bus-wb",       "bus-de",
> > > > =20
> > > >                       0x04, BIT(2), 0);
> > > >=20
> > > > +static SUNXI_CCU_GATE(bus_rot_clk,     "bus-rot",      "bus-de",
> > > > +                     0x04, BIT(3), 0);
> > > >=20
> > > >  static SUNXI_CCU_GATE(mixer0_clk,      "mixer0",       "mixer0-div=
",
> > > > =20
> > > >                       0x00, BIT(0), CLK_SET_RATE_PARENT);
> > > >=20
> > > > @@ -38,6 +40,8 @@ static SUNXI_CCU_GATE(mixer1_clk,     "mixer1",
> > > > "mixer1-div",>
> > > >=20
> > > >                       0x00, BIT(1), CLK_SET_RATE_PARENT);
> > > > =20
> > > >  static SUNXI_CCU_GATE(wb_clk,          "wb",           "wb-div",
> > > > =20
> > > >                       0x00, BIT(2), CLK_SET_RATE_PARENT);
> > > >=20
> > > > +static SUNXI_CCU_GATE(rot_clk,         "rot",          "rot-div",
> > > > +                     0x00, BIT(3), CLK_SET_RATE_PARENT);
> > > >=20
> > > >  static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
> > > > =20
> > > >                    CLK_SET_RATE_PARENT);
> > > >=20
> > > > @@ -45,6 +49,8 @@ static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div",
> > > > "de",
> > > > 0x0c, 4, 4,>
> > > >=20
> > > >                    CLK_SET_RATE_PARENT);
> > > > =20
> > > >  static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,
> > > > =20
> > > >                    CLK_SET_RATE_PARENT);
> > > >=20
> > > > +static SUNXI_CCU_M(rot_div_clk, "rot-div", "de", 0x0c, 0x0c, 4,
> > > > +                  CLK_SET_RATE_PARENT);
> > > >=20
> > > >  static SUNXI_CCU_M(mixer0_div_a83_clk, "mixer0-div", "pll-de", 0x0=
c,
> > > >  0,
> > > >  4,
> > > > =20
> > > >                    CLK_SET_RATE_PARENT);
> > > >=20
> > > > @@ -53,6 +59,24 @@ static SUNXI_CCU_M(mixer1_div_a83_clk,
> > > > "mixer1-div",
> > > > "pll-de", 0x0c, 4, 4,>
> > > >=20
> > > >  static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
> > > > =20
> > > >                    CLK_SET_RATE_PARENT);
> > > >=20
> > > > +static struct ccu_common *sun50i_h6_de3_clks[] =3D {
> > > > +       &mixer0_clk.common,
> > > > +       &mixer1_clk.common,
> > > > +       &wb_clk.common,
> > > > +
> > > > +       &bus_mixer0_clk.common,
> > > > +       &bus_mixer1_clk.common,
> > > > +       &bus_wb_clk.common,
> > > > +
> > > > +       &mixer0_div_clk.common,
> > > > +       &mixer1_div_clk.common,
> > > > +       &wb_div_clk.common,
> > > > +
> > > > +       &bus_rot_clk.common,
> > > > +       &rot_clk.common,
> > > > +       &rot_div_clk.common,
> > > > +};
> > > > +
> > > >=20
> > > >  static struct ccu_common *sun8i_a83t_de2_clks[] =3D {
> > > > =20
> > > >         &mixer0_clk.common,
> > > >         &mixer1_clk.common,
> > > >=20
> > > > @@ -92,6 +116,26 @@ static struct ccu_common *sun8i_v3s_de2_clks[] =
=3D {
> > > >=20
> > > >         &wb_div_clk.common,
> > > > =20
> > > >  };
> > > >=20
> > > > +static struct clk_hw_onecell_data sun50i_h6_de3_hw_clks =3D {
> > > > +       .hws    =3D {
> > > > +               [CLK_MIXER0]            =3D &mixer0_clk.common.hw,
> > > > +               [CLK_MIXER1]            =3D &mixer1_clk.common.hw,
> > > > +               [CLK_WB]                =3D &wb_clk.common.hw,
> > > > +               [CLK_ROT]               =3D &rot_clk.common.hw,
> > > > +
> > > > +               [CLK_BUS_MIXER0]        =3D &bus_mixer0_clk.common.=
hw,
> > > > +               [CLK_BUS_MIXER1]        =3D &bus_mixer1_clk.common.=
hw,
> > > > +               [CLK_BUS_WB]            =3D &bus_wb_clk.common.hw,
> > > > +               [CLK_BUS_ROT]           =3D &bus_rot_clk.common.hw,
> > > > +
> > > > +               [CLK_MIXER0_DIV]        =3D &mixer0_div_clk.common.=
hw,
> > > > +               [CLK_MIXER1_DIV]        =3D &mixer1_div_clk.common.=
hw,
> > > > +               [CLK_WB_DIV]            =3D &wb_div_clk.common.hw,
> > > > +               [CLK_ROT_DIV]           =3D &rot_div_clk.common.hw,
> > > > +       },
> > > > +       .num    =3D 12,
> > >=20
> > > It's best not to openly code these. It is error prone, like having
> > > an index beyond .num, which then never gets registered.
> > >=20
> > > Instead, please update CLK_NUMBERS and use that instead.
> > > sunxi_ccu_probe()
> > > can handle holes in .hws.
> >=20
> > I'm not sure this will work. All newly introduced indices are at the en=
d,
> > so other arrays will still have same length (hole at the end). You will
> > just claim that arrays are larger than they really are, which means bad
> > things.
> >=20
> > But I take any other suggestion. I really can't think of better solutio=
n.
>=20
> Then maybe have macros for both cases instead?
> CLK_NUMBER_WITH_ROT / CLK_NUMBER_WITHOUT_ROT?

That sounds reasonable. Do you want separate patch which renames original=
=20
macro CLK_NUMBER to CLK_NUMBER_WITHOUT_ROT?

Best regards,
Jernej

>=20
> ChenYu
>=20
> > Best regards,
> > Jernej
> >=20
> > > On the other hand, it can't handle holes in the ccu_reset_map. Hope w=
e
> > > never have to deal with such an instance.
> > >=20
> > > ChenYu
> > >=20
> > > > +};
> > > > +
> > > >=20
> > > >  static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks =3D {
> > > > =20
> > > >         .hws    =3D {
> > > >        =20
> > > >                 [CLK_MIXER0]            =3D &mixer0_clk.common.hw,
> > > >=20
> > > > @@ -156,6 +200,13 @@ static struct ccu_reset_map
> > > > sun50i_a64_de2_resets[] =3D
> > > > {>
> > > >=20
> > > >         [RST_WB]        =3D { 0x08, BIT(2) },
> > > > =20
> > > >  };
> > > >=20
> > > > +static struct ccu_reset_map sun50i_h6_de3_resets[] =3D {
> > > > +       [RST_MIXER0]    =3D { 0x08, BIT(0) },
> > > > +       [RST_MIXER1]    =3D { 0x08, BIT(1) },
> > > > +       [RST_WB]        =3D { 0x08, BIT(2) },
> > > > +       [RST_ROT]       =3D { 0x08, BIT(3) },
> > > > +};
> > > > +
> > > >=20
> > > >  static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc =3D {
> > > > =20
> > > >         .ccu_clks       =3D sun8i_a83t_de2_clks,
> > > >         .num_ccu_clks   =3D ARRAY_SIZE(sun8i_a83t_de2_clks),
> > > >=20
> > > > @@ -186,6 +237,16 @@ static const struct sunxi_ccu_desc
> > > > sun50i_a64_de2_clk_desc =3D {>
> > > >=20
> > > >         .num_resets     =3D ARRAY_SIZE(sun50i_a64_de2_resets),
> > > > =20
> > > >  };
> > > >=20
> > > > +static const struct sunxi_ccu_desc sun50i_h6_de3_clk_desc =3D {
> > > > +       .ccu_clks       =3D sun50i_h6_de3_clks,
> > > > +       .num_ccu_clks   =3D ARRAY_SIZE(sun50i_h6_de3_clks),
> > > > +
> > > > +       .hw_clks        =3D &sun50i_h6_de3_hw_clks,
> > > > +
> > > > +       .resets         =3D sun50i_h6_de3_resets,
> > > > +       .num_resets     =3D ARRAY_SIZE(sun50i_h6_de3_resets),
> > > > +};
> > > > +
> > > >=20
> > > >  static const struct sunxi_ccu_desc sun8i_v3s_de2_clk_desc =3D {
> > > > =20
> > > >         .ccu_clks       =3D sun8i_v3s_de2_clks,
> > > >         .num_ccu_clks   =3D ARRAY_SIZE(sun8i_v3s_de2_clks),
> > > >=20
> > > > @@ -296,6 +357,10 @@ static const struct of_device_id
> > > > sunxi_de2_clk_ids[]
> > > > =3D {>
> > > >=20
> > > >                 .compatible =3D "allwinner,sun50i-h5-de2-clk",
> > > >                 .data =3D &sun50i_a64_de2_clk_desc,
> > > >        =20
> > > >         },
> > > >=20
> > > > +       {
> > > > +               .compatible =3D "allwinner,sun50i-h6-de3-clk",
> > > > +               .data =3D &sun50i_h6_de3_clk_desc,
> > > > +       },
> > > >=20
> > > >         { }
> > > > =20
> > > >  };
> > > >=20
> > > > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.h
> > > > b/drivers/clk/sunxi-ng/ccu-sun8i-de2.h index
> > > > 530c006e0ae9..27bd88539f42
> > > > 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.h
> > > > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.h
> > > > @@ -22,6 +22,7 @@
> > > >=20
> > > >  #define CLK_MIXER0_DIV 3
> > > >  #define CLK_MIXER1_DIV 4
> > > >  #define CLK_WB_DIV     5
> > > >=20
> > > > +#define CLK_ROT_DIV    11
> > > >=20
> > > >  #define CLK_NUMBER     (CLK_WB + 1)
> > > >=20
> > > > --
> > > > 2.18.0




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
