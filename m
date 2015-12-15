From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Tue, 15 Dec 2015 16:33:26 +0800
Message-ID: <20151215083259.GA13809@shlinux2>
References: <1450077974-22762-1-git-send-email-peter.chen@freescale.com>
 <3023844.AYbAYqvHUZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3023844.AYbAYqvHUZ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 14, 2015 at 10:35:19AM +0100, Arnd Bergmann wrote:
> On Monday 14 December 2015 15:26:11 Peter Chen wrote:
> > Hi all,
> > 
> > There is a known issue that the USB code can't handle USB HUB's
> > external pins well, in that case, it may cause some onboard
> > USB HUBs can't work since their PHY's clock or reset pin needs to
> > operate.
> > 
> > The user reported this issue at below:
> > http://www.spinics.net/lists/linux-usb/msg131502.html
> > 
> > In this patch set, I add a generic onboard USB HUB driver to
> > handle this problem, the external signals will be configured
> > before usb controller's initialization, it much likes we did
> > it at board code before.
> > 
> > The user needs to add this generic hub node at dts to support it.
> > 
> > @The udoo users, help to test please.
> 
> I still think need to do this properly by representing the hub
> device as a USB device, using power sequencing code like MMC does.
> 
> 	Arnd

I will try to have a patch set for general onboard USB device.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
