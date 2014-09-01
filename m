From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 4/5] clk: RK808: Add clkout driver for RK808
Date: Mon, 01 Sep 2014 14:55:55 -0700
Message-ID: <20140901215555.5251.33484@quantum>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
 <1409564800-18477-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409564800-18477-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Chris Zhong (2014-09-01 02:46:40)
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> 
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hello Chris,

Thanks for submitting this patch. Could you fill in a proper changelog?
Also you should reorder the tags like so:

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

<snip>

> +static int rk808_clkout2_control(struct clk_hw *hw, bool enable)
> +{
> +       struct rk808_clkout *rk808_clkout = container_of(hw,
> +                                                        struct rk808_clkout,
> +                                                        clkout2_hw);
> +       struct rk808 *rk808 = rk808_clkout->rk808;
> +
> +       return regmap_update_bits(rk808->regmap, RK808_CLK32OUT_REG,
> +                                 CLK32KOUT2_EN, enable ? CLK32KOUT2_EN : 0);
> +}

Nitpick: can you rename "control" to "enable" or "ungate"? That makes it
more obvious what the function is doing without having to inspect the
code in the function body.

<snip>

> +static int rk808_clkout_probe(struct platform_device *pdev)
> +{
> +       struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
> +       struct i2c_client *client = rk808->i2c;
> +       struct device_node *node = client->dev.of_node;
> +       struct clk_init_data init = {};
> +       struct clk **clk_table;
> +       struct rk808_clkout *rk808_clkout;
> +
> +       rk808_clkout = devm_kzalloc(&client->dev,
> +                                   sizeof(*rk808_clkout), GFP_KERNEL);
> +       if (!rk808_clkout)
> +               return -ENOMEM;
> +
> +       rk808_clkout->rk808 = rk808;
> +
> +       clk_table = devm_kzalloc(&client->dev,
> +                                2 * sizeof(struct clk *), GFP_KERNEL);

Better to use devm_kcalloc. Also good to define a constant like:

#define RK808_NR_OUTPUT 2

... and then use RK8808_NR_OUTPUT instead of hard-coding the value 2 in
the driver.

> +       if (!clk_table)
> +               return -ENOMEM;
> +
> +       init.flags = CLK_IS_ROOT;
> +       init.parent_names = NULL;
> +       init.num_parents = 0;
> +       init.name = "rk808-clkout1";
> +       init.ops = &rk808_clkout1_ops;
> +       rk808_clkout->clkout1_hw.init = &init;
> +
> +       /* optional override of the clockname */
> +       of_property_read_string_index(node, "clock-output-names",
> +                                     0, &init.name);
> +
> +       clk_table[0] = devm_clk_register(&client->dev,
> +                                        &rk808_clkout->clkout1_hw);
> +       if (IS_ERR(clk_table[0]))
> +               return PTR_ERR(clk_table[0]);
> +
> +       init.name = "rk808-clkout2";
> +       init.ops = &rk808_clkout2_ops;
> +       rk808_clkout->clkout2_hw.init = &init;
> +
> +       /* optional override of the clockname */
> +       of_property_read_string_index(node, "clock-output-names",
> +                                     1, &init.name);
> +
> +       clk_table[1] = devm_clk_register(&client->dev,
> +                                        &rk808_clkout->clkout2_hw);
> +       if (IS_ERR(clk_table[1]))
> +               return PTR_ERR(clk_table[1]);
> +
> +       rk808_clkout->clk_data.clks = clk_table;
> +       rk808_clkout->clk_data.clk_num = 2;

Again, here you can use RK808_NR_OUTPUT.

Otherwise the driver looks pretty good to me.

Thanks,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
