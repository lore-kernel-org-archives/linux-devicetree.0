From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Wed, 27 Jun 2018 11:40:00 +0300
Message-ID: <20180627084000.GE2118@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
 <20180613130338.GH20078@localhost.localdomain>
 <152997038474.143105.3390705878521933864@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152997038474.143105.3390705878521933864@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Hello Stephen,

On Mon, Jun 25, 2018 at 04:46:24PM -0700, Stephen Boyd wrote:
> Quoting Matti Vaittinen (2018-06-13 06:03:38)
> > On Tue, Jun 12, 2018 at 11:23:54AM +0300, Matti Vaittinen wrote:
> > > 
> > > I see. This makes sense. I need to verify from HW colleagues whether
> > > this chip has internal oscillator or not. I originally thought we have
> > > on-chip oscillator - but as you say, we do have XIN pin in documentation.
> > > So now I am not sure if the test board I have contains oscillator driving
> > > the clk on PMIC - or if the PMIC has internal oscillator. I'll clarify this.
> > 
> > It really turned out that the PMIC just acts as a clock buffer. So I do
> > as you suggested and add lookup for parent clock to the driver. I
> > planned to do it so that if no parent is found from DT - then we assume
> > the 32.768KHz clock (as described in documentation). Eg, something along
> > the lines:
> > 
> >         init.parent_names = of_clk_get_parent_name(pdev->dev.parent->of_node, 0);
> >         if (init.parent_names) {
> >                 init.num_parents = 1;
> >         } else {
> >                 /* If parent is not given from DT we assume the typical use-case with
> >                  * 32.768 KHz oscillator for RTC (Maybe we could just error out here?)
> >                  */
> >                 c->rate = BD71837_CLK_RATE;
> >                 bd71837_clk_ops.recalc_rate = &bd71837_clk_recalc_rate;
> >         }
> 
> You can also add a clk directly in this driver in that case there isn't
> one in DT with the rate and name of your choosing. Then the logic is the
> same and we don't need a c->rate variable.

So you mean that I should use clk_hw_register_fixed_rate and create new
clk if parent is not found? Isn't this a bit of an overkill? Downside is
that then we do need remove/cleanup functionality for deleting this
parent clock - and I didn't find devm support for fixed clock. Furthermore
I guess that since it is parent, it can't be removed before child is removed.

Or did you mean something else but creating a fixed rate clock as parent
here?

Best Regards
    Matti Vaittinen
