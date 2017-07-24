From: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: iio: adc: stm32: add optional
 min-sample-time
Date: Mon, 24 Jul 2017 23:04:18 +0800
Message-ID: <20170724230418.000078b1@huawei.com>
References: <1500381332-17086-1-git-send-email-fabrice.gasnier@st.com>
        <1500381332-17086-3-git-send-email-fabrice.gasnier@st.com>
        <20170723115337.1e34e173@kernel.org>
        <81cabf83-689c-277a-5cf9-510df5cc9045@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <81cabf83-689c-277a-5cf9-510df5cc9045-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Jul 2017 09:55:37 +0200
Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:

> On 07/23/2017 12:53 PM, Jonathan Cameron wrote:
> > On Tue, 18 Jul 2017 14:35:31 +0200
> > Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:
> >   
> >> STM32 ADC allows each channel to be sampled with a different sampling
> >> time. There's an application note that deals with this: 'How to get
> >> the best ADC accuracy in STM32...' It basically depends on analog input
> >> signal electrical properties (depends on board).
> >>
> >> Add optional 'min-sample-time' property so this can be tuned in dt.
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>  
> > 
> > This isn't yet very standard, so I think it needs a manufacturer
> > prefix, e.g. st,min-sample-time.  Also convention is I believe
> > to include the units as part of the naming where appropriate.
> > 
> > Hence st,min-sample-time-nsecs  
> 
> Hi Jonathan,
> 
> I originally used st,... form, when writing this patch, until I found
> out there's 'min-sample-time' in vf610 adc dt-bindings:
> - Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
> It looks like to me very similar.
> 
> I also agree it misses '-nsecs' units. Sure, I can use your suggestion
> above...
> 
> Please can you just confirm if I should use same property as vf610 adc,
> or 'st,min-sample-time-nsecs' ?
st,min-sample-time-nsecs.

We might well add a generic option in future, but the burden of
supporting this old one will be trivial anyway so not a problem.

Jonathan
> 
> Thanks for reviewing,
> Best regards,
> Fabrice
> 
> > 
> > Otherwise, seems good to me.
> > 
> > Jonathan  
> >> ---
> >>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> >> index 8310073..9cd964b 100644
> >> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> >> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> >> @@ -74,6 +74,11 @@ Optional properties:
> >>    * can be 6, 8, 10 or 12 on stm32f4
> >>    * can be 8, 10, 12, 14 or 16 on stm32h7
> >>    Default is maximum resolution if unset.
> >> +- min-sample-time: Minimum sampling time in nanoseconds.
> >> +  Depending on hardware (board) e.g. high/low analog input source impedance,
> >> +  fine tune of ADC sampling time may be recommended.
> >> +  This can be either one value or an array that matches 'st,adc-channels' list,
> >> +  to set sample time resp. for all channels, or independently for each channel.
> >>  
> >>  Example:
> >>  	adc: adc@40012000 {  
> >   
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
