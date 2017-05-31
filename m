From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: max3421-hcd: Add devicetree support to the
 driver
Date: Wed, 31 May 2017 14:03:32 -0500
Message-ID: <20170531190332.hmyshg7agkmr3hrj@rob-hp-laptop>
References: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
 <420c4f42ade4fd33fb8ad00fa54552f1@amelkin.msk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <420c4f42ade4fd33fb8ad00fa54552f1-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Amelkin <alexander-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 02:28:24PM +0300, Alexander Amelkin wrote:
> NOTE:
> Please don't use the plain text here as a patch because it most probably is
> corrupted by my webmail client.
> Attached is a copy of the following text guaranteed to have correct
> tabs/spaces.
> -------------------------

Huh?

> 
> Before this patch the max3421-hcd driver could only use
> statically linked platform data to initialize its parameters.
> This prevented it from being used on systems using device
> tree.
> 
> The data taken from the device tree is put into dev->platform_data
> when CONFIG_OF is enabled and the device is an OpenFirmware node.
> 
> The driver's 'compatible' string is 'maxim,max3421'
> 
> Binding documentation is also added with this patch.

Please split binding to a separate patch.

> 
> Signed-off-by: Alexander Amelkin <alexander-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/maxim,max3421-hcd.txt  | 19 +++++

Drop the "-hcd"

>  drivers/usb/host/max3421-hcd.c                     | 96
> ++++++++++++++++++++--
>  2 files changed, 110 insertions(+), 5 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> b/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> new file mode 100644
> index 0000000..a8b9faa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> @@ -0,0 +1,19 @@
> +* SPI-based USB host controller Maxim Integrated max3421e
> +
> +Required properties:
> +- compatible: must be "maxim,max3421"
> +- reg: chip select number to which the max3421 chip is connected
> +  (depends on master SPI controller)
> +- spi-max-frequency: the operational frequency, must not exceed <26000000>
> +- interrupt-parent: phandle of the associated GPIO controller to which the
> INT line

Some line wrapping problems...

While typically an interrupt to a board level device is a GPIO, that's 
outside the scope of this binding. For this binding, it is just an 
interrupt line.

> +  of max3421e chip is connected
> +- interrupts: specification of the GPIO pin (in terms of the
> `interrupt-parent`)
> +  to which INT line of max3421e chip is connected.
> +  The driver configures MAX3421E for active low level triggered interrupts.
> +  Configure your 'interrupt-parent' gpio controller accordingly.

This is wrong. The flags cell tells how to configure the interrupt.

> +- vbus: <GPOUTx ACTIVE_LEVEL>
> +  GPOUTx is the number (1-8) of GPOUT pin of max3421e used to drive Vbus.
> +  ACTIVE_LEVEL is 1 or 0.

Just "vbus" could be a lot of things. Perhaps "maxim,vbus-en-pin".

> +
> +Don't forget to add pinctrl properties if you need some GPIO pins
> reconfigured
> +for use as INT. See binding information for the pinctrl nodes.

List the properties as optional.

> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 369869a..f600052 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -61,6 +61,12 @@
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> 
> +#if defined(CONFIG_OF)
> +#include <linux/of_device.h>

Probably should be of.h instead.

> +
> +#define MAX3421_GPOUT_COUNT 8
> +#endif

Don't need an ifdef here.

> +
>  #include <linux/platform_data/max3421-hcd.h>
> 
>  #define DRIVER_DESC    "MAX3421 USB Host-Controller Driver"
> @@ -1699,6 +1705,10 @@ max3421_hub_control(struct usb_hcd *hcd, u16
> type_req, u16 value, u16 index,
>     spin_lock_irqsave(&max3421_hcd->lock, flags);
> 
>     pdata = spi->dev.platform_data;
> +   if (!pdata) {
> +       dev_err(&spi->dev, "Device platform data is missing\n");
> +       return -EFAULT;
> +   }
> 
>     switch (type_req) {
>     case ClearHubFeature:
> @@ -1831,20 +1841,80 @@ static struct hc_driver max3421_hcd_desc = {
>     .bus_resume =       max3421_bus_resume,
>  };
> 
> +#if defined(CONFIG_OF)
> +static struct max3421_hcd_platform_data max3421_data;
> +
> +static const struct of_device_id max3421_dt_ids[] = {
> +   { .compatible = "maxim,max3421", .data = &max3421_data, },
> +   { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, max3421_dt_ids);
> +#endif
> +
>  static int
>  max3421_probe(struct spi_device *spi)
>  {
>     struct max3421_hcd *max3421_hcd;
>     struct usb_hcd *hcd = NULL;
>     int retval = -ENOMEM;
> +#if defined(CONFIG_OF)
> +   struct max3421_hcd_platform_data *pdata = NULL;
> +#endif
> 
>     if (spi_setup(spi) < 0) {
>         dev_err(&spi->dev, "Unable to setup SPI bus");
>         return -EFAULT;
>     }
> 
> -   hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev,
> -                dev_name(&spi->dev));
> +   if (!spi->irq) {
> +       dev_err(&spi->dev, "Failed to get SPI IRQ for node '%s'\n",
> spi->dev.of_node->full_name);
> +       return -EFAULT;
> +   }
> +
> +#if defined(CONFIG_OF)
> +   if (spi->dev.of_node) {

if (IS_ENABLED(CONFIG_OF) && spi->dev.of_node)

> +       /* A temporary alias structure */
> +       union {
> +           uint32_t value[2];
> +           struct {
> +               uint32_t gpout;
> +               uint32_t active_level;
> +           };
> +       } vbus;
> +
> +       if(!(pdata = devm_kzalloc(&spi->dev, sizeof(*pdata), GFP_KERNEL))) {
> +           dev_err(&spi->dev, "failed to allocate memory for private
> data\n");
> +           retval = -ENOMEM;
> +           goto error;
> +       }
> +       spi->dev.platform_data = pdata;
> +
> +       if ((retval = of_property_read_u32_array(spi->dev.of_node, "vbus",
> vbus.value, 2))) {
> +           dev_err(&spi->dev, "device tree node property 'vbus' is
> missing\n");
> +           goto error;
> +       }
> +       pdata->vbus_gpout = vbus.gpout;
> +       pdata->vbus_active_level = vbus.active_level;
> +   }
> +   else
> +#endif
> +   pdata = spi->dev.platform_data;
> +   if (!pdata) {
> +       dev_err(&spi->dev, "driver configuration data is not provided\n");
> +       retval = -EFAULT;
> +       goto error;
> +   }
> +   if (pdata->vbus_active_level > 1) {
> +       dev_err(&spi->dev, "vbus active level value %d is out of range
> (0/1)\n", pdata->vbus_active_level);
> +       retval = -EINVAL;
> +       goto error;
> +   }
> +   if (pdata->vbus_gpout < 1 || pdata->vbus_gpout > MAX3421_GPOUT_COUNT) {
> +       dev_err(&spi->dev, "vbus gpout value %d is out of range (1..8)\n",
> pdata->vbus_gpout);
> +       retval = -EINVAL;
> +       goto error;
> +   }
> +   hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev, dev_name(&spi->dev));
>     if (!hcd) {
>         dev_err(&spi->dev, "failed to create HCD structure\n");
>         goto error;
> @@ -1892,6 +1962,12 @@ max3421_probe(struct spi_device *spi)
>             kthread_stop(max3421_hcd->spi_thread);
>         usb_put_hcd(hcd);
>     }
> +#if defined(CONFIG_OF)
> +   if (pdata && spi->dev.platform_data == pdata) {

IS_ENABLED...

> +       devm_kfree(&spi->dev, pdata);
> +       spi->dev.platform_data = NULL;
> +   }
> +#endif
>     return retval;
>  }
> 
> @@ -1908,14 +1984,12 @@ max3421_remove(struct spi_device *spi)
>         if (hcd->self.controller == &spi->dev)
>             break;
>     }
> +

Spurious change.

>     if (!max3421_hcd) {
>         dev_err(&spi->dev, "no MAX3421 HCD found for SPI device %p\n",
>             spi);
>         return -ENODEV;
>     }
> -
> -   usb_remove_hcd(hcd);
> -
>     spin_lock_irqsave(&max3421_hcd->lock, flags);
> 
>     kthread_stop(max3421_hcd->spi_thread);
> @@ -1923,8 +1997,19 @@ max3421_remove(struct spi_device *spi)
> 
>     spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> 
> +#if defined(CONFIG_OF)
> +   if (spi->dev.platform_data) {
> +       dev_dbg(&spi->dev, "Freeing platform data structure\n");
> +       devm_kfree(&spi->dev, spi->dev.platform_data);
> +       spi->dev.platform_data = NULL;
> +   }
> +#endif
> +
>     free_irq(spi->irq, hcd);
> 
> +   usb_remove_hcd(hcd);
> +
> +

One blank line.

>     usb_put_hcd(hcd);
>     return 0;
>  }
> @@ -1934,6 +2019,7 @@ static struct spi_driver max3421_driver = {
>     .remove     = max3421_remove,
>     .driver     = {
>         .name   = "max3421-hcd",
> +       .of_match_table = of_match_ptr(max3421_dt_ids),
>     },
>  };
> 
> --
> 2.7.4

> From 0eb4464398c8b0a336aa0305724b4b84ef2be097 Mon Sep 17 00:00:00 2001
> From: Alexander Amelkin <amelkin-0pd1rHjVOVEvJsYlp49lxw@public.gmane.org>
> Date: Tue, 28 Mar 2017 20:59:06 +0300
> Subject: [PATCH 1/3] usb: max3421-hcd: Add devicetree support to the driver
> 
> Before this patch the max3421-hcd driver could only use
> statically linked platform data to initialize its parameters.
> This prevented it from being used on systems using device
> tree.
> 
> The data taken from the device tree is put into dev->platform_data
> when CONFIG_OF is enabled and the device is an OpenFirmware node.
> 
> The driver's 'compatible' string is 'maxim,max3421'
> 
> Binding documentation is also added with this patch.
> 
> Signed-off-by: Alexander Amelkin <alexander-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/maxim,max3421-hcd.txt  | 19 +++++
>  drivers/usb/host/max3421-hcd.c                     | 96 ++++++++++++++++++++--
>  2 files changed, 110 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt b/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> new file mode 100644
> index 0000000..a8b9faa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
> @@ -0,0 +1,19 @@
> +* SPI-based USB host controller Maxim Integrated max3421e
> +
> +Required properties:
> +- compatible: must be "maxim,max3421"
> +- reg: chip select number to which the max3421 chip is connected
> +  (depends on master SPI controller)
> +- spi-max-frequency: the operational frequency, must not exceed <26000000>
> +- interrupt-parent: phandle of the associated GPIO controller to which the INT line
> +  of max3421e chip is connected
> +- interrupts: specification of the GPIO pin (in terms of the `interrupt-parent`)
> +  to which INT line of max3421e chip is connected.
> +  The driver configures MAX3421E for active low level triggered interrupts.
> +  Configure your 'interrupt-parent' gpio controller accordingly.
> +- vbus: <GPOUTx ACTIVE_LEVEL>
> +  GPOUTx is the number (1-8) of GPOUT pin of max3421e used to drive Vbus.
> +  ACTIVE_LEVEL is 1 or 0.
> +
> +Don't forget to add pinctrl properties if you need some GPIO pins reconfigured
> +for use as INT. See binding information for the pinctrl nodes.
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 369869a..f600052 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -61,6 +61,12 @@
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  
> +#if defined(CONFIG_OF)
> +#include <linux/of_device.h>
> +
> +#define MAX3421_GPOUT_COUNT 8
> +#endif
> +
>  #include <linux/platform_data/max3421-hcd.h>
>  
>  #define DRIVER_DESC	"MAX3421 USB Host-Controller Driver"
> @@ -1699,6 +1705,10 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
>  	spin_lock_irqsave(&max3421_hcd->lock, flags);
>  
>  	pdata = spi->dev.platform_data;
> +	if (!pdata) {
> +		dev_err(&spi->dev, "Device platform data is missing\n");
> +		return -EFAULT;
> +	}
>  
>  	switch (type_req) {
>  	case ClearHubFeature:
> @@ -1831,20 +1841,80 @@ static struct hc_driver max3421_hcd_desc = {
>  	.bus_resume =		max3421_bus_resume,
>  };
>  
> +#if defined(CONFIG_OF)
> +static struct max3421_hcd_platform_data max3421_data;
> +
> +static const struct of_device_id max3421_dt_ids[] = {
> +	{ .compatible = "maxim,max3421", .data = &max3421_data, },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, max3421_dt_ids);
> +#endif
> +
>  static int
>  max3421_probe(struct spi_device *spi)
>  {
>  	struct max3421_hcd *max3421_hcd;
>  	struct usb_hcd *hcd = NULL;
>  	int retval = -ENOMEM;
> +#if defined(CONFIG_OF)
> +	struct max3421_hcd_platform_data *pdata = NULL;
> +#endif
>  
>  	if (spi_setup(spi) < 0) {
>  		dev_err(&spi->dev, "Unable to setup SPI bus");
>  		return -EFAULT;
>  	}
>  
> -	hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev,
> -			     dev_name(&spi->dev));
> +	if (!spi->irq) {
> +		dev_err(&spi->dev, "Failed to get SPI IRQ for node '%s'\n", spi->dev.of_node->full_name);
> +		return -EFAULT;
> +	}
> +
> +#if defined(CONFIG_OF)
> +	if (spi->dev.of_node) {
> +		/* A temporary alias structure */
> +		union {
> +			uint32_t value[2];
> +			struct {
> +				uint32_t gpout;
> +				uint32_t active_level;
> +			};
> +		} vbus;
> +
> +		if(!(pdata = devm_kzalloc(&spi->dev, sizeof(*pdata), GFP_KERNEL))) {
> +			dev_err(&spi->dev, "failed to allocate memory for private data\n");
> +			retval = -ENOMEM;
> +			goto error;
> +		}
> +		spi->dev.platform_data = pdata;
> +
> +		if ((retval = of_property_read_u32_array(spi->dev.of_node, "vbus", vbus.value, 2))) {
> +			dev_err(&spi->dev, "device tree node property 'vbus' is missing\n");
> +			goto error;
> +		}
> +		pdata->vbus_gpout = vbus.gpout;
> +		pdata->vbus_active_level = vbus.active_level;
> +	}
> +	else
> +#endif
> +	pdata = spi->dev.platform_data;
> +	if (!pdata) {
> +		dev_err(&spi->dev, "driver configuration data is not provided\n");
> +		retval = -EFAULT;
> +		goto error;
> +	}
> +	if (pdata->vbus_active_level > 1) {
> +		dev_err(&spi->dev, "vbus active level value %d is out of range (0/1)\n", pdata->vbus_active_level);
> +		retval = -EINVAL;
> +		goto error;
> +	}
> +	if (pdata->vbus_gpout < 1 || pdata->vbus_gpout > MAX3421_GPOUT_COUNT) {
> +		dev_err(&spi->dev, "vbus gpout value %d is out of range (1..8)\n", pdata->vbus_gpout);
> +		retval = -EINVAL;
> +		goto error;
> +	}
> +	hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev, dev_name(&spi->dev));
>  	if (!hcd) {
>  		dev_err(&spi->dev, "failed to create HCD structure\n");
>  		goto error;
> @@ -1892,6 +1962,12 @@ max3421_probe(struct spi_device *spi)
>  			kthread_stop(max3421_hcd->spi_thread);
>  		usb_put_hcd(hcd);
>  	}
> +#if defined(CONFIG_OF)
> +	if (pdata && spi->dev.platform_data == pdata) {
> +		devm_kfree(&spi->dev, pdata);
> +		spi->dev.platform_data = NULL;
> +	}
> +#endif
>  	return retval;
>  }
>  
> @@ -1908,14 +1984,12 @@ max3421_remove(struct spi_device *spi)
>  		if (hcd->self.controller == &spi->dev)
>  			break;
>  	}
> +
>  	if (!max3421_hcd) {
>  		dev_err(&spi->dev, "no MAX3421 HCD found for SPI device %p\n",
>  			spi);
>  		return -ENODEV;
>  	}
> -
> -	usb_remove_hcd(hcd);
> -
>  	spin_lock_irqsave(&max3421_hcd->lock, flags);
>  
>  	kthread_stop(max3421_hcd->spi_thread);
> @@ -1923,8 +1997,19 @@ max3421_remove(struct spi_device *spi)
>  
>  	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
>  
> +#if defined(CONFIG_OF)
> +	if (spi->dev.platform_data) {
> +		dev_dbg(&spi->dev, "Freeing platform data structure\n");
> +		devm_kfree(&spi->dev, spi->dev.platform_data);
> +		spi->dev.platform_data = NULL;
> +	}
> +#endif
> +
>  	free_irq(spi->irq, hcd);
>  
> +	usb_remove_hcd(hcd);
> +
> +
>  	usb_put_hcd(hcd);
>  	return 0;
>  }
> @@ -1934,6 +2019,7 @@ static struct spi_driver max3421_driver = {
>  	.remove		= max3421_remove,
>  	.driver		= {
>  		.name	= "max3421-hcd",
> +		.of_match_table = of_match_ptr(max3421_dt_ids),
>  	},
>  };
>  
> -- 
> 2.7.4
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
