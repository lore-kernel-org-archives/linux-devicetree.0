From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: stm32: add optional
 st,min-sample-time-nsecs
Date: Sun, 30 Jul 2017 17:24:17 +0100
Message-ID: <20170730172417.5c3d38bb@kernel.org>
References: <1500912640-23927-1-git-send-email-fabrice.gasnier@st.com>
        <1500912640-23927-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500912640-23927-3-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Jul 2017 18:10:39 +0200
Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:

> STM32 ADC allows each channel to be sampled with a different sampling
> time. There's an application note that deals with this: 'How to get
> the best ADC accuracy in STM32...' It basically depends on analog input
> signal electrical properties (depends on board).
> 
> Add optional 'st,min-sample-time-nsecs' property so this can be tuned
> in dt.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
This ideally wants a devicetree review so I'm going to sit on
it for a few days longer.

Looks fine to me as does the implementation patch.

Give me a kick in a week or so if we have seen no progress on
this.  I will be travelling from next weekend and access may
be a little intermittent for up to two weeks.

Thanks,

Jonathan
> ---
> Changes in v2:
> - Use 'st,min-sample-time-nsecs' instead of 'min-sample-time'.
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 8310073..48bfcaa3 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -74,6 +74,11 @@ Optional properties:
>    * can be 6, 8, 10 or 12 on stm32f4
>    * can be 8, 10, 12, 14 or 16 on stm32h7
>    Default is maximum resolution if unset.
> +- st,min-sample-time-nsecs: Minimum sampling time in nanoseconds.
> +  Depending on hardware (board) e.g. high/low analog input source impedance,
> +  fine tune of ADC sampling time may be recommended.
> +  This can be either one value or an array that matches 'st,adc-channels' list,
> +  to set sample time resp. for all channels, or independently for each channel.
>  
>  Example:
>  	adc: adc@40012000 {
