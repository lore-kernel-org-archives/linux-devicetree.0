From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] mfd: wm831x: Add device tree binding document
Date: Wed, 22 Feb 2017 09:15:02 -0600
Message-ID: <20170222151502.njwsimmttah3tv4f@rob-hp-laptop>
References: <1486984514-29749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1486984514-29749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486984514-29749-3-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 11:15:14AM +0000, Charles Keepax wrote:
> This is just a very simple initial binding, supporting only registering
> the chip and the GPIOs. More features will be added as support for
> device tree in the driver is expanded.

Please make the binding as complete as you can. You don't have to have 
driver side support in place. Doesn't have to be everything, but at 
least everything you know you will need.

> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
> 
> Changes since v1:
>  - Added MAINTAINERS update
> 
>  Documentation/devicetree/bindings/mfd/wm831x.txt | 31 ++++++++++++++++++++++++
>  MAINTAINERS                                      |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/wm831x.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/wm831x.txt b/Documentation/devicetree/bindings/mfd/wm831x.txt
> new file mode 100644
> index 0000000..9771022
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/wm831x.txt
> @@ -0,0 +1,31 @@
> +Cirrus Logic/Wolfson Microelectronics wm831x PMICs
> +
> +System PMICs with a wide range of additional features.
> +
> +Required properties:
> +
> +  - compatible : One of the following chip-specific strings:
> +        "wlf,wm8310"
> +        "wlf,wm8311"
> +        "wlf,wm8312"
> +        "wlf,wm8320"
> +        "wlf,wm8321"
> +        "wlf,wm8325"
> +        "wlf,wm8326"
> +
> +  - reg : I2C slave address when connected using I2C, chip select number when
> +    using SPI.
> +
> +  - gpio-controller : Indicates this device is a GPIO controller.
> +  - #gpio-cells : Must be 2. The first cell is the pin number and the
> +    second cell is used to specify optional parameters (currently unused).
> +
> +Example:
> +
> +wm8310: wm8310@36 {

pmic@

> +	compatible = "wlf,wm8310";
> +	reg = <0x36>;
> +
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2d8ca28..48fdc82 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13363,6 +13363,7 @@ F:	Documentation/hwmon/wm83??
>  F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>  F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
>  F:	Documentation/devicetree/bindings/mfd/arizona.txt
> +F:	Documentation/devicetree/bindings/mfd/wm831x.txt
>  F:	arch/arm/mach-s3c64xx/mach-crag6410*
>  F:	drivers/clk/clk-wm83*.c
>  F:	drivers/extcon/extcon-arizona.c
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
