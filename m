From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 01/16] MIPS: Provide a generic plat_irq_dispatch
Date: Fri, 5 Sep 2014 14:02:38 -0700
Message-ID: <CAL1qeaFDBU6bB-OmSW8DqMWGtpNDL9H-WB6F0ZBg7hEz6c1vBQ@mail.gmail.com>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
	<1409938218-9026-2-git-send-email-abrestic@chromium.org>
	<alpine.DEB.2.10.1409052051240.5472@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1409052051240.5472@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 5, 2014 at 11:51 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On Fri, 5 Sep 2014, Andrew Bresticker wrote:
>> For platforms which boot with device-tree and use the MIPS CPU interrupt
>> controller binding, a generic plat_irq_dispatch() can be used since all
>> CPU interrupts should be mapped through the CPU IRQ domain.  Implement a
>> plat_irq_dispatch() which simply handles the highest pending interrupt.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Tested-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> ---
>> No changes from v1.
>> ---
>>  arch/mips/kernel/irq_cpu.c | 28 +++++++++++++++++++++++-----
>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/mips/kernel/irq_cpu.c b/arch/mips/kernel/irq_cpu.c
>> index e498f2b..9cf8459 100644
>> --- a/arch/mips/kernel/irq_cpu.c
>> +++ b/arch/mips/kernel/irq_cpu.c
>> @@ -116,6 +116,24 @@ void __init mips_cpu_irq_init(void)
>>  }
>>
>>  #ifdef CONFIG_IRQ_DOMAIN
>> +static struct irq_domain *mips_intc_domain;
>> +
>> +asmlinkage void __weak plat_irq_dispatch(void)
>> +{
>> +     unsigned int pending = read_c0_cause() & read_c0_status() & ST0_IM;
>> +     unsigned int hw;
>> +     int irq;
>> +
>> +     if (!pending) {
>> +             spurious_interrupt();
>> +             return;
>> +     }
>> +
>> +     hw = fls(pending) - CAUSEB_IP - 1;
>> +     irq = irq_linear_revmap(mips_intc_domain, hw);
>> +     do_IRQ(irq);
>
> Why are you not handling all pending interrupts in a loop?

Nearly all of the existing plat_irq_dispatch()es handle only a single
pending interrupt.  I suppose it doesn't hurt to handle all pending
interrupts though.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
