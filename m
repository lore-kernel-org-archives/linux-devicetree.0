From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/7] mfd: Add Device Tree bindings document for TI
 tps6105x chip
Date: Mon, 3 Apr 2017 12:15:40 +0100
Message-ID: <20170403111540.7k3rjucvcxe5cunf@dell>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-6-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170401071854.23198-6-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 01 Apr 2017, Javier Martinez Canillas wrote:

> There are Device Tree source files defining a device node for the
> tps61050/61052 I2C chip but there isn't a binding document for it.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mfd/tps6105x.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
> new file mode 100644
> index 000000000000..c076f28575fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
> @@ -0,0 +1,17 @@
> +* Device tree bindings for TI TPS61050/61052 Boost Converters
> +
> +The TP61050/TPS61052 is a high-power "white LED driver". This boost converter
> +is also used for other things than white LEDs, and also contains a GPIO pin.

What functions does it offer?

> +Required properties:
> +- compatible:		"ti,tps61050" or "ti,tps61052"
> +- reg:			Specifies the I2C slave address
> +
> +Example:
> +
> +i2c0 {
> +	tps61052@33 {
> +		compatible = "ti,tps61052";
> +		reg = <0x33>;
> +	};
> +};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
