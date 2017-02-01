From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] Documentation: dt: iio: document stm32 exti trigger
Date: Wed, 1 Feb 2017 10:35:00 -0600
Message-ID: <20170201163500.ivxnxejurhzzoctl@rob-hp-laptop>
References: <1485784663-19505-1-git-send-email-fabrice.gasnier@st.com>
 <1485784663-19505-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485784663-19505-4-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 02:57:41PM +0100, Fabrice Gasnier wrote:
> Add dt documentation for st,stm32-exti-trigger.
> EXTi gpio signal can be routed internally as trigger source for various

s/gpio/GPIO/

> IPs (e.g. for ADC or DAC conversions).

Please use "dt-bindings: iio:" for the subject prefix.

> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  .../bindings/iio/trigger/st,stm32-exti-trigger.txt      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt b/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
> new file mode 100644
> index 0000000..ebf2645
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
> @@ -0,0 +1,17 @@
> +STMicroelectronics STM32 EXTI trigger bindings
> +
> +EXTi gpio signal can be routed internally as trigger source for various

s/gpio/GPIO/

> +IPs (e.g. for ADC or DAC conversions).
> +
> +Contents of a stm32 exti trigger root node:

Drop "root"

> +-------------------------------------------
> +Required properties:
> +- compatible: Should be "st,stm32-exti-trigger"

This whole binding looks a bit suspicious. Is this actually a h/w block? 
What makes it stm32 specific? Seems like the gpio properties should just 
be part of the ADC or DAC that they trigger.

> +- extiN-gpio: optional gpio line that may be used as external trigger source

-gpios is the preferred form.

> +  (e.g. N may be 0..15. For example, exti11-gpio can trig ADC on stm32f4).
> +
> +Example:
> +	triggers {
> +		compatible = "st,stm32-exti-trigger";
> +		exti11-gpio=<&gpioa 11 0>;

spaces around the "=".

> +	};
> -- 
> 1.9.1
> 
