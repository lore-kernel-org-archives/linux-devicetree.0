From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 02/12] usb: chipidea: permit driver bindings pass phy pointer
Date: Tue, 22 May 2012 16:07:31 +0200
Message-ID: <201205221607.31624.marex@denx.de>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com> <1337592237-5090-3-git-send-email-richard.zhao@freescale.com> <87ehqcbko0.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ehqcbko0.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Alexander Shishkin,

> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> 
> Hi,
> 
> > Sometimes, the driver bindings may know what phy they use.
> > For example, when using device tree, the usb controller may have a
> > phandler pointing to usb phy.
> 
> Some comments below:
> 
> [snip]
> 
> >  	ci->dev = dev;
> >  	ci->udc_driver = dev->platform_data;
> > 
> > +	if (ci->udc_driver->phy)
> > +		ci->transceiver = ci->udc_driver->phy;
> > +	else
> > +		ci->global_phy = 1;
> 
> Nitpick: since it's a bool, don't you want to use "true" instead?
> 
> [snip]
> 
> > +#include <linux/usb/otg.h>
> > +
> > 
> >  struct ci13xxx;
> >  struct ci13xxx_udc_driver {
> >  
> >  	const char	*name;
> >  	/* offset of the capability registers */
> >  	uintptr_t	 capoffset;
> >  	unsigned	 power_budget;
> > 
> > +	struct usb_phy	*phy;
> 
> This structure is really platform information, not per-device
> instance. Consider, for example, situation when you have 2 controllers
> in one system, they'll be using the same platform structure, but they'll
> have different phys. Right?

Not really, won't you allocate separate structure for them?

> 
> Regards,
> --
> Alex

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
