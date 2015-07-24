From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: introduce of_has_named_irqs helper
Date: Fri, 24 Jul 2015 15:59:39 -0500
Message-ID: <CAL_JsqKRat-OH=z3c0bCYEKCUrKDKHJPHaDCw977mfUYaKPSTA@mail.gmail.com>
References: <20150724182655.GA22007@dtor-ws> <CAL_Jsq+JGpNBwS3HF1fF4HdefRCwhniaYCm5G4_WAnio7t-1og@mail.gmail.com>
 <20150724192619.GA33241@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150724192619.GA33241@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 24, 2015 at 2:26 PM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jul 24, 2015 at 02:14:57PM -0500, Rob Herring wrote:
>> On Fri, Jul 24, 2015 at 1:26 PM, Dmitry Torokhov
>> <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Sometimes drivers might wish to transition from index-based to named
>> > interrupt descriptions. To aid in decision-making when parsing device
>> > tree data let's provide a helper that will indicate the scheme that is
>> > being used.
>>
>> Generally, IRQs are retrieved by platform_get_irq or
>> platform_get_irq_byname. Drivers should not call the of_irq_*
>> functions directly in most cases.
>
> That would be true for platform drivers, but not all devices are
> platform devices.

I should say for drivers, IRQs are retrieved by a bus specific method,
not DT functions. There are 3 cases of drivers using them:

arch/arm/mach-omap2/prm3xxx.c:                  irq_num = of_irq_get(np, 0);
arch/arm/mach-omap2/prm44xx.c:  irq_num = of_irq_get(prm_init_data->np, 0);
drivers/pinctrl/sirf/pinctrl-atlas7.c:          ret = of_irq_get(np, idx);

>> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >
>> > The intent is to it like this:
>> >
>> >         if (of_has_named_irqs(np) {
>> >                 /* Wake IRQ is optional */
>> >                 dev->wakeirq = of_irq_get_byname(np, "wakeup");
>> >                 if (dev->wakeirq < 0 && dev->wakeirq != -ENODATA)
>> >                         return dev->wakeirq;
>> >         }
>>
>> of_irq_get_byname will already return an error if the property is not
>> present. Use that.
>
> I do not like that it returns -EINVAL when property is missing, can we
> change it to return -ENODATA (so it is the same as when the property is
> defined but such name is missing)?

It may be useful to distinguish between those cases. If you want audit
all the callers we could possibly change it though.

Really, I don't understand why you would care about any error code
other than EPROBE_DEFER. If it is optional, then you would want to
continue no matter what is returned.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
