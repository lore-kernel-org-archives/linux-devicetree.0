From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] extcon: gpio: Add the support for Device tree bindings
Date: Mon, 5 Oct 2015 12:13:59 +0100
Message-ID: <20151005111359.GF19064@leverpostej>
References: <1444028299-11755-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444028299-11755-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 05, 2015 at 03:58:19PM +0900, Chanwoo Choi wrote:
> This patch adds the support for Device tree bindings of extcon-gpio driver.
> The extcon-gpio device tree node must include the both 'extcon-id' and
> 'extcon-gpio' property.
> 
> For exmaple:
> 	usb_cable: extcon-gpio-0 {
> 		compatible = "extcon-gpio";
> 		extcon-id = <EXTCON_USB>;
> 		extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> 	}
> 
> 	ta_cable: extcon-gpio-1 {
> 		compatible = "extcon-gpio";
> 		extcon-id = <EXTCON_CHG_USB_DCP>;
> 		extcon-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
> 		debounce-ms = <50>;	/* 50 millisecond */
> 		wakeup-source;
> 	}
> 
> 	&dwc3_usb {
> 		extcon = <&usb_cable>;
> 	};
> 
> 	&charger {
> 		extcon = <&ta_cable>;
> 	};
> 
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes from v1:
> - Create the include/dt-bindings/extcon/extcon.h including the identification
>   of external connector. These definitions are used in dts file.
> - Fix error if CONFIG_OF is disabled.
> 
>  .../devicetree/bindings/extcon/extcon-gpio.txt     |  38 +++++++
>  drivers/extcon/extcon-gpio.c                       | 110 ++++++++++++++++-----
>  include/dt-bindings/extcon/extcon.h                |  44 +++++++++
>  include/linux/extcon/extcon-gpio.h                 |   6 +-
>  4 files changed, 173 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>  create mode 100644 include/dt-bindings/extcon/extcon.h
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> new file mode 100644
> index 000000000000..70c36f729963
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> @@ -0,0 +1,38 @@
> +GPIO Extcon device
> +
> +This is a virtual device used to generate specific external connector
> +from the GPIO pin connected to a GPIO pin.
> +
> +Required properties:
> +- compatible: Must be "extcon-gpio".
> +- extcon-id: unique id for specific external connector.
> +	     See include/dt-bindings/extcon/extcon.h.

This property is either misnamed and badly described, or it is
pointless (the node is sufficient to form a unique ID which can be
referenced by phandle).

What is this used for exactly?

> +- extcon-gpio: GPIO pin to detect the external connector. See gpio binding.
> +
> +Optional properties:
> +- debounce-ms: the debounce dealy for GPIO pin in millisecond.
> +- wakeup-source: Boolean, extcon can wake-up the system.
> +
> +Example: Examples of extcon-gpio node as listed below:
> +
> +	usb_cable: extcon-gpio-0 {
> +		compatible = "extcon-gpio";
> +		extcon-id = <EXTCON_USB>;
> +		extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> +	}
> +
> +	ta_cable: extcon-gpio-1 {
> +		compatible = "extcon-gpio";
> +		extcon-id = <EXTCON_CHG_USB_DCP>;
> +		extcon-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
> +		debounce-ms = <50>;	/* 50 millisecond */
> +		wakeup-source;
> +	}
> +
> +	&dwc3_usb {
> +		extcon = <&usb_cable>;
> +	};
> +
> +	&charger {
> +		extcon = <&ta_cable>;
> +	};
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index 279ff8f6637d..7f3e24aae0c4 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -1,8 +1,8 @@
>  /*
>   * extcon_gpio.c - Single-state GPIO extcon driver based on extcon class
>   *
> - * Copyright (C) 2008 Google, Inc.
> - * Author: Mike Lockwood <lockwood-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> + * Copyright (C) 2015 Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samsung Electronics
> + * Copyright (C) 2008 Mike Lockwood <lockwood-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Google, Inc.
>   *
>   * Modified by MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> to support extcon
>   * (originally switch class is supported)
> @@ -26,12 +26,14 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>  
>  struct gpio_extcon_data {
>  	struct extcon_dev *edev;
>  	int irq;
> +	bool irq_wakeup;
>  	struct delayed_work work;
>  	unsigned long debounce_jiffies;
>  
> @@ -61,19 +63,50 @@ static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int gpio_extcon_init(struct device *dev, struct gpio_extcon_data *data)
> +static int gpio_extcon_parse_of(struct device *dev,
> +				struct gpio_extcon_data *data)
>  {
> -	struct gpio_extcon_pdata *pdata = data->pdata;
> +	struct gpio_extcon_pdata *pdata;
>  	int ret;
>  
> -	ret = devm_gpio_request_one(dev, pdata->gpio, GPIOF_DIR_IN,
> -				dev_name(dev));
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32(dev, "extcon-id", &pdata->extcon_id);
> +	if (ret < 0)
> +		return -EINVAL;

No sanity checking of the value?

Why device_property rather than of_property?

> +
> +	data->id_gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
>  	if (ret < 0)
>  		return ret;
>  
> -	data->id_gpiod = gpio_to_desc(pdata->gpio);
> -	if (!data->id_gpiod)
> -		return -EINVAL;
> +	data->irq_wakeup = device_property_read_bool(dev, "wakeup-source");
> +
> +	device_property_read_u32(dev, "debounce-ms", &pdata->debounce);

Likewise, surely there's an upper bound above?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
