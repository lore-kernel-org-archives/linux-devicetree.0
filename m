From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/7] USB: add devicetree helpers for determining dr_mode and phy_type
Date: Mon, 03 Jun 2013 15:32:50 +0300
Message-ID: <8761xvjrwt.fsf@ashishki-desk.ger.corp.intel.com>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de> <1370025529-7414-2-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370025529-7414-2-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> This adds two little devicetree helper functions for determining the
> dr_mode (host, peripheral, otg) and phy_type (utmi, ulpi,...) from
> the devicetree.

This one needs an ack from Felipe.

>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/usb/phy/Makefile |  1 +
>  drivers/usb/phy/of.c     | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/usb-common.c | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/usb/of.h   | 28 ++++++++++++++++++++++++++++
>  include/linux/usb/otg.h  |  7 +++++++
>  include/linux/usb/phy.h  |  9 +++++++++
>  6 files changed, 127 insertions(+)
>  create mode 100644 drivers/usb/phy/of.c
>  create mode 100644 include/linux/usb/of.h
>
> diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
> index a9169cb..070eca3 100644
> --- a/drivers/usb/phy/Makefile
> +++ b/drivers/usb/phy/Makefile
> @@ -5,6 +5,7 @@
>  ccflags-$(CONFIG_USB_DEBUG) := -DDEBUG
>  
>  obj-$(CONFIG_USB_PHY)			+= phy.o
> +obj-$(CONFIG_OF)			+= of.o
>  
>  # transceiver drivers, keep the list sorted
>  
> diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
> new file mode 100644
> index 0000000..e6f3b74
> --- /dev/null
> +++ b/drivers/usb/phy/of.c
> @@ -0,0 +1,47 @@
> +/*
> + * USB of helper code
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/usb/of.h>
> +#include <linux/usb/otg.h>
> +
> +static const char *usbphy_modes[] = {
> +	[USBPHY_INTERFACE_MODE_UNKNOWN]	= "",
> +	[USBPHY_INTERFACE_MODE_UTMI]	= "utmi",
> +	[USBPHY_INTERFACE_MODE_UTMIW]	= "utmi_wide",
> +	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
> +	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
> +	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
> +};
> +
> +/**
> + * of_usb_get_phy_mode - Get phy mode for given device_node
> + * @np:	Pointer to the given device_node
> + *
> + * The function gets phy interface string from property 'phy_type',
> + * and returns the correspondig enum usb_phy_interface
> + */
> +enum usb_phy_interface of_usb_get_phy_mode(struct device_node *np)
> +{
> +	const char *phy_type;
> +	int err, i;
> +
> +	err = of_property_read_string(np, "phy_type", &phy_type);
> +	if (err < 0)
> +		return USBPHY_INTERFACE_MODE_UNKNOWN;
> +
> +	for (i = 0; i < ARRAY_SIZE(usbphy_modes); i++)
> +		if (!strcmp(phy_type, usbphy_modes[i]))
> +			return i;
> +
> +	return USBPHY_INTERFACE_MODE_UNKNOWN;
> +}
> +EXPORT_SYMBOL_GPL(of_usb_get_phy_mode);
> diff --git a/drivers/usb/usb-common.c b/drivers/usb/usb-common.c
> index 0db0a91..027582d 100644
> --- a/drivers/usb/usb-common.c
> +++ b/drivers/usb/usb-common.c
> @@ -13,7 +13,9 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/usb/ch9.h>
> +#include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
>  
>  const char *usb_otg_state_string(enum usb_otg_state state)
> @@ -79,4 +81,37 @@ const char *usb_state_string(enum usb_device_state state)
>  }
>  EXPORT_SYMBOL_GPL(usb_state_string);
>  
> +#ifdef CONFIG_OF
> +static const char *usb_dr_modes[] = {
> +	[USB_DR_MODE_UNKNOWN]		= "",
> +	[USB_DR_MODE_HOST]		= "host",
> +	[USB_DR_MODE_PERIPHERAL]	= "peripheral",
> +	[USB_DR_MODE_OTG]		= "otg",
> +};
> +
> +/**
> + * of_usb_get_dr_mode - Get dual role mode for given device_node
> + * @np:	Pointer to the given device_node
> + *
> + * The function gets phy interface string from property 'dr_mode',
> + * and returns the correspondig enum usb_dr_mode
> + */
> +enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
> +{
> +	const char *dr_mode;
> +	int err, i;
> +
> +	err = of_property_read_string(np, "dr_mode", &dr_mode);
> +	if (err < 0)
> +		return USB_DR_MODE_UNKNOWN;
> +
> +	for (i = 0; i < ARRAY_SIZE(usb_dr_modes); i++)
> +		if (!strcmp(dr_mode, usb_dr_modes[i]))
> +			return i;
> +
> +	return USB_DR_MODE_UNKNOWN;
> +}
> +EXPORT_SYMBOL_GPL(of_usb_get_dr_mode);
> +#endif
> +
>  MODULE_LICENSE("GPL");
> diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
> new file mode 100644
> index 0000000..e460a24
> --- /dev/null
> +++ b/include/linux/usb/of.h
> @@ -0,0 +1,28 @@
> +/*
> + * OF helpers for usb devices.
> + *
> + * This file is released under the GPLv2
> + */
> +
> +#ifndef __LINUX_USB_OF_H
> +#define __LINUX_USB_OF_H
> +
> +#include <linux/usb/otg.h>
> +#include <linux/usb/phy.h>
> +
> +#ifdef CONFIG_OF
> +enum usb_phy_interface of_usb_get_phy_mode(struct device_node *np);
> +enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
> +#else
> +static inline enum usb_phy_interface of_usb_get_phy_mode(struct device_node *np)
> +{
> +	return USBPHY_INTERFACE_MODE_UNKNOWN;
> +}
> +
> +static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
> +{
> +	return USB_DR_MODE_UNKNOWN;
> +}
> +#endif
> +
> +#endif /* __LINUX_USB_OF_H */
> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> index 291e01b..154332b 100644
> --- a/include/linux/usb/otg.h
> +++ b/include/linux/usb/otg.h
> @@ -92,4 +92,11 @@ otg_start_srp(struct usb_otg *otg)
>  /* for OTG controller drivers (and maybe other stuff) */
>  extern int usb_bus_start_enum(struct usb_bus *bus, unsigned port_num);
>  
> +enum usb_dr_mode {
> +	USB_DR_MODE_UNKNOWN,
> +	USB_DR_MODE_HOST,
> +	USB_DR_MODE_PERIPHERAL,
> +	USB_DR_MODE_OTG,
> +};
> +

I would suggest turning this into a bitmask, so that further tests look
like

  if (dr_mode & USB_DR_MODE_HOST) {...}

instead of how they currently look like in the other patch.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
