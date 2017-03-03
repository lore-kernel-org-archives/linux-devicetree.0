From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] clk/axs10x: introduce AXS10X pll driver
Date: Fri, 3 Mar 2017 15:50:09 -0800
Message-ID: <20170303235005.GV25384@codeaurora.org>
References: <1487682670-4164-1-git-send-email-vzakhar@synopsys.com>
 <1488547113.2557.44.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488547113.2557.44.camel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vlad Zakharov <Vladislav.Zakharov-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03, Vlad Zakharov wrote:
> Hi Michael, Stephen,
> 
> On Tue, 2017-02-21 at 16:11 +0300, Vlad Zakharov wrote:
> > AXS10X boards manages it's clocks using various PLLs. These PLL has same
> > dividers and corresponding control registers mapped to different addresses.
> > So we add one common driver for such PLLs.
> > 
> > Each PLL on AXS10X board consist of three dividers: IDIV, FBDIV and
> > ODIV. Output clock value is managed using these dividers.
> > 
> > We add pre-defined tables with supported rate values and appropriate
> > configurations of IDIV, FBDIV and ODIV for each value.
> > 
> > As of today we add support for PLLs that generate clock for the
> > following devices:
> >  * ARC core on AXC CPU tiles.
> >  * ARC PGU on ARC SDP Mainboard.
> > and more to come later.
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Vlad Zakharov <vzakhar-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> 
> Maybe you have any comments or remarks about this patch? And if you don't could you please apply it.
> 

I haven't reviewed it yet. The merge window is upon us right now
so I'll probably get to going through the queue this weekend/next
week.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
