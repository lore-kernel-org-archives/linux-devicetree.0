From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Wed, 22 Jan 2014 21:31:50 +0100
Message-ID: <52E02AB6.7040104@gmail.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com> <20140121233537.GS18269@obsidianresearch.com> <20140122164904.GB27273@localhost> <20140122173417.GT18269@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140122173417.GT18269-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/22/2014 06:34 PM, Jason Gunthorpe wrote:
> On Wed, Jan 22, 2014 at 01:49:05PM -0300, Ezequiel Garcia wrote:
>>> Looking at this patch in isolation it looks to me like the clear
>>> bridge lines should be replaced with a request_irq (as that does the
>>> clear) - is the request_irq in the wrong spot?
>>
>> In that case, I thought that requesting the IRQ at probe time was enough
>> to ensure the BRIDGE_CAUSE would be cleared by the time the watchdog is
>> started. However, after reading through the irqchip code again, I'm no longer
>> sure this is the case.
>
> The watchdog should ideally be fully stopped before request_irq so
> there is no possible race.
>
>> It looks like the BRIDGE_CAUSE register is cleared when the interruption
>> is acked (which happens in the handler if I understood the code right).
>> So requesting the IRQ is useless...
>
> IMHO, the IRQ stuff should clear out pending edge triggered interrupts
> at request_irq time. It makes no sense to take an interrupt for a
> stale edge event.
>
> I had always assumed the core code did this via irq_gc_ack_clr_bit -
> but I don't see an obvious path..
>
>> Sebastian: If the above is correct, do you think we can add a cause clear to
>> the orion irqchip? (supposing it's harmful) Something like this:

Ezequiel,

irqchip/irq-orion.c does mask all interrupts but you are right, it 
should also clear pending interrupts right after that.

So
	/* mask all interrupts */
	writel(0, gc->reg_base + ORION_BRIDGE_IRQ_MASK);

should become

	/* mask and clear all interrupts */
	writel(0, gc->reg_base + ORION_BRIDGE_IRQ_MASK);
	writel(~0, gc->reg_base + ORION_BRIDGE_IRQ_CAUSE);

Could also be clear on write 0, I'll check that. I already had some
beer, so I'll postpone any patches till tomorrow.

Clearing BRIDGE_CAUSE will only clear all currently pending upstream
IRQs, of course. If WDT IRQ will be re-raised right after that in
BRIDGE_CAUSE depends on the actual HW implementation, i.e. we do no
clear the causing IRQ itself but just what it raised in BRIDGE_CAUSE.

So, you should also clear WDT's irq in the driver yourself to clear a
possible pending upstream BRIDGE_CAUSE.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
