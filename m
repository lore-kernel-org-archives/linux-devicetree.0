From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC] iio: iadc: wait_for_completion_timeout time in
 jiffies
Date: Mon, 05 Jan 2015 17:33:16 +0200
Message-ID: <1420471996.2090.9.camel@mm-sol.com>
References: <1420016386-19638-1-git-send-email-der.herr@hofr.at>
	 <54A9212B.8050709@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A9212B.8050709-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Sun, 2015-01-04 at 11:16 +0000, Jonathan Cameron wrote:
> On 31/12/14 08:59, Nicholas Mc Guire wrote:
> > The timeout value to wait_for_completion_timeout is in jiffies but
> > the value being passed seems like it was intended to by microseconds
> > Note that the timeout was extremely long thus it might be too short
> > now. In any case it probably should be passed through usecs_to_jiffies()
> > or msecs_to_jiffies()
> > 
> > patch is against linux-next 3.19.0-rc1 -next-20141226
> > 
> > patch was only compile-tested x86_64_defcofnig + CONFIG_SPMI=m
> > CONFIG_IIO=m, CONFIG_QCOM_SPMI_IADC=m
> > 
> > Signed-off-by: Nicholas Mc Guire herr-kA1LtwSENNE@public.gmane.org>
> Certainly suspicious and I'd draw the same conclusion you did!
> Anyhow just waiting for Ivan to take a look as it's his driver.

Oops, true. Timeout is calculated in microseconds and have to 
be converted to jiffies.

Thanks.

Acked-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>


> 
> Thanks,
> 
> Jonathan
> > ---
> >  drivers/iio/adc/qcom-spmi-iadc.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
> > index b9666f2..3080562 100644
> > --- a/drivers/iio/adc/qcom-spmi-iadc.c
> > +++ b/drivers/iio/adc/qcom-spmi-iadc.c
> > @@ -296,7 +296,8 @@ static int iadc_do_conversion(struct iadc_chip *iadc, int chan, u16 *data)
> >         if (iadc->poll_eoc) {
> >                 ret = iadc_poll_wait_eoc(iadc, wait);
> >         } else {
> > -               ret = wait_for_completion_timeout(&iadc->complete, wait);
> > +               ret = wait_for_completion_timeout(&iadc->complete,
> > +                       usecs_to_jiffies(wait));
> >                 if (!ret)
> >                         ret = -ETIMEDOUT;
> >                 else
> > 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
