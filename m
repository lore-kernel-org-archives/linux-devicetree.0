From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: stm32: add support for diff
 channels
Date: Tue, 24 Oct 2017 11:41:38 -0500
Message-ID: <20171024164138.arnjrlw4pmk5xaqy@rob-hp-laptop>
References: <1508246145-19417-1-git-send-email-fabrice.gasnier@st.com>
 <1508246145-19417-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508246145-19417-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 03:15:43PM +0200, Fabrice Gasnier wrote:
> STM32H7 ADC channels may be configured either as single-ended or
> differential.
> Add 'st,adc-diff-channels' property to support differential channels.
> Differential channels are defined as a pair of positive and negative
> inputs: vinp & vinn.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 48bfcaa3..c3c8de1 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -62,6 +62,12 @@ Required properties:
>  - st,adc-channels: List of single-ended channels muxed for this ADC.
>    It can have up to 16 channels on stm32f4 or 20 channels on stm32h7, numbered
>    from 0 to 15 or 19 (resp. for in0..in15 or in0..in19).
> +- st,adc-diff-channels: List of differential channels muxed for this ADC.
> +  Depending on part used, some channels can be configured as differential
> +  instead of single-ended (e.g. stm32h7). List here positive and negative
> +  inputs pairs as <vinp vinn>, <vinp vinn>,... vinp and vinn are numbered
> +  from 0 to 19 on stm32h7)
> +  Note: At least one of "st,adc-channels" or "st,adc-diff-channels" is required.

Wouldn't both present be invalid?

>  - #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
>    Documentation/devicetree/bindings/iio/iio-bindings.txt
>  
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
