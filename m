From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6] usb: common: add API to set usb otg capabilities by
 device tree
Date: Thu, 18 Jun 2015 16:47:48 +0800
Message-ID: <20150618084747.GD15280@shlinux2>
References: <1434590302-18066-1-git-send-email-jun.li@freescale.com>
 <20150618103650.7c3d1b8ceb134388b0d8b093@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150618103650.7c3d1b8ceb134388b0d8b093-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 10:36:50AM +0300, Roger Quadros wrote:
> Lin,
> 
> You can use --in-reply-to "message id of v5 of this path" so that it appears together
> with the other patches in peoples mailboxes.
> 
> > + * the passed properties in DT.
> > + * @np: Pointer to the given device_node
> > + * @otg_caps: Pointer to the target usb_otg_caps to be set
> > + *
> > + * The function gets and sets the otg capabilities
> > + */
> > +void of_usb_set_otg_caps(struct device_node *np, struct usb_otg_caps *otg_caps)
> > +{
> > +	u32 otg_rev;
> > +
> > +	if (!otg_caps)
> > +		return;
> > +
> > +	if (!of_property_read_u32(np, "otg-rev", &otg_rev))
> > +		otg_caps->otg_rev = otg_rev;
> 
> should we check if otg_rev is in correct format?
> anything non BCD and greater than 0x9999 is invalid.
> 
> Also if otg-rev is not passed then we need to treat it as legacy
> platform right? How is this taken care of?
> 
Missed this comment
This handling rely on controller driver, cannot decided here.
There are several cases we need take care:
1) otg-rev is not passed, but all 3 disable flags passed, this is
  valid, means user want to disable whole OTG, so only "otg-rev"
  not passed, cannot treat as legacy platform.
2) Legacy platform means: none of 4 properties is present.
3) Some controller drivers already support OTG HNP/SRP, then change
  to utilize those new flags, still should support OTG HNP/SRP w/o
  any dt change, so OTG caps should be enabled for legacy platforms.
4) Some controller drivers does not support any OTG, after add OTG
  functions and utilize those new flags, should keep OTG disabled
  for legacy platforms.

Li Jun 
> > -- 
> > 1.9.1
> > 
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
