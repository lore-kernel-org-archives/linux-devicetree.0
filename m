From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: driver using another driver
Date: Fri, 1 Aug 2014 08:31:05 +0200
Message-ID: <20140801063105.GV23235@pengutronix.de>
References: <E70AF999396FDF4EAE40E195B84709611F84671F@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F84671F-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Wed, Jul 30, 2014 at 02:45:51PM +0000, Priebe, Sebastian wrote:
> Hello,
> 
> I am working on a project with an ARMv6 cpu and I am currently trying
> to port our board file to a device tree.  Our custom hardware has a
> CPLD with is used by multiple driver.  In the past we shared the CPLD
> driver resource (struct resource...) among the drivers platform data
> to be able to access the CPLD registers from all the drivers.  The
> CPLD driver allocated the resource, returned it to our platform code
> and our platform code passed it to the other drivers.
> In other words the CPLD driver is used by the other driver.
> How can I achieve the same with a device tree?

You can use a toplevel device node for your CPLD on which your toplevel driver
matches. Call of_platform_populate() with this toplevel node to create
the child devices. drivers/bus/ contains some examples, like
drivers/bus/imx-weim.c.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
