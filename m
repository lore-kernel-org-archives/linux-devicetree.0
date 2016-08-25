From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Thu, 25 Aug 2016 15:28:04 +0200
Message-ID: <CACna6rwB8bPMqZ8Gz5x8WVMeB83T3J=D7dXsDpMO8YdNHFSKaA@mail.gmail.com>
References: <20160823061745.8162-1-zajec5@gmail.com> <20160823062613.13865-1-zajec5@gmail.com>
 <20160824084738.GB6502@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160824084738.GB6502@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24 August 2016 at 10:47, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/23, Rafa=C5=82 Mi=C5=82ecki wrote:
>> diff --git a/drivers/clk/bcm/clk-bcm53573-ilp.c b/drivers/clk/bcm/clk-bc=
m53573-ilp.c
>> new file mode 100644
>> index 0000000..b7ac0eb
>> --- /dev/null
>> +++ b/drivers/clk/bcm/clk-bcm53573-ilp.c
>> @@ -0,0 +1,146 @@
>> +/*
>> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/clk.h>
>
> Is this include used?

No. Good point.


>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/slab.h>
>> +
>> +#define PMU_XTAL_FREQ_RATIO                  0x66c
>> +#define  XTAL_ALP_PER_4ILP                   0x00001fff
>> +#define  XTAL_CTL_EN                         0x80000000
>> +#define PMU_SLOW_CLK_PERIOD                  0x6dc
>> +
>> +struct bcm53573_ilp {
>> +     struct clk *clk;
>> +     struct clk_hw hw;
>> +     void __iomem *pmu;
>> +};
>> +
>> +static int bcm53573_ilp_enable(struct clk_hw *hw)
>> +{
>> +     struct bcm53573_ilp *ilp =3D container_of(hw, struct bcm53573_ilp,=
 hw);
>> +
>> +     writel(0x10199, ilp->pmu + PMU_SLOW_CLK_PERIOD);
>> +     writel(0x10000, ilp->pmu + 0x674);
>
> Is there a name for 0x674?
>> +
>> +     return 0;
>> +}
>> +
>> +static unsigned long bcm53573_ilp_recalc_rate(struct clk_hw *hw,
>> +                                           unsigned long parent_rate)
>> +{
>> +     struct bcm53573_ilp *ilp =3D container_of(hw, struct bcm53573_ilp,=
 hw);
>> +     void __iomem *pmu =3D ilp->pmu;
>> +     u32 last_val, cur_val;
>> +     u32 sum =3D 0, num =3D 0, loop_num =3D 0;
>
> Should these just be plain ints? Do we care about sizes for these
> variables?
>
>> +     u32 avg;
>
> This one too.

Right.


>> +
>> +     /* Enable measurement */
>> +     writel(XTAL_CTL_EN, pmu + PMU_XTAL_FREQ_RATIO);
>> +
>> +     /* Read initial value */
>> +     last_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
>> +
>> +     /*
>> +      * At minimum we should loop for a bit to let hardware do the
>> +      * measurement. This isn't very accurate however, so for a better
>> +      * precision lets try getting 20 different values for and use aver=
age.
>> +      */
>> +     while (num < 20) {
>> +             cur_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PE=
R_4ILP;
>> +
>> +             if (cur_val !=3D last_val) {
>> +                     /* Got different value, use it */
>> +                     sum +=3D cur_val;
>> +                     num++;
>> +                     loop_num =3D 0;
>> +                     last_val =3D cur_val;
>> +             } else if (++loop_num > 5000) {
>> +                     /* Same value over and over, give up */
>> +                     sum +=3D cur_val;
>> +                     num++;
>> +                     break;
>> +             }
>
> Should there be a udelay() here? Or we're expected to tight loop
> read the hardware? If so we should throw in a cpu_relax() here to
> indicate tight loop.
>
>> +     }
>> +
>> +     /* Disable measurement to save power */
>> +     writel(0x0, pmu + PMU_XTAL_FREQ_RATIO);
>> +
>> +     avg =3D sum / num;
>> +
>> +     return parent_rate * 4 / avg;
>> +}
>> +
>> +static const struct clk_ops bcm53573_ilp_clk_ops =3D {
>> +     .enable =3D bcm53573_ilp_enable,
>
> No disable? Or .is_enabled?

The beauty of working without datasheets... I'll compare initial reg
state with one after enabling and see if there is sth obvious.


>> +     .recalc_rate =3D bcm53573_ilp_recalc_rate,
>> +};
>> +
>> +static void bcm53573_ilp_init(struct device_node *np)
>> +{
>> +     struct bcm53573_ilp *ilp;
>> +     struct resource res;
>> +     struct clk_init_data init =3D { 0 };
>> +     const char *parent_name;
>> +     int index;
>> +     int err;
>> +
>> +     ilp =3D kzalloc(sizeof(*ilp), GFP_KERNEL);
>> +     if (!ilp)
>> +             return;
>> +
>> +     parent_name =3D of_clk_get_parent_name(np, 0);
>> +     if (!parent_name) {
>> +             err =3D -ENOENT;
>> +             goto err_free_ilp;
>> +     }
>> +
>> +     /* TODO: This looks generic, try making it OF helper. */
>> +     index =3D of_property_match_string(np, "reg-names", "pmu");
>> +     if (index < 0) {
>> +             err =3D index;
>> +             goto err_free_ilp;
>> +     }
>> +     err =3D of_address_to_resource(np, index, &res);
>> +     if (err)
>> +             goto err_free_ilp;
>> +     ilp->pmu =3D ioremap(res.start, resource_size(&res));
>> +     if (IS_ERR(ilp->pmu)) {
>> +             err =3D PTR_ERR(ilp->pmu);
>> +             goto err_free_ilp;
>> +     }
>> +
>> +     init.name =3D np->name;
>> +     init.ops =3D &bcm53573_ilp_clk_ops;
>> +     init.parent_names =3D &parent_name;
>> +     init.num_parents =3D 1;
>> +
>> +     ilp->hw.init =3D &init;
>> +     ilp->clk =3D clk_register(NULL, &ilp->hw);
>
> please use clk_hw_register() and of_clk_add_hw_provider().

I wasn't aware of this API change, thanks.


>> +     if (WARN_ON(IS_ERR(ilp->clk)))
>> +             goto err_unmap_pmu;
>> +
>> +     err =3D of_clk_add_provider(np, of_clk_src_simple_get, ilp->clk);
>> +     if (err)
>> +             goto err_clk_unregister;
>> +
>> +     return;
>> +
>> +err_clk_unregister:
>> +     clk_unregister(ilp->clk);
>> +err_unmap_pmu:
>> +     iounmap(ilp->pmu);
>> +err_free_ilp:
>> +     kfree(ilp);
>> +     pr_err("Failed to init ILP clock: %d\n", err);
>> +}
>> +CLK_OF_DECLARE(bcm53573_ilp_clk, "brcm,bcm53573-ilp", bcm53573_ilp_init=
);
>
> Can this be a platform driver instead?

I guess it can. Should it? It's not clear to me when CLK_OF_DECLARE is
preferred and when it's not.

--=20
Rafa=C5=82
