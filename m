From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/2] dt: Document Holt HI-8435 bindings
Date: Mon, 31 Aug 2015 18:02:29 +0100
Message-ID: <55E488A5.7000604@kernel.org>
References: <1440772029-3022-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1440772100-3115-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440772100-3115-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/08/15 15:28, Vladimir Barinov wrote:
> These bindings can be used to register Holt HI-8435 threshold detector
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
This is now trivial so I'm taking it.

Applied to the togreg branch of iio.git

Thanks,

Jonathan
> ---
> Changes in version 2:
> - renamed file name hi-843x.txt to hi8435.txt
> - removed hi-8436,hi-8436,hi-8437
> - removed holt,debounce-soft field
> - renamed holt,debounc-soft-delay to holt,debounce-interval
> - renamed mr-gpio to reset-gpios
> Changes in version 3:
> - none
> Changes in version 4:
> - removed debounce_interval property
> - removed reset-gpios to use GPIO descriptor API
> Changes in version 5:
> - none
> 
>  .../devicetree/bindings/iio/adc/hi8435.txt          | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/hi8435.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/hi8435.txt b/Documentation/devicetree/bindings/iio/adc/hi8435.txt
> new file mode 100644
> index 0000000..3b0348c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/hi8435.txt
> @@ -0,0 +1,21 @@
> +Holt Integrated Circuits HI-8435 threshold detector bindings
> +
> +Required properties:
> + - compatible: should be "holt,hi8435"
> + - reg: spi chip select number for the device
> +
> +Recommended properties:
> + - spi-max-frequency: definition as per
> +		Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional properties:
> + - gpios: GPIO used for controlling the reset pin
> +
> +Example:
> +sensor@0 {
> +	compatible = "holt,hi8435";
> +	reg = <0>;
> +	gpios = <&gpio6 1 0>;
> +
> +	spi-max-frequency = <1000000>;
> +};
> 
