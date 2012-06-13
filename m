From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [Patch v5 06/13] usb: chipidea: add imx platform driver
Date: Wed, 13 Jun 2012 23:46:22 +0200
Message-ID: <20120613214622.GE30400@pengutronix.de>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
 <1339590863-10564-7-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1339590863-10564-7-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 13, 2012 at 08:34:16PM +0800, Richard Zhao wrote:
> This patch supports only the host-mode functionality so far.
> 
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 +++
>  drivers/usb/chipidea/Makefile                      |    3 +
>  drivers/usb/chipidea/ci13xxx_imx.c                 |  189 ++++++++++++++++++++
>  3 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
>  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> new file mode 100644
> index 0000000..beb75d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> @@ -0,0 +1,20 @@
> +* Freescale i.MX ci13xxx usb controllers
> +
> +Required properties:
> +- compatible: Should be "fsl,imx31-usb"
> +- reg: Should contain registers location and length
> +- interrupts: Should contain controller interrupt
> +
> +Optional properties:
> +- fsl,usbphy: phandler of usb phy that connects to the only one port
> +- fsl,hub-reset-gpios: gpio used to reset on-board usb hub
> +- fsl,vbus-power-gpios: gpio used to set vbus power of the only one port
> +
> +Examples:
> +usb@02184000 { /* USB OTG */
> +	compatible = "fsl,imx6q-usb", "fsl,imx31-usb";

The i.MX27 also has this core. As it's older that's probably the right
fallback instead of i.MX31.

> +	reg = <0x02184000 0x200>;
> +	interrupts = <0 43 0x04>;
> +	fsl,usbphy = <&usbphy1>;
> +	fsl,vbus-power-gpios = <&gpio3 22 0>;
> +};
> diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
> index b69900a..5c66d9c 100644
> --- a/drivers/usb/chipidea/Makefile
> +++ b/drivers/usb/chipidea/Makefile
> @@ -14,3 +14,6 @@ ifneq ($(CONFIG_PCI),)
>  	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_pci.o
>  endif
>  
> +ifneq ($(CONFIG_OF_DEVICE),)
> +	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_imx.o
> +endif
> +
> +static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
> +{
> +	struct ci13xxx_imx_data *data;
> +	struct platform_device *plat_ci, *phy_pdev;
> +	struct device_node *phy_np;
> +	struct resource *res;
> +	struct regulator *reg_vbus;
> +	int ret;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		dev_err(&pdev->dev, "Failed to allocate CI13xxx-IMX data!\n");

Same as in the other patch: This message contains no useful information.

> +		return -ENOMEM;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Can't get device resources!\n");
> +		return -ENOENT;
> +	}
> +
> +	data->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(data->clk)) {
> +		dev_err(&pdev->dev, "Failed to get clock!\n");
> +		return PTR_ERR(data->clk);
> +	}
> +
> +	ret = clk_prepare_enable(data->clk);

You forgot to undo this is the error path.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to prepare or enable clock!\n");
> +		return ret;
> +	}
> +
> +	phy_np = of_parse_phandle(pdev->dev.of_node, "fsl,usbphy", 0);
> +	if (phy_np) {

Ok, we maybe can do without a phy on some devices, but if we have one...

> +		data->phy_np = phy_np;
> +		phy_pdev = of_find_device_by_node(phy_np);
> +		if (phy_pdev) {

... shouldn't it be an error if we do not find the device?

> +			struct usb_phy *phy;
> +			phy = pdev_to_phy(phy_pdev);
> +			if (phy &&
> +			    try_module_get(phy_pdev->dev.driver->owner)) {
> +				usb_phy_init(phy);
> +				data->phy = phy;
> +			}
> +		}
> +	}
> +
> +	/* we only support host now, so enable vbus here */
> +	reg_vbus = devm_regulator_get(&pdev->dev, "vbus");
> +	if (!IS_ERR(reg_vbus)) {
> +		ret = regulator_enable(reg_vbus);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable vbus regulator!\n");
> +			goto put_np;
> +		}
> +		data->reg_vbus = reg_vbus;
> +	} else
> +		reg_vbus = NULL;

If you have braces in one path of a if/else add them to the other path
aswell.

> +
> +	ci13xxx_imx_platdata.phy = data->phy;
> +
> +	if (!pdev->dev.dma_mask) {
> +		pdev->dev.dma_mask = devm_kzalloc(&pdev->dev,
> +				      sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
> +		if (!pdev->dev.dma_mask) {
> +			ret = -ENOMEM;
> +			dev_err(&pdev->dev, "Failed to alloc dma_mask!\n");
> +			goto err;
> +		}
> +		*pdev->dev.dma_mask = DMA_BIT_MASK(32);
> +		dma_set_coherent_mask(&pdev->dev, *pdev->dev.dma_mask);
> +	}

Do you need this? I assume not.

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
