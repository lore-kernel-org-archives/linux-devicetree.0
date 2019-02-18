From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Mon, 18 Feb 2019 06:35:08 -0800
Message-ID: <20190218143508.GD15711@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <41a9780b-d971-2b20-1ecb-c55852292563@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41a9780b-d971-2b20-1ecb-c55852292563@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [190216 03:30]:
> On 2/12/2019 1:12 PM, Lokesh Vutla wrote:
> > +TISCI Interrupt Router Node:
> > +----------------------------
> > +- compatible:		Must be "ti,sci-intr".
> > +- interrupt-controller:	Identifies the node as an interrupt controller
> > +- #interrupt-cells:	Specifies the number of cells needed to encode an
> > +			interrupt source. The value should be 4.
> > +			First cell should contain the TISCI device ID of source
> > +			Second cell should contain the interrupt source offset
> > +			within the device
> > +			Third cell specifies the trigger type as defined
> > +			in interrupts.txt in this directory.
> > +			Fourth cell should be 1 if the irq is coming from
> > +			interrupt aggregator else 0.
> > +- ti,sci:		Phandle to TI-SCI compatible System controller node.
> > +- ti,sci-dst-id:	TISCI device ID of the destination IRQ controller.
>
> Please help me here. As said this is the TISCI device id for the host
> interrupt controller. While sending message to the system co-processor
> this ID needs to be specified so that the irq route gets discovered and
> configured. Atleast with the current design device Ids are not
> discoverable. Can you mention what can be improved here? Is there any
> such example where a firmware supports querying the deivce ids?
> 
> Also do you have any further comments on this patch?

No reg property above. So if the interrupt router is not accessible
by Linux like you're saying, you should not set up a dts node for
it at all.

Regards,

Tony
