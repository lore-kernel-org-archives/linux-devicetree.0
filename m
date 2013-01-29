From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Tue, 29 Jan 2013 21:30:50 +0100
Message-ID: <20130129203050.GT1906@pengutronix.de>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de>
 <5107D253.5030400@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5107D253.5030400-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2013 at 07:14:51PM +0530, kishon wrote:
> Hi,
> 
> On Tuesday 29 January 2013 04:52 PM, Sascha Hauer wrote:
> >From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >
> >This adds two little devicetree helper functions for determining the
> >dr_mode (host, peripheral, otg) and phy_type (utmi, ulpi,...) from
> >the devicetree.
> >
> >Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >---
> >
> >The properties and their values have been taken from the fsl-mph-dr driver.
> >This binding is also documented (though currently not used) for the tegra
> >ehci driver (Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt).
> >This is a first attempt to parse these bindings at a common place so that
> >others can make use of it.
> >
> >Basically I want to know whether this binding is recommended for new drivers
> >since normally the devicetree uses '-' instead of '_', and maybe there are
> >other problems with it.
> >
> >I need this binding for the chipidea driver. I suspect that the fsl-mph-dr
> >driver also really handles a chipidea core.
> >
> >Should we agree on this I would convert the fsl-mph-dr driver to use these
> >helpers.
> >
> >Sascha
> >
> >  drivers/usb/core/Makefile |    1 +
> >  drivers/usb/core/of.c     |   76 +++++++++++++++++++++++++++++++++++++++++++++
> 
> This file should ideally go into drivers/usb/phy/.

I originally wanted to do that, but the host/peripheral/otg property is
not phy specific. DO you still want to move it there?

> >  include/linux/usb/of.h    |   22 +++++++++++++
> >  include/linux/usb/phy.h   |    9 ++++++
> >  4 files changed, 108 insertions(+)
> >  create mode 100644 drivers/usb/core/of.c
> >  create mode 100644 include/linux/usb/of.h
> >
> >diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
> >index 26059b9..5378add 100644
> >--- a/drivers/usb/core/Makefile
> >+++ b/drivers/usb/core/Makefile
> >@@ -10,5 +10,6 @@ usbcore-y += devio.o notify.o generic.o quirks.o devices.o
> >
> >  usbcore-$(CONFIG_PCI)		+= hcd-pci.o
> >  usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
> >+usbcore-$(CONFIG_OF)		+= of.o
> 
> No Kconfig? Shouldn't this file be compiled only when some one is
> going to use the PHY?

Yes. Just skipped that for the first shot.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
