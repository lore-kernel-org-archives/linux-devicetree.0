Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] clk: imx: Add PLLs driver for imx8mm soc
In-Reply-To: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
From: Stephen Boyd <sboyd@kernel.org>
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
Message-ID: <154706614586.15366.5517254314423441854@swboyd.mtv.corp.google.com>
Date: Wed, 09 Jan 2019 12:35:45 -0800
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Jacky Bai (2019-01-08 01:00:45)
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> new file mode 100644
> index 0000000..c9f83fd
> --- /dev/null
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2017-2018 NXP.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +
> +#include "clk.h"
> +
> +#define GNRL_CTL       0x0
> +#define DIV_CTL                0x4
> +#define LOCK_STATUS    BIT(31)
> +#define LOCK_SEL_MASK  BIT(29)
> +#define CLKE_MASK      BIT(11)
> +#define RST_MASK       BIT(9)
> +#define BYPASS_MASK    BIT(4)
> +#define MDIV_SHIFT     12
> +#define MDIV_MASK      GENMASK(21, 12)
> +#define PDIV_SHIFT     4
> +#define PDIV_MASK      GENMASK(9, 4)
> +#define SDIV_SHIFT     0
> +#define SDIV_MASK      GENMASK(2, 0)
> +#define KDIV_SHIFT     0
> +#define KDIV_MASK      GENMASK(15, 0)
> +
> +struct clk_pll14xx {
> +       struct clk_hw                   hw;
> +       void __iomem                    *base;
> +       enum imx_pll14xx_type           type;
> +       struct imx_pll14xx_rate_table   *rate_table;
> +       int rate_count;
> +};
> +
> +#define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
> +
> +static const struct imx_pll14xx_rate_table *imx_get_pll_settings(
> +               struct clk_pll14xx *pll, unsigned long rate)
> +{
> +       const struct imx_pll14xx_rate_table *rate_table =3D pll->rate_tab=
le;
> +       int i;
> +
> +       for (i =3D 0; i < pll->rate_count; i++) {
> +               if (rate =3D=3D rate_table[i].rate)
> +                       return &rate_table[i];
> +       }

Nitpick: Drop the brackets.

> +
> +       return NULL;
> +}
> +
> +static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
> +                       unsigned long *prate)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +       const struct imx_pll14xx_rate_table *rate_table =3D pll->rate_tab=
le;
> +       int i;
> +
> +       /* Assumming rate_table is in descending order */
> +       for (i =3D 0; i < pll->rate_count; i++) {
> +               if (rate >=3D rate_table[i].rate)
> +                       return rate_table[i].rate;
> +       }
> +       /* return minimum supported value */
> +       return rate_table[i - 1].rate;
> +}
> +
> +static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_ra=
te)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +       u32 mdiv, pdiv, sdiv, pll_gnrl, pll_div;
> +       u64 fvco =3D parent_rate;
> +
> +       pll_gnrl =3D readl_relaxed(pll->base);
> +       pll_div =3D readl_relaxed(pll->base + 4);
> +       mdiv =3D (pll_div & MDIV_MASK) >> MDIV_SHIFT;
> +       pdiv =3D (pll_div & PDIV_MASK) >> PDIV_SHIFT;
> +       sdiv =3D (pll_div & SDIV_MASK) >> SDIV_SHIFT;
> +
> +       fvco *=3D mdiv;
> +       do_div(fvco, pdiv << sdiv);
> +
> +       return (unsigned long)fvco;

Nitpick: Drop the cast.

> +}
> +
> +static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_ra=
te)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +       u32 mdiv, pdiv, sdiv, pll_gnrl, pll_div_ctl0, pll_div_ctl1;
> +       short int kdiv;
> +       u64 fvco =3D parent_rate;
> +
> +       pll_gnrl =3D readl_relaxed(pll->base);
> +       pll_div_ctl0 =3D readl_relaxed(pll->base + 4);
> +       pll_div_ctl1 =3D readl_relaxed(pll->base + 8);
> +       mdiv =3D (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
> +       pdiv =3D (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
> +       sdiv =3D (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
> +       kdiv =3D pll_div_ctl1 & KDIV_MASK;
> +
> +       /* fvco =3D (m * 65536 + k) * Fin / (p * 65536) */
> +       fvco *=3D (mdiv * 65536 + kdiv);
> +       pdiv *=3D 65536;
> +
> +       do_div(fvco, pdiv << sdiv);
> +
> +       return (unsigned long)fvco;

Nitpick: Drop the cast.

> +}
> +
> +static inline bool clk_pll1416x_mp_change(const struct imx_pll14xx_rate_=
table *rate,
> +                                         u32 pll_div)
> +{
> +       u32 old_mdiv, old_pdiv;
> +
> +       old_mdiv =3D (pll_div >> MDIV_SHIFT) & MDIV_MASK;
> +       old_pdiv =3D (pll_div >> PDIV_SHIFT) & PDIV_MASK;
> +
> +       return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv);
> +}
> +
> +static inline bool clk_pll1443x_mpk_change(const struct imx_pll14xx_rate=
_table *rate,
> +                                         u32 pll_div_ctl0, u32 pll_div_c=
tl1)
> +{
> +       u32 old_mdiv, old_pdiv, old_kdiv;
> +
> +       old_mdiv =3D (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
> +       old_pdiv =3D (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
> +       old_kdiv =3D (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
> +
> +       return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv ||
> +               rate->kdiv !=3D old_kdiv);
> +}
> +
> +static inline bool clk_pll1443x_mp_change(const struct imx_pll14xx_rate_=
table *rate,
> +                                         u32 pll_div_ctl0, u32 pll_div_c=
tl1)
> +{
> +       u32 old_mdiv, old_pdiv, old_kdiv;
> +
> +       old_mdiv =3D (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
> +       old_pdiv =3D (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
> +       old_kdiv =3D (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
> +
> +       return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv ||
> +               rate->kdiv !=3D old_kdiv);

Nitpick: Please drop the parenthesis on all the returns above.

> +}
> +
> +static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
> +{
> +       unsigned long timeout =3D jiffies + msecs_to_jiffies(10);
> +
> +       /* Wait for PLL to lock */
> +       do {
> +               if (readl_relaxed(pll->base) & LOCK_STATUS)
> +                       break;
> +               if (time_after(jiffies, timeout))
> +                       break;
> +       } while (1);
> +
> +       return readl_relaxed(pll->base) & LOCK_STATUS ? 0 : -ETIMEDOUT;

Is this readl_poll_timeout()?

> +}
> +
[...]
> +
> +struct clk *imx_clk_pll14xx(const char *name, const char *parent_name,
> +                           void __iomem *base,
> +                           const struct imx_pll14xx_clk *pll_clk)
> +{
> +       struct clk_pll14xx *pll;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +       int len;
> +
> +       pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name =3D name;
> +       init.flags =3D pll_clk->flags;
> +       init.parent_names =3D &parent_name;
> +       init.num_parents =3D 1;
> +
> +       if (pll_clk->rate_table) {
> +               for (len =3D 0; pll_clk->rate_table[len].rate !=3D 0; )
> +                       len++;
> +
> +               pll->rate_count =3D len;
> +               pll->rate_table =3D kmemdup(pll_clk->rate_table,
> +                                         pll->rate_count *
> +                                         sizeof(struct imx_pll14xx_rate_=
table),

Is this struct_size()?

> +                                         GFP_KERNEL);
> +               WARN(!pll->rate_table, "%s : could not alloc rate table\n=
", __func__);

Allocations will fail with a loud message indicating as such, so this
WARN is not necessary.

> +       }
> +
> +       switch (pll_clk->type) {
> +       case PLL_1416X:
> +               if (!pll->rate_table)
> +                       init.ops =3D &clk_pll1416x_min_ops;
> +               else
> +                       init.ops =3D &clk_pll1416x_ops;
> +               break;
> +       case PLL_1443X:
