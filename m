From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] dt: Document Holt descrete ADC bindings
Date: Sun, 07 Jun 2015 16:43:47 +0100
Message-ID: <557466B3.3030907@kernel.org>
References: <1433161073-21967-1-git-send-email-vladimir.barinov@cogentembedded.com> <1433161252-22122-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433161252-22122-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/06/15 13:20, Vladimir Barinov wrote:
> These bindings can be used to register Holt HI-8435/8436/8437 descrete ADC
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/hi-843x.txt        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/hi-843x.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/hi-843x.txt b/Documentation/devicetree/bindings/iio/adc/hi-843x.txt
> new file mode 100644
> index 0000000..872e801
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/hi-843x.txt
> @@ -0,0 +1,27 @@
> +Holt Integrated Circuits HI-8435/8436/8437 discrete ADC bindings
> +
> +Required properties:
> + - compatible: Should be "holt,hi-8435" or "holt,hi-8436" or "holt,hi-8437"
> + - reg: spi chip select number for the device
> +
> +Recommended properties:
> + - spi-max-frequency: Definition as per
> +		Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional properties:
> + - holt,mr-gpio: GPIO used for controlling the MR (chip reset) pin
Unless there is anything unusual about the chip reset line, I'd 
be tempted to go with reset-gpios which seems to be somewhat
of a convention based on a quick grep of existing bindings.
> + - holt,debounce-soft: enable software debounce at startup
> + - holt,debounce-soft-delay: software debounce interval in milliseconds
> +
> +Example:
> +adc@0 {
> +	compatible = "holt,hi-8435";
> +	reg = <0>;
> +
> +	holt,mr-gpio = <&gpio6 1 0>;
> +
> +	holt,debounce-soft;
> +	holt,debounce-soft-delay = <100>;
> +
> +	spi-max-frequency = <1000000>;
> +};
> 
