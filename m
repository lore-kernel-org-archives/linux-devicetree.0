From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [EXT] Re: [v2 2/3] clk: ls1028a: Add clock driver for Display output interface
Date: Mon, 19 Aug 2019 11:29:43 -0700
Message-ID: <20190819182944.4AEAB22CF5@mail.kernel.org>
References: <20190815101613.22872-1-wen.he_1@nxp.com> <20190815101613.22872-2-wen.he_1@nxp.com> <20190816174624.115FC205F4@mail.kernel.org> <DB7PR04MB51952DF4E1EE7FF10A947347E2A80@DB7PR04MB5195.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB51952DF4E1EE7FF10A947347E2A80@DB7PR04MB5195.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Wen He <wen.he_1@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Wen He (2019-08-19 00:30:49)
> > Quoting Wen He (2019-08-15 03:16:12)
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig index
> > > 801fa1cd0321..3c95d8ec31d4 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -223,6 +223,16 @@ config CLK_QORIQ
> > >           This adds the clock driver support for Freescale QorIQ plat=
forms
> > >           using common clock framework.
> > >
> > > +config CLK_LS1028A_PLLDIG
> > > +        bool "Clock driver for LS1028A Display output"
> > > +       depends on (ARCH_LAYERSCAPE || COMPILE_TEST) && OF
> >=20
> > Where is the OF dependency to build anything? Doesn't this still compile
> > without CONFIG_OF set?
>=20
> Yes, current included some APIs of the OF, like of_get_parent_name()

And there isn't a stub API for of_get_parent_name when OF isn't defined?

> > > +
> > > +static int plldig_clk_probe(struct platform_device *pdev) {
> > > +       struct clk_plldig *data;
> > > +       struct resource *mem;
> > > +       const char *parent_name;
> > > +       struct clk_init_data init =3D {};
> > > +       struct device *dev =3D &pdev->dev;
> > > +       int ret;
> > > +
> > > +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > > +       if (!data)
> > > +               return -ENOMEM;
> > > +
> > > +       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       data->regs =3D devm_ioremap_resource(dev, mem);
> > > +       if (IS_ERR(data->regs))
> > > +               return PTR_ERR(data->regs);
> > > +
> > > +       init.name =3D dev->of_node->name;
> > > +       init.ops =3D &plldig_clk_ops;
> > > +       parent_name =3D of_clk_get_parent_name(dev->of_node, 0);
> > > +       init.parent_names =3D &parent_name;
> >=20
> > Can you use the new way of specifying clk parents with the parent_data
> > member of clk_init?
>=20
> Of course, but I don't understand why need recommend to use this member?
> Is that the member parent_names will be discard in future?
>=20
> Here are definition of the clk-provider.h
> /* Only one of the following three should be assigned */
> const char              * const *parent_names;
> const struct clk_parent_data    *parent_data;
> const struct clk_hw             **parent_hws;
>=20
> For PLLDIG, it only has one parent.

Yes. Can you use clk_parent_data array and specify a DT index of 0 and
some name that would go into "clock-names" in the .fw_name member?
