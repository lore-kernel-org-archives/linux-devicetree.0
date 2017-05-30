From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 3/6] irqchip: irq-mvebu-gicp: new driver for Marvell
 GICP
Date: Tue, 30 May 2017 17:25:00 +0200
Message-ID: <20170530172500.7bf522e1@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <1496135772-20694-4-git-send-email-thomas.petazzoni@free-electrons.com>
        <2ea42715-700b-c363-eeba-db83b0f63a70@arm.com>
        <20170530165454.6ca24dbc@free-electrons.com>
        <5b882159-4de1-5a8e-5737-56542f2aee3a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b882159-4de1-5a8e-5737-56542f2aee3a@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 May 2017 16:17:41 +0100, Marc Zyngier wrote:

> > Indeed. But do we care? Can an edge interrupt be left pending from the
> > firmware?  
> 
> I cannot see why not. It is just as likely as a level interrupt.

OK.

> > I'm not sure how to use this irq_set_irqchip_state() API. I guess it
> > needs a virq that corresponds to the GIC SPI interrupt, and I'm not
> > sure how to get that.  
> 
> You do have the virtual interrupt when doing the allocation (it is
> passed as a parameter). So you could perform the mapping (call into the
> lower layers), and clear the pending bit using the above API.

So in mvebu_icu_irq_domain_alloc(), if I do:

	irq_set_irqchip_state(virq, IRQCHIP_STATE_MASKED, true);

this will go all the way to the ->irq_set_irqchip_state() in the GIC? I
thought the virq we had was referring to an irq from the ICU domain,
not from the GIC one. But maybe I'm still getting confused by all these
irq domains.

> But maybe you don't have any edge interrupt on this SoC, and it doesn't
> matter.

We currently don't have any in the devices we support in the SoC, but
since the ICU does support edge interrupts explicitly, it's nicer if we
can get this right. Plus if this actually works, we don't need the
marvell,gicp "driver" anymore.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
