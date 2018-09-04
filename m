From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v6 3/5] clk: imx: add SCCG PLL type
Date: Tue, 4 Sep 2018 12:30:44 -0700
Message-ID: <CAHQ1cqFPUm5xnWGto5wRz2dMzxdWe4tAJwe0SxySmfnnkf9_Bg@mail.gmail.com>
References: <1534945703-4730-1-git-send-email-abel.vesa@nxp.com>
 <1534945703-4730-4-git-send-email-abel.vesa@nxp.com> <20180824074011.lufm653imkf6fyd3@pengutronix.de>
 <20180828105821.gbd7tba7uvmeeqcx@fsr-ub1664-175> <CAHQ1cqEsHoF0ZFY5+CpQFJ+b3sKd3yJPvmRZMAbaa9+Xzhe3=g@mail.gmail.com>
 <20180904131341.ef7tvt6hvtkkpdhw@fsr-ub1664-175>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904131341.ef7tvt6hvtkkpdhw@fsr-ub1664-175>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>, abelvesa@linux.com, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 4, 2018 at 6:13 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On Tue, Aug 28, 2018 at 12:11:13PM -0700, Andrey Smirnov wrote:
> > On Tue, Aug 28, 2018 at 3:58 AM Abel Vesa <abel.vesa@nxp.com> wrote:
> > >
> > > On Fri, Aug 24, 2018 at 09:40:11AM +0200, Sascha Hauer wrote:
> > > > +Cc Andrey Smirnov who made me aware of this issue.
> > > >
> > > > On Wed, Aug 22, 2018 at 04:48:21PM +0300, Abel Vesa wrote:
> > > > > From: Lucas Stach <l.stach@pengutronix.de>
> > > > >
> > > > > The SCCG is a new PLL type introduced on i.MX8. Add support for this.
> > > > > The driver currently misses the PLL lock check, as the preliminary
> > > > > documentation mentions lock configurations, but is quiet about where
> > > > > to find the actual lock status signal.
> > > > >
> > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > > > ---
> > > > > +static int clk_pll1_set_rate(struct clk_hw *hw, unsigned long rate,
> > > > > +                       unsigned long parent_rate)
> > > > > +{
> > > > > +   struct clk_sccg_pll *pll = to_clk_sccg_pll(hw);
> > > > > +   u32 val;
> > > > > +   u32 divf;
> > > > > +
> > > > > +   divf = rate / (parent_rate * 2);
> > > > > +
> > > > > +   val = readl_relaxed(pll->base + PLL_CFG2);
> > > > > +   val &= ~(PLL_DIVF_MASK << PLL_DIVF1_SHIFT);
> > > > > +   val |= (divf - 1) << PLL_DIVF1_SHIFT;
> > > > > +   writel_relaxed(val, pll->base + PLL_CFG2);
> > > > > +
> > > > > +   /* FIXME: PLL lock check */
> > > >
> > > > Shouldn't be too hard to add, no?
> > >
> > > Added to the next version which I intend to send today.
> > >
> > > >
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static int clk_pll1_prepare(struct clk_hw *hw)
> > > > > +{
> > > > > +   struct clk_sccg_pll *pll = to_clk_sccg_pll(hw);
> > > > > +   u32 val;
> > > > > +
> > > > > +   val = readl_relaxed(pll->base);
> > > > > +   val &= ~(1 << PLL_PD);
> > > > > +   writel_relaxed(val, pll->base);
> > > >
> > > > pll->base + PLL_CFG0 please.
> > >
> > > Same as above.
> > >
> > > >
> > > > > +static const struct clk_ops clk_sccg_pll1_ops = {
> > > > > +   .is_prepared    = clk_pll1_is_prepared,
> > > > > +   .recalc_rate    = clk_pll1_recalc_rate,
> > > > > +   .round_rate     = clk_pll1_round_rate,
> > > > > +   .set_rate       = clk_pll1_set_rate,
> > > > > +};
> > > > > +
> > > > > +static const struct clk_ops clk_sccg_pll2_ops = {
> > > > > +   .prepare        = clk_pll1_prepare,
> > > > > +   .unprepare      = clk_pll1_unprepare,
> > > > > +   .recalc_rate    = clk_pll2_recalc_rate,
> > > > > +   .round_rate     = clk_pll2_round_rate,
> > > > > +   .set_rate       = clk_pll2_set_rate,
> > > > > +};
> > > >
> > > > So these are two PLLs that share the same enable register. Doing the
> > > > prepare/unprepare for only one PLL can lead to all kinds of trouble.
> > > > Finding a good abstraction the properly handles this case with the
> > > > clock framework is probably also not easy.
> > > >
> > > > I could imagine we'll need to track the enable state on both PLLs and
> > > > only if both are disabled we disable it in hardware.
> > > >
> > > > With the current code we disable the PLLs when all consumers are
> > > > reparented to pll1, which probably has bad effects.
> > > >
> > >
> > > So it took me a while to understand exactly why this needs to stay like it is.
> > >
> >
> > IMHO this means that, if nothing else, all of the below should be
> > documented in code as a comment, otherwise simpletons like me are
> > going to continue stumbling over it and wondering what's going on.
>
> Will try to add proper comment to explain what's happening.
>
> >
> > > The PLL1 is never used by any device, instead it is used as a source for PLL2.
> > >
> > > But because the interlink between the two of them is too complicated,
> > > the PLLs 1 and 2 need to be separate clocks.
> > >
> >
> > Can you go a little bit more into detail as for why PLL1 needs to be
> > exposed in the first place and can't just be dealt with behind the
> > scenes as a part of PLL2 abstraction? Are there use-cases where the
> > rates of the two are going to be adjusted individually in Linux?
> >
>
> Here is the SCCG PLL Block Diagram:
>
> https://www.nxp.com/docs/en/reference-manual/IMX8MDQLQRM.pdf#page=834
>
> Now lets take the System PLL 2 for example. If you follow the hierarchy,
> when you reach the sys2_pll1_out you can see that one of its selectors is
> actually sys1_pll1_ref_sel. Same thing applies to sys3_pll2_out with
> sys2_pll1_ref_sel. This means there is an input reference clock interlinking
> between different System PLLs.
>

Hmm, I am not sure I see how this would prevent you from treating a
PLL pair as a black box, but OTOH, doing that probably wouldn't result
cleaner or simpler code. IMHO, it's unfortunate that PD bit is shared
between the two clocks, but if PLL1 could only be ever connected to
corresponding PLL2, then my concerns were probably misguided and
current implementation is good enough.

Thanks,
Andrey Smirnov
