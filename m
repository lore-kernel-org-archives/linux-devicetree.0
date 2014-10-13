From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 3/7] irqchip: gic: Support hierarchy irq domain.
Date: Mon, 13 Oct 2014 21:51:18 +0200
Message-ID: <4904191.xcTM1nFGH7@wuerfel>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com> <1413196996.23455.9.camel@mtksdaap41> <543BC138.3010109@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <543BC138.3010109@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: "Joe.C" <yingjoe.chen@mediatek.com>, Mark Rutland <Mark.Rutland@arm.com>, "arm@kernel.org" <arm@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, "yingjoe.chen@gmail.com" <yingjoe.chen@gmail.com>, "hc.yen@mediatek.com" <hc.yen@mediatek.com>, "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, "nathan.chung@mediatek.com" <nathan.chung@mediatek.com>, "yh.chen@mediatek.com" <yh.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Pawel Moll <Pawel.Moll@arm.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Santosh Shilimkar <santosh.sh>
List-Id: devicetree@vger.kernel.org

On Monday 13 October 2014 13:10:32 Marc Zyngier wrote:
> On 13/10/14 11:43, Joe.C wrote:
> > On Thu, 2014-10-09 at 17:59 +0100, Marc Zyngier wrote:
> >> On 09/10/14 15:29, Joe.C wrote
> >>> @@ -952,7 +988,11 @@ void __init gic_init_bases(unsigned int gic_nr, int irq_start,
> >>>  
> >>>     gic_irqs -= hwirq_base; /* calculate # of irqs to allocate */
> >>>  
> >>> -   if (of_property_read_u32(node, "arm,routable-irqs",
> >>> +   if (IS_ENABLED(CONFIG_IRQ_DOMAIN_HIERARCHY) &&
> >>> +           of_find_property(node, "arm,irq-domain-hierarchy", NULL))
> >>> +           gic->domain = irq_domain_add_linear(node, gic_irqs,
> >>> +                                   &gic_irq_domain_hierarchy_ops, gic);
> >>
> >> I really think that looking for a property is the wrong thing to do. If
> >> "node" is non-NULL, then we're pretty sure that we're initializing from
> >> DT, and that a pure linear domain should be the right thing, leaving the
> >> legacy stuff for the few non-DT platforms that are still around.
> >>
> >> Thanks,
> >>
> >>      M.
> > 
> > The only reason I introduce "arm,irq-domain-hierarchy" property is
> > trying to keep original behavior when hierarchy irq domain is not used.
> > Without this, when a board init GIC with DT, all driver will have to use
> > devicetree. I'm not sure we want to break things like this.
> 
> I don't think we want to support a "middle of the road" setup, where the
> GIC is probed by DT, but some devices have hardcoded interrupts.

Agreed. We should work on making GIC DT-only by converting the few remaining
users instead, and certainly should not add any new board files that
might use the domain hierarchy code.

	Arnd
