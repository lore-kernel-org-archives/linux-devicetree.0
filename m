From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] Documentation: dt: iio: document stm32 adc trigger
 polarity
Date: Sun, 5 Feb 2017 09:56:18 +0000
Message-ID: <1b326a3d-522f-b76e-0bc3-656b5fd2a8ae@kernel.org>
References: <1485786840-4557-1-git-send-email-fabrice.gasnier@st.com>
 <1485786840-4557-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485786840-4557-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/01/17 14:33, Fabrice Gasnier wrote:
> STM32 ADC trigger polarity can be set to either rising, falling
> or both edges. Allow to configure it from dt.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
This falls into the same question of whether this is really an interrupt
(be it one that linux can't see) or not.

It certainly similar enough I'd like to see us use as much of the
interrupt bindings as possible rather than reinventing the wheel.

cc'd Thomas Gleixner.

Thomas, what we have here effectively an interrupt that we have the option
to directly route to the hardware block to initialize an ADC sample
(rather than bouncing through the kernel).  It can also be directly
exposed as a real interrupt and the chances are we are going to end
up with a mixture of the two depending on who is interesting in the
'interrupt'.

Any thoughts?

Jonathan
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 5dfc88e..6c6d968 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -57,6 +57,8 @@ Optional properties:
>  - dmas: Phandle to dma channel for this ADC instance.
>    See ../../dma/dma.txt for details.
>  - dma-names: Must be "rx" when dmas property is being used.
> +- st,trigger-polarity: Must be 0 (default), 1 or 2 to set default trigger
> +  polarity to respectively "rising-edge", "falling-edge" or "both-edges".
>  
>  Example:
>  	adc: adc@40012000 {
> @@ -84,6 +86,7 @@ Example:
>  			st,adc-channels = <8>;
>  			dmas = <&dma2 0 0 0x400 0x0>;
>  			dma-names = "rx";
> +			st,trigger-polarity = <1>;
>  		};
>  		...
>  		other adc child nodes follow...
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
