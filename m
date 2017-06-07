From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: bcm2835: Add AUX interrupt controller
Date: Wed, 7 Jun 2017 13:37:41 +0100
Message-ID: <369bb235-77fb-60ad-61d8-3de039e0f838@raspberrypi.org>
References: <79d4534c-49fe-3af4-13d8-2aaf22120d43@raspberrypi.org>
 <3148562.tSrsoIclEp@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3148562.tSrsoIclEp@ws-stein>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2017 13:07, Alexander Stein wrote:
> On Wednesday 07 June 2017 12:11:45, Phil Elwell wrote:
>> Devices in the AUX block share a common interrupt line, with a register
>> indicating which devices have active IRQs. Expose this as a nested
>> interrupt controller to avoid IRQ sharing problems (easily observed if
>> UART1 and SPI1/2 are enabled simultaneously).
>>
>> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
>> ---
>>  drivers/clk/bcm/clk-bcm2835-aux.c | 120
>> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 120 insertions(+)
>>
>> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c
>> b/drivers/clk/bcm/clk-bcm2835-aux.c index bd750cf..41e0702 100644
>> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
>> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
>> [...]
>> +struct auxirq_state {
>> +	void __iomem      *status;
>> +	u32                enables;
>> +	struct irq_domain *domain;
>> +	struct regmap     *local_regmap;
>> +};
>> +
>> +static struct auxirq_state auxirq __read_mostly;
>> +
>> +static irqreturn_t bcm2835_auxirq_handler(int irq, void *dev_id)
>> +{
>> +	u32 stat = readl_relaxed(auxirq.status);
>> +	u32 masked = stat & auxirq.enables;
> 
> Doesn't this hide any spurious interrupts? Is this acceptable? I mean getting 
> informed about spurious interrupts seems nice to me, as it indicates a 
> hardware/configuration problem.

Thanks for the reply. This interrupt handler is capable of dispatching multiple
interrupts but must return a single value - IRQ_HANDLED or IRQ_NONE. I've assumed
that returning IRQ_NONE repeatedly will trigger the spurious interrupt detection.

This implementation returns IRQ_HANDLED if any unmasked interrupts are raised,
otherwise it returns IRQ_NONE. Therefore provided any spurious interrupt isn't
always coincident with a real interrupt then it ought eventually to be identified
as spurious. The alternative - returning IRQ_NONE if there are any spurious
interrupts - seems prone to causing collateral damage.

What did you have in mind?

>> +	if (masked & BCM2835_AUXIRQ_UART_MASK)
>> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
>> +						     BCM2835_AUXIRQ_UART_IRQ));
>> +
>> +	if (masked & BCM2835_AUXIRQ_SPI1_MASK)
>> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
>> +						     BCM2835_AUXIRQ_SPI1_IRQ));
>> +
>> +	if (masked & BCM2835_AUXIRQ_SPI2_MASK)
>> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
>> +						     BCM2835_AUXIRQ_SPI2_IRQ));
>> +
>> +	return (masked & BCM2835_AUXIRQ_ALL_MASK) ? IRQ_HANDLED : IRQ_NONE;
>> +}
> 
> How does interrupt acknowledgement work in these 3 interrupts work?

The interrupt "controller" is just combinatorial logic on the three level-sensitive
interrupt lines from the devices. Interrupts must be acknowledged and cleared at
source.

Phil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
