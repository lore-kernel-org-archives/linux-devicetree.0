From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] iio: adc: hx711: Add DT binding for avia,hx711
Date: Wed, 14 Dec 2016 11:11:36 +0100
Message-ID: <470f0017-2607-d5bd-bcd3-69f892cdc88b@metafoo.de>
References: <20161214095945.GA26511@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214095945.GA26511@andreas>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/14/2016 10:59 AM, Andreas Klinger wrote:
> Add DT bindings for avia,hx711
> Add vendor avia to vendor list
> 
> Signed-off-by: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/avia-hx711.txt      | 21 +++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt         |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> new file mode 100644
> index 000000000000..6a4659fc7a4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
> @@ -0,0 +1,21 @@
> +* AVIA HX711 ADC chip for weight cells
> +  Bit-banging driver
> +
> +Required properties:
> + - compatible: Should be "avia,hx711"
> + - sck-gpios:	Definition of the GPIO for the clock
> + - dout-gpios:	Definition of the GPIO for data-out
> +		See Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Recommended properties:
> + - gain:	Gain select, can be 32, 64 or 128
> +		default is 128

If the gain is software programmable it should be exposed by the driver
allowing the application to change it rather than putting it in the devicetree.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
