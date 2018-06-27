Return-Path: <SRS0=7F6K=JN=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH] leds: lt3593: Move GPIO node from child to device node
References: <20180626202252.6127-1-daniel@zonque.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1e704976-e8e8-321b-e146-ab4186306be0@gmail.com>
Date: Wed, 27 Jun 2018 19:59:04 +0200
MIME-Version: 1.0
In-Reply-To: <20180626202252.6127-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Daniel Mack <daniel@zonque.org>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Daniel,

Thank you for the patch.

Could you please just squash these changes to the original patch set
and resend?
There is no reason to come up with the incremental patch
if the original ones are not in the mainline yet.

Best regards,
Jacek Anaszewski

On 06/26/2018 10:22 PM, Daniel Mack wrote:
> Move the GPIO node from the child node to the device node as it
> is a property of the chip, not of the LED.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>   .../devicetree/bindings/leds/leds-lt3593.txt         | 10 ++++------
>   drivers/leds/leds-lt3593.c                           | 12 ++++--------
>   2 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
> index b31d427448f8..6b2cabc36c0c 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lt3593.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
> @@ -1,15 +1,13 @@
>   Bindings for Linear Technologies LT3593 LED controller
>   
>   Required properties:
> -- compatible:	Should be "lltc,lt3593".
> +- compatible:		Should be "lltc,lt3593".
> +- lltc,ctrl-gpios:	A handle to the GPIO that is connected to the 'CTRL'
> +			pin of the chip.
>   
>   The hardware supports only one LED. The properties of this LED are
>   configured in a sub-node in the device node.
>   
> -Required sub-node properties:
> -- gpios:	A handle to the GPIO that is connected to the 'CTRL'
> -		pin of the chip.
> -
>   Optional sub-node properties:
>   - label:	A label for the LED. If none is given, the LED will be
>   		named "lt3595::".
> @@ -25,10 +23,10 @@ Example:
>   
>   led-controller {
>   	compatible = "lltc,lt3593";
> +	lltc,ctrl-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
>   
>   	led {
>   		label = "white:backlight";
> -		gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
>   		default-state = "on";
>   	};
>   };
> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
> index f6aae616242e..9d4896aa8475 100644
> --- a/drivers/leds/leds-lt3593.c
> +++ b/drivers/leds/leds-lt3593.c
> @@ -133,6 +133,10 @@ static int lt3593_led_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> +	led_data->gpiod = devm_gpiod_get(dev, "lltc,ctrl", 0);
> +	if (IS_ERR(led_data->gpiod))
> +		return PTR_ERR(led_data->gpiod);
> +
>   	child = device_get_next_child_node(dev, NULL);
>   
>   	ret = fwnode_property_read_string(child, "label", &tmp);
> @@ -156,14 +160,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	led_data->gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
> -							   flags,
> -							   led_data->name);
> -	if (IS_ERR(led_data->gpiod)) {
> -		fwnode_handle_put(child);
> -		return PTR_ERR(led_data->gpiod);
> -	}
> -
>   	led_data->cdev.name = led_data->name;
>   	led_data->cdev.brightness_set_blocking = lt3593_led_set;
>   	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
> 
