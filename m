From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/2] irqchip: add driver for imx-irqsteer controller
Date: Mon, 17 Dec 2018 14:52:20 +0100
Message-ID: <1545054740.5874.6.camel@pengutronix.de>
References: <20181214102244.21509-1-l.stach@pengutronix.de>
         <20181214102244.21509-3-l.stach@pengutronix.de>
         <86r2ejaztt.wl-marc.zyngier@arm.com>
         <1545041393.5874.1.camel@pengutronix.de>
         <98217822-208a-9a92-e80b-b0b73111e527@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98217822-208a-9a92-e80b-b0b73111e527@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Am Montag, den 17.12.2018, 10:32 +0000 schrieb Marc Zyngier:
[...]
> > > > > > +	/* steer all IRQs into configured channel */
> > > > +	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> > > 
> > > Could you explain what this channel is exactly?
> > 
> > I've tired in the cover letter, but seems I still failed, so let me try
> > again. ;)
> > 
> > Each irqsteer instance can be connected to multiple upstream IRQ lines,
> > but only one of them can be used at runtime. This register controls
> > which output IRQ line will be used by this controller instance. With
> > multiple controller instances in the system it's a way to offload the
> > decision of the IRQ routing from the hardware to the software guys.
> > 
> > Let's try to add an example: Suppose there are 2 instances of the
> > irqsteer controller. Both are connected to upstream GIC IRQs 20 and 21.
> > The channel controls which of those IRQs are used by each instance, so
> > there are 2 valid DT configurations in this scenario:
> > 
> > This is valid:
> > 
> > irqsteer@0 {
> > 	interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>
> > 	fsl,channel = <0>;
> > };
> > 
> > irqsteer@1 {
> > 	interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>
> > 	fsl,channel = <1>;
> > };
> > 
> > As well as this:
> > 
> > irqsteer@0 {
> > 	interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>
> > 	fsl,channel = <1>;
> > };
> > 
> > irqsteer@1 {
> > 	interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>
> > 	fsl,channel = <0>;
> > };
> 
> OK, this is now making sense, thanks for that. I'm wondering if it'd
> make sense to expose both IRQs in the DT for each irqsteer, and use
> fsl,channel as the selector? It doesn't change much in the driver, but
> seems to describe the HW in a more complete way.
> 
> I don't care much either way, and I'll leave it for you and the DT folks
> to decide.

At least according to the preliminary documentation available about the
i.MX8QM not all of the channels are routed to an upstream IRQ which is
visible to the Linux system. Some of them may also go to the Cortex-M
subsystem, so for your suggestion to work I would need a scheme to
describe the output interrupts with holes in between them.

I guess that complicates things a bit too much for little gain, as I
don't see us switching the controller between different channels at
runtime (which is the only thing I could imagine which would benefit
from this more complete HW description). The current binding can deal
with having some channels which route to something invisible to the
Linux system just fine, so I'm leaning toward keeping things as they
are now.

Regards,
Lucas
