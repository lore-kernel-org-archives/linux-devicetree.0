From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] irqchip: add support for Marvell Orion SoCs
Date: Thu, 2 May 2013 23:34:49 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1305022324371.2891@ionos>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sebastian,

please do not take the rant below personally. You just happen to
trigger it.

On Thu, 2 May 2013, Sebastian Hesselbarth wrote:

> +static void orion_irq_mask(struct irq_data *irqd)
> +{
> +	unsigned int irq = irqd_to_hwirq(irqd);
> +	unsigned int irq_off = irq % 32;
> +	int reg = irq / 32;
> +	u32 val;
> +
> +	val = readl(orion_irq_base[reg] + ORION_IRQ_MASK);
> +	writel(val & ~(1 << irq_off), orion_irq_base[reg] + ORION_IRQ_MASK);
> +}
> +
> +static void orion_irq_unmask(struct irq_data *irqd)
> +{
> +	unsigned int irq = irqd_to_hwirq(irqd);
> +	unsigned int irq_off = irq % 32;
> +	int reg = irq / 32;
> +	u32 val;
> +
> +	val = readl(orion_irq_base[reg] + ORION_IRQ_MASK);
> +	writel(val | (1 << irq_off), orion_irq_base[reg] + ORION_IRQ_MASK);
> +}

I'm really tired of looking at the next incarnation of an OF/DT irq
chip driver, which reimplements stuff which I have consolidated in the
generic irq chip implementation with a lot of effort.

Just look at the various implementations in drivers/irqchip/ and find
out how similar they are. Moving code to drivers/irqchip/ does not
make an excuse for reestablishing the mess which was addressed by the
generic irq chip implementation.

Can you - and that means all of you ARM folks - please get your gear
together and add the missing features to the generic irq chip
implementation? I'm not going to accept more of that OF/DT frenzy.

Thanks,

	tglx
