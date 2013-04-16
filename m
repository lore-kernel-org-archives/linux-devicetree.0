From: Mike Turquette <mturquette@linaro.org>
Subject: Re: RE: [PATCH v3] clk: add PowerPC corenet clock driver support
Date: Tue, 16 Apr 2013 15:27:21 -0700
Message-ID: <20130416222721.19887.3395@quantum>
References: <1365497187-8305-1-git-send-email-Yuantian.Tang@freescale.com>
 <D07C73A334FF604B95B3CBD2A545D07B0B144FEF@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B0B144FEF@039-SN2MPN1-013.039d.mgd.msft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Tang Yuantian-B29983 <B29983@freescale.com>Tang Yuantian-B29983 <B29983@freescale.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Li Yang-R58472 <r58472@freescale.com>
List-Id: devicetree@vger.kernel.org

Quoting Tang Yuantian-B29983 (2013-04-15 23:59:34)
> Hi Mike,
>=20
> I really appreciate if you can spend some times to review this patch.
>=20

Yauntian,

Thanks for submitting this patch.  I have frozen the changes I plan to
submit for 3.10, with the exception of any last-minute fixes.  I'll tak=
e
a closer look at this after the merge window.

Regards,
Mike

> Thanks,
> Yuantian
>=20
>=20
> > -----Original Message-----
> > From: Tang Yuantian-B29983
> > Sent: 2013=E5=B9=B44=E6=9C=889=E6=97=A5 16:46
> > To: mturquette@linaro.org
> > Cc: linus.walleij@linaro.org; viresh.kumar@linaro.org;
> > shawn.guo@linaro.org; ulf.hansson@linaro.org; linux-
> > kernel@vger.kernel.org; devicetree-discuss@lists.ozlabs.org; linuxp=
pc-
> > dev@lists.ozlabs.org; linux-doc@vger.kernel.org; Tang Yuantian-B299=
83;
> > Tang Yuantian-B29983; Li Yang-R58472
> > Subject: [PATCH v3] clk: add PowerPC corenet clock driver support
> >=20
> > From: Tang Yuantian <yuantian.tang@freescale.com>
> >=20
> > This adds the clock driver for Freescale PowerPC corenet series SoC=
s
> > using common clock infrastructure.
> >=20
> > Signed-off-by: Tang Yuantian <Yuantian.Tang@freescale.com>
> > Signed-off-by: Li Yang <leoli@freescale.com>
> > ---
> > v3:
> >       - remove the module author and description
> > v2:
> >       - add the document for device tree clock bindings
> >=20
> >  arch/powerpc/platforms/Kconfig.cputype |   1 +
> >  drivers/clk/Kconfig                    |   7 +
> >  drivers/clk/Makefile                   |   1 +
> >  drivers/clk/clk-ppc-corenet.c          | 280
> > +++++++++++++++++++++++++++++++++
> >  4 files changed, 289 insertions(+)
> >  create mode 100644 drivers/clk/clk-ppc-corenet.c
> >=20
> > diff --git a/arch/powerpc/platforms/Kconfig.cputype
> > b/arch/powerpc/platforms/Kconfig.cputype
> > index 18e3b76..cf065b8 100644
> > --- a/arch/powerpc/platforms/Kconfig.cputype
> > +++ b/arch/powerpc/platforms/Kconfig.cputype
> > @@ -158,6 +158,7 @@ config E500
> >  config PPC_E500MC
> >       bool "e500mc Support"
> >       select PPC_FPU
> > +     select COMMON_CLK
> >       depends on E500
> >       help
> >         This must be enabled for running on e500mc (and derivatives=
 diff
> > --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig index a47e6ee..6e=
2fd9c
> > 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -63,6 +63,13 @@ config CLK_TWL6040
> >         McPDM. McPDM module is using the external bit clock on the =
McPDM
> > bus
> >         as functional clock.
> >=20
> > +config CLK_PPC_CORENET
> > +     bool "Clock driver for PowerPC corenet platforms"
> > +     depends on PPC_E500MC && OF
> > +     ---help---
> > +       This adds the clock driver support for Freescale PowerPC co=
renet
> > +       platforms using common clock framework.
> > +
> >  endmenu
> >=20
> >  source "drivers/clk/mvebu/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile index
> > 300d477..6720319 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -34,3 +34,4 @@ obj-$(CONFIG_X86)           +=3D x86/
> >  obj-$(CONFIG_COMMON_CLK_WM831X) +=3D clk-wm831x.o
> >  obj-$(CONFIG_COMMON_CLK_MAX77686) +=3D clk-max77686.o
> >  obj-$(CONFIG_CLK_TWL6040)    +=3D clk-twl6040.o
> > +obj-$(CONFIG_CLK_PPC_CORENET)        +=3D clk-ppc-corenet.o
> > diff --git a/drivers/clk/clk-ppc-corenet.c b/drivers/clk/clk-ppc-
> > corenet.c new file mode 100644 index 0000000..a2d483f
> > --- /dev/null
> > +++ b/drivers/clk/clk-ppc-corenet.c
> > @@ -0,0 +1,280 @@
> > +/*
> > + * Copyright 2013 Freescale Semiconductor, Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * clock driver for Freescale PowerPC corenet SoCs.
> > + */
> > +#include <linux/clk-provider.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +
> > +struct cmux_clk {
> > +     struct clk_hw hw;
> > +     void __iomem *reg;
> > +     u32 flags;
> > +};
> > +
> > +#define PLL_KILL                     BIT(31)
> > +#define      CLKSEL_SHIFT            27
> > +#define CLKSEL_ADJUST                BIT(0)
> > +#define to_cmux_clk(p)               container_of(p, struct cmux_c=
lk, hw)
> > +
> > +static void __iomem *base;
> > +static unsigned int clocks_per_pll;
> > +
> > +static int cmux_set_parent(struct clk_hw *hw, u8 idx) {
> > +     struct cmux_clk *clk =3D to_cmux_clk(hw);
> > +     u32 clksel;
> > +
> > +     clksel =3D ((idx / clocks_per_pll) << 2) + idx % clocks_per_p=
ll;
> > +     if (clk->flags & CLKSEL_ADJUST)
> > +             clksel +=3D 8;
> > +     clksel =3D (clksel & 0xf) << CLKSEL_SHIFT;
> > +     iowrite32be(clksel, clk->reg);
> > +
> > +     return 0;
> > +}
> > +
> > +static u8 cmux_get_parent(struct clk_hw *hw) {
> > +     struct cmux_clk *clk =3D to_cmux_clk(hw);
> > +     u32 clksel;
> > +
> > +     clksel =3D ioread32be(clk->reg);
> > +     clksel =3D (clksel >> CLKSEL_SHIFT) & 0xf;
> > +     if (clk->flags & CLKSEL_ADJUST)
> > +             clksel -=3D 8;
> > +     clksel =3D (clksel >> 2) * clocks_per_pll + clksel % 4;
> > +
> > +     return clksel;
> > +}
> > +
> > +const struct clk_ops cmux_ops =3D {
> > +     .get_parent =3D cmux_get_parent,
> > +     .set_parent =3D cmux_set_parent,
> > +};
> > +
> > +static void __init core_mux_init(struct device_node *np) {
> > +     struct clk *clk;
> > +     struct clk_init_data init;
> > +     struct cmux_clk *cmux_clk;
> > +     struct device_node *node;
> > +     int rc, count, i;
> > +     u32     offset;
> > +     const char *clk_name;
> > +     const char **parent_names;
> > +
> > +     rc =3D of_property_read_u32(np, "reg", &offset);
> > +     if (rc) {
> > +             pr_err("%s: could not get reg property\n", np->name);
> > +             return;
> > +     }
> > +
> > +     /* get the input clock source count */
> > +     count =3D of_property_count_strings(np, "clock-names");
> > +     if (count < 0) {
> > +             pr_err("%s: get clock count error\n", np->name);
> > +             return;
> > +     }
> > +     parent_names =3D kzalloc((sizeof(char *) * count), GFP_KERNEL=
);
> > +     if (!parent_names) {
> > +             pr_err("%s: could not allocate parent_names\n", __fun=
c__);
> > +             return;
> > +     }
> > +
> > +     for (i =3D 0; i < count; i++)
> > +             parent_names[i] =3D of_clk_get_parent_name(np, i);
> > +
> > +     cmux_clk =3D kzalloc(sizeof(struct cmux_clk), GFP_KERNEL);
> > +     if (!cmux_clk) {
> > +             pr_err("%s: could not allocate cmux_clk\n", __func__)=
;
> > +             goto err_name;
> > +     }
> > +     cmux_clk->reg =3D base + offset;
> > +
> > +     node =3D of_find_compatible_node(NULL, NULL, "fsl,p4080-clock=
gen");
> > +     if (node && (offset >=3D 0x80))
> > +             cmux_clk->flags =3D CLKSEL_ADJUST;
> > +
> > +     rc =3D of_property_read_string_index(np, "clock-output-names"=
,
> > +                     0, &clk_name);
> > +     if (rc) {
> > +             pr_err("%s: read clock names error\n", np->name);
> > +             goto err_clk;
> > +     }
> > +
> > +     init.name =3D clk_name;
> > +     init.ops =3D &cmux_ops;
> > +     init.parent_names =3D parent_names;
> > +     init.num_parents =3D count;
> > +     init.flags =3D 0;
> > +     cmux_clk->hw.init =3D &init;
> > +
> > +     clk =3D clk_register(NULL, &cmux_clk->hw);
> > +     if (IS_ERR(clk)) {
> > +             pr_err("%s: could not register clock\n", clk_name);
> > +             goto err_clk;
> > +     }
> > +
> > +     rc =3D of_clk_add_provider(np, of_clk_src_simple_get, clk);
> > +     if (rc) {
> > +             pr_err("Could not register clock provider for node:%s=
\n",
> > +                      np->name);
> > +             goto err_clk;
> > +     }
> > +     goto err_name;
> > +
> > +err_clk:
> > +     kfree(cmux_clk);
> > +err_name:
> > +     /* free *_names because they are reallocated when registered =
*/
> > +     kfree(parent_names);
> > +}
> > +
> > +static void __init core_pll_init(struct device_node *np) {
> > +     u32 offset, mult;
> > +     int i, rc, count;
> > +     const char *clk_name, *parent_name;
> > +     struct clk_onecell_data *onecell_data;
> > +     struct clk      **subclks;
> > +
> > +     rc =3D of_property_read_u32(np, "reg", &offset);
> > +     if (rc) {
> > +             pr_err("%s: could not get reg property\n", np->name);
> > +             return;
> > +     }
> > +
> > +     /* get the multiple of PLL */
> > +     mult =3D ioread32be(base + offset);
> > +
> > +     /* check if this PLL is disabled */
> > +     if (mult & PLL_KILL) {
> > +             pr_debug("PLL:%s is disabled\n", np->name);
> > +             return;
> > +     }
> > +     mult =3D (mult >> 1) & 0x3f;
> > +
> > +     parent_name =3D of_clk_get_parent_name(np, 0);
> > +     if (!parent_name) {
> > +             pr_err("PLL: %s must have a parent\n", np->name);
> > +             return;
> > +     }
> > +
> > +     count =3D of_property_count_strings(np, "clock-output-names")=
;
> > +     if (count < 0 || count > 4) {
> > +             pr_err("%s: clock is not supported\n", np->name);
> > +             return;
> > +     }
> > +
> > +     /* output clock number per PLL */
> > +     clocks_per_pll =3D count;
> > +
> > +     subclks =3D kzalloc(sizeof(struct clk *) * count, GFP_KERNEL)=
;
> > +     if (!subclks) {
> > +             pr_err("%s: could not allocate subclks\n", __func__);
> > +             return;
> > +     }
> > +
> > +     onecell_data =3D kzalloc(sizeof(struct clk_onecell_data), GFP=
_KERNEL);
> > +     if (!onecell_data) {
> > +             pr_err("%s: could not allocate onecell_data\n", __fun=
c__);
> > +             goto err_clks;
> > +     }
> > +
> > +     for (i =3D 0; i < count; i++) {
> > +             rc =3D of_property_read_string_index(np, "clock-outpu=
t-names",
> > +                             i, &clk_name);
> > +             if (rc) {
> > +                     pr_err("%s: could not get clock names\n", np-=
>name);
> > +                     goto err_cell;
> > +             }
> > +
> > +             /*
> > +              * when count =3D=3D 4, there are 4 output clocks:
> > +              * /1, /2, /3, /4 respectively
> > +              * when count < 4, there are at least 2 output clocks=
:
> > +              * /1, /2, (/4, if count =3D=3D 3) respectively.
> > +              */
> > +             if (count =3D=3D 4)
> > +                     subclks[i] =3D clk_register_fixed_factor(NULL=
, clk_name,
> > +                                     parent_name, 0, mult, 1 + i);
> > +             else
> > +
> > +                     subclks[i] =3D clk_register_fixed_factor(NULL=
, clk_name,
> > +                                     parent_name, 0, mult, 1 << i)=
;
> > +
> > +             if (IS_ERR(subclks[i])) {
> > +                     pr_err("%s: could not register clock\n", clk_=
name);
> > +                     goto err_cell;
> > +             }
> > +     }
> > +
> > +     onecell_data->clks =3D subclks;
> > +     onecell_data->clk_num =3D count;
> > +
> > +     rc =3D of_clk_add_provider(np, of_clk_src_onecell_get, onecel=
l_data);
> > +     if (rc) {
> > +             pr_err("Could not register clk provider for node:%s\n=
",
> > +                      np->name);
> > +             goto err_cell;
> > +     }
> > +
> > +     return;
> > +err_cell:
> > +     kfree(onecell_data);
> > +err_clks:
> > +     kfree(subclks);
> > +}
> > +
> > +static const struct of_device_id clk_match[] __initconst =3D {
> > +     { .compatible =3D "fixed-clock", .data =3D of_fixed_clk_setup=
, },
> > +     { .compatible =3D "fsl,core-pll-clock", .data =3D core_pll_in=
it, },
> > +     { .compatible =3D "fsl,core-mux-clock", .data =3D core_mux_in=
it, },
> > +     {}
> > +};
> > +
> > +static int __init ppc_corenet_clk_probe(struct platform_device *pd=
ev) {
> > +     struct device_node *np;
> > +
> > +     np =3D pdev->dev.of_node;
> > +     base =3D of_iomap(np, 0);
> > +     if (!base) {
> > +             dev_err(&pdev->dev, "iomap error\n");
> > +             return -ENOMEM;
> > +     }
> > +     of_clk_init(clk_match);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id ppc_clk_ids[] __initconst =3D {
> > +     { .compatible =3D "fsl,qoriq-clockgen-1.0", },
> > +     { .compatible =3D "fsl,qoriq-clockgen-2", },
> > +     {}
> > +};
> > +
> > +static struct platform_driver ppc_corenet_clk_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ppc_corenet_clock",
> > +             .owner =3D THIS_MODULE,
> > +             .of_match_table =3D ppc_clk_ids,
> > +     },
> > +     .probe =3D ppc_corenet_clk_probe,
> > +};
> > +
> > +static int __init ppc_corenet_clk_init(void) {
> > +     return platform_driver_register(&ppc_corenet_clk_driver);
> > +}
> > +subsys_initcall(ppc_corenet_clk_init);
> > --
> > 1.8.0
