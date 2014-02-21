From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RFC] usb: gadget: Add xilinx axi usb2 device support
Date: Fri, 21 Feb 2014 17:15:04 +0100
Message-ID: <1684019.mmMhl0O7OE@wuerfel>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local> <20140221154244.GG31902@saruman.home> <530775EB.6030004@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530775EB.6030004-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 21 February 2014 16:51:07 Michal Simek wrote:
> > | 
> > |     if (res->flags & IORESOURCE_CACHEABLE)
> > |             dest_ptr = devm_ioremap(dev, res->start, size);
> > |     else
> > |             dest_ptr = devm_ioremap_nocache(dev, res->start, size);
> 
> I have read it just not sure if IORESOURCE_CACHEABLE is setup by default
> or not.
> If yes, then you have to setup res->flags in your driver and have to
> check it.

ioremap() and ioremap_nocache() are the same on all architectures.
If you want a cacheable mapping, you need to call ioremap_cache(),
which unfortunately doesn't exist on all architectures and also
doesn't have a devm_* variant.

I don't know how the above code made it into devm_ioremap_resource(),
it's clearly bogus. The only time we ever set IORESOURCE_CACHEABLE
is for ROM BARs on PCI, which in turn are rarely used in the kernel.
It's never set for any platform devices, aside from one use
in arch/arm/mach-clps711x/board-cdb89712.c.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
