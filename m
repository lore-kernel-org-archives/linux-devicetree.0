From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] doc: dt-binding: generic onboard USB HUB
Date: Wed, 09 Dec 2015 09:55:43 +0100
Message-ID: <4048406.zTEffj2eJ2@wuerfel>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com> <20151209032403.GA3716@rob-hp-laptop> <20151209081223.GB941@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151209081223.GB941@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 December 2015 16:12:24 Peter Chen wrote:
> On Tue, Dec 08, 2015 at 09:24:03PM -0600, Rob Herring wrote:
> > On Tue, Dec 08, 2015 at 10:58:48AM +0100, Arnd Bergmann wrote:
> > > On Tuesday 08 December 2015 10:50:49 Philipp Zabel wrote:
> > > > This something we don't have to define ad-hoc. The hub hangs off an USB
> > > > controller, right? The "Open Firmware recommended practice: USB"
> > > > document already describes how to represent USB devices in a generic
> > > > manner:
> > > > http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> > > > 
> > > > Is there a reason not to reuse this?
> > > > 
> > > > The usb hub node would be a child of the usb controller node, and it
> > > > could use
> > > > 	compatible = "usb,class9"; /* bDeviceClass 9 (Hub) */
> > > 
> > > Good point, I had not thought of that when I looked at the patches.
> > >  
> > > Yes, let's do this way. I don't know if we ever implemented the simple
> > > patch to associate a USB device with a device_node, but if not, then
> > > let's do it now for this driver. A lot of people have asked for it in
> > > the past.
> > 
> > Agreed. Also, some hubs have I2C buses as well, but I still think under 
> > the USB bus is the right place.
> > 
> > However, one complication here is often (probably this case) these 
> > addtional signals need to be controlled before the device enumerates.
> > 
> 
> Yes, I did not find a way to let the USB bus code handle it, so I had to
> write a platform driver to do it

Looping in Ulf, he solved the same problem for SDIO devices recently,
and probably remembers the details best.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
