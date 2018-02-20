Return-Path: <SRS0=NmUz=FO=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: document Panasonic AN30259A
 bindings
References: <20180220005446.8577-1-simon@lineageos.org>
 <20180220005446.8577-2-simon@lineageos.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <affb0dcc-05a0-20f5-4caf-528453b59fb6@gmail.com>
Date: Tue, 20 Feb 2018 22:28:56 +0100
MIME-Version: 1.0
In-Reply-To: <20180220005446.8577-2-simon@lineageos.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
To: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thank you for the patch. I have a few comments below.

On 02/20/2018 01:54 AM, Simon Shields wrote:
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  .../devicetree/bindings/leds/leds-an30259a.txt     | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> new file mode 100644
> index 000000000000..d3586ce71eef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> @@ -0,0 +1,41 @@
> +* Panasonic AN30259A 3-channel LED driver
> +
> +The AN30259A is a LED controller capable of driving three LEDs independently. It supports
> +constant current output and sloping current output modes. The chip is connected over I2C.
> +
> +Required properties:
> +	- compatible : must be "panasonic,an30259a"

s/must/Must/ and please put a dot in the end.

> +	- reg -  I2C slave address
> +
> +Each led is represented as a sub-node of the panasonic,an30259a node.

s/led/LED/

> +
> +Optional sub-node properties:
> +	- label: see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> +	- led-sources: 0 if LED is connected to LED1 pin,

led-sources is applicable in e bit different arrangements.
Here please use "reg" property instead. In this case you will
need also below in the "Required properties":

- #address-cells: Must be 1.
- #size-cells: Must be 0.


> +	  1 if LED is connected to LED2 pin, or 2 if LED is connected to LED3 pin.
> +
> +Example:
> +an30259a@30 {

According to the lesson from Rob [0] it should be:

led-controller@30 {
  #address-cells = <1>;
  #size-cells = <0>
  reg = <30>;

  led0 {
    reg = <0>;
    label = "red";	
  };

  green@1 {
    reg = <1>;
    label = "green";
  };

  blue@2 {
    reg = <2>;
    label = "blue";
  };
};


> +	compatible = "panasonic,an30259a";
> +	reg = <0x30>;
> +
> +	red {
> +		led-sources = <0>;
> +		linux,default-trigger = "heartbeat";
> +		label = "red";
> +	};
> +
> +	green {
> +		led-sources = <1>;
> +		label = "green";
> +	};
> +
> +	blue {
> +		led-sources = <2>;
> +		label = "blue";
> +	};
> +};
> +
> +For more information please see the link below:
> +https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> 

[0] https://patchwork.kernel.org/patch/10093757/

-- 
Best regards,
Jacek Anaszewski
