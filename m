From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/7] usb: chipidea: udc: add force-full-speed option
Date: Sat, 1 Jun 2013 10:19:32 +0200
Message-ID: <20130601081932.GA28181@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
 <1370025529-7414-7-git-send-email-mgr@pengutronix.de>
 <20130601073933.GK32299@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130601073933.GK32299-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 01, 2013 at 09:39:33AM +0200, Sascha Hauer wrote:
> On Fri, May 31, 2013 at 08:38:48PM +0200, Michael Grzeschik wrote:
> > From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > This patch makes it possible to set the chipidea udc
> > into full-speed only mode. It can be set by the oftree
> > property "force-full-speed".
> 
> [...]
> 
> > +/* force full-speed operation */
> > +static bool full_speed;
> > +module_param(full_speed, bool, 0444);
> > +MODULE_PARM_DESC(full_speed, "force full-speed mode");
> > +
> 
> ???

Right, i reworked that one to get rid of yet another of property.
But i forgot to change the description. I will fix that, thanks.

Regards,
Michael

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
