From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCHv5 08/20] usb: host: xhci-plat: add support for the Armada
 375/38x XHCI controllers
Date: Mon, 12 May 2014 20:24:45 +0300
Message-ID: <537103DD.5030906@linux.intel.com>
References: <1399832288-19899-1-git-send-email-thomas.petazzoni@free-electrons.com> <1399832288-19899-9-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399832288-19899-9-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/11/2014 09:17 PM, Thomas Petazzoni wrote:
> From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> The Armada 375 and 38x SoCs come with an XHCI controller that requires
> some specific initialization related to the MBus windows
> configuration. This patch adds the support for this special
> configuration as an XHCI quirk executed during probe.
>
> Two new compatible strings are added to identify the Armada 375 and
> Armada 38x XHCI controllers, and therefore enable the relevant quirk.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/usb/host/Kconfig      |  8 +++++
>   drivers/usb/host/Makefile     |  3 ++
>   drivers/usb/host/xhci-mvebu.c | 70 +++++++++++++++++++++++++++++++++++++++++++
>   drivers/usb/host/xhci-mvebu.h | 21 +++++++++++++
>   drivers/usb/host/xhci-plat.c  | 12 ++++++++
>   5 files changed, 114 insertions(+)
>   create mode 100644 drivers/usb/host/xhci-mvebu.c
>   create mode 100644 drivers/usb/host/xhci-mvebu.h
>
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 3d9e540..9247ad2 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -29,6 +29,14 @@ if USB_XHCI_HCD
>   config USB_XHCI_PLATFORM
>   	tristate
>
> +config USB_XHCI_MVEBU
> +	tristate "xHCI support for Marvell Armada 375/38x"
> +	select USB_XHCI_PLATFORM
> +	depends on ARCH_MVEBU || COMPILE_TEST
> +	---help---
> +	  Say 'Y' to enable the support for the xHCI host controller
> +	  found in Marvell Armada 375/38x ARM SOCs.
> +
>   endif # USB_XHCI_HCD
>
>   config USB_EHCI_HCD
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index 7530468..7c0886a 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -19,6 +19,9 @@ xhci-hcd-$(CONFIG_PCI)	+= xhci-pci.o
>
>   ifneq ($(CONFIG_USB_XHCI_PLATFORM), )
>   	xhci-hcd-y		+= xhci-plat.o
> +ifneq ($(CONFIG_USB_XHCI_MVEBU), )
> +	xhci-hcd-y		+= xhci-mvebu.o
> +endif
>   endif
>
>   obj-$(CONFIG_USB_WHCI_HCD)	+= whci/
> diff --git a/drivers/usb/host/xhci-mvebu.c b/drivers/usb/host/xhci-mvebu.c
> new file mode 100644
> index 0000000..fab9d6f
> --- /dev/null
> +++ b/drivers/usb/host/xhci-mvebu.c
> @@ -0,0 +1,70 @@
> +/*
> + * Copyright (C) 2014 Marvell
> + * Author: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/mbus.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define USB3_MAX_WINDOWS	4
> +#define USB3_WIN_CTRL(w)	(0x0 + ((w) * 8))
> +#define USB3_WIN_BASE(w)	(0x4 + ((w) * 8))
> +
> +static void xhci_mvebu_mbus_config(void __iomem *base,
> +			const struct mbus_dram_target_info *dram)
> +{
> +	int win;
> +
> +	/* Clear all existing windows */
> +	for (win = 0; win < USB3_MAX_WINDOWS; win++) {
> +		writel(0, base + USB3_WIN_CTRL(win));
> +		writel(0, base + USB3_WIN_BASE(win));
> +	}
> +
> +	/* Program each DRAM CS in a seperate window */
> +	for (win = 0; win < dram->num_cs; win++) {
> +		const struct mbus_dram_window *cs = dram->cs + win;
> +
> +		writel(((cs->size - 1) & 0xffff0000) | (cs->mbus_attr << 8) |
> +		       (dram->mbus_dram_target_id << 4) | 1,
> +		       base + USB3_WIN_CTRL(win));
> +
> +		writel((cs->base & 0xffff0000), base + USB3_WIN_BASE(win));
> +	}
> +}
> +
> +int xhci_mvebu_mbus_init_quirk(struct platform_device *pdev)
> +{
> +	struct resource	*res;
> +	void __iomem *base;
> +	const struct mbus_dram_target_info *dram;

Hi

Sparse warns about this:

drivers/usb/host/xhci-mvebu.c:42:5: warning: symbol 'xhci_mvebu_mbus_init_quirk' 
was not declared. Should it be static?

Otherwise I think it looks good

-Mathias
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
