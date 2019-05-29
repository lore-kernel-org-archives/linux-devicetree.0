Return-Path: <SRS0=hIoA=T5=mediatek.com=chunfeng.yun@kernel.org>
Message-ID: <1559117216.8487.22.camel@mhfsdcap03>
Subject: Re: [Patch V3 7/8] usb: gadget: Add UDC driver for tegra XUSB
 device mode controller
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Wed, 29 May 2019 16:06:56 +0800
In-Reply-To: <1836c342-3fc8-7988-c7d4-943619e22df9@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
	 <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
	 <1557997694.10179.343.camel@mhfsdcap03>
	 <1836c342-3fc8-7988-c7d4-943619e22df9@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,  Nagarjuna,
On Fri, 2019-05-24 at 12:20 +0530, Nagarjuna Kristam wrote:
> 
> On 16-05-2019 14:38, Chunfeng Yun wrote:
> > On Thu, 2019-05-16 at 12:09 +0530, Nagarjuna Kristam wrote:
> >> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> >> XUSB device mode controller supports SS, HS and FS modes
> >>
> >> Based on work by:
> >>   Mark Kuo <mkuo@nvidia.com>
> >>   Andrew Bresticker <abrestic@chromium.org>
> >>
> >> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> >> ---
> >>  drivers/usb/gadget/udc/Kconfig      |   10 +
> >>  drivers/usb/gadget/udc/Makefile     |    1 +
> >>  drivers/usb/gadget/udc/tegra_xudc.c | 3807 +++++++++++++++++++++++++++++++++++
> >>  3 files changed, 3818 insertions(+)
> >>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
> >>
> >> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> >> index ef0259a..b35856c 100644
> >> --- a/drivers/usb/gadget/udc/Kconfig
> >> +++ b/drivers/usb/gadget/udc/Kconfig
> >> @@ -440,6 +440,16 @@ config USB_GADGET_XILINX
> >>  	  dynamically linked module called "udc-xilinx" and force all
> >>  	  gadget drivers to also be dynamically linked.
> >>  
> >> +config USB_TEGRA_XUDC
> >> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> >> +	depends on ARCH_TEGRA
> >> +	help
> >> +	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
> >> +
> >> +	 Say "y" to link the driver statically, or "m" to build a
> >> +	 dynamically linked module called "tegra_xudc" and force all
> >> +	 gadget drivers to also be dynamically linked.
> >> +
> >>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
> >>  
[...]

> >> +static int tegra_xudc_probe(struct platform_device *pdev)
> >> +{
> >> +	struct tegra_xudc *xudc;
> >> +	struct resource *res;
> >> +	unsigned int i;
> >> +	int err;
> >> +
> >> +	xudc = devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_ATOMIC);
> >> +	if (!xudc)
> >> +		return -ENOMEM;
> >> +
> >> +	xudc->dev = &pdev->dev;
> >> +	platform_set_drvdata(pdev, xudc);
> >> +
> >> +	xudc->soc = of_device_get_match_data(&pdev->dev);
> >> +	if (!xudc->soc)
> >> +		return -ENODEV;
> >> +
> >> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +	xudc->base = devm_ioremap_resource(&pdev->dev, res);
> >> +	if (IS_ERR(xudc->base))
> >> +		return PTR_ERR(xudc->base);
> >> +	xudc->phys_base = res->start;
> >> +
> >> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> >> +	xudc->fpci = devm_ioremap_resource(&pdev->dev, res);
> >> +	if (IS_ERR(xudc->fpci))
> >> +		return PTR_ERR(xudc->fpci);
> >> +
> >> +	if (xudc->soc->has_ipfs) {
> >> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> >> +		xudc->ipfs = devm_ioremap_resource(&pdev->dev, res);
> >> +		if (IS_ERR(xudc->ipfs))
> >> +			return PTR_ERR(xudc->ipfs);
> >> +	}
> > providing register names will make more clear
> 
> will migrate to platform_get_resource_by_name
> 
> >> +
> >> +	xudc->irq = platform_get_irq(pdev, 0);
> >> +	if (xudc->irq < 0) {
> >> +		dev_err(xudc->dev, "failed to get IRQ: %d\n",
> >> +				xudc->irq);
> >> +		return xudc->irq;
> >> +	}
> >> +
> >> +	err = devm_request_irq(&pdev->dev, xudc->irq, tegra_xudc_irq, 0,
> >> +			       dev_name(&pdev->dev), xudc);
> >> +	if (err < 0) {
> >> +		dev_err(xudc->dev, "failed to claim IRQ#%u: %d\n", xudc->irq,
> >> +			err);
> >> +		return err;
> >> +	}
> >> +
> >> +	xudc->clks = devm_kcalloc(&pdev->dev, xudc->soc->num_clks,
> >> +				      sizeof(*xudc->clks), GFP_KERNEL);
> >> +	if (!xudc->clks)
> >> +		return -ENOMEM;
> >> +
> >> +	for (i = 0; i < xudc->soc->num_clks; i++)
> >> +		xudc->clks[i].id = xudc->soc->clock_names[i];
> >> +
> >> +	err = devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks,
> >> +				      xudc->clks);
> >> +	if (err) {
> >> +		dev_err(xudc->dev, "failed to request clks %d\n", err);
> >> +		return err;
> >> +	}
> >> +
> >> +	xudc->supplies = devm_kcalloc(&pdev->dev, xudc->soc->num_supplies,
> >> +				      sizeof(*xudc->supplies), GFP_KERNEL);
> >> +	if (!xudc->supplies)
> >> +		return -ENOMEM;
> >> +
> >> +	for (i = 0; i < xudc->soc->num_supplies; i++)
> >> +		xudc->supplies[i].supply = xudc->soc->supply_names[i];
> >> +
> >> +	err = devm_regulator_bulk_get(&pdev->dev, xudc->soc->num_supplies,
> >> +				      xudc->supplies);
> >> +	if (err) {
> >> +		dev_err(xudc->dev, "failed to request regulators %d\n", err);
> >> +		return err;
> >> +	}
> >> +
> >> +	xudc->padctl = tegra_xusb_padctl_get(&pdev->dev);
> >> +	if (IS_ERR(xudc->padctl))
> >> +		return PTR_ERR(xudc->padctl);
> >> +
> >> +	err = regulator_bulk_enable(xudc->soc->num_supplies, xudc->supplies);
> >> +	if (err) {
> >> +		dev_err(xudc->dev, "failed to enable regulators %d\n", err);
> >> +		goto put_padctl;
> >> +	}
> >> +
> >> +	xudc->usb3_phy = devm_phy_optional_get(&pdev->dev, "usb3");
> >> +	if (IS_ERR(xudc->usb3_phy)) {
> >> +		err = PTR_ERR(xudc->usb3_phy);
> >> +		dev_err(xudc->dev, "failed to get usb3 phy: %d\n", err);
> >> +		goto disable_regulator;
> >> +	}
> >> +
> >> +	xudc->utmi_phy = devm_phy_optional_get(&pdev->dev, "usb2");
> >> +	if (IS_ERR(xudc->utmi_phy)) {
> >> +		err = PTR_ERR(xudc->utmi_phy);
> >> +		dev_err(xudc->dev, "failed to get usb2 phy: %d\n", err);
> >> +		goto disable_regulator;
> >> +	}
> >> +
> >> +	xudc->data_role_extcon = extcon_get_edev_by_phandle(&pdev->dev, 0);
> > extcon seems not allowed for new USB driver anymore, use usb-connector
> > instead.
> > Try to look into drivers/usb/roles, maybe you also need use USB role
> > switch. Hope it's helpful to you.
> > 
> Purpose of using extcon is to get hot plug interrupts.
> Going through usb-connector dt-document doesnot provide fucntionlity of
> generating a hot-plug interrupts of its own.
> based on documentation for usb-sw-role driver in drivers/usb/roles is needed
> when a mux switch is used. It is not needeed for current driver.
> 
> Please share your inputs, if purpose of generating hot-plug interrupts can be met
> using usb-connector, with out any additional driver.
Sorry for the late reply.

I introduce a new driver using usb-connector, and try to replace the
function of extcon-usb-gpio.c, but still under review, you can try it.

[v6,09/10] usb: roles: add USB Type-B GPIO connector driver
https://patchwork.kernel.org/patch/10966361/

If you have any good idea, please let me know, thanks a lot

> 
> -Nagarjuna
> >> +	if (IS_ERR(xudc->data_role_extcon)) {
> >> +		err = PTR_ERR(xudc->data_role_extcon);
> >> +		dev_err(xudc->dev, "extcon_get_edev_by_phandle failed %d\n",
> >> +				err);
> >> +		goto disable_regulator;
> >> +	}
> >> +
> >> +	err = tegra_xudc_powerdomain_init(xudc);
> >> +	if (err)
> >> +		goto put_powerdomains;
> >> +
> >> +	err = tegra_xudc_phy_init(xudc);
> >> +	if (err)
> >> +		goto put_powerdomains;
> >> +
> >> +	err = tegra_xudc_alloc_event_ring(xudc);
> >> +	if (err)
> >> +		goto disable_phy;
> >> +
> >> +	err = tegra_xudc_alloc_eps(xudc);
> >> +	if (err)
> >> +		goto free_event_ring;
> >> +
> >> +	spin_lock_init(&xudc->lock);
> >> +
> >> +	init_completion(&xudc->disconnect_complete);
> >> +
> >> +	INIT_WORK(&xudc->data_role_work, tegra_xudc_data_role_work);
> >> +
> >> +	xudc->data_role_nb.notifier_call = tegra_xudc_data_role_notifier;
> >> +
> >> +	extcon_register_notifier(xudc->data_role_extcon, EXTCON_USB,
> >> +				 &xudc->data_role_nb);
> >> +
> >> +	INIT_DELAYED_WORK(&xudc->plc_reset_work, tegra_xudc_plc_reset_work);
> >> +
> >> +	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
> >> +				tegra_xudc_port_reset_war_work);
> >> +
> >> +	pm_runtime_enable(&pdev->dev);
> >> +
> >> +	xudc->gadget.ops = &tegra_xudc_gadget_ops;
> >> +	xudc->gadget.ep0 = &xudc->ep[0].usb_ep;
> >> +	xudc->gadget.name = "tegra-xudc";
> >> +	xudc->gadget.max_speed = USB_SPEED_SUPER;
> >> +
> >> +	err = usb_add_gadget_udc(&pdev->dev, &xudc->gadget);
> >> +	if (err) {
> >> +		dev_err(&pdev->dev, "failed to add USB gadget: %d\n", err);
> >> +		goto free_eps;
> >> +	}
> >> +
> >> +	tegra_xudc_update_data_role(xudc);
> >> +
> >> +	return 0;
> >> +
> >> +free_eps:
> >> +	tegra_xudc_free_eps(xudc);
> >> +free_event_ring:
> >> +	tegra_xudc_free_event_ring(xudc);
> >> +disable_phy:
> >> +	tegra_xudc_phy_exit(xudc);
> >> +put_powerdomains:
> >> +	tegra_xudc_powerdomain_remove(xudc);
> >> +disable_regulator:
> >> +	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
> >> +put_padctl:
> >> +	tegra_xusb_padctl_put(xudc->padctl);
> >> +
> >> +	return err;
> >> +}
> >> +
> >> +static int tegra_xudc_remove(struct platform_device *pdev)
> >> +{
> >> +	struct tegra_xudc *xudc = platform_get_drvdata(pdev);
> >> +
> >> +	pm_runtime_get_sync(xudc->dev);
> >> +
> >> +	cancel_delayed_work(&xudc->plc_reset_work);
> >> +	if (xudc->data_role_extcon) {
> >> +		extcon_unregister_notifier(xudc->data_role_extcon, EXTCON_USB,
> >> +				&xudc->data_role_nb);
> >> +		cancel_work_sync(&xudc->data_role_work);
> >> +	}
> >> +
> >> +	usb_del_gadget_udc(&xudc->gadget);
> >> +
> >> +	tegra_xudc_free_eps(xudc);
> >> +	tegra_xudc_free_event_ring(xudc);
> >> +
> >> +	tegra_xudc_powerdomain_remove(xudc);
> >> +
> >> +	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
> >> +
> >> +	phy_power_off(xudc->utmi_phy);
> >> +	phy_power_off(xudc->usb3_phy);
> >> +
> >> +	tegra_xudc_phy_exit(xudc);
> >> +
> >> +	pm_runtime_disable(xudc->dev);
> >> +	pm_runtime_put(xudc->dev);
> >> +
> >> +	tegra_xusb_padctl_put(xudc->padctl);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int __maybe_unused tegra_xudc_powergate(struct tegra_xudc *xudc)
> >> +{
> >> +	unsigned long flags;
> >> +
> >> +	dev_dbg(xudc->dev, "entering ELPG\n");
> >> +
> >> +	spin_lock_irqsave(&xudc->lock, flags);
> >> +
> >> +	xudc->powergated = true;
> >> +	xudc->saved_regs.ctrl = xudc_readl(xudc, CTRL);
> >> +	xudc->saved_regs.portpm = xudc_readl(xudc, PORTPM);
> >> +	xudc_writel(xudc, 0, CTRL);
> >> +
> >> +	spin_unlock_irqrestore(&xudc->lock, flags);
> >> +
> >> +	clk_bulk_disable_unprepare(xudc->soc->num_clks, xudc->clks);
> >> +
> >> +	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
> >> +
> >> +	dev_dbg(xudc->dev, "entering ELPG done\n");
> >> +	return 0;
> >> +}
> >> +
> >> +static int __maybe_unused tegra_xudc_unpowergate(struct tegra_xudc *xudc)
> >> +{
> >> +	unsigned long flags;
> >> +	int err;
> >> +
> >> +	dev_dbg(xudc->dev, "exiting ELPG\n");
> >> +
> >> +	err = regulator_bulk_enable(xudc->soc->num_supplies,
> >> +			xudc->supplies);
> >> +	if (err < 0)
> >> +		return err;
> >> +
> >> +	err = clk_bulk_prepare_enable(xudc->soc->num_clks, xudc->clks);
> >> +	if (err < 0)
> >> +		return err;
> >> +
> >> +	tegra_xudc_fpci_ipfs_init(xudc);
> >> +
> >> +	tegra_xudc_device_params_init(xudc);
> >> +
> >> +	tegra_xudc_init_event_ring(xudc);
> >> +
> >> +	tegra_xudc_init_eps(xudc);
> >> +
> >> +	xudc_writel(xudc, xudc->saved_regs.portpm, PORTPM);
> >> +	xudc_writel(xudc, xudc->saved_regs.ctrl, CTRL);
> >> +
> >> +	spin_lock_irqsave(&xudc->lock, flags);
> >> +	xudc->powergated = false;
> >> +	spin_unlock_irqrestore(&xudc->lock, flags);
> >> +
> >> +	dev_dbg(xudc->dev, "exiting ELPG done\n");
> >> +	return 0;
> >> +}
> >> +
> >> +static int __maybe_unused tegra_xudc_suspend(struct device *dev)
> >> +{
> >> +	struct tegra_xudc *xudc = dev_get_drvdata(dev);
> >> +	unsigned long flags;
> >> +
> >> +	spin_lock_irqsave(&xudc->lock, flags);
> >> +	xudc->suspended = true;
> >> +	spin_unlock_irqrestore(&xudc->lock, flags);
> >> +
> >> +	if (xudc->data_role_extcon)
> >> +		flush_work(&xudc->data_role_work);
> >> +
> >> +	/* Forcibly disconnect before powergating. */
> >> +	tegra_xudc_device_mode_off(xudc);
> >> +
> >> +	if (!pm_runtime_status_suspended(dev))
> >> +		tegra_xudc_powergate(xudc);
> >> +
> >> +	pm_runtime_disable(dev);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int __maybe_unused tegra_xudc_resume(struct device *dev)
> >> +{
> >> +	struct tegra_xudc *xudc = dev_get_drvdata(dev);
> >> +	unsigned long flags;
> >> +	int err;
> >> +
> >> +	err = tegra_xudc_unpowergate(xudc);
> >> +	if (err < 0)
> >> +		return err;
> >> +
> >> +	spin_lock_irqsave(&xudc->lock, flags);
> >> +	xudc->suspended = false;
> >> +	spin_unlock_irqrestore(&xudc->lock, flags);
> >> +
> >> +	tegra_xudc_update_data_role(xudc);
> >> +
> >> +	pm_runtime_enable(dev);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int __maybe_unused tegra_xudc_runtime_suspend(struct device *dev)
> >> +{
> >> +	struct tegra_xudc *xudc = dev_get_drvdata(dev);
> >> +
> >> +	return tegra_xudc_powergate(xudc);
> >> +}
> >> +
> >> +static int __maybe_unused tegra_xudc_runtime_resume(struct device *dev)
> >> +{
> >> +	struct tegra_xudc *xudc = dev_get_drvdata(dev);
> >> +
> >> +	return tegra_xudc_unpowergate(xudc);
> >> +}
> >> +
> >> +static const struct dev_pm_ops tegra_xudc_pm_ops = {
> >> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_xudc_suspend, tegra_xudc_resume)
> >> +	SET_RUNTIME_PM_OPS(tegra_xudc_runtime_suspend,
> >> +			   tegra_xudc_runtime_resume, NULL)
> >> +};
> >> +
> >> +static struct platform_driver tegra_xudc_driver = {
> >> +	.probe = tegra_xudc_probe,
> >> +	.remove = tegra_xudc_remove,
> >> +	.driver = {
> >> +		.name = "tegra-xudc",
> >> +		.pm = &tegra_xudc_pm_ops,
> >> +		.of_match_table = tegra_xudc_of_match,
> >> +	},
> >> +};
> >> +module_platform_driver(tegra_xudc_driver);
> >> +
> >> +MODULE_DESCRIPTION("NVIDIA Tegra XUSB Device Controller");
> >> +MODULE_AUTHOR("Andrew Bresticker <abrestic@chromium.org>");
> >> +MODULE_AUTHOR("Hui Fu");
> >> +MODULE_LICENSE("GPL v2");
> > 
> > 
