From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 0/10] clk: iproc: add support for BCM NS, NSP, and NS2
Date: Thu, 22 Oct 2015 10:16:19 -0400
Message-ID: <20151022141618.GC651@broadcom.com>
References: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
 <20151021235144.GQ19782@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151021235144.GQ19782-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 21, 2015 at 04:51:44PM -0700, Stephen Boyd wrote:
> On 10/15, Jon Mason wrote:
> > 
> > v3 - Added a patch to fix cygnus clk link failures, and added back the
> > DT documentation patches that were removed from v2.
> > 
> > v2 - Added a patch to change the Cygnus clk macros to uppercase,
> > removed the device tree changes from the series (will send out those as
> > an RFC), and other minor changes that Stephen Boyd requested.
> > 
> > This patch series adds support for the Broadcom Northstar, Northstar
> > Plus, and Northstar 2 clocks.  Some slight modifications were necessary
> > to clk-iproc-pll to get Northstar and Northstar Plus working, due to
> > differences in register layout.  This is the reason why the first patch
> > is necessary.  Some more modifications were necessary to clk-iproc-pll
> > to get Northstar 2 working, due to differences in register layout (and
> > resulting fallout in Cygnus and NSP).  This is the reason why the sixth
> > and seventh patches are necessary.  The fifth patch is clean-up to
> > prevent accidentally forgetting to adjust for the base write errata
> > (which happened a few times, but was caught in internal review).
> > 
> 
> Can you please use git cover-letter format where the diffstat for
> the series is shown? Without that information here I started
> applying patches until I realized this added dt-bindings headers,
> thus probably needing some stable clk branch to pull into arm-soc.

My apologies.  I will do so in the future.

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
