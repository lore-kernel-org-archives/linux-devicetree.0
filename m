From: robert.jarzmik-GANU6spQydw@public.gmane.org
Subject: Re: [PATCH v3 2/3] mfd: lubbock_io: add lubbock_io board
Date: Wed, 21 Jan 2015 14:36:59 +0100 (CET)
Message-ID: <332399927.402665086.1421847419490.JavaMail.root@zimbra1-e1.priv.proxad.net>
References: <20150121123551.GD9258@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150121123551.GD9258@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> ----- Mail original -----
> De: "Lee Jones" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
First of all, this is my web mail interface, so please be kind with
my mail formatting ...

> Looking at one of the other patches in the series it appears the flag
> you're trying to capture is IORESOURCE_IRQ_LOWEDGE.  When I grep for
> where this is being _used_ (think 'consumed, rather than passed.  I
> only see a single entry in drivers/pnp/interface.c.
Look at this call chain :
request_irq()
  setup_irq()
    __setup_irq()
      __irq_set_trigger()
        pxa_gpio_irq_type() (aka. chip->irq_set_type)
          => hardware register manipulation

Moreover, you should be aware of the bijection existing between :
 - IORESOURCE_IRQ_LOWEDGE and IRQF_TRIGGER_RISING
 - it's HIGHEDGE twin
 - it is noted in : include/linux/interrupt.h

> That's what got me thinking... are you sure you're a) making use of
this flag
Yes, I'm quite sure.

> b) assuming the answer to 'a' is "no"
I won't :)

> I think to set an edge trigger on an IRQ, you should instead do so via
> irq_set_irq_type(), or have a missed a line or two?
__setup_irq(), that's the entry point.

Cheers.

--
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
