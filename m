From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Tue, 31 Mar 2015 12:22:56 +0300
Message-ID: <551A6770.3050702@ti.com>
References: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com> <1427787963-23562-3-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427787963-23562-3-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Baldyga <r.baldyga@samsung.com>, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 31/03/15 10:46, Robert Baldyga wrote:
> This patch adds VBUS pin detection support to extcon-usb-gpio driver.
> It allows to use this driver with boards which have both VBUS and ID
> pins, or only one of them.
> 
> Following table of states presents relationship between this signals
> and detected cable type:
> 
>  State        |    ID   |   VBUS
> ----------------------------------
>  [1] USB      |    H    |    H
>  [2] disconn. |    H    |    L
>  [3] USB-HOST |    L    |    H
>  [4] USB-HOST |    L    |    L
> 
> In case we have only one of these signals:
> - ID pin only: we can distinguish between states [1] and [3].
> - VBUS pin only: we can distinguish between states [1] and [2].
> 
> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
> ---
>  drivers/extcon/extcon-usb-gpio.c | 159 +++++++++++++++++++++++++++++----------
>  1 file changed, 118 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index f6aa99d..02ff40e 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -32,7 +32,9 @@ struct usb_extcon_info {
>  	struct extcon_dev *edev;
>  
>  	struct gpio_desc *id_gpiod;
> +	struct gpio_desc *vbus_gpiod;
>  	int id_irq;
> +	int vbus_irq;
>  
>  	unsigned long debounce_jiffies;
>  	struct delayed_work wq_detcable;
> @@ -52,21 +54,50 @@ static const char *usb_extcon_cable[] = {
>  	NULL,
>  };
>  
> +/*
> + *  State        |    ID   |   VBUS
> + * ----------------------------------
> + *  [1] USB      |    H    |    H
> + *  [2] disconn. |    H    |    L
> + *  [3] USB-HOST |    L    |    H
> + *  [4] USB-HOST |    L    |    L

This state table is misleading.
For the OTG case we're interested in ID and VBUS states as they are
without any decision making done by this driver.

The only state table you can have is
			ID	VBUS
	USB true	x	H
	USB false	x	L
	USB-HOST true	L	x
	USB-HOST false	H	x

So when both ID and VBUS pins are available, we must pass them
as is to the extcon framework.
	USB-HOST is ID status inverted
	USB is VBUS status

When only one pin is available we have to judge the other pin
state in the driver.

> + *
> + */
> +
>  static void usb_extcon_detect_cable(struct work_struct *work)
>  {
>  	int id;
> +	int vbus;
>  	struct usb_extcon_info *info = container_of(to_delayed_work(work),
>  						    struct usb_extcon_info,
>  						    wq_detcable);
>  
> -	/* check ID and update cable state */
> -	id = gpiod_get_value_cansleep(info->id_gpiod);
> -	if (id) {
> -		/*
> -		 * ID = 1 means USB HOST cable detached.
> -		 * As we don't have event for USB peripheral cable attached,
> -		 * we simulate USB peripheral attach here.
> -		 */
> +	/* check ID and VBUS and update cable state */
> +

Can we first tackle the case when both id_gpiod and vbus_gpiod are valid.
For that case you just need to pass on the states directly.
i.e.
	/* we have both ID and VBUS */
	if (info->id_gpiod && info->id_vbus) {
		EXTCON_CABLE_USB = vbus;
		EXTCON_CABLE_USB_HOST = !id;
	}

> +	/*
> +	 * If we don't have id pin, we want to detect states [1] and [2],
> +	 * so we set id to value 1.
> +	 */
> +	id = info->id_gpiod ?
> +		gpiod_get_value_cansleep(info->id_gpiod) : 1;
> +
> +	/*
> +	 * If we don't have vbus pin, we want to detect states [1] and [3],
> +	 * so we set vbus to value 1.
> +	 */
> +	vbus = info->vbus_gpiod ?
> +		gpiod_get_value_cansleep(info->vbus_gpiod) : 1;

All the below stuff can be simplified to

	/* we have only ID? */
	if (info->id_gpiod) {
		id = gpiod_get_value_cansleep(info->id_gpiod);
		if (id)
			EXCON_CABLE_USB_HOST = false;
			EXTCON_CABLE_USB = true;
		else
			EXTCON_CABLE_USB = false;
			EXTCON_CABLE_USB_HOST = true;

/* notice that we are first disabling the previously active state before enabling the next state */

	}

	/* we have only VBUS? */
	if (info->id_vbus) {
		vbus = gpiod_get_value_cansleep(info->vbus_gpiod);
		EXCON_CABLE_USB_HOST = false;
		EXTCON_CABLE_USB = vbus;
	}


> +
> +	if (id == 0) {
> +		/* ID = 0 means USB HOST cable attached. */
> +		extcon_set_cable_state(info->edev,
> +				       usb_extcon_cable[EXTCON_CABLE_USB],
> +				       false);

If we don't handle the case I mentioned above this will be wrong for
case id == 0, vbus == 1. We want CABLE_USB to be true in that case.

> +		extcon_set_cable_state(info->edev,
> +				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
> +				       true);


> +	} else if (vbus) {
> +		/* ID = 1 and VBUS = 1 means USB cable attached. */
>  		extcon_set_cable_state(info->edev,
>  				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
>  				       false);
> @@ -74,17 +105,13 @@ static void usb_extcon_detect_cable(struct work_struct *work)
>  				       usb_extcon_cable[EXTCON_CABLE_USB],
>  				       true);
>  	} else {
> -		/*
> -		 * ID = 0 means USB HOST cable attached.
> -		 * As we don't have event for USB peripheral cable detached,
> -		 * we simulate USB peripheral detach here.
> -		 */
> +		/* ID = 1 and VBUS = 0 means USB cable detached. */
>  		extcon_set_cable_state(info->edev,
>  				       usb_extcon_cable[EXTCON_CABLE_USB],
>  				       false);
>  		extcon_set_cable_state(info->edev,
>  				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
> -				       true);
> +				       false);
>  	}
>  }
>  
> @@ -113,10 +140,12 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	info->dev = dev;
> -	info->id_gpiod = devm_gpiod_get(&pdev->dev, "id");
> -	if (IS_ERR(info->id_gpiod)) {
> -		dev_err(dev, "failed to get ID GPIO\n");
> -		return PTR_ERR(info->id_gpiod);
> +	info->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
> +	info->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus");
> +
> +	if (!info->id_gpiod && !info->vbus_gpiod) {
> +		dev_err(dev, "failed to get gpios\n");
> +		return -ENODEV;
>  	}
>  
>  	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
> @@ -131,27 +160,51 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = gpiod_set_debounce(info->id_gpiod,
> -				 USB_GPIO_DEBOUNCE_MS * 1000);
> +	if (info->id_gpiod)
> +		ret = gpiod_set_debounce(info->id_gpiod,
> +			USB_GPIO_DEBOUNCE_MS * 1000);
> +	if (!ret && info->vbus_gpiod) {
> +		ret = gpiod_set_debounce(info->vbus_gpiod,
> +			USB_GPIO_DEBOUNCE_MS * 1000);
> +		if (ret < 0 && info->id_gpiod)
> +			gpiod_set_debounce(info->vbus_gpiod, 0);
> +	}
>  	if (ret < 0)
>  		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
>  
>  	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
>  
> -	info->id_irq = gpiod_to_irq(info->id_gpiod);
> -	if (info->id_irq < 0) {
> -		dev_err(dev, "failed to get ID IRQ\n");
> -		return info->id_irq;
> +	if (info->id_gpiod) {
> +		info->id_irq = gpiod_to_irq(info->id_gpiod);
> +		if (info->id_irq < 0) {
> +			dev_err(dev, "failed to get ID IRQ\n");
> +			return info->id_irq;
> +		}
> +		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
> +				usb_irq_handler,
> +				IRQF_TRIGGER_RISING |
> +				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				pdev->name, info);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to request handler for ID IRQ\n");
> +			return ret;
> +		}
>  	}
> -
> -	ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
> -					usb_irq_handler,
> -					IRQF_TRIGGER_RISING |
> -					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -					pdev->name, info);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to request handler for ID IRQ\n");
> -		return ret;
> +	if (info->vbus_gpiod) {
> +		info->vbus_irq = gpiod_to_irq(info->vbus_gpiod);
> +		if (info->vbus_irq < 0) {
> +			dev_err(dev, "failed to get VBUS IRQ\n");
> +			return info->vbus_irq;
> +		}
> +		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
> +				usb_irq_handler,
> +				IRQF_TRIGGER_RISING |
> +				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				pdev->name, info);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to request handler for VBUS IRQ\n");
> +			return ret;
> +		}
>  	}
>  
>  	platform_set_drvdata(pdev, info);
> @@ -179,9 +232,18 @@ static int usb_extcon_suspend(struct device *dev)
>  	int ret = 0;
>  
>  	if (device_may_wakeup(dev)) {
> -		ret = enable_irq_wake(info->id_irq);
> -		if (ret)
> -			return ret;
> +		if (info->id_gpiod) {
> +			ret = enable_irq_wake(info->id_irq);
> +			if (ret)
> +				return ret;
> +		}
> +		if (info->vbus_gpiod) {
> +			ret = enable_irq_wake(info->vbus_irq);
> +			if (ret) {
> +				disable_irq_wake(info->id_irq);

	if (info->id_gpiod)
		disable_irq_wake(info->id_irq);

> +				return ret;
> +			}
> +		}
>  	}
>  
>  	/*
> @@ -189,7 +251,10 @@ static int usb_extcon_suspend(struct device *dev)
>  	 * as GPIOs used behind I2C subsystem might not be
>  	 * accessible until resume completes. So disable IRQ.
>  	 */
> -	disable_irq(info->id_irq);
> +	if (info->id_gpiod)
> +		disable_irq(info->id_irq);
> +	if (info->vbus_gpiod)
> +		disable_irq(info->vbus_irq);
>  
>  	return ret;
>  }
> @@ -200,12 +265,24 @@ static int usb_extcon_resume(struct device *dev)
>  	int ret = 0;
>  
>  	if (device_may_wakeup(dev)) {
> -		ret = disable_irq_wake(info->id_irq);
> -		if (ret)
> -			return ret;
> +		if (info->id_gpiod) {
> +			ret = disable_irq_wake(info->id_irq);
> +			if (ret)
> +				return ret;
> +		}
> +		if (info->vbus_gpiod) {
> +			ret = disable_irq_wake(info->vbus_irq);
> +			if (ret) {
> +				enable_irq_wake(info->id_irq);

	if (info->id_gpiod)
		enable_irq_wake(info->id_irq);

> +				return ret;
> +			}
> +		}
>  	}
>  
> -	enable_irq(info->id_irq);
> +	if (info->id_gpiod)
> +		enable_irq(info->id_irq);
> +	if (info->vbus_gpiod)
> +		enable_irq(info->vbus_irq);
>  
>  	return ret;
>  }
> 

cheers,
-roger
