From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk/axs10x: introduce AXS10X pll driver
Date: Wed, 19 Apr 2017 09:49:49 -0700
Message-ID: <20170419164949.GH7065@codeaurora.org>
References: <1487682670-4164-1-git-send-email-vzakhar@synopsys.com>
 <20170405013525.GJ18246@codeaurora.org>
 <1491408370.9650.24.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491408370.9650.24.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/05, Vlad Zakharov wrote:
> Hi Stephen,
> 
> On Tue, 2017-04-04 at 18:35 -0700, Stephen Boyd wrote:
> > > +     .pll_table = (struct pll_of_table []){
> > > +             {
> > > +                     .prate = 27000000,
> > 
> > Can this be another clk in the framework instead of hardcoding
> > the parent rate?
> 
> In fact there is another clk in the framework that represents this parent clock. But this field is needed to get
> appropriate pll_cfg_table as it depends on parent clock frequency. Below in pll_cfg_get function we are searching for
> the correct table comparing .parent_node field with real hardware parent clock frequency:
> ---------------------------------->8------------------------------------
> for (i = 0; pll_table[i].prate != 0; i++)
>     if (pll_table[i].prate == prate)
>         return pll_table[i].pll_cfg_table;
> ---------------------------------->8------------------------------------

When is that done though? During round_rate and recalc_rate the
parent frequency is passed into the function, so it should be
possible to use that if the tree is properly expressed.

> 
> > 
> > > +                     .pll_cfg_table = (struct pll_cfg []){
> > > +                             { 25200000, 1, 84, 90 },
> > > +                             { 50000000, 1, 100, 54 },
> > > +                             { 74250000, 1, 44, 16 },
> > > +                             { },
> > > +                     },
> > > +             },
> > > +             /* Used as list limiter */
> > > +             { },
> > 
> > There's only ever one, so I'm confused why we're making a list.
> 
> By this patch we only add support of core arc pll and pgu pll and today they are clocked by the only parent clocks
> introduced here. But other plls on axs10x may be driven by different or configurable clocks, so in such cases we will
> have more than one entry in this list. And we are going to add more supported plls to this driver in the nearest future.

Ok.

> 
> > > +
> > > +     clk = clk_register(NULL, &pll_clk->hw);
> > > +     if (IS_ERR(clk)) {
> > > +             pr_err("failed to register %s clock (%ld)\n",
> > > +                             node->name, PTR_ERR(clk));
> > > +             kfree(pll_clk);
> > > +             return;
> > > +     }
> > > +
> > > +     of_clk_add_provider(node, of_clk_src_simple_get, clk);
> > 
> > Can you please use the clk_hw based provider and clk registration
> > functions?
> 
> Sure. Could you be so kind to explain what is the difference between hw and non-hw based provider and clk registration
> functions please? In which cases they are preferred? 
> 

We're trying to split the consumer and provider APIs along struct
clk_hw and struct clk respectively. If we can have drivers only
registers clk_hw pointers and never get back anything but an
error code, then we can force consumers to always go through the
clk_get() family of APIs. Then we can easily tell who is a
provider, who is a consumer, and who is a provider + a consumer.
Right now this isn't always clear cut because clk_hw has access
to struct clk, and also clk_register() returns a clk pointer, but
it doesn't really get used by anything in a provider driver,
unless provider drivers are doing something with the consumer
API.

> > 
> > > +}
> > > +
> > > +CLK_OF_DECLARE(axs10x_pll_clock, "snps,axs10x-arc-pll-clock", of_pll_clk_setup);
> > 
> > Does this need to be CLK_OF_DECLARE_DRIVER? I mean does the
> > driver need to probe and also have this of declare happen? Is the
> > PLL special and needs to be used for the timers?
> 
> It is special and is used for the timers, so we have to CLK_OF_DECLARE it. On the other hand similar pll is used to
> drive PGU clock frequency and other subsystems and so we add usual probe func.
> 

Presumably we'll have different compatible strings for the
different PLLs then? CLK_OF_DECLARE() will make it so that the
device node that matches never gets a ->probe() from a
platform_driver called on it. If you want it to be called twice,
then you need to use CLK_OF_DECLARE_DRIVER() instead.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
