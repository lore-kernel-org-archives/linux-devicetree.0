From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 7/8] clk: lochnagar: Add support for the Cirrus Logic Lochnagar
Date: Thu, 29 Nov 2018 23:53:51 -0800
Message-ID: <154356443157.88331.15749597863624143993@swboyd.mtv.corp.google.com>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-7-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120141631.18949-7-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Charles Keepax (2018-11-20 06:16:30)
> diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
> new file mode 100644
> index 000000000000..8b2a78689715
> --- /dev/null
> +++ b/drivers/clk/clk-lochnagar.c
> @@ -0,0 +1,360 @@
[...]
> +
> +static int lochnagar_regmap_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct lochnagar_clk *lclk =3D lochnagar_hw_to_lclk(hw);
> +       struct lochnagar_clk_priv *priv =3D lclk->priv;
> +       struct regmap *regmap =3D priv->regmap;
> +       int ret;
> +
> +       /*
> +        * Some clocks on Lochnagar can either generate a clock themselves
> +        * or accept an external clock, these default to generating the c=
lock
> +        * themselves. If we set a parent however we should update the di=
r_mask
> +        * to indicate to the hardware that this clock will now be receiv=
ing an
> +        * external clock.

Hmm ok. So the plan is to configure parents in DT or from driver code if
the configuration is to accept an external clk? I guess this works.

> +        */
> +       if (lclk->dir_mask) {
> +               ret =3D regmap_update_bits(regmap, lclk->cfg_reg,
> +                                        lclk->dir_mask, lclk->dir_mask);
> +               if (ret < 0) {
> +                       dev_err(priv->dev, "Failed to set %s direction: %=
d\n",
> +                               lclk->name, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       ret =3D regmap_update_bits(regmap, lclk->src_reg, lclk->src_mask,=
 index);
> +       if (ret < 0)
> +               dev_err(priv->dev, "Failed to reparent %s: %d\n",
> +                       lclk->name, ret);
> +
> +       return ret;
> +}
> +
> +static u8 lochnagar_regmap_get_parent(struct clk_hw *hw)
> +{
> +       struct lochnagar_clk *lclk =3D lochnagar_hw_to_lclk(hw);
> +       struct lochnagar_clk_priv *priv =3D lclk->priv;
> +       struct regmap *regmap =3D priv->regmap;
> +       unsigned int val;
> +       int ret;
> +
> +       ret =3D regmap_read(regmap, lclk->src_reg, &val);
> +       if (ret < 0) {
> +               dev_err(priv->dev, "Failed to read parent of %s: %d\n",
> +                       lclk->name, ret);

The error messages in the above functions could be spammy. Just let
drivers who fail when using these clks ops print errors and maybe
downgrade these to debug? If you don't agree with this it's fine, I'll
just hope to never see these prints change to debug in the future.

> +               return priv->nparents;
> +       }
> +
> +       val &=3D lclk->src_mask;
> +
> +       return val;
> +}
> +
> +static const struct clk_ops lochnagar_clk_regmap_ops =3D {
> +       .prepare =3D lochnagar_regmap_prepare,
> +       .unprepare =3D lochnagar_regmap_unprepare,
> +       .set_parent =3D lochnagar_regmap_set_parent,
> +       .get_parent =3D lochnagar_regmap_get_parent,

Is regmap important to have in the name of these functions and struct?
I'd prefer it was just clk instead of regmap.

> +};
> +
> +static int lochnagar_init_parents(struct lochnagar_clk_priv *priv)
> +{
> +       struct device_node *np =3D priv->dev->of_node;
> +       int i, j;
> +
> +       switch (priv->type) {
> +       case LOCHNAGAR1:
> +               memcpy(priv->lclks, lochnagar1_clks, sizeof(lochnagar1_cl=
ks));
> +
> +               priv->nparents =3D ARRAY_SIZE(lochnagar1_clk_parents);
> +               priv->parents =3D devm_kmemdup(priv->dev, lochnagar1_clk_=
parents,
> +                                            sizeof(lochnagar1_clk_parent=
s),
> +                                            GFP_KERNEL);
> +               break;
> +       case LOCHNAGAR2:
> +               memcpy(priv->lclks, lochnagar2_clks, sizeof(lochnagar2_cl=
ks));
> +
> +               priv->nparents =3D ARRAY_SIZE(lochnagar2_clk_parents);
> +               priv->parents =3D devm_kmemdup(priv->dev, lochnagar2_clk_=
parents,
> +                                            sizeof(lochnagar2_clk_parent=
s),
> +                                            GFP_KERNEL);

Why do we need to kmemdup it? The clk framework already deep copies
everything from clk_init structure.

> +               break;
> +       default:
> +               dev_err(priv->dev, "Unknown Lochnagar type: %d\n", priv->=
type);
> +               return -EINVAL;
> +       }
> +
> +       if (!priv->parents)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < priv->nparents; i++) {
> +               j =3D of_property_match_string(np, "clock-names",
> +                                            priv->parents[i]);
> +               if (j >=3D 0)
> +                       priv->parents[i] =3D of_clk_get_parent_name(np, j=
);

Isn't this of_clk_parent_fill()? But there are holes or something?

> +       }
> +
> +       return 0;
> +}
> +
> +static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
> +{
> +       struct clk_init_data clk_init =3D {
> +               .ops =3D &lochnagar_clk_regmap_ops,
> +               .parent_names =3D priv->parents,
> +               .num_parents =3D priv->nparents,
> +       };
> +       struct lochnagar_clk *lclk;
> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(priv->lclks); i++) {

We already have an array of clks.

> +               lclk =3D &priv->lclks[i];
> +
> +               if (!lclk->name)
> +                       continue;
> +
> +               clk_init.name =3D lclk->name;
> +
> +               lclk->priv =3D priv;
> +               lclk->hw.init =3D &clk_init;
> +
> +               ret =3D devm_clk_hw_register(priv->dev, &lclk->hw);
> +               if (ret) {
> +                       dev_err(priv->dev, "Failed to register %s: %d\n",
> +                               lclk->name, ret);
> +                       return ret;
> +               }
> +
> +               priv->clk_data->hws[i] =3D &lclk->hw;

But then we copy the pointers into here to use of_clk_hw_onecell_get().
Can you just roll your own function to use your own array of clk
structures? I know it's sort of sad, but it avoids a copy.

> +       }
> +
> +       priv->clk_data->num =3D ARRAY_SIZE(priv->lclks);
> +
> +       ret =3D devm_of_clk_add_hw_provider(priv->dev, of_clk_hw_onecell_=
get,
> +                                         priv->clk_data);
> +       if (ret < 0) {
> +               dev_err(priv->dev, "Failed to register provider: %d\n", r=
et);
> +               return ret;
> +       }
> +
> +       return 0;

Simplify this to

	if (ret < 0)
		dev_err(...)

	return ret;

> +}
> +
> +static const struct of_device_id lochnagar_of_match[] =3D {
> +       { .compatible =3D "cirrus,lochnagar1-clk", .data =3D (void *)LOCH=
NAGAR1 },
> +       { .compatible =3D "cirrus,lochnagar2-clk", .data =3D (void *)LOCH=
NAGAR2 },
> +       {},

Nitpick: Drop the comma, it's the sentinel so nothing should come after.

> +};

Any MODULE_DEVICE_TABLE?

> +
> +static int lochnagar_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct lochnagar_clk_priv *priv;
> +       const struct of_device_id *of_id;
> +       int ret;
> +
> +       of_id =3D of_match_device(lochnagar_of_match, dev);
> +       if (!of_id)
> +               return -EINVAL;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->clk_data =3D devm_kzalloc(dev, struct_size(priv->clk_data, =
hws,
> +                                                      ARRAY_SIZE(priv->l=
clks)),
> +                                     GFP_KERNEL);
> +       if (!priv->clk_data)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       priv->regmap =3D dev_get_regmap(dev->parent, NULL);
> +       priv->type =3D (enum lochnagar_type)of_id->data;
> +
> +       ret =3D lochnagar_init_parents(priv);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D lochnagar_init_clks(priv);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static struct platform_driver lochnagar_clk_driver =3D {
> +       .driver =3D {
> +               .name =3D "lochnagar-clk",
> +               .of_match_table =3D of_match_ptr(lochnagar_of_match),

I suspect of_match_ptr() makes the build complain about unused match
table when CONFIG_OF=3DN. Can you try building it that way?

> +       },
> +

Nitpick: Why the extra newline?

> +       .probe =3D lochnagar_clk_probe,
> +};
> +module_platform_driver(lochnagar_clk_driver);
> +
> +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> +MODULE_DESCRIPTION("Clock driver for Cirrus Logic Lochnagar Board");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:lochnagar-clk");

I think MODULE_ALIAS is not needed if it's this simple?
