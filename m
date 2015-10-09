From: Jon Mason <jonmason@broadcom.com>
Subject: Re: [PATCH 05/10] clk: iproc: Add PLL base write function
Date: Fri, 9 Oct 2015 14:01:55 -0400
Message-ID: <20151009180155.GC17527@broadcom.com>
References: <1443826665-17570-1-git-send-email-jonmason@broadcom.com>
 <1443826665-17570-6-git-send-email-jonmason@broadcom.com>
 <20151009070357.GN26883@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151009070357.GN26883@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 12:03:57AM -0700, Stephen Boyd wrote:
> On 10/02, Jon Mason wrote:
> > diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
> > index e029ab3..a4602aa 100644
> > --- a/drivers/clk/bcm/clk-iproc-pll.c
> > +++ b/drivers/clk/bcm/clk-iproc-pll.c
> > @@ -137,6 +137,18 @@ static int pll_wait_for_lock(struct iproc_pll *pll)
> >  	return -EIO;
> >  }
> >  
> > +static void iproc_pll_write(struct iproc_pll *pll, void __iomem *base,
> 
> Seems that pll could be const too?

Yes, and offset can be const too.  I'll make these changes and
resubmit.

Thanks,
Jon

> 
> > +			    u32 offset, u32 val)
> > +{
> > +	const struct iproc_pll_ctrl *ctrl = pll->ctrl;
> > +
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
