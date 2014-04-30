From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 01/10] of: Keep track of populated platform devices
Date: Wed, 30 Apr 2014 12:48:49 +0100
Message-ID: <1398858529.24255.3.camel@hornet>
References: <1398707877-22596-1-git-send-email-pawel.moll@arm.com>
	 <1398707877-22596-2-git-send-email-pawel.moll@arm.com>
	 <CAL_JsqJxWoxNL=P0SJm+Q1rTRGTpMkzmzTJDbFq2P1vPH4XxZQ@mail.gmail.com>
	 <20140429125657.65910C4089D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140429125657.65910C4089D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-29 at 13:56 +0100, Grant Likely wrote:
> > > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > > index 404d1da..0ae757a 100644
> > > --- a/drivers/of/platform.c
> > > +++ b/drivers/of/platform.c
> > > @@ -204,7 +204,8 @@ static struct platform_device *of_platform_device_create_pdata(
> > >  {
> > >         struct platform_device *dev;
> > >
> > > -       if (!of_device_is_available(np))
> > > +       if (!of_device_is_available(np) ||
> > > +                       of_node_check_flag(np, OF_POPULATED))
> > 
> > This and the amba case should be a test_and_set operation to avoid a
> > race condition.
> 
> Yes. It is an unlikely condition at the time that Pawel is handling, but
> it should also work for later calls to of_platform_populate() which may
> happen at runtime and in parallel.

Sure thing, will fix.

Thanks!

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
