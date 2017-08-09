From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: stm32: add optional
 st,min-sample-time-nsecs
Date: Wed, 9 Aug 2017 14:13:41 +0100
Message-ID: <20170809141341.777bdd85@archlinux>
References: <1500912640-23927-1-git-send-email-fabrice.gasnier@st.com>
        <1500912640-23927-3-git-send-email-fabrice.gasnier@st.com>
        <20170803170154.bizlx2dvdbwtgmoy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803170154.bizlx2dvdbwtgmoy@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 3 Aug 2017 12:01:54 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Mon, Jul 24, 2017 at 06:10:39PM +0200, Fabrice Gasnier wrote:
> > STM32 ADC allows each channel to be sampled with a different sampling
> > time. There's an application note that deals with this: 'How to get
> > the best ADC accuracy in STM32...' It basically depends on analog input
> > signal electrical properties (depends on board).
> > 
> > Add optional 'st,min-sample-time-nsecs' property so this can be tuned
> > in dt.
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> > ---
> > Changes in v2:
> > - Use 'st,min-sample-time-nsecs' instead of 'min-sample-time'.
> > ---
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 5 +++++
> >  1 file changed, 5 insertions(+)  
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testings.

Thanks for review Rob and thanks for the patch Fabrice.

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
