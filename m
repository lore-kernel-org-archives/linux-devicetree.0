From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 05/10] clk: iproc: Add PLL base write function
Date: Mon, 12 Oct 2015 13:48:53 -0400
Message-ID: <20151012174853.GD20867@broadcom.com>
References: <1443826665-17570-1-git-send-email-jonmason@broadcom.com>
 <1443826665-17570-6-git-send-email-jonmason@broadcom.com>
 <20151010002106.GZ26883@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151010002106.GZ26883-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 05:21:06PM -0700, Stephen Boyd wrote:
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
> > +			    u32 offset, u32 val)
> > +{
> > +	const struct iproc_pll_ctrl *ctrl = pll->ctrl;
> > +
> > +	writel(val, base + offset);
> > +
> > +	if (unlikely(ctrl->flags & IPROC_CLK_NEEDS_READ_BACK &&
> > +		     base == pll->pll_base))
> > +		val = readl(base + offset);
> 
> Is there any point to assign val here?

It is a flush.  The val assignment could be excluded (and thus made
const) if so desired.

Thanks,
Jon

> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
