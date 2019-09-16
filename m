From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [EXT] Re: [v2 2/3] clk: ls1028a: Add clock driver for Display output interface
Date: Mon, 16 Sep 2019 11:32:52 -0700
Message-ID: <20190916183252.E360720830@mail.kernel.org>
References: <20190815101613.22872-1-wen.he_1@nxp.com> <20190815101613.22872-2-wen.he_1@nxp.com> <20190816174624.115FC205F4@mail.kernel.org> <DB7PR04MB51952DF4E1EE7FF10A947347E2A80@DB7PR04MB5195.eurprd04.prod.outlook.com> <20190819182944.4AEAB22CF5@mail.kernel.org> <DB7PR04MB519563FED2146F6D1327668AE2AB0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB519563FED2146F6D1327668AE2AB0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Wen He <wen.he_1@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Wen He (2019-08-19 19:24:25)
>=20
> >=20
> > > > > +
> > > > > +static int plldig_clk_probe(struct platform_device *pdev) {
> > > > > +       struct clk_plldig *data;
> > > > > +       struct resource *mem;
> > > > > +       const char *parent_name;
> > > > > +       struct clk_init_data init =3D {};
> > > > > +       struct device *dev =3D &pdev->dev;
> > > > > +       int ret;
> > > > > +
> > > > > +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > > > > +       if (!data)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > > +       data->regs =3D devm_ioremap_resource(dev, mem);
> > > > > +       if (IS_ERR(data->regs))
> > > > > +               return PTR_ERR(data->regs);
> > > > > +
> > > > > +       init.name =3D dev->of_node->name;
> > > > > +       init.ops =3D &plldig_clk_ops;
> > > > > +       parent_name =3D of_clk_get_parent_name(dev->of_node, 0);
> > > > > +       init.parent_names =3D &parent_name;
> > > >
> > > > Can you use the new way of specifying clk parents with the
> > > > parent_data member of clk_init?
> > >
> > > Of course, but I don't understand why need recommend to use this memb=
er?
> > > Is that the member parent_names will be discard in future?
> > >
> > > Here are definition of the clk-provider.h
> > > /* Only one of the following three should be assigned */
> > > const char              * const *parent_names;
> > > const struct clk_parent_data    *parent_data;
> > > const struct clk_hw             **parent_hws;
> > >
> > > For PLLDIG, it only has one parent.
> >=20
> > Yes. Can you use clk_parent_data array and specify a DT index of 0 and =
some
> > name that would go into "clock-names" in the .fw_name member?
>=20
> OK, but .fw_name used for to registering clk, current it registered with =
fixed clk in dts .
> I think should be specify a DT index of 0 and specify the unique name for=
 .name member.
>=20
> I found have two ways to specify:
> 1. declare clk_parent_data variable parent_data, and initialization with =
clk_init_data, like this:
> =20
> parent_data.name =3D of_clk_get_parent_name(dev->of_node, 0);=20

This isn't preferred because of_clk_get_parent_name() is DT specific and
relies on the parent clk being registered before calling the function so
that we can figure out the globally unique name.

> parent_data.index =3D 0;
>=20
> init.name =3D dev->of_node->name;
> init.ops =3D &plldig_clk_ops;
> init.parent_data =3D &parent_data;
> init.num_parents =3D 1;
>=20
> 2. Or use a static const array for here? And put the unique name and inde=
x like this.
> static const struct clk_parent_data parent_data[] =3D {
>         {.name =3D "phy_27m", .index =3D 0},
> };
>=20
> After then initialization with macro CLK_HW_INIT_PARENTS_DATA?

Yes use option #2. But, don't even specify a .name if this is new code
because .name is a fallback mechanism that is supposed to be used if
you're migrating code from an older DT to a newer DT. I don't think
that's happening here.
