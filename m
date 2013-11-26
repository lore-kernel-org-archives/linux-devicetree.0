From: Andre Heider <a.heider-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] staging: dwc2: set up all module params
Date: Tue, 26 Nov 2013 13:01:46 +0100
Message-ID: <20131126120146.GA31736@localhost>
References: <1385442150-23561-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385442150-23561-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 25, 2013 at 10:02:30PM -0700, Stephen Warren wrote:
> The DWC2 USB controller in the BCM2835 (Raspberry Pi) needs some non-
> default parameters. Select these based on the compatible value from the
> DT node. For all other HW, fall back to the default parameters currently
> in use.
> 
> The values in params_bcm2835[] were posted to the mailing list by Paul
> quite some time ago. I made a couple of minor modifications since then;
> to set ahbcfg instead of ahb_single, and to set uframe_sched.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/staging/dwc2.txt |    4 +-
>  drivers/staging/dwc2/platform.c                    |   56 ++++++++++++++++----
>  2 files changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/staging/dwc2.txt b/Documentation/devicetree/bindings/staging/dwc2.txt
> index 1a1b7cf..8b60e90 100644
> --- a/Documentation/devicetree/bindings/staging/dwc2.txt
> +++ b/Documentation/devicetree/bindings/staging/dwc2.txt
> @@ -2,7 +2,9 @@ Platform DesignWare HS OTG USB 2.0 controller
>  -----------------------------------------------------
>  
>  Required properties:
> -- compatible : "snps,dwc2"
> +- compatible : One of:
> +  - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
> +  - snps,dwc2: A generic DWC2 USB controller with default parameters.
>  - reg : Should contain 1 register range (address and length)
>  - interrupts : Should contain 1 interrupt
>  
> diff --git a/drivers/staging/dwc2/platform.c b/drivers/staging/dwc2/platform.c
> index 4d9fac0..20586dc 100644
> --- a/drivers/staging/dwc2/platform.c
> +++ b/drivers/staging/dwc2/platform.c
> @@ -39,6 +39,7 @@
>  #include <linux/slab.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> @@ -46,6 +47,33 @@
>  
>  static const char dwc2_driver_name[] = "dwc2";
>  
> +static const struct dwc2_core_params params_bcm2835 = {
> +	.otg_cap			= 0,	/* HNP/SRP capable */
> +	.otg_ver			= 0,	/* 1.3 */
> +	.dma_enable			= 1,
> +	.dma_desc_enable		= 0,
> +	.speed				= 0,	/* High Speed */
> +	.enable_dynamic_fifo		= 1,
> +	.en_multiple_tx_fifo		= 1,
> +	.host_rx_fifo_size		= 774,	/* 774 DWORDs */
> +	.host_nperio_tx_fifo_size	= 256,	/* 256 DWORDs */
> +	.host_perio_tx_fifo_size	= 512,	/* 512 DWORDs */
> +	.max_transfer_size		= 65535,
> +	.max_packet_count		= 511,
> +	.host_channels			= 8,
> +	.phy_type			= 1,	/* UTMI */
> +	.phy_utmi_width			= 8,	/* 8 bits */
> +	.phy_ulpi_ddr			= 0,	/* Single */
> +	.phy_ulpi_ext_vbus		= 0,
> +	.i2c_enable			= 0,
> +	.ulpi_fs_ls			= 0,
> +	.host_support_fs_ls_low_power	= 0,
> +	.host_ls_low_power_phy_clk	= 0,	/* 48 MHz */
> +	.ts_dline			= 0,
> +	.reload_ctl			= 0,
> +	.ahbcfg				= 0x10,
> +};
> +
>  /**
>   * dwc2_driver_remove() - Called when the DWC_otg core is unregistered with the
>   * DWC_otg driver
> @@ -66,6 +94,13 @@ static int dwc2_driver_remove(struct platform_device *dev)
>  	return 0;
>  }
>  
> +static const struct of_device_id dwc2_of_match_table[] = {
> +	{ .compatible = "brcm,bcm2835-usb", .data = &params_bcm2835 },
> +	{ .compatible = "snps,dwc2", .data = NULL },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
> +
>  /**
>   * dwc2_driver_probe() - Called when the DWC_otg core is bound to the DWC_otg
>   * driver
> @@ -80,14 +115,23 @@ static int dwc2_driver_remove(struct platform_device *dev)
>   */
>  static int dwc2_driver_probe(struct platform_device *dev)
>  {
> +	const struct of_device_id *match;
> +	const struct dwc2_core_params *params;
> +	struct dwc2_core_params defparams;
>  	struct dwc2_hsotg *hsotg;
>  	struct resource *res;
>  	int retval;
>  	int irq;
> -	struct dwc2_core_params params;
> +
> +	match = of_match_device(dwc2_of_match_table, &dev->dev);
> +	if (match)
> +		params = match->data;
> +	else {
> +		dwc2_set_all_params(&defparams, -1);
> +		params = &defparams;
> +	}

If that matches "snps,dwc2", params will be NULL instead of the default set, which I guess was not your intention?

>  
>  	/* Default all params to autodetect */
> -	dwc2_set_all_params(&params, -1);

The comment can be moved too.

>  
>  	hsotg = devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
>  	if (!hsotg)
> @@ -118,7 +162,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
>  	dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
>  		(unsigned long)res->start, hsotg->regs);
>  
> -	retval = dwc2_hcd_init(hsotg, irq, &params);
> +	retval = dwc2_hcd_init(hsotg, irq, params);
>  	if (retval)
>  		return retval;
>  
> @@ -127,12 +171,6 @@ static int dwc2_driver_probe(struct platform_device *dev)
>  	return retval;
>  }
>  
> -static const struct of_device_id dwc2_of_match_table[] = {
> -	{ .compatible = "snps,dwc2" },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
> -
>  static struct platform_driver dwc2_platform_driver = {
>  	.driver = {
>  		.name = dwc2_driver_name,
> -- 
> 1.7.10.4
> 
> _______________________________________________
> devel mailing list
> devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
