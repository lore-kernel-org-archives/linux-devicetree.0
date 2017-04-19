From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: imx7d: fix USDHC NAND clock
Date: Wed, 19 Apr 2017 09:44:39 -0700
Message-ID: <20170419164439.GG7065@codeaurora.org>
References: <20170410210015.1620-1-stefan@agner.ch>
 <20170419161435.GA7065@codeaurora.org>
 <9f0b9e83bc2a46bacb323d3ff2cfcf64@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9f0b9e83bc2a46bacb323d3ff2cfcf64-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/19, Stefan Agner wrote:
> On 2017-04-19 09:14, Stephen Boyd wrote:
> > On 04/10, Stefan Agner wrote:
> >> The USDHC NAND root clock is not gated by any CCM clock gate. Remove
> >> the bogus gate definition.
> >>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> ---
> > 
> > Can this be applied? It's followed by a dtsi change and there is
> > zero information about if the two depend on each other. Please
> > add cover letters for these sorts of things in the future
> > indicating how you expect merging to work.
> 
> This can be merged. The two changes are independent.
> 
> They look kind of dependent, but really aren't since
> IMX7D_NAND_USDHC_BUS_ROOT_CLK is still in the init_on list. Should have
> explicitly mentioned that, sorry about that.
> 

Thanks. Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
