From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v10 10/15] usb: phy-mxs: Add implementation of
 set_wakeup
Date: Fri, 21 Feb 2014 17:03:28 +0800
Message-ID: <20140221090326.GB13483@shlinux1.ap.freescale.net>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
 <1392873284-9386-11-git-send-email-peter.chen@freescale.com>
 <20140221092127.GC7541@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140221092127.GC7541-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 21, 2014 at 09:21:27AM +0000, Mark Rutland wrote:
> On Thu, Feb 20, 2014 at 05:14:39AM +0000, Peter Chen wrote:
> > When we need the PHY can be waken up by external signals,
> > we can call this API. Besides, we call mxs_phy_disconnect_line
> > at this API to close the connection between USB PHY and
> > controller, after that, the line state from controller is SE0.
> > Once the PHY is out of power, without calling mxs_phy_disconnect_line,
> > there are unknown wakeups due to dp/dm floating at device mode.
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c |  116 +++++++++++++++++++++++++++++++++++++++++
> >  1 files changed, 116 insertions(+), 0 deletions(-)
> 
> [...]
> 
> > +static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
> > +{
> > +	bool vbus_is_on = false;
> > +
> > +	/* If the SoCs don't need to disconnect line without vbus, quit */
> > +	if (!(mxs_phy->data->flags & MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS))
> > +		return;
> > +
> > +	/* If the SoCs don't have anatop, quit */
> > +	if (!mxs_phy->regmap_anatop)
> > +		return;
> 
> So it looks like fsl,anatop is truly optional.
> 

Like I said at 04/15, if the user wants full features and less bugs,
it is required.

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
