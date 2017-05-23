From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dt-bindings: iio: stm32-adc: add support for STM32H7
Date: Tue, 23 May 2017 10:07:30 -0500
Message-ID: <20170523150730.735kyrb5kuheqtyi@rob-hp-laptop>
References: <1495197928-1439-1-git-send-email-fabrice.gasnier@st.com>
 <1495197928-1439-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495197928-1439-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 02:45:24PM +0200, Fabrice Gasnier wrote:
> Document support for STM32H7 Analog to Digital Converter.
> Main difference is regarding compatible, clock definitions and new
> features like differential channels support:
> STM32H7 ADC block has two clock inputs, common clock for all ADCs.
> One 'bus' clock for registers access, and one optional 'adc' clock
> for analog circuitry (bus clock may be used for conversions).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-adc.txt     | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index e35f9f1..9519d2e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -21,11 +21,17 @@ own configurable sequence and trigger:
>  Contents of a stm32 adc root node:
>  -----------------------------------
>  Required properties:
> -- compatible: Should be "st,stm32f4-adc-core".
> +- compatible: Should be one of "st,stm32f4-adc-core" or "st,stm32h7-adc-core".

Reformat this to 1 per line.

>  - reg: Offset and length of the ADC block register set.
>  - interrupts: Must contain the interrupt for ADC block.
> -- clocks: Clock for the analog circuitry (common to all ADCs).
> -- clock-names: Must be "adc".
> +- clocks: Core can use up to two clocks, depending on part used:
> +  - "adc" clock: for the analog circuitry, common to all ADCs.
> +    It's required on stm32f4.
> +    It's optional on stm32h7, bus clock will be used by default if not set.

The clocks listed should be all connections present, not policy as to 
what clock you want to use for conversions.

> +  - "bus" clock: for registers access, common to all ADCs.
> +    It's unused on stm32f4.

s/unused/not present/

> +    It's required on stm32h7.
> +- clock-names: Must be "adc" and/or "bus" depending on part used.
>  - interrupt-controller: Identifies the controller node as interrupt-parent
>  - vref-supply: Phandle to the vref input analog reference voltage.
>  - #interrupt-cells = <1>;
> @@ -42,14 +48,16 @@ An ADC block node should contain at least one subnode, representing an
>  ADC instance available on the machine.
>  
>  Required properties:
> -- compatible: Should be "st,stm32f4-adc".
> +- compatible: Should be one of "st,stm32f4-adc" or "st,stm32h7-adc".

One per line.

>  - reg: Offset of ADC instance in ADC block (e.g. may be 0x0, 0x100, 0x200).
> -- clocks: Input clock private to this ADC instance.
> +- clocks: Input clock private to this ADC instance. It's required only on
> +  stm32f4, that has per instance clock input for registers access.

Does the h7 simply have the same parent connected to all ADC instances 
or really doesn't have a per instance clock? For the former case, you 
should still have a clock, but just all be the same parent.

>  - interrupt-parent: Phandle to the parent interrupt controller.
>  - interrupts: IRQ Line for the ADC (e.g. may be 0 for adc@0, 1 for adc@100 or
>    2 for adc@200).
>  - st,adc-channels: List of single-ended channels muxed for this ADC.
> -  It can have up to 16 channels, numbered from 0 to 15 (resp. for in0..in15).
> +  It can have up to 16 channels on stm32f4 or 20 channels on stm32h7, numbered
> +  from 0 to 15 or 19 (resp. for in0..in15 or in0..in19).
>  - #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
>    Documentation/devicetree/bindings/iio/iio-bindings.txt
>  
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
