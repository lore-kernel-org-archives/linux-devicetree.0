From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 3/6] irqchip: irq-mvebu-gicp: new driver for Marvell GICP
Date: Tue, 30 May 2017 16:54:54 +0200
Message-ID: <20170530165454.6ca24dbc@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <2ea42715-700b-c363-eeba-db83b0f63a70@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2ea42715-700b-c363-eeba-db83b0f63a70@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hanna Hawa <hannah@marvell.com>, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 May 2017 14:55:57 +0100, Marc Zyngier wrote:

> > +	for (i = 0; i < GICP_INT_COUNT; i++)
> > +		writel(i, regs + GICP_CLRSPI_NSR_OFFSET);  
> 
> What does this do on an edge interrupt?

I guess nothing. What the ICU does is:

 * For level interrupts: when the interrupt wire is asserted, write to
   SETNSR, when the interrupt wire is deasserted, write to CLRNSR

 * For edge interrupts: only the interrupt assertion causes a write to
   SETNSR.

> I bet this doesn't have any effect

Indeed. But do we care? Can an edge interrupt be left pending from the
firmware?

>, so you may want to use the irq_set_irqchip_state() API to clear a
> potential pending state instead (and you may want to wire it in the
> ICU driver itself as well).

I'm not sure how to use this irq_set_irqchip_state() API. I guess it
needs a virq that corresponds to the GIC SPI interrupt, and I'm not
sure how to get that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
