From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 2/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Fri, 30 Jan 2015 11:10:03 +0200
Message-ID: <1422609003.11083.13.camel@mm-sol.com>
References: <1421748922-8933-1-git-send-email-iivanov@mm-sol.com>
	 <1421748922-8933-3-git-send-email-iivanov@mm-sol.com>
	 <54C92E7C.5040507@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C92E7C.5040507-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-01-28 at 18:46 +0000, Jonathan Cameron wrote:
> On 20/01/15 10:15, Ivan T. Ivanov wrote:
> > From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > 
> > The voltage ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> > 15bits resolution and register space inside PMIC accessible across
> > SPMI bus.
> > 
> > The vadc driver registers itself through IIO interface.
> > 
> > Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> One minor comment inline.  Looks good to me.
> Applied to the togreg branch of iio.git - initially pushed out as testing.
> 
> Glad to have this one out of the pending list ;)

Thank you.

> 
> > +
> > +       irq_eoc = platform_get_irq(pdev, 0);
> > +       if (irq_eoc < 0) {
> > +               if (irq_eoc == -EPROBE_DEFER || irq_eoc == -EINVAL)
> > +                       return irq_eoc;
> This does feel a little backwards.  I'd normally expect to see those
> errors that indicate one is not specified tested against, rather than
> trying to guess all the reasons it might fail otherwise....
> 
> This way round strikes me as probably more fragile as additional errors
> may turn up in that function over time..
> 

Agree, would it be better if driver just check for EPROBE_DEFER
and treat all other error codes as "no interrupt defined"? 
I could send followup patch if you like.

Regards,
Ivan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
