From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] sm501: Add device property
Date: Mon, 4 Jul 2016 15:40:43 +0100
Message-ID: <20160704144043.GC9048@leverpostej>
References: <1467642364-10316-1-git-send-email-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467642364-10316-1-git-send-email-ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 04, 2016 at 11:26:04PM +0900, Yoshinori Sato wrote:
> Add device proptery on enable integrated peripheral.
> It have platform_data. But don't have devicetree.
> 
> Signed-off-by: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
> ---
>  .../devicetree/bindings/display/sm501fb.txt        | 11 +++++++++
>  drivers/mfd/sm501.c                                | 28 +++++++++++++---------
>  2 files changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sm501fb.txt b/Documentation/devicetree/bindings/display/sm501fb.txt
> index 9d9f009..9290094 100644
> --- a/Documentation/devicetree/bindings/display/sm501fb.txt
> +++ b/Documentation/devicetree/bindings/display/sm501fb.txt
> @@ -22,6 +22,17 @@ Optional properties:
>    set different foreign endian.
>  - big-endian: available on little endian systems, to
>    set different foreign endian.
> +- smi,devices: function block enable bitmap.
> +	bit0: USB host
> +	bit1: USB slave
> +	bit2: SSP Ch0
> +	bit3: SSP Ch1
> +	bit4: UART Ch0
> +	bit5: UART Ch1
> +	bit6: Accelerator
> +	bit7: AC97
> +	bit8: I2S
> +	bit9: GPIO

Generally we don't place bitmaps like this in DT.

What exactly does this property represent? Whether certain sub-blocks
are present?

These should probably be separate has-${FOO} proeprties. It may be
better to have separate nodes, if we'e going to need to refer to sub
blocks by phandle, or are liekly to have peropties specific to a sub
block.

Thanks,
Mark.

>  Example for MPC5200:
>  	display@1,0 {
> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index 65cd0d2..e8c6a5e 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -21,6 +21,7 @@
>  #include <linux/pci.h>
>  #include <linux/i2c-gpio.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
>  
>  #include <linux/sm501.h>
>  #include <linux/sm501-regs.h>
> @@ -1297,7 +1298,7 @@ static unsigned int sm501_mem_local[] = {
>   * Common init code for an SM501
>  */
>  
> -static int sm501_init_dev(struct sm501_devdata *sm)
> +static int sm501_init_dev(struct sm501_devdata *sm, unsigned int devices)
>  {
>  	struct sm501_initdata *idata;
>  	struct sm501_platdata *pdata;
> @@ -1342,16 +1343,15 @@ static int sm501_init_dev(struct sm501_devdata *sm)
>  	pdata = sm->platdata;
>  	idata = pdata ? pdata->init : NULL;
>  
> -	if (idata) {
> +	if (idata)
>  		sm501_init_regs(sm, idata);
>  
> -		if (idata->devices & SM501_USE_USB_HOST)
> -			sm501_register_usbhost(sm, &mem_avail);
> -		if (idata->devices & (SM501_USE_UART0 | SM501_USE_UART1))
> -			sm501_register_uart(sm, idata->devices);
> -		if (idata->devices & SM501_USE_GPIO)
> -			sm501_register_gpio(sm);
> -	}
> +	if (devices & SM501_USE_USB_HOST)
> +		sm501_register_usbhost(sm, &mem_avail);
> +	if (devices & (SM501_USE_UART0 | SM501_USE_UART1))
> +		sm501_register_uart(sm, devices);
> +	if (devices & SM501_USE_GPIO)
> +		sm501_register_gpio(sm);
>  
>  	if (pdata && pdata->gpio_i2c != NULL && pdata->gpio_i2c_nr > 0) {
>  		if (!sm501_gpio_isregistered(sm))
> @@ -1377,6 +1377,7 @@ static int sm501_plat_probe(struct platform_device *dev)
>  {
>  	struct sm501_devdata *sm;
>  	int ret;
> +	unsigned int devices = 0;
>  
>  	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
>  	if (sm == NULL) {
> @@ -1415,6 +1416,11 @@ static int sm501_plat_probe(struct platform_device *dev)
>  	}
>  
>  	platform_set_drvdata(dev, sm);
> +	if (sm->platdata)
> +		devices = sm->platdata->init->devices;
> +	if (dev->dev.of_node)
> +		of_property_read_u32(dev->dev.of_node, "smi,devices",
> +				     &devices);
>  
>  	sm->regs = ioremap(sm->io_res->start, resource_size(sm->io_res));
>  
> @@ -1424,7 +1430,7 @@ static int sm501_plat_probe(struct platform_device *dev)
>  		goto err_claim;
>  	}
>  
> -	return sm501_init_dev(sm);
> +	return sm501_init_dev(sm, devices);
>  
>   err_claim:
>  	release_resource(sm->regs_claim);
> @@ -1635,7 +1641,7 @@ static int sm501_pci_probe(struct pci_dev *dev,
>  		goto err4;
>  	}
>  
> -	sm501_init_dev(sm);
> +	sm501_init_dev(sm, sm->platdata->init->devices);
>  	return 0;
>  
>   err4:
> -- 
> 2.7.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
