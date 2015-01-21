From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] mfd: lubbock_io: add lubbock_io board
Date: Wed, 21 Jan 2015 08:46:29 +0100
Message-ID: <873874fuei.fsf@free.fr>
References: <1421406010-14851-1-git-send-email-robert.jarzmik@free.fr>
	<1421406010-14851-2-git-send-email-robert.jarzmik@free.fr>
	<20150119091705.GG21886@x1> <87ppaah9k5.fsf@free.fr>
	<20150120102919.GP5767@x1>
	<20150120115658.GJ26493@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> writes:

> What I'd suggest (and always have done) is:
>
> 	dev_err(&pdev->dev, "couldn't request main irq%d: %d\n",
> 		irq, ret);
I like it, it's even more compact, I'll use it for next patch version.

> but I guess printing the IRQ number no longer makes sense with todays
> dynamic mapping of logical IRQ numbers, as it is no longer meaningful.
Yes ... we're not yet there with pxa gpio interrupts, maybe it will come
eventually one day.

For Lee:
> > > platform_get_irq()?
> > No. I need the flags.
> Where are they used?
A couple of lines below, using local "irqflags" variable :
       ret = devm_request_irq(&pdev->dev, cot->irq, lubbock_irq_handler,
                              irqflags, dev_name(&pdev->dev), cot);

Cheers.

-- 
Robert

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
