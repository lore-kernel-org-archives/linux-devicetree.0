From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add driver for the
 ti-adc084s021 chip
Date: Sun, 14 May 2017 16:35:17 +0100
Message-ID: <3596a197-aebb-f43e-079a-cad9abd7866a@kernel.org>
References: <1494345901-4714-1-git-send-email-marten.lindahl@axis.com>
 <1494345901-4714-2-git-send-email-marten.lindahl@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494345901-4714-2-git-send-email-marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Content-Language: en-GH
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?M=c3=a5rten_Lindahl?= <martenli-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/05/17 17:05, Mårten Lindahl wrote:
> From: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>
> 
> This adds support for the Texas Instruments ADC084S021 ADC chip.
> 
> Signed-off-by: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied
> ---
> Changes in v4:
> - Added Rob's Acked-by tag
> 
> Changes in v3:
> - No updates since v2
> 
> Changes in v2:
> - Updated the 'Required properties' section
> - Removed the 'Optional properties' section
> 
>   .../devicetree/bindings/iio/adc/ti-adc084s021.txt     | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt b/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
> new file mode 100644
> index 0000000..4259e50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
> @@ -0,0 +1,19 @@
> +* Texas Instruments' ADC084S021
> +
> +Required properties:
> + - compatible        : Must be "ti,adc084s021"
> + - reg               : SPI chip select number for the device
> + - vref-supply       : The regulator supply for ADC reference voltage
> + - spi-cpol          : Per spi-bus bindings
> + - spi-cpha          : Per spi-bus bindings
> + - spi-max-frequency : Per spi-bus bindings
> +
> +Example:
> +adc@0 {
> +	compatible = "ti,adc084s021";
> +	reg = <0>;
> +	vref-supply = <&adc_vref>;
> +	spi-cpol;
> +	spi-cpha;
> +	spi-max-frequency = <16000000>;
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
