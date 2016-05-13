From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/4] clk: renesas: rcar-gen3-cpg: Add Z clock
Date: Fri, 13 May 2016 10:54:03 +0200
Message-ID: <CAMuHMdV-N1WNju+n3ErQVKHqiofm+0RWUx+MQZZ8qjDr-q1w3g@mail.gmail.com>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
	<573166A8.1030101@rvc.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <573166A8.1030101@rvc.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Khiem,

On Tue, May 10, 2016 at 6:42 AM, Khiem Nguyen
<khiem.nguyen.xt@rvc.renesas.com> wrote:
> Base on Dien Pham work.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>

Thanks for your patch!

> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 143
> ++++++++++++++++++++++++++++++++++++
>  drivers/clk/renesas/rcar-gen3-cpg.h |   1 +
>  2 files changed, 144 insertions(+)
>
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c
> b/drivers/clk/renesas/rcar-gen3-cpg.c
> index bb4f2f9..45209ac 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -28,6 +28,146 @@
>  #define CPG_PLL2CR             0x002c
>  #define CPG_PLL4CR             0x01f4
>
> +/** Modify for Z-clock

Please drop this comment

> + *
> -----------------------------------------------------------------------------
> + * Z Clock
> + *
> + * Traits of this clock:
> + * prepare - clk_prepare only ensures that parents are prepared
> + * enable - clk_enable only ensures that parents are enabled
> + * rate - rate is adjustable.  clk->rate = parent->rate * mult / 32
> + * parent - fixed parent.  No clk_set_parent support
> + */
> +#define CPG_FRQCRB                     0x00000004
> +#define CPG_FRQCRB_KICK                        BIT(31)
> +#define CPG_FRQCRC                     0x000000e0
> +#define CPG_FRQCRC_ZFC_MASK            (0x1f << 8)
> +#define CPG_FRQCRC_ZFC_SHIFT           8
> +
> +
> +struct cpg_z_clk {
> +       struct clk_hw hw;
> +       void __iomem *reg;
> +       void __iomem *kick_reg;

I would just store the base address, and always use "zclk->base + CPG_FRQCRB"
or "zclk->base + CPG_FRQCRC".

> +};
> +
> +#define to_z_clk(_hw)  container_of(_hw, struct cpg_z_clk, hw)
> +
> +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> +                                          unsigned long parent_rate)
> +{
> +       struct cpg_z_clk *zclk = to_z_clk(hw);
> +       unsigned int mult;
> +       unsigned int val;
> +       unsigned long rate;
> +
> +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
> +           >> CPG_FRQCRC_ZFC_SHIFT;
> +       mult = 32 - val;
> +
> +       rate = div_u64((u64)parent_rate * mult + 16, 32);

The above also does rounding.

> +       /* Round to closest value at 100MHz unit */
> +       rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);

Why rounding to the closest 100MHz unit?

> +       return rate;
> +}
> +
> +static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                unsigned long *parent_rate)
> +{
> +       unsigned long prate  = *parent_rate;
> +       unsigned int mult;
> +
> +       if (!prate)
> +               prate = 1;
> +
> +       mult = div_u64((u64)rate * 32 + prate/2, prate);

DIV_ROUND_CLOSEST_ULL()

> +       mult = clamp(mult, 1U, 32U);
> +
> +       return *parent_rate / 32 * mult;

Doing the division first reduces accuracy.
Please do the multiplication first (in 64-bit arithmetic).

> +}
> +
> +static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +                             unsigned long parent_rate)
> +{
> +       struct cpg_z_clk *zclk = to_z_clk(hw);
> +       unsigned int mult;
> +       u32 val, kick;
> +       unsigned int i;
> +
> +       mult = div_u64((u64)rate * 32 + parent_rate/2, parent_rate);

DIV_ROUND_CLOSEST_ULL()

> +}
> +
> +static const struct clk_ops cpg_z_clk_ops = {
> +       .recalc_rate = cpg_z_clk_recalc_rate,
> +       .round_rate = cpg_z_clk_round_rate,
> +       .set_rate = cpg_z_clk_set_rate,
> +};
> +
> +static struct clk * __init cpg_z_clk_register(const struct cpg_core_clk
> *core,
> +                                             void __iomem *base,
> +                                             const char *parent_name)
> +{
> +       struct clk_init_data init;
> +       struct cpg_z_clk *zclk;
> +       struct clk *clk;
> +
> +       zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
> +       if (!zclk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = core->name;
> +       init.ops = &cpg_z_clk_ops;
> +       init.flags = CLK_SET_RATE_GATE;

#define CLK_SET_RATE_GATE       BIT(0) /* must be gated across rate change */

Given you don't implement clk_ops.disable() and clk_ops.unprepare(),
CLK_SET_RATE_GATE doesn't sound like the right flag to use.

> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       zclk->reg = base + CPG_FRQCRC;
> +       zclk->kick_reg = base + CPG_FRQCRB;
> +       zclk->hw.init = &init;
> +
> +       clk = clk_register(NULL, &zclk->hw);
> +       if (IS_ERR(clk))
> +               kfree(zclk);
> +
> +       return clk;
> +}
> +
> +/** End of modifying for Z-clock */

Please drop this comment

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
