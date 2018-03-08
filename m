Return-Path: <SRS0=9q+S=F6=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document Panasonic AN30259A
 bindings
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-2-simon@lineageos.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <973256fd-8394-1b41-9ca1-846442515f62@gmail.com>
Date: Thu, 8 Mar 2018 23:17:17 +0100
MIME-Version: 1.0
In-Reply-To: <20180307004722.23524-2-simon@lineageos.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
To: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On 03/07/2018 01:47 AM, Simon Shields wrote:
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  .../devicetree/bindings/leds/leds-an30259a.txt     | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> new file mode 100644
> index 000000000000..34ad4b189853
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> @@ -0,0 +1,43 @@
> +* Panasonic AN30259A 3-channel LED driver
> +
> +The AN30259A is a LED controller capable of driving three LEDs independently. It supports
> +constant current output and sloping current output modes. The chip is connected over I2C.
> +
> +Required properties:
> +	- compatible: Must be "panasonic,an30259a".
> +	- reg: I2C slave address.
> +	- #address-cells: Must be 1.
> +	- #size-cells: Must be 0.
> +
> +Each LED is represented as a sub-node of the panasonic,an30259a node.
> +
> +Required sub-node properties:
> +	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
> +
> +Optional sub-node properties:
> +	- label: see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +leds@30 {

Let's start to keep the uniform convention, i.e.
led-controller for the LED controller node:

s/leds@30/led-controller@30/

> +	compatible = "panasonic,an30259a";
> +	reg = <0x30>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	led@1 {
> +		reg = <1>;
> +		linux,default-trigger = "heartbeat";
> +		label = "an30259a:red:notification";

s/an30259a:red:notification/red:notification/

Let's drop devicename section from label, and make it a LED class
driver responsibility to prepend the label with devicename when
composing LED class device name.

> +	};
> +
> +	led@2 {
> +		reg = <2>;
> +		label = "an30259a:green:notification";
> +	};
> +
> +	led@3 {
> +		reg = <3>;
> +		label = "an30259a:blue:notification";
> +	};
> +};
> 

-- 
Best regards,
Jacek Anaszewski
