From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v5 7/8] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 21 Dec 2018 13:50:37 +0000
Message-ID: <20181221135037.GH16508@imbe.wolfsonmicro.main>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-7-ckeepax@opensource.cirrus.com>
 <154356443157.88331.15749597863624143993@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154356443157.88331.15749597863624143993@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 11:53:51PM -0800, Stephen Boyd wrote:
> Quoting Charles Keepax (2018-11-20 06:16:30)

Apologies for the delay on this we have been very swamped at this
end lately.

> > diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
> > new file mode 100644
> > index 000000000000..8b2a78689715
> > --- /dev/null
> > +++ b/drivers/clk/clk-lochnagar.c
> > @@ -0,0 +1,360 @@
> [...]
> > +
> > +static int lochnagar_regmap_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +       struct lochnagar_clk *lclk = lochnagar_hw_to_lclk(hw);
> > +       struct lochnagar_clk_priv *priv = lclk->priv;
> > +       struct regmap *regmap = priv->regmap;
> > +       int ret;
> > +
> > +       /*
> > +        * Some clocks on Lochnagar can either generate a clock themselves
> > +        * or accept an external clock, these default to generating the clock
> > +        * themselves. If we set a parent however we should update the dir_mask
> > +        * to indicate to the hardware that this clock will now be receiving an
> > +        * external clock.
> 
> Hmm ok. So the plan is to configure parents in DT or from driver code if
> the configuration is to accept an external clk? I guess this works.
> 

Actually from further discussions on the hardware side it seems
this is handled automatically by the hardware so we no longer
need to set these direction bits. As such I will remove them in
the next spin.

> > +        */
> > +       if (lclk->dir_mask) {
> > +               ret = regmap_update_bits(regmap, lclk->cfg_reg,
> > +                                        lclk->dir_mask, lclk->dir_mask);
> > +               if (ret < 0) {
> > +                       dev_err(priv->dev, "Failed to set %s direction: %d\n",
> > +                               lclk->name, ret);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       ret = regmap_update_bits(regmap, lclk->src_reg, lclk->src_mask, index);
> > +       if (ret < 0)
> > +               dev_err(priv->dev, "Failed to reparent %s: %d\n",
> > +                       lclk->name, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static u8 lochnagar_regmap_get_parent(struct clk_hw *hw)
> > +{
> > +       struct lochnagar_clk *lclk = lochnagar_hw_to_lclk(hw);
> > +       struct lochnagar_clk_priv *priv = lclk->priv;
> > +       struct regmap *regmap = priv->regmap;
> > +       unsigned int val;
> > +       int ret;
> > +
> > +       ret = regmap_read(regmap, lclk->src_reg, &val);
> > +       if (ret < 0) {
> > +               dev_err(priv->dev, "Failed to read parent of %s: %d\n",
> > +                       lclk->name, ret);
> 
> The error messages in the above functions could be spammy. Just let
> drivers who fail when using these clks ops print errors and maybe
> downgrade these to debug? If you don't agree with this it's fine, I'll
> just hope to never see these prints change to debug in the future.
> 

Seems reasonable to me I will change them to debug prints.

> > +               return priv->nparents;
> > +       }
> > +
> > +       val &= lclk->src_mask;
> > +
> > +       return val;
> > +}
> > +
> > +static const struct clk_ops lochnagar_clk_regmap_ops = {
> > +       .prepare = lochnagar_regmap_prepare,
> > +       .unprepare = lochnagar_regmap_unprepare,
> > +       .set_parent = lochnagar_regmap_set_parent,
> > +       .get_parent = lochnagar_regmap_get_parent,
> 
> Is regmap important to have in the name of these functions and struct?
> I'd prefer it was just clk instead of regmap.
> 

Again no objection happy to rename.

> > +};
> > +
> > +static int lochnagar_init_parents(struct lochnagar_clk_priv *priv)
> > +{
> > +       struct device_node *np = priv->dev->of_node;
> > +       int i, j;
> > +
> > +       switch (priv->type) {
> > +       case LOCHNAGAR1:
> > +               memcpy(priv->lclks, lochnagar1_clks, sizeof(lochnagar1_clks));
> > +
> > +               priv->nparents = ARRAY_SIZE(lochnagar1_clk_parents);
> > +               priv->parents = devm_kmemdup(priv->dev, lochnagar1_clk_parents,
> > +                                            sizeof(lochnagar1_clk_parents),
> > +                                            GFP_KERNEL);
> > +               break;
> > +       case LOCHNAGAR2:
> > +               memcpy(priv->lclks, lochnagar2_clks, sizeof(lochnagar2_clks));
> > +
> > +               priv->nparents = ARRAY_SIZE(lochnagar2_clk_parents);
> > +               priv->parents = devm_kmemdup(priv->dev, lochnagar2_clk_parents,
> > +                                            sizeof(lochnagar2_clk_parents),
> > +                                            GFP_KERNEL);
> 
> Why do we need to kmemdup it? The clk framework already deep copies
> everything from clk_init structure.
> 

The copy is needed for the updates to the list down below.

> > +               break;
> > +       default:
> > +               dev_err(priv->dev, "Unknown Lochnagar type: %d\n", priv->type);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!priv->parents)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < priv->nparents; i++) {
> > +               j = of_property_match_string(np, "clock-names",
> > +                                            priv->parents[i]);
> > +               if (j >= 0)
> > +                       priv->parents[i] = of_clk_get_parent_name(np, j);
> 
> Isn't this of_clk_parent_fill()? But there are holes or something?
> 

I guess rather than a fill, this is perhaps more of a name and
replace. I could make this a core function if you prefer? I think
there are a couple of other drivers that could also use it,
although might be worth doing that as a separate series rather
than holding this one up.

> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
> > +{
> > +       struct clk_init_data clk_init = {
> > +               .ops = &lochnagar_clk_regmap_ops,
> > +               .parent_names = priv->parents,
> > +               .num_parents = priv->nparents,
> > +       };
> > +       struct lochnagar_clk *lclk;
> > +       int ret, i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(priv->lclks); i++) {
> 
> We already have an array of clks.
> 
> > +               lclk = &priv->lclks[i];
> > +
> > +               if (!lclk->name)
> > +                       continue;
> > +
> > +               clk_init.name = lclk->name;
> > +
> > +               lclk->priv = priv;
> > +               lclk->hw.init = &clk_init;
> > +
> > +               ret = devm_clk_hw_register(priv->dev, &lclk->hw);
> > +               if (ret) {
> > +                       dev_err(priv->dev, "Failed to register %s: %d\n",
> > +                               lclk->name, ret);
> > +                       return ret;
> > +               }
> > +
> > +               priv->clk_data->hws[i] = &lclk->hw;
> 
> But then we copy the pointers into here to use of_clk_hw_onecell_get().
> Can you just roll your own function to use your own array of clk
> structures? I know it's sort of sad, but it avoids a copy.
> 

Apologies for not doing it this way the first time, looks much
clearer that way round.

> > +       }
> > +
> > +       priv->clk_data->num = ARRAY_SIZE(priv->lclks);
> > +
> > +       ret = devm_of_clk_add_hw_provider(priv->dev, of_clk_hw_onecell_get,
> > +                                         priv->clk_data);
> > +       if (ret < 0) {
> > +               dev_err(priv->dev, "Failed to register provider: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> 
> Simplify this to
> 
> 	if (ret < 0)
> 		dev_err(...)
> 
> 	return ret;
> 

No problem.

> > +}
> > +
> > +static const struct of_device_id lochnagar_of_match[] = {
> > +       { .compatible = "cirrus,lochnagar1-clk", .data = (void *)LOCHNAGAR1 },
> > +       { .compatible = "cirrus,lochnagar2-clk", .data = (void *)LOCHNAGAR2 },
> > +       {},
> 
> Nitpick: Drop the comma, it's the sentinel so nothing should come after.
> 

Again no problem.

> > +};
> 
> Any MODULE_DEVICE_TABLE?
> 

Yes oversight there, will add that.

> > +static struct platform_driver lochnagar_clk_driver = {
> > +       .driver = {
> > +               .name = "lochnagar-clk",
> > +               .of_match_table = of_match_ptr(lochnagar_of_match),
> 
> I suspect of_match_ptr() makes the build complain about unused match
> table when CONFIG_OF=N. Can you try building it that way?
> 

The driver depends on the MFD which in turn depends on CONFIG_OF
so that shouldn't be a problem.

> > +       },
> > +
> 
> Nitpick: Why the extra newline?
> 

Happy to remove.

> > +       .probe = lochnagar_clk_probe,
> > +};
> > +module_platform_driver(lochnagar_clk_driver);
> > +
> > +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> > +MODULE_DESCRIPTION("Clock driver for Cirrus Logic Lochnagar Board");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:lochnagar-clk");
> 
> I think MODULE_ALIAS is not needed if it's this simple?
> 

Not actually sure on this one, to be honest its mostly cargo
culted from other drivers. I will investigate and see what I dig
up but if has any pointers I would greatly appreciate it.

Should be able to send another version very shortly.

Thanks,
Charles
