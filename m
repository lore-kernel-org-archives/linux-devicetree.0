From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Thu, 23 Jan 2014 01:03:26 +0100
Message-ID: <52E05C4E.9060709@gmail.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com> <20140121233537.GS18269@obsidianresearch.com> <20140122164904.GB27273@localhost> <20140122173417.GT18269@obsidianresearch.com> <52E02AB6.7040104@gmail.com> <20140122205213.GW18269@obsidianresearch.com> <20140122221237.GA30763@localhost> <20140122223117.GX18269@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140122223117.GX18269-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/22/2014 11:31 PM, Jason Gunthorpe wrote:
> On Wed, Jan 22, 2014 at 07:12:38PM -0300, Ezequiel Garcia wrote:
>> On Wed, Jan 22, 2014 at 01:52:13PM -0700, Jason Gunthorpe wrote:
>>>> Clearing BRIDGE_CAUSE will only clear all currently pending upstream
>>>> IRQs, of course. If WDT IRQ will be re-raised right after that in
>>>> BRIDGE_CAUSE depends on the actual HW implementation, i.e. we do no
>>>> clear the causing IRQ itself but just what it raised in BRIDGE_CAUSE.
>>>
>>> Which is why it makes no sense to clear it one time at kernel start.
>>>
>>
>> So, it seems we need to handle irq_startup(), as you suggested.
>> I've just tested the attached patch, and it's working fine: the driver's
>> probe() fully stops the watchdog, and then request_irq() acks and
>> pending interrupts, through the added irq_startup().
>>
>> How does it look?
>
> Looks sane to me.
>
> I looked some more and there are other drivers (eg irq-metag-ext) that
> take this same approach.
>
> Sebastian:
> I looked at the irq-orion driver a bit more and noticed this:
>
>          ret = irq_alloc_domain_generic_chips(domain, nrirqs, 1, np->name,
>                               handle_level_irq, clr, 0, IRQ_GC_INIT_MASK_CACHE);
>                             ^^^^^^^^^^^^^^^^^^^^^
> Shouldn't it be handle_edge_irq? Otherwise who is calling irq_ack? How
> does this work at all? :)

I can tell you that it comes from arch/arm/plat-orion/irq.c and I
blindly copied it. I never really checked the differences in handling
level/edge irqs. Besides, if it wasn't working, we wouldn't get far
in booting the kernel without timer irqs.

 From a HW point-of-view, I'd say the difference is that an
edge-triggered irq samples level transitions from e.g. low to high.
It also remains asserted if you clear the actual cause of the interrupt
and is only asserted again on the next low-to-high transition.

A level-triggered irq will be asserted as long as the cause of the irq
is asserted. If you clear the cause, you'll also clear that bit in the
upstream controller.

*BUT*, I will double-check how Linux deals with level/edge irqs and if
Orion SoCs have edge or level triggered cause registers. That should
reveal, if it is more sane to use handle_edge_irq here and possibly in
the main interrupt controller, too.

Sebastian


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
