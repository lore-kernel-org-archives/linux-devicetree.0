From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/4] clk: arizona: Add clock driver for the Arizona
 devices
Date: Mon, 9 May 2016 14:48:29 -0700
Message-ID: <20160509214829.GQ3492@codeaurora.org>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20160507005501.GN3492@codeaurora.org>
 <20160509104728.GG1646@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160509104728.GG1646@localhost.localdomain>
Sender: linux-clk-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 05/09, Charles Keepax wrote:
> On Fri, May 06, 2016 at 05:55:01PM -0700, Stephen Boyd wrote:
> > I've applied this to clk-next but still have a question, see
> > below.
> > 
> > On 01/08, Charles Keepax wrote:
> > > diff --git a/drivers/clk/clk-arizona.c b/drivers/clk/clk-arizona.c
> > > new file mode 100644
> > > index 0000000..eaf2877
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-arizona.c
> > > +
> > > +static int arizona_clk_of_get_pdata(struct arizona *arizona)
> > > +{
> > > +	const char * const pins[] = { "mclk1", "mclk2" };
> > > +	struct clk *mclk;
> > > +	int i;
> > > +
> > > +	if (!of_property_read_bool(arizona->dev->of_node, "clocks"))
> > > +		return 0;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(pins); ++i) {
> > > +		mclk = of_clk_get_by_name(arizona->dev->of_node, pins[i]);
> > > +		if (IS_ERR(mclk))
> > > +			return PTR_ERR(mclk);
> > > +
> > > +		if (clk_get_rate(mclk) == CLK32K_RATE) {
> > > +			arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK1 + i;
> > > +			arizona->pdata.clk32k_parent = __clk_get_name(mclk);
> > > +		}
> > > +
> > > +		clk_put(mclk);
> > 
> > Could this be done through assigned parents instead of this rate
> > checking stuff? Presumably DT could tell us how the clk tree
> > should be configured.
> > 
> 
> Apologies, I have been working on a v4 that includes these
> improvements. It does indeed look much nicer using assigned
> parents etc. I think it might be best to drop these for now until
> those are ready to send.

Ok sure. I've dropped them.

> 
> The only problem I really have left to sort out before I can send
> it are some locking issues. It is quite tricky to get interaction
> between the clocking and SPI frameworks to play nicely. The SPI
> framework will sometimes punt the actually processing for the
> transfer to a worker thread which will often perform operations
> on clocks required for the SPI. Because this is a seperate
> thread it isn't handled by the re-enterant locking in the clock
> framework. I had been working around this using async transfers
> for the SPI, but even then I have since found you can get lockdep
> warnings because of the potential mutex inversion (SPI mutex and
> the clock one).
> 
> Any suggestions on this front would be greatly appreciated?
> 

The fix is to always prepare the first clk right? That way we
avoid any deadlock scenario.

We've been slowly working our way toward an alternate solution,
which is to have one mutex per clk so that different parts of the
clk tree can be locked independently, but so far that's blocked
on drivers re-entering the clk framework with clk consumer APIs
from within the clk_ops callbacks. Hopefully coordinated clk rate
switches will allow us to get rid of those situations and then we
can go and make sure all drivers aren't relying on the big
prepare mutex to keep their drivers safe from concurrent accesses
and finally move to one mutex per clk. This is a long term goal
though so I wouldn't depend on this happening anytime soon.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
