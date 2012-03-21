From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 13:17:38 +0000
Message-ID: <201203211317.38339.arnd@arndb.de>
References: <20120312214325.GD5050@titan.lakedaemon.net> <201203211009.40934.arnd@arndb.de> <20120321114546.GC3092@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120321114546.GC3092-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 21 March 2012, Felipe Balbi wrote:
> I have explained an easy way to achieve that to Alan Stern, but he did
> not like it. Basically, we should add a platform_device to ehci-hcd.ko
> and make ehci-{omap,mv,fsl,atmel,etc} a parent device/driver which
> basically passes the correct resources and handle platform-specific
> details.
> 
> That way, we could build everything together and udev would load the
> correct modules for us.
> 
> For an example of what I mean, see drivers/usb/dwc3/core.c,
> drivers/usb/dwc3/dwc3-omap.c, and drivers/usb/dwc3/dwc3-pci.c

While that way clearly works and can solve the problem we have
with ehci today, I think it's easier and more consistent with
other drivers to do it the opposite way, as we have recently
discussed in the context of ohci:

Make the base driver a loadable module that does not register
any struct device_driver at all, but just exports functions to
other module. The hardware specific drivers then each register
to their own bus and use the functions exported by the
main driver, with a way to override them with their own versions.

Alan suggested a variation of that where we actually export
a default "struct hc_driver" instead of the individual functions,
which has the advantage of having to export fewer symbols, but
otherwise is similar to what we do elsewhere.

See libata, sdhci, serial-8250 or xhci for examples of this way.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
