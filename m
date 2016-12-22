From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] iio: adc: hx711: Add DT binding for avia,hx711
Date: Thu, 22 Dec 2016 16:38:12 -0600
Message-ID: <20161222223812.65oqqmvfcpsrcgsn@rob-hp-laptop>
References: <20161221152442.GA14543@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161221152442.GA14543@andreas>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2016 at 04:24:42PM +0100, Andreas Klinger wrote:
> Add DT bindings for avia,hx711
> Add vendor avia to vendor list
> 
> [PATCH v3 1/2] of this patch was Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Sorry, but i had to add the regulator (avdd-supply) and therefore it 
> needs to be acked once again.

This should go after the '---', but otherwise you can keep my ack.

> 
> Signed-off-by: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/avia-hx711.txt         | 18 ++++++++++++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt  |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> new file mode 100644
> index 000000000000..b3629405f568
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> @@ -0,0 +1,18 @@
> +* AVIA HX711 ADC chip for weight cells
> +  Bit-banging driver
> +
> +Required properties:
> + - compatible:	Should be "avia,hx711"
> + - sck-gpios:	Definition of the GPIO for the clock
> + - dout-gpios:	Definition of the GPIO for data-out
> +		See Documentation/devicetree/bindings/gpio/gpio.txt
> + - avdd-supply:	Definition of the regulator used as analog supply
> +
> +Example:
> +weight@0 {
> +	compatible = "avia,hx711";
> +	sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
> +	dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> +	avdd-suppy = <&avdd>;
> +};
> +
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 44ddc980b085..4696bb5c2198 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -32,6 +32,7 @@ atlas	Atlas Scientific LLC
>  atmel	Atmel Corporation
>  auo	AU Optronics Corporation
>  avago	Avago Technologies
> +avia	avia semiconductor
>  avic	Shanghai AVIC Optoelectronics Co., Ltd.
>  axis	Axis Communications AB
>  boe	BOE Technology Group Co., Ltd.
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
