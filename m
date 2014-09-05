From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 14/16] irqchip: mips-gic: Support local interrupts
Date: Fri, 5 Sep 2014 14:50:02 -0700
Message-ID: <CAL1qeaH5ZQA8Y=n3uVSy9e+vEweCi_RT2s-ZGRfyJTAcbguyoA@mail.gmail.com>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
	<1409938218-9026-15-git-send-email-abrestic@chromium.org>
	<alpine.DEB.2.10.1409052056400.5472@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1409052056400.5472@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 5, 2014 at 12:05 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On Fri, 5 Sep 2014, Andrew Bresticker wrote:
>>  static void gic_mask_irq(struct irq_data *d)
>>  {
>> -     GIC_CLR_INTR_MASK(d->irq - gic_irq_base);
>> +     unsigned int irq = d->irq - gic_irq_base;
>> +
>> +     if (gic_is_local_irq(irq)) {
>> +             GICWRITE(GIC_REG(VPE_LOCAL, GIC_VPE_RMASK),
>> +                      1 << GIC_INTR_BIT(gic_hw_to_local_irq(irq)));
>> +     } else {
>> +             GIC_CLR_INTR_MASK(irq);
>> +     }
>>  }
>>
>>  static void gic_unmask_irq(struct irq_data *d)
>>  {
>> -     GIC_SET_INTR_MASK(d->irq - gic_irq_base);
>> +     unsigned int irq = d->irq - gic_irq_base;
>> +
>> +     if (gic_is_local_irq(irq)) {
>> +             GICWRITE(GIC_REG(VPE_LOCAL, GIC_VPE_SMASK),
>> +                      1 << GIC_INTR_BIT(gic_hw_to_local_irq(irq)));
>> +     } else {
>> +             GIC_SET_INTR_MASK(irq);
>> +     }
>
> Why are you adding a conditional in all these functions instead of
> having two interrupt chips with separate callbacks and irqdata?

Ok, I'll use a separate irqchip.

> And looking at GIC_SET_INTR_MASK(irq) makes me shudder even more. The
> whole thing can be replaced with the generic interrupt chip functions.
>
> If you set it up proper, then there is not a single conditional or
> runtime calculation of bitmasks, address offsets etc.

Yes, I'd like to use the generic irqchip library here, but Malta and
SEAD-3 will need to be converted over to using irq domains.  Perhaps
I'll do that first - it should get rid of a lot of the other ugliness
here as well.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
