From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Wed, 13 Jun 2018 16:03:38 +0300
Message-ID: <20180613130338.GH20078@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180612082354.GG20078@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 11:23:54AM +0300, Matti Vaittinen wrote:
> Hello Stephen,
> 
> Thanks again for the review. I'll do new patch which fixes these issues.
> 
> On Tue, Jun 12, 2018 at 12:44:11AM -0700, Stephen Boyd wrote:
> > Quoting Matti Vaittinen (2018-06-04 06:19:13)
> > > +}
> > > +
> > > +static unsigned long bd71837_clk_recalc_rate(struct clk_hw *hw,
> > > +                                            unsigned long parent_rate)
> > > +{
> > > +       struct bd71837_clk *c = container_of(hw, struct bd71837_clk, hw);
> > > +
> > > +       return c->rate;
> > > +}
> > > +
> > > +static const struct clk_ops bd71837_clk_ops = {
> > > +       .recalc_rate = &bd71837_clk_recalc_rate,
> > > +       .prepare = &bd71837_clk_enable,
> > > +       .unprepare = &bd71837_clk_disable,
> > > +       .is_prepared = &bd71837_clk_is_enabled,
> > > +};
> > > +
> > > +static int bd71837_clk_probe(struct platform_device *pdev)
> > > +{
> > > +       struct bd71837_clk *c;
> > > +       int rval = -ENOMEM;
> > > +       struct bd71837 *mfd = dev_get_drvdata(pdev->dev.parent);
> > > +       struct clk_init_data init = {
> > > +               .name = "bd71837-32k-out",
> > > +               .ops = &bd71837_clk_ops,
> > > +       };
> > > +
> > > +       c = devm_kzalloc(&pdev->dev, sizeof(*c), GFP_KERNEL);
> > > +       if (!c)
> > > +               goto err_out;
> > > +
> > > +       c->reg = BD71837_REG_OUT32K;
> > > +       c->mask = BD71837_OUT32K_EN;
> > > +       c->rate = BD71837_CLK_RATE;
> > 
> > The PMIC has an 'XIN' pin that would be the clk input for this chip, and
> > the output clk, this driver, would specify that xin clock as the parent.
> > The 'xin' clock would then be listed in DT as a fixed-rate clock. That
> > way this driver doesn't hardcode the frequency.
> 
> I see. This makes sense. I need to verify from HW colleagues whether
> this chip has internal oscillator or not. I originally thought we have
> on-chip oscillator - but as you say, we do have XIN pin in documentation.
> So now I am not sure if the test board I have contains oscillator driving
> the clk on PMIC - or if the PMIC has internal oscillator. I'll clarify this.

It really turned out that the PMIC just acts as a clock buffer. So I do
as you suggested and add lookup for parent clock to the driver. I
planned to do it so that if no parent is found from DT - then we assume
the 32.768KHz clock (as described in documentation). Eg, something along
the lines:

        init.parent_names = of_clk_get_parent_name(pdev->dev.parent->of_node, 0);
        if (init.parent_names) {
                init.num_parents = 1;
        } else {
                /* If parent is not given from DT we assume the typical use-case with
                 * 32.768 KHz oscillator for RTC (Maybe we could just error out here?)
                 */
                c->rate = BD71837_CLK_RATE;
                bd71837_clk_ops.recalc_rate = &bd71837_clk_recalc_rate;
        }

Does this make sense?

Br,
    Matti Vaittinen 
