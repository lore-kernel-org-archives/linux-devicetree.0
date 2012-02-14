From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: at91: usb ohci add dt support
Date: Tue, 14 Feb 2012 14:02:59 -0700
Message-ID: <20120214210259.GC2656@ponder.secretlab.ca>
References: <1329235109-6688-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329235109-6688-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 14, 2012 at 04:58:26PM +0100, Jean-Christophe PLAGNIOL-VILLARD wrote:
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Hi Greg,
> 
> 	I you don't mind I'll apply this via at91 tree as it's part a DT USB
> 	patch series
> 
> Best Regards,
> J.
>  .../devicetree/bindings/usb/atmel-usb.txt          |   19 ++++
>  drivers/usb/host/ohci-at91.c                       |  101 +++++++++++++++++++-
>  2 files changed, 119 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/atmel-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> new file mode 100644
> index 0000000..6c7f728
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -0,0 +1,19 @@
> +Atmel SOC USB controllers
> +
> +OHCI
> +
> +Required properties:
> + - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
> +   used in host mode.
> + - num-ports: Number of ports.
> + - atmel,vbus-gpio: If present, specifies a gpio that needs to be
> +   activated for the bus to be powered.
> + - atmel,oc-gpio: If present, specifies a gpio that needs to be
> +   activated for the overcurrent detection.
> +
> +usb0: ohci@00500000 {
> +	compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> +	reg = <0x00500000 0x100000>;
> +	interrupts = <20 4>;
> +	num-ports = <2>;
> +};
> diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
> index 8e855eb..718f138 100644
> --- a/drivers/usb/host/ohci-at91.c
> +++ b/drivers/usb/host/ohci-at91.c
> @@ -14,6 +14,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_gpio.h>
>  
>  #include <mach/hardware.h>
>  #include <asm/gpio.h>
> @@ -477,13 +479,109 @@ static irqreturn_t ohci_hcd_at91_overcurrent_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id at91_ohci_dt_ids[] = {
> +	{ .compatible = "atmel,at91rm9200-ohci" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, at91_ohci_dt_ids);
> +
> +static u64 at91_ohci_dma_mask = DMA_BIT_MASK(32);
> +
> +static int __devinit ohci_at91_of_init(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	int i, ret, gpio;
> +	enum of_gpio_flags flags;
> +	struct at91_usbh_data	*pdata;
> +	u32 ports;
> +
> +	if (!np)
> +		return 0;
> +
> +	/* Right now device-tree probed devices don't get dma_mask set.
> +	 * Since shared usb code relies on it, set it here for now.
> +	 * Once we have dma capability bindings this can go away.
> +	 */
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &at91_ohci_dma_mask;
> +
> +	pdata = kzalloc(sizeof(struct at91_usbh_data), GFP_KERNEL);

devm_kzalloc()

Otherwise looks good to me.

g.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
