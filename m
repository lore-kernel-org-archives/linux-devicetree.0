From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 07/14] irqchip/irq-mvebu-sei: add new driver for
 Marvell SEI
Date: Fri, 28 Sep 2018 11:25:32 +0100
Message-ID: <9a0de5ac-8cef-0950-e218-0368167ecff8@arm.com>
References: <20180830073535.10710-1-miquel.raynal@bootlin.com>
 <20180830073535.10710-8-miquel.raynal@bootlin.com>
 <86pnx7x5pz.wl-marc.zyngier@arm.com> <20180924180133.2ea93762@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180924180133.2ea93762@xps13>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 24/09/18 17:01, Miquel Raynal wrote:

Hi Miquel,

[...]

> The difference is that at this stage, the irq_data->chip pointer of the
> SEI controller _parent_ (ie. the GIC's chip pointer) is not valid. I
> digged a lot in this direction during your vacations to find out what I
> missed, and I ended up calling back irq_alloc_irqs_parent().
> 
> If you have an idea of how to handle this properly, I am all ears!

The most glaring problem is that you create a hierarchy that encompasses
the GIC, which is just wrong. The hierarchy cannot point to the GIC,
because it end-up as a multiplexer.

This code sequence in the probe function is the root of all evil:

	/* Get a reference to the parent domain */
	parent = of_irq_find_parent(node);
	if (!parent) {
		dev_err(sei->dev, "Failed to find parent IRQ node\n");
		ret = -ENODEV;
		goto dispose_irq;
	}

This is a GIC interrupt, which is the output line for the SEI block.

	parent_domain = irq_find_host(parent);
	if (!parent_domain) {
		dev_err(sei->dev, "Failed to find parent IRQ domain\n");
		ret = -ENODEV;
		goto dispose_irq;
	}

That's the GIC domain.

	/* Create the 'wired' domain */
	sei->ap_domain = irq_domain_create_hierarchy(parent_domain, 0,
						     sei->caps->ap_range.size,
						     of_node_to_fwnode(node),
						     &mvebu_sei_ap_domain_ops,
						     sei);
	if (!sei->ap_domain) {
		dev_err(sei->dev, "Failed to create AP IRQ domain\n");
		ret = -ENOMEM;
		goto dispose_irq;
	}

And here, you're saying "each and every AP SEI interrupt is directly
linked to a unique GIC interrupt". Nothing could be further from the
truth, since all SEI interrupts are funnelled through a *single*
GIC interrupt. So you cannot create it as a hierarchy parented at
the GIC.

	/* Create the 'MSI' domain */
	sei->cp_domain = irq_domain_create_hierarchy(parent_domain, 0,
						     sei->caps->cp_range.size,
						     of_node_to_fwnode(node),
						     &mvebu_sei_cp_domain_ops,
						     sei);


Same thing here.

The issue here is that you're using the GIC domain as the way to root
the two distinct SEI domains, while they should be rooted at an internal,
SEI-specific domain. I'd suggest a topology like this:

                  AP-SEI ---> S
                              E
    Plat-MSI ---> CP-SEI ---> I

CP-SEI and AP-SEI use SEI as a parent. SEI does not have a parent, but is
a chained irqchip.

I'm happy to help you reworking this piece of code if you tell me how to
plug a driver that can use it on an mcbin system.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
