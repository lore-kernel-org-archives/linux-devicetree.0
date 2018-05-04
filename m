Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from Mailgw01.mediatek.com ([1.203.163.78]:27270 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751262AbeEDJ74 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 4 May 2018 05:59:56 -0400
Message-ID: <1525427980.25162.36.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] xhci: hisilicon: support HiSilicon STB xHCI host
 controller
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Fri, 4 May 2018 17:59:40 +0800
In-Reply-To: <1525425645-17246-3-git-send-email-sunjg79@163.com>
References: <1525425645-17246-1-git-send-email-sunjg79@163.com>
         <1525425645-17246-3-git-send-email-sunjg79@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: sunjg79@163.com
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, shawn.guo@linaro.org, xuejiancheng@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

Hi Jianguo,

On Fri, 2018-05-04 at 17:20 +0800, sunjg79@163.com wrote:
> From: Jianguo Sun <sunjianguo1@huawei.com>
> 
> This commit adds support for HiSilicon STB xHCI host controller.
> 
> Signed-off-by: Jianguo Sun <sunjianguo1@huawei.com>
> ---
>  drivers/usb/host/Kconfig      |   7 +
>  drivers/usb/host/Makefile     |   1 +
>  drivers/usb/host/xhci-histb.c | 409 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
>  create mode 100644 drivers/usb/host/xhci-histb.c
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 5d958da..c813fc4 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -52,6 +52,13 @@ config USB_XHCI_PLATFORM
>  
>  	  If unsure, say N.
>  
> +config USB_XHCI_HISTB
> +	tristate "xHCI support for HiSilicon STB SoCs"
> +	depends on USB_XHCI_PLATFORM && (ARCH_HISI || COMPILE_TEST)
> +	help
> +	  Say 'Y' to enable the support for the xHCI host controller
> +	  found in HiSilicon STB SoCs.
> +
>  config USB_XHCI_MTK
>  	tristate "xHCI support for MediaTek SoCs"
>  	select MFD_SYSCON
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index 8a8cffe..9b669c9 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
>  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
>  obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
>  obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
> +obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
>  obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
>  obj-$(CONFIG_USB_XHCI_TEGRA)	+= xhci-tegra.o
>  obj-$(CONFIG_USB_SL811_HCD)	+= sl811-hcd.o
> diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
> new file mode 100644
> index 0000000..5ec549f
> --- /dev/null
> +++ b/drivers/usb/host/xhci-histb.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * xHCI host controller driver for HiSilicon STB SoCs
> + *
> + * Copyright (C) 2017-2018 HiSilicon Co., Ltd. http://www.hisilicon.com
> + *
> + * Authors: Jianguo Sun <sunjianguo1@huawei.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
No need anymore if SPDX-License-Identifier is provided
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
Not used
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
ditto
> +#include <linux/reset.h>
> +
> +#include "xhci.h"
> +
> +#define GTXTHRCFG		0xc108
> +#define GRXTHRCFG		0xc10c
> +#define REG_GUSB2PHYCFG0	0xc200
> +#define BIT_UTMI_8_16		BIT(3)
> +#define BIT_UTMI_ULPI		BIT(4)
> +#define BIT_FREECLK_EXIST	BIT(30)
> +
> +#define REG_GUSB3PIPECTL0	0xc2c0
> +#define USB3_DEEMPHASIS_MASK	GENMASK(2, 1)
> +#define USB3_DEEMPHASIS0	BIT(1)
> +#define USB3_TX_MARGIN1		BIT(4)
> +
> +struct xhci_hcd_histb {
> +	struct device		*dev;
> +	struct usb_hcd		*hcd;
> +	void __iomem		*ctrl;
> +	struct clk		*bus_clk;
> +	struct clk		*utmi_clk;
> +	struct clk		*pipe_clk;
> +	struct clk		*suspend_clk;
> +	struct reset_control	*soft_reset;
> +};
> +
> +static inline struct xhci_hcd_histb *hcd_to_histb(struct usb_hcd *hcd)
> +{
> +	return dev_get_drvdata(hcd->self.controller);
> +}
> +
> +static int xhci_histb_config(struct xhci_hcd_histb *histb)
> +{
> +	struct device_node *np = histb->dev->of_node;
> +	u32 regval;
> +
> +	if (of_property_match_string(np, "phys-names", "inno") >= 0) {
> +		/* USB2 PHY chose ulpi 8bit interface */
> +		regval = readl(histb->ctrl + REG_GUSB2PHYCFG0);
> +		regval &= ~BIT_UTMI_ULPI;
> +		regval &= ~(BIT_UTMI_8_16);
> +		regval &= ~BIT_FREECLK_EXIST;
> +		writel(regval, histb->ctrl + REG_GUSB2PHYCFG0);
> +	}
> +
> +	if (of_property_match_string(np, "phys-names", "combo") >= 0) {
> +		/*
> +		 * write 0x010c0012 to GUSB3PIPECTL0
> +		 * GUSB3PIPECTL0[5:3] = 010 : Tx Margin = 900mV ,
> +		 * decrease TX voltage
> +		 * GUSB3PIPECTL0[2:1] = 01 : Tx Deemphasis = -3.5dB,
> +		 * refer to xHCI spec
> +		 */
> +		regval = readl(histb->ctrl + REG_GUSB3PIPECTL0);
> +		regval &= ~USB3_DEEMPHASIS_MASK;
> +		regval |= USB3_DEEMPHASIS0;
> +		regval |= USB3_TX_MARGIN1;
> +		writel(regval, histb->ctrl + REG_GUSB3PIPECTL0);
> +	}
> +
> +	writel(0x23100000, histb->ctrl + GTXTHRCFG);
> +	writel(0x23100000, histb->ctrl + GRXTHRCFG);
> +
> +	return 0;
> +}
> +
> +static int xhci_histb_clks_get(struct xhci_hcd_histb *histb)
> +{
> +	struct device *dev = histb->dev;
> +
> +	histb->bus_clk = devm_clk_get(dev, "bus");
> +	if (IS_ERR(histb->bus_clk)) {
> +		dev_err(dev, "fail to get bus clk\n");
> +		return PTR_ERR(histb->bus_clk);
> +	}
> +
> +	histb->utmi_clk = devm_clk_get(dev, "utmi");
> +	if (IS_ERR(histb->utmi_clk)) {
> +		dev_err(dev, "fail to get utmi clk\n");
> +		return PTR_ERR(histb->utmi_clk);
> +	}
> +
> +	histb->pipe_clk = devm_clk_get(dev, "pipe");
> +	if (IS_ERR(histb->pipe_clk)) {
> +		dev_err(dev, "fail to get pipe clk\n");
> +		return PTR_ERR(histb->pipe_clk);
> +	}
> +
> +	histb->suspend_clk = devm_clk_get(dev, "suspend");
> +	if (IS_ERR(histb->suspend_clk)) {
> +		dev_err(dev, "fail to get suspend clk\n");
> +		return PTR_ERR(histb->suspend_clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int xhci_histb_host_enable(struct xhci_hcd_histb *histb)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(histb->bus_clk);
> +	if (ret) {
> +		dev_err(histb->dev, "failed to enable bus clk\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(histb->utmi_clk);
> +	if (ret) {
> +		dev_err(histb->dev, "failed to enable utmi clk\n");
> +		goto err_utmi_clk;
> +	}
> +
> +	ret = clk_prepare_enable(histb->pipe_clk);
> +	if (ret) {
> +		dev_err(histb->dev, "failed to enable pipe clk\n");
> +		goto err_pipe_clk;
> +	}
> +
> +	ret = clk_prepare_enable(histb->suspend_clk);
> +	if (ret) {
> +		dev_err(histb->dev, "failed to enable suspend clk\n");
> +		goto err_suspend_clk;
> +	}
> +
> +	reset_control_deassert(histb->soft_reset);
> +
> +	return 0;
> +
> +err_suspend_clk:
> +	clk_disable_unprepare(histb->pipe_clk);
> +err_pipe_clk:
> +	clk_disable_unprepare(histb->utmi_clk);
> +err_utmi_clk:
> +	clk_disable_unprepare(histb->bus_clk);
> +
> +	return ret;
> +}
> +
> +static void xhci_histb_host_disable(struct xhci_hcd_histb *histb)
> +{
> +	reset_control_assert(histb->soft_reset);
> +
> +	clk_disable_unprepare(histb->suspend_clk);
> +	clk_disable_unprepare(histb->pipe_clk);
> +	clk_disable_unprepare(histb->utmi_clk);
> +	clk_disable_unprepare(histb->bus_clk);
> +}
> +
> +static void xhci_histb_quirks(struct device *dev, struct xhci_hcd *xhci)
> +{
> +	/*
> +	 * As of now platform drivers don't provide MSI support so we ensure
> +	 * here that the generic code does not try to make a pci_dev from our
> +	 * dev struct in order to setup MSI
> +	 */
> +	xhci->quirks |= XHCI_PLAT;
> +}
> +
> +/* called during probe() after chip reset completes */
> +static int xhci_histb_setup(struct usb_hcd *hcd)
> +{
> +	struct xhci_hcd_histb *histb = hcd_to_histb(hcd);
> +	int ret;
> +
> +	if (usb_hcd_is_primary_hcd(hcd)) {
> +		ret = xhci_histb_config(histb);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = xhci_gen_setup(hcd, xhci_histb_quirks);
> +	if (ret)
> +		return ret;
no need test @ret here
> +
> +	return ret;
> +}
> +
> +static const struct xhci_driver_overrides xhci_histb_overrides __initconst = {
> +	.reset = xhci_histb_setup,
> +};
> +
> +static struct hc_driver __read_mostly xhci_histb_hc_driver;
> +static int xhci_histb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct xhci_hcd_histb *histb;
> +	const struct hc_driver *driver;
> +	struct usb_hcd *hcd;
> +	struct xhci_hcd *xhci;
> +	struct resource *res;
> +	int irq;
> +	int ret = -ENODEV;
> +
> +	if (usb_disabled())
> +		return -ENODEV;
> +
> +	driver = &xhci_histb_hc_driver;
> +	histb = devm_kzalloc(dev, sizeof(*histb), GFP_KERNEL);
> +	if (!histb)
> +		return -ENOMEM;
> +
> +	histb->dev = dev;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	histb->ctrl = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(histb->ctrl))
> +		return PTR_ERR(histb->ctrl);
> +
> +	ret = xhci_histb_clks_get(histb);
> +	if (ret)
> +		return ret;
> +
> +	histb->soft_reset = devm_reset_control_get(dev, "soft");
> +	if (IS_ERR(histb->soft_reset)) {
> +		dev_err(dev, "failed to get soft reset\n");
> +		return PTR_ERR(histb->soft_reset);
> +	}
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +	device_enable_async_suspend(dev);
> +
> +	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
> +
> +	hcd = usb_create_hcd(driver, dev, dev_name(dev));
> +	if (!hcd) {
> +		ret = -ENOMEM;
> +		goto disable_pm;
> +	}
> +
> +	hcd->regs = histb->ctrl;
> +	hcd->rsrc_start = res->start;
> +	hcd->rsrc_len = resource_size(res);
> +
> +	histb->hcd = hcd;
> +	dev_set_drvdata(hcd->self.controller, histb);
> +
> +	ret = xhci_histb_host_enable(histb);
> +	if (ret)
> +		goto put_hcd;
> +
> +	xhci = hcd_to_xhci(hcd);
> +
> +	device_wakeup_enable(hcd->self.controller);
> +
> +	xhci->main_hcd = hcd;
> +	xhci->shared_hcd = usb_create_shared_hcd(driver, dev, dev_name(dev),
> +						 hcd);
> +	if (!xhci->shared_hcd) {
> +		ret = -ENOMEM;
> +		goto disable_host;
> +	}
> +
> +	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
> +	if (ret)
> +		goto put_usb3_hcd;
> +
> +	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> +		xhci->shared_hcd->can_do_streams = 1;
> +
> +	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> +	if (ret)
> +		goto dealloc_usb2_hcd;
> +
> +	device_enable_async_suspend(dev);
> +	pm_runtime_put_noidle(dev);
> +
> +	/*
> +	 * Prevent runtime pm from being on as default, users should enable
> +	 * runtime pm using power/control in sysfs.
> +	 */
> +	pm_runtime_forbid(dev);
> +
Are you sure make use of the default value xhci->imod_interval == 0 ?

> +	return 0;
> +
> +dealloc_usb2_hcd:
> +	usb_remove_hcd(hcd);
> +put_usb3_hcd:
> +	usb_put_hcd(xhci->shared_hcd);
> +disable_host:
> +	xhci_histb_host_disable(histb);
> +put_hcd:
> +	usb_put_hcd(hcd);
> +disable_pm:
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +
> +	return ret;
> +}
> +
> +static int xhci_histb_remove(struct platform_device *dev)
> +{
> +	struct xhci_hcd_histb *histb = platform_get_drvdata(dev);
> +	struct usb_hcd *hcd = histb->hcd;
> +	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> +
> +	xhci->xhc_state |= XHCI_STATE_REMOVING;
> +
> +	usb_remove_hcd(xhci->shared_hcd);
> +	device_wakeup_disable(&dev->dev);
> +
> +	usb_remove_hcd(hcd);
> +	usb_put_hcd(xhci->shared_hcd);
> +
> +	xhci_histb_host_disable(histb);
> +	usb_put_hcd(hcd);
> +	pm_runtime_put_sync(&dev->dev);
> +	pm_runtime_disable(&dev->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused xhci_histb_suspend(struct device *dev)
> +{
> +	struct xhci_hcd_histb *histb = dev_get_drvdata(dev);
> +	struct usb_hcd *hcd = histb->hcd;
> +	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> +	int ret;
> +
> +	ret = xhci_suspend(xhci, device_may_wakeup(dev));
> +
> +	if (!device_may_wakeup(dev))
> +		xhci_histb_host_disable(histb);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused xhci_histb_resume(struct device *dev)
> +{
> +	struct xhci_hcd_histb *histb = dev_get_drvdata(dev);
> +	struct usb_hcd *hcd = histb->hcd;
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +
> +	if (!device_may_wakeup(dev))
> +		xhci_histb_host_enable(histb);
> +
> +	return xhci_resume(xhci, 0);
> +}
> +
> +static const struct dev_pm_ops xhci_histb_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(xhci_histb_suspend, xhci_histb_resume)
> +};
> +#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &xhci_histb_pm_ops : NULL)
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id histb_xhci_of_match[] = {
> +	{ .compatible = "hisilicon,hi3798cv200-xhci"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, histb_xhci_of_match);
> +#endif
> +
> +static struct platform_driver histb_xhci_driver = {
> +	.probe	= xhci_histb_probe,
> +	.remove	= xhci_histb_remove,
> +	.driver	= {
> +		.name = "xhci-histb",
> +		.pm = DEV_PM_OPS,
> +		.of_match_table = of_match_ptr(histb_xhci_of_match),
> +	},
> +};
> +MODULE_ALIAS("platform:xhci-histb");
> +
> +static int __init xhci_histb_init(void)
> +{
> +	xhci_init_driver(&xhci_histb_hc_driver, &xhci_histb_overrides);
> +	return platform_driver_register(&histb_xhci_driver);
> +}
> +module_init(xhci_histb_init);
> +
> +static void __exit xhci_histb_exit(void)
> +{
> +	platform_driver_unregister(&histb_xhci_driver);
> +}
> +module_exit(xhci_histb_exit);
> +
> +MODULE_DESCRIPTION("HiSilicon STB xHCI Host Controller Driver");
> +MODULE_LICENSE("GPL v2");


