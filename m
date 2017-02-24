From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v1 3/3] extcon: int3496: Add GPIO ACPI mapping table
Date: Fri, 24 Feb 2017 10:30:43 +0900
Message-ID: <58AF8CC3.7080703@samsung.com>
References: <20170223103156.109643-1-andriy.shevchenko@linux.intel.com>
 <CGME20170223103233epcas2p1c4c914cb79395704d8fce85e2b23f43d@epcas2p1.samsung.com>
 <20170223103156.109643-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170223103156.109643-3-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, David Cohen <david.a.cohen@intel.com>, Felipe Balbi <balbi@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 02월 23일 19:31, Andy Shevchenko wrote:
> In order to make GPIO ACPI library stricter prepare users of
> gpiod_get_index() to correctly behave when there no mapping is
> provided by firmware.
> 
> Here we add explicit mapping between _CRS GpioIo() resources and
> their names used in the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/extcon/extcon-intel-int3496.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
> index 81713bf7487e..1abe9071d9d0 100644
> --- a/drivers/extcon/extcon-intel-int3496.c
> +++ b/drivers/extcon/extcon-intel-int3496.c
> @@ -45,6 +45,17 @@ static const unsigned int int3496_cable[] = {
>  	EXTCON_NONE,
>  };
>  
> +static const struct acpi_gpio_params id_gpios = { INT3496_GPIO_USB_ID, 0, false };
> +static const struct acpi_gpio_params vbus_gpios = { INT3496_GPIO_VBUS_EN, 0, false };
> +static const struct acpi_gpio_params mux_gpios = { INT3496_GPIO_USB_MUX, 0, false };
> +
> +static const struct acpi_gpio_mapping acpi_int3496_default_gpios[] = {
> +	{ "id-gpios", &id_gpios, 1 },
> +	{ "vbus-gpios", &vbus_gpios, 1 },
> +	{ "mux-gpios", &mux_gpios, 1 },
> +	{ },
> +};
> +
>  static void int3496_do_usb_id(struct work_struct *work)
>  {
>  	struct int3496_data *data =
> @@ -83,6 +94,13 @@ static int int3496_probe(struct platform_device *pdev)
>  	struct int3496_data *data;
>  	int ret;
>  
> +	ret = acpi_dev_add_driver_gpios(ACPI_COMPANION(dev),
> +					acpi_int3496_default_gpios);
> +	if (ret) {
> +		dev_err(dev, "can't add GPIO ACPI mapping\n");
> +		return ret;
> +	}
> +
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> @@ -154,6 +172,7 @@ static int int3496_remove(struct platform_device *pdev)
>  	devm_free_irq(&pdev->dev, data->usb_id_irq, data);
>  	cancel_delayed_work_sync(&data->work);
>  
> +	acpi_dev_remove_driver_gpios(ACPI_COMPANION(&pdev->dev));

Need to add the one blank line.

>  	return 0;
>  }
>  

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

This patch depends on the patch2. So, after resending the v2,
I'll merge them if there is no problem.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
