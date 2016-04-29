From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: imx6: rework GPC to support multiple power
 domains
Date: Fri, 29 Apr 2016 14:43:13 +0200
Message-ID: <1461933793.3482.24.camel@pengutronix.de>
References: <1458128514-9560-1-git-send-email-l.stach@pengutronix.de>
	 <1458128514-9560-2-git-send-email-l.stach@pengutronix.de>
	 <20160407024857.GA3111@x250>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160407024857.GA3111@x250>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 07.04.2016, 10:48 +0800 schrieb Shawn Guo:
> On Wed, Mar 16, 2016 at 12:41:53PM +0100, Lucas Stach wrote:
> > This largely reworks the GPC driver to better accommodate multiple
> > power domains. This allows to extend the driver to support more domains
> > (like present on i.MX6SX) easily later on.
> > 
> > Compatibility to the old DT bindings is provided to keep the currently
> > supported i.MX6 devices working with the same feature level as before.
> > New DTs and SoC support should only use the new binding from now on.
> > 
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > v2: correct spelling in commit message
> > ---
> >  arch/arm/mach-imx/gpc.c | 435 ++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 329 insertions(+), 106 deletions(-)
> 
> There are too many changes in this single patch.  It makes the review
> quite difficult.  Is it possible to split it a bit into some incremental
> patches?
> 
I see that this is a quite difficult transformation and hard to review,
but it's also equally hard to split up without introducing regressions
and breaking bisectability in the series. This would cost me at least a
full day to revalidate the changes, time which I currently don't have
available.

Maybe it's easier to review if you apply the change and look at the
resulting code?

> Also please rebase against v4.6-rc1, which has the commit eaa2d73ef998
> (ARM: imx6: pm: declare pm domain latency on power_state struct)
> conflicting with your changes.
> 
I can do that if you are willing to take it in the current form. If you
still want to have it split up, I'll keep it blocked on -ENOTIME.

Regards,
Lucas

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
