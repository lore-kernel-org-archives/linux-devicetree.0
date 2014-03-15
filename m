From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 6/9] Documentation: DT: Document twl4030-madc binding
Date: Sat, 15 Mar 2014 15:27:27 +0000
Message-ID: <5324715F.4030106@kernel.org>
References: <1393702365-26429-1-git-send-email-sre@debian.org> <1393970751-18157-1-git-send-email-sre@debian.org> <1393970751-18157-7-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393970751-18157-7-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/03/14 22:05, Sebastian Reichel wrote:
> Add devicetree binding documentation for twl4030-madc
> analog digital converter.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
I'm happy with this, but it needs the usual sign off form a device tree
maintainer or 3 weeks to pass since it was posted.
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/iio/adc/twl4030-madc.txt   | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt b/Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
> new file mode 100644
> index 0000000..6bdd214
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
> @@ -0,0 +1,24 @@
> +* TWL4030 Monitoring Analog to Digital Converter (MADC)
> +
> +The MADC subsystem in the TWL4030 consists of a 10-bit ADC
> +combined with a 16-input analog multiplexer.
> +
> +Required properties:
> +  - compatible: Should contain "ti,twl4030-madc".
> +  - interrupts: IRQ line for the MADC submodule.
> +  - #io-channel-cells: Should be set to <1>.
> +
> +Optional properties:
> +  - ti,system-uses-second-madc-irq: boolean, set if the second madc irq register
> +				    should be used, which is intended to be used
> +				    by Co-Processors (e.g. a modem).
> +
> +Example:
> +
> +&twl {
> +	madc {
> +		compatible = "ti,twl4030-madc";
> +		interrupts = <3>;
> +		#io-channel-cells = <1>;
> +	};
> +};
>
