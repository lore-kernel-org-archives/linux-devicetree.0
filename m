From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: bcm2835: Add AUX interrupt controller
Date: Wed, 7 Jun 2017 21:48:58 +0100
Message-ID: <0cf0462f-0c3a-b89b-a729-8fdea0037260@raspberrypi.org>
References: <79d4534c-49fe-3af4-13d8-2aaf22120d43@raspberrypi.org>
 <3148562.tSrsoIclEp@ws-stein>
 <369bb235-77fb-60ad-61d8-3de039e0f838@raspberrypi.org>
 <2599573.4PsWGx6B1X@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2599573.4PsWGx6B1X@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2017 18:25, Alexander Stein wrote:
>  On Wednesday, June 7, 2017, 2:37:41 PM CEST Phil Elwell wrote:
>> On 07/06/2017 13:07, Alexander Stein wrote:
>>> On Wednesday 07 June 2017 12:11:45, Phil Elwell wrote:
>>>> Devices in the AUX block share a common interrupt line, with a register
>>>> indicating which devices have active IRQs. Expose this as a nested
>>>> interrupt controller to avoid IRQ sharing problems (easily observed if
>>>> UART1 and SPI1/2 are enabled simultaneously).
>>>>
>>>> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
>>>> ---
>>>>
>>>>  drivers/clk/bcm/clk-bcm2835-aux.c | 120
>>>>
>>>> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 120 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c
>>>> b/drivers/clk/bcm/clk-bcm2835-aux.c index bd750cf..41e0702 100644
>>>> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
>>>> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
>>>> [...]
>>>> +struct auxirq_state {
>>>> +	void __iomem      *status;
>>>> +	u32                enables;
>>>> +	struct irq_domain *domain;
>>>> +	struct regmap     *local_regmap;
>>>> +};
>>>> +
>>>> +static struct auxirq_state auxirq __read_mostly;
>>>> +
>>>> +static irqreturn_t bcm2835_auxirq_handler(int irq, void *dev_id)
>>>> +{
>>>> +	u32 stat = readl_relaxed(auxirq.status);
>>>> +	u32 masked = stat & auxirq.enables;
>>>
>>> Doesn't this hide any spurious interrupts? Is this acceptable? I mean
>>> getting informed about spurious interrupts seems nice to me, as it
>>> indicates a hardware/configuration problem.
>>
>> Thanks for the reply. This interrupt handler is capable of dispatching
>> multiple interrupts but must return a single value - IRQ_HANDLED or
>> IRQ_NONE. I've assumed that returning IRQ_NONE repeatedly will trigger the
>> spurious interrupt detection.
>>
>> This implementation returns IRQ_HANDLED if any unmasked interrupts are
>> raised, otherwise it returns IRQ_NONE. Therefore provided any spurious
>> interrupt isn't always coincident with a real interrupt then it ought
>> eventually to be identified as spurious. The alternative - returning
>> IRQ_NONE if there are any spurious interrupts - seems prone to causing
>> collateral damage.
>>
>> What did you have in mind?
>
> I was wondering about "stat & auxirq.enables". With that you wouldn't forward
> any spurious interrupts to e.g. SPI1. I don't know which way is better,
> returning IRQ_NONE is a masked interrupt happens, or pass it further down. I
> guess this also raises a warning if the SPI driver also returns IRQ_NONE.

That makes sense. Although my instinct was to ignore the spurious interrupt
as early as possible, it is better to let Linux handle in it. Without that
use of the enables field there is no need for the mask and unmask methods,
so the driver becomes even simpler.

I'll incorporate your suggestions into v2.

> BTW: Is it even allowed to call generic_handle_irq on a masked irq?

Ah, I think that's just a naming confusion - the variable contains bits for
interrupts that are active and enabled, i.e. masked in, not masked out.

Phil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
