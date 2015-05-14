From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 10:56:09 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1505141025280.1582-100000@iolanthe.rowland.org>
References: <1431557340-5421-6-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431557340-5421-6-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 May 2015, Rob Herring wrote:

> Add platform driver for Marvell PXA1928 SOC. This is different from the
> mv-ehci driver in that it uses the generic phy framework, uses DT, does
> not use platform_data, is host only, and has a specific HSIC PHY and
> controller initialization handshake.

Are those differences sufficient to make a separate source file 
necessary?  There are plenty of other drivers that work for both DT and 
non-DT, for example.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/usb/host/Kconfig      |  15 ++-
>  drivers/usb/host/Makefile     |   1 +
>  drivers/usb/host/ehci-mv-of.c | 243 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/host/ehci-mv-of.c
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 197a6a3..4d8cfbc 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -251,6 +251,19 @@ config USB_EHCI_MV
>  	  Dova, Armada 370 and Armada XP. See "Support for Marvell EBU
>  	  on-chip EHCI USB controller" for those.
>  
> +config USB_EHCI_MV_OF
> +	bool "EHCI OF support for Marvell PXA/MMP USB controller"
> +	depends on (ARCH_PXA || ARCH_MMP)
> +	select USB_EHCI_ROOT_HUB_TT
> +	---help---
> +	  Enables support for Marvell (including PXA and MMP series) on-chip
> +	  USB SPH and OTG controller. SPH is a single port host, and it can
> +	  only be EHCI host. OTG is controller that can switch to host mode.
> +	  Note that this driver will not work on Marvell's other EHCI
> +	  controller used by the EBU-type SoCs including Orion, Kirkwood,
> +	  Dova, Armada 370 and Armada XP. See "Support for Marvell EBU
> +	  on-chip EHCI USB controller" for those.

This is identical to the help text for USB_EHCI_MV.  How is a user 
supposed to know which option to enable?

> +
>  config USB_W90X900_EHCI
>  	tristate "W90X900(W90P910) EHCI support"
>  	depends on ARCH_W90X900
> @@ -663,7 +676,7 @@ config USB_SL811_HCD
>  	help
>  	  The SL811HS is a single-port USB controller that supports either
>  	  host side or peripheral side roles.  Enable this option if your
> -	  board has this chip, and you want to use it as a host controller. 
> +	  board has this chip, and you want to use it as a host controller.

This doesn't belong in the patch.

>  	  If unsure, say N.
>  
>  	  To compile this driver as a module, choose M here: the
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index 65b0b6a..5ed93ff 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
>  obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
>  obj-$(CONFIG_USB_EHCI_PCI)	+= ehci-pci.o
>  obj-$(CONFIG_USB_EHCI_HCD_PLATFORM)	+= ehci-platform.o
> +obj-$(CONFIG_USB_EHCI_MV_OF)	+= ehci-mv-of.o
>  obj-$(CONFIG_USB_EHCI_MXC)	+= ehci-mxc.o
>  obj-$(CONFIG_USB_EHCI_HCD_OMAP)	+= ehci-omap.o
>  obj-$(CONFIG_USB_EHCI_HCD_ORION)	+= ehci-orion.o
> diff --git a/drivers/usb/host/ehci-mv-of.c b/drivers/usb/host/ehci-mv-of.c
> new file mode 100644
> index 0000000..3783299
> --- /dev/null
> +++ b/drivers/usb/host/ehci-mv-of.c
> @@ -0,0 +1,243 @@
> +/*
> + * Copyright (C) 2015 Linaro, Ltd.
> + * Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> + *
> + * Based on vendor driver modifications to ehci-mv.c:
> + * Copyright (C) 2011 Marvell International Ltd. All rights reserved.
> + * Author: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> + *        Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/err.h>
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
> +
> +#include "ehci.h"
> +
> +struct ehci_hcd_mv {
> +	struct usb_hcd *hcd;
> +	struct phy *phy;
> +	struct clk *clk;
> +};

Where does the .phy member get used?

> +
> +#define hcd_to_mv_priv(h) ((struct ehci_hcd_mv *)hcd_to_ehci(h)->priv)
> +
> +static struct hc_driver ehci_mv_hc_driver;
> +
> +static bool wait_for_reg(void __iomem *reg, u32 mask, unsigned long timeout)
> +{
> +	timeout += jiffies;
> +	while (time_is_after_eq_jiffies(timeout)) {
> +		if ((readl(reg) & mask) == mask)
> +			return true;
> +		msleep(1);
> +	}
> +	return false;
> +}
> +
> +static int mv_ehci_enable(struct ehci_hcd_mv *ehci_mv)
> +{
> +	struct ehci_hcd *ehci = hcd_to_ehci(ehci_mv->hcd);
> +	struct ehci_regs *ehci_regs = ehci->regs;
> +	int retval;
> +	u32 status;
> +
> +	/* enable port power and reserved bit 25 */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status |= (PORT_POWER) | (1 << 25);
> +	/* Clear bits 30:31 for HSIC to be enabled */
> +	status &= ~(0x3 << 30);
> +	__raw_writel(status, &ehci_regs->port_status[0]);
> +
> +	/* test mode: force enable hs */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status &= ~(0xf << 16);
> +	status |= (0x5 << 16);
> +	__raw_writel(status, &ehci_regs->port_status[0]);
> +
> +	/* disable test mode */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status &= ~(0xf << 16);
> +	__raw_writel(status, &ehci_regs->port_status[0]);
> +
> +	retval =  phy_power_on(ehci_mv->hcd->phy);
> +	if (retval)
> +		return retval;
> +
> +	/* issue port reset */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status |= PORT_RESET;
> +	status &= ~PORT_PE;
> +	__raw_writel(status, &ehci_regs->port_status[0]);
> +
> +	/* check reset done */
> +	if (!wait_for_reg(&ehci_regs->port_status[0], PORT_RESET, HZ / 10)) {
> +		pr_err("HSIC port reset not done: port_status 0x%x\n", status);
> +		return -ETIMEDOUT;
> +	}
> +	return 0;
> +}
> +
> +static int mv_ehci_probe(struct platform_device *pdev)
> +{
> +	struct usb_hcd *hcd;
> +	struct ehci_hcd *ehci;
> +	struct ehci_hcd_mv *ehci_mv;
> +	struct resource *r;
> +	int retval = -ENODEV;
> +
> +	hcd = usb_create_hcd(&ehci_mv_hc_driver, &pdev->dev, "mv ehci");
> +	if (!hcd)
> +		return -ENOMEM;
> +	ehci = hcd_to_ehci(hcd);
> +	ehci_mv = hcd_to_mv_priv(hcd);
> +	ehci_mv->hcd = hcd;
> +
> +	platform_set_drvdata(pdev, ehci_mv);
> +
> +	ehci_mv->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(ehci_mv->clk)) {
> +		dev_err(&pdev->dev, "error getting clock\n");
> +		retval = PTR_ERR(ehci_mv->clk);
> +		goto err_put_hcd;
> +	}
> +
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ehci->caps = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(ehci->caps)) {
> +		retval = PTR_ERR(ehci->caps);
> +		goto err_put_hcd;
> +	}
> +
> +	hcd->phy = devm_of_phy_get(&pdev->dev, pdev->dev.of_node, NULL);
> +	if (IS_ERR_OR_NULL(hcd->phy)) {
> +		retval = PTR_ERR(hcd->phy);
> +		if (retval != -EPROBE_DEFER && retval != -ENODEV)
> +			dev_err(&pdev->dev, "failed to get the phy\n");
> +		else
> +			return -EPROBE_DEFER;
> +		goto err_put_hcd;
> +	}
> +
> +	hcd->rsrc_start = r->start;
> +	hcd->rsrc_len = resource_size(r);
> +
> +	hcd->irq = platform_get_irq(pdev, 0);
> +	if (!hcd->irq) {
> +		dev_err(&pdev->dev, "Cannot get irq.");
> +		retval = -ENODEV;
> +		goto err_put_hcd;
> +	}
> +
> +	retval = phy_init(hcd->phy);
> +	if (retval)
> +		goto err_put_hcd;
> +
> +	clk_prepare(ehci_mv->clk);
> +	clk_enable(ehci_mv->clk);
> +
> +	retval = usb_add_hcd(hcd, hcd->irq, IRQF_SHARED);
> +	if (retval) {
> +		dev_err(&pdev->dev,
> +			"failed to add hcd with err %d\n", retval);
> +		goto err_disable_clk;
> +	}
> +
> +	retval = mv_ehci_enable(ehci_mv);

Is this call in the right place?  I doubt it.  The rest of the system
expects the controller to be running by the time usb_add_hcd() returns.
Probably you ought to put mv_ehci_enable in the ehci_mv_overrides
structure as the .reset entry.

> +	if (retval) {
> +		dev_err(&pdev->dev,
> +			"EHCI: private init failed with err %d\n", retval);
> +		goto err_disable_clk;
> +	}
> +
> +	device_wakeup_enable(hcd->self.controller);
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable(ehci_mv->clk);
> +	clk_unprepare(ehci_mv->clk);
> +	phy_exit(hcd->phy);
> +err_put_hcd:
> +	usb_put_hcd(hcd);
> +	return retval;
> +}

This doesn't set hcd->has_tt anywhere.  So why bother selecting 
USB_EHCI_ROOT_HUB_TT?

> +
> +static int mv_ehci_remove(struct platform_device *pdev)
> +{
> +	struct ehci_hcd_mv *ehci_mv = platform_get_drvdata(pdev);
> +	struct usb_hcd *hcd = ehci_mv->hcd;
> +
> +	phy_power_off(hcd->phy);
> +	phy_exit(hcd->phy);
> +	clk_disable(ehci_mv->clk);
> +	clk_unprepare(ehci_mv->clk);
> +
> +	usb_remove_hcd(hcd);
> +	usb_put_hcd(hcd);

The remove actions should be carried out in reverse order of the probe
actions.  As it is, this code briefly leaves the controller running but
with the clock turned off.  That doesn't seem like a good idea.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mv_ehci_dt_match[] = {
> +	{.compatible = "marvell,pxa1928-ehci"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mv_ehci_dt_match);
> +
> +static void mv_ehci_shutdown(struct platform_device *pdev)
> +{
> +	struct ehci_hcd_mv *ehci_mv = platform_get_drvdata(pdev);
> +	struct usb_hcd *hcd = ehci_mv->hcd;
> +
> +	if (!hcd->rh_registered)
> +		return;
> +
> +	if (hcd->driver->shutdown)
> +		hcd->driver->shutdown(hcd);
> +}

This is kind of strange.  It's the same as usb_hcd_platform_shutdown()  
except for the hcd->rh_registered test.  Is there some reason why that
test is needed here but not in the generic routine?  If not, can the
test be removed?  Or should it be added to the generic routine?

> +
> +static const struct ehci_driver_overrides ehci_mv_overrides __initconst = {
> +	.extra_priv_size =	sizeof(struct ehci_hcd_mv),
> +};
> +
> +static struct platform_driver ehci_mv_driver = {
> +	.probe = mv_ehci_probe,
> +	.remove = mv_ehci_remove,
> +	.shutdown = mv_ehci_shutdown,
> +	.driver = {
> +		   .name = "mv-ehci-of",
> +		   .of_match_table = of_match_ptr(mv_ehci_dt_match),
> +		   },
> +};
> +
> +static int __init ehci_mv_init(void)
> +{
> +	if (usb_disabled())
> +		return -ENODEV;
> +
> +	ehci_init_driver(&ehci_mv_hc_driver, &ehci_mv_overrides);
> +	return platform_driver_register(&ehci_mv_driver);
> +}
> +module_init(ehci_mv_init);
> +
> +static void __exit ehci_mv_cleanup(void)
> +{
> +	platform_driver_unregister(&ehci_mv_driver);
> +}
> +module_exit(ehci_mv_cleanup);
> +
> +MODULE_AUTHOR("Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
