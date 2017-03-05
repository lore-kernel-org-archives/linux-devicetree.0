From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: iio: document interrupt trigger
 support
Date: Sun, 5 Mar 2017 12:16:28 +0000
Message-ID: <e6e2f05f-0dc0-f2a3-064b-268776a413c5@kernel.org>
References: <1488300679-3259-1-git-send-email-fabrice.gasnier@st.com>
 <1488300679-3259-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488300679-3259-4-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/02/17 16:51, Fabrice Gasnier wrote:
> Document interrupt trigger that takes a generic interrupt, and
> can be used as trigger source for sampling devices such as sensors,
> ADCs...
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
I'm not convinced we want the earlier device tree binding doc at all.
In the vast majority of cases that chunk on providers is irrelevant.
What matters is to document the specific case as you have done here.

So this one I like, the earlier document less so, simply because
it repeats what this more specific document has described.

So Rob, what do you think of 'just' this bit?
> ---
>  .../bindings/iio/trigger/iio-trig-interrupt.txt    | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/trigger/iio-trig-interrupt.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/trigger/iio-trig-interrupt.txt b/Documentation/devicetree/bindings/iio/trigger/iio-trig-interrupt.txt
> new file mode 100644
> index 0000000..9de9856
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/trigger/iio-trig-interrupt.txt
> @@ -0,0 +1,22 @@
> +Interrupt based trigger
> +
> +Any internal or external interrupt may be used as trigger source for
> +devices like sensors, ADCs... As an example, external signal can be
> +routed to a GPIO, and turned into an interrupt driven trigger.
> +
> +Required properties:
> +- compatible: Should be "interrupt-trigger"
> +- interrupts: The interrupt used as trigger. Generic interrupt client node as
> +  described in ../../interrupt-controller/interrupts.txt
> +
> +Optional properties:
> +- #io-trigger-cells = <0>; See the IIO bindings, IIO trigger providers
> +  and consumers sections in ../iio-bindings.txt
> +
> +Example:
> +	trig0: interrupt-trigger0 {
> +		#io-trigger-cells = <0>;
> +		compatible = "interrupt-trigger";
> +		interrupts = <11 0>;
> +		interrupt-parent = <&gpioa>;
> +	}
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
