From: Alexander Stein <alexanders83@web.de>
Subject: Re: [PATCH 1/2] clk: bcm2835: Add AUX interrupt controller
Date: Wed, 07 Jun 2017 19:25:07 +0200
Message-ID: <2599573.4PsWGx6B1X@localhost>
References: <79d4534c-49fe-3af4-13d8-2aaf22120d43@raspberrypi.org> <3148562.tSrsoIclEp@ws-stein> <369bb235-77fb-60ad-61d8-3de039e0f838@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <369bb235-77fb-60ad-61d8-3de039e0f838@raspberrypi.org>
Sender: linux-clk-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

 On Wednesday, June 7, 2017, 2:37:41 PM CEST Phil Elwell wrote:
> On 07/06/2017 13:07, Alexander Stein wrote:
> > On Wednesday 07 June 2017 12:11:45, Phil Elwell wrote:
> >> Devices in the AUX block share a common interrupt line, with a register
> >> indicating which devices have active IRQs. Expose this as a nested
> >> interrupt controller to avoid IRQ sharing problems (easily observed if
> >> UART1 and SPI1/2 are enabled simultaneously).
> >> 
> >> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> >> ---
> >> 
> >>  drivers/clk/bcm/clk-bcm2835-aux.c | 120
> >> 
> >> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 120 insertions(+)
> >> 
> >> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c
> >> b/drivers/clk/bcm/clk-bcm2835-aux.c index bd750cf..41e0702 100644
> >> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
> >> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
> >> [...]
> >> +struct auxirq_state {
> >> +	void __iomem      *status;
> >> +	u32                enables;
> >> +	struct irq_domain *domain;
> >> +	struct regmap     *local_regmap;
> >> +};
> >> +
> >> +static struct auxirq_state auxirq __read_mostly;
> >> +
> >> +static irqreturn_t bcm2835_auxirq_handler(int irq, void *dev_id)
> >> +{
> >> +	u32 stat = readl_relaxed(auxirq.status);
> >> +	u32 masked = stat & auxirq.enables;
> > 
> > Doesn't this hide any spurious interrupts? Is this acceptable? I mean
> > getting informed about spurious interrupts seems nice to me, as it
> > indicates a hardware/configuration problem.
> 
> Thanks for the reply. This interrupt handler is capable of dispatching
> multiple interrupts but must return a single value - IRQ_HANDLED or
> IRQ_NONE. I've assumed that returning IRQ_NONE repeatedly will trigger the
> spurious interrupt detection.
> 
> This implementation returns IRQ_HANDLED if any unmasked interrupts are
> raised, otherwise it returns IRQ_NONE. Therefore provided any spurious
> interrupt isn't always coincident with a real interrupt then it ought
> eventually to be identified as spurious. The alternative - returning
> IRQ_NONE if there are any spurious interrupts - seems prone to causing
> collateral damage.
> 
> What did you have in mind?

I was wondering about "stat & auxirq.enables". With that you wouldn't forward 
any spurious interrupts to e.g. SPI1. I don't know which way is better, 
returning IRQ_NONE is a masked interrupt happens, or pass it further down. I 
guess this also raises a warning if the SPI driver also returns IRQ_NONE.
BTW: Is it even allowed to call generic_handle_irq on a masked irq?

> >> +	if (masked & BCM2835_AUXIRQ_UART_MASK)
> >> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
> >> +						     BCM2835_AUXIRQ_UART_IRQ));
> >> +
> >> +	if (masked & BCM2835_AUXIRQ_SPI1_MASK)
> >> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
> >> +						     BCM2835_AUXIRQ_SPI1_IRQ));
> >> +
> >> +	if (masked & BCM2835_AUXIRQ_SPI2_MASK)
> >> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
> >> +						     BCM2835_AUXIRQ_SPI2_IRQ));
> >> +
> >> +	return (masked & BCM2835_AUXIRQ_ALL_MASK) ? IRQ_HANDLED : IRQ_NONE;
> >> +}
> > 
> > How does interrupt acknowledgement work in these 3 interrupts work?
> 
> The interrupt "controller" is just combinatorial logic on the three
> level-sensitive interrupt lines from the devices. Interrupts must be
> acknowledged and cleared at source.

Thanks for the info.

Best regards,
Alexander


