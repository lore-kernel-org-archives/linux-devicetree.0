Return-Path: <SRS0=p3e/=JD=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
References: <20180617114929.719-1-daniel@zonque.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <468ab3aa-80cd-3525-3c89-7e5c4e7e8b9e@gmail.com>
Date: Sun, 17 Jun 2018 21:39:08 +0200
MIME-Version: 1.0
In-Reply-To: <20180617114929.719-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Daniel Mack <daniel@zonque.org>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Daniel,

Thank you for the patch.

On 06/17/2018 01:49 PM, Daniel Mack wrote:
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>   .../devicetree/bindings/leds/leds-lt3593.txt  | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
> new file mode 100644
> index 000000000000..0a7035acda8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
> @@ -0,0 +1,25 @@
> +Bindings for Linear Technologies LT3593 LED controller
> +
> +Required properties:
> +- compatible : should be "lltc,lt3593".
> +- label: A label for the LED.
> +
> +Optional properties:
> +- linux,default-trigger :  (optional)
> +  see Documentation/devicetree/bindings/leds/common.txt
> +- default-state:  (optional) The initial state of the LED.
> +  see Documentation/devicetree/bindings/leds/common.txt
> +
> +The controller only suports one LED, hence the properties are all set
> +in the root node of the device. If multiple chips of this kind are
> +found in a design, each one needs to be handled by its own device node.

Please do not make an excuse for a single LED. Let's keep the bindings
consistent across all LED class drivers, i.e. each LED should have
a dedicated child node. Even there is a single output available.

Please compare how recently added LED bindings look like.
This also influences the way of LED class device name construction.
Please also refer to the recently added drivers for that, e.g.:
drivers/leds/leds-cr0014114.c.

> +Example:
> +
> +led-controller {
> +	compatible = "lltc,lt3593";
> +	label = "led-stripe";

Label should stick to the "color:function" pattern.

> +	gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +	linux,default-trigger = "heartbeat";
> +};
> +
> 

-- 
Best regards,
Jacek Anaszewski
