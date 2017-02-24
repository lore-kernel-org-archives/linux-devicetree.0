From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v1 2/3] extcon: int3496: Rename GPIO pins in accordance
 with binding
Date: Fri, 24 Feb 2017 10:17:12 +0900
Message-ID: <58AF8998.5000601@samsung.com>
References: <20170223103156.109643-1-andriy.shevchenko@linux.intel.com>
 <CGME20170223103203epcas1p1512e927e6f4c85e793d65c2e426ed1d6@epcas1p1.samsung.com>
 <20170223103156.109643-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170223103156.109643-2-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, David Cohen <david.a.cohen@intel.com>, Felipe Balbi <balbi@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 02월 23일 19:31, Andy Shevchenko wrote:
> First of all, add an optional binding for external muxer which might be
> used.
> 
> Second, update GPIO pin names in extcon-intel-int3496.c driver to follow
> the existing binding.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt | 3 +++
>  drivers/extcon/extcon-intel-int3496.c                        | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> index dfc14f71e81f..9d97472ae51d 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> @@ -10,6 +10,9 @@ Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
>  - id-gpio: gpio for USB ID pin. See gpio binding.
>  - vbus-gpio: gpio for USB VBUS pin.
>  
> +Optional properties:
> +- mux-gpios: gpio for USB external muxer

The Documentation/extcon/intel-int3496.txt includes
already the information for id/vbus/mux pin.

The extcon-usb-gpio.txt is not related with the extcon-int3496 driver.

> +
>  Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
>  	extcon_usb1 {
>  		compatible = "linux,extcon-usb-gpio";
> diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
> index 38eb6cab938f..81713bf7487e 100644
> --- a/drivers/extcon/extcon-intel-int3496.c
> +++ b/drivers/extcon/extcon-intel-int3496.c
> @@ -105,13 +105,13 @@ static int int3496_probe(struct platform_device *pdev)
>  		return data->usb_id_irq;
>  	}
>  
> -	data->gpio_vbus_en = devm_gpiod_get_index(dev, "vbus en",
> +	data->gpio_vbus_en = devm_gpiod_get_index(dev, "vbus",
>  						 INT3496_GPIO_VBUS_EN,
>  						 GPIOD_ASIS);
>  	if (IS_ERR(data->gpio_vbus_en))
>  		dev_info(dev, "can't request VBUS EN GPIO\n");
>  
> -	data->gpio_usb_mux = devm_gpiod_get_index(dev, "usb mux",
> +	data->gpio_usb_mux = devm_gpiod_get_index(dev, "mux",
>  						 INT3496_GPIO_USB_MUX,
>  						 GPIOD_ASIS);
>  	if (IS_ERR(data->gpio_usb_mux))
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
