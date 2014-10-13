From: Joe.C <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v3 3/7] irqchip: gic: Support hierarchy irq domain.
Date: Mon, 13 Oct 2014 18:43:16 +0800
Message-ID: <1413196996.23455.9.camel@mtksdaap41>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
 <1412864980-20273-4-git-send-email-yingjoe.chen@mediatek.com>
 <5436BF0C.1030508@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5436BF0C.1030508@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, "yingjoe.chen@gmail.com" <yingjoe.chen@gmail.com>, "yh.chen@mediatek.com" <yh.chen@mediatek.com>, "arm@kernel.org" <arm@kernel.org>, "nathan.chung@mediatek.com" <nathan.chung@mediatek.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.
List-Id: devicetree@vger.kernel.org

On Thu, 2014-10-09 at 17:59 +0100, Marc Zyngier wrote:
> On 09/10/14 15:29, Joe.C wrote
> > @@ -952,7 +988,11 @@ void __init gic_init_bases(unsigned int gic_nr, int irq_start,
> >  
> >  	gic_irqs -= hwirq_base; /* calculate # of irqs to allocate */
> >  
> > -	if (of_property_read_u32(node, "arm,routable-irqs",
> > +	if (IS_ENABLED(CONFIG_IRQ_DOMAIN_HIERARCHY) &&
> > +		of_find_property(node, "arm,irq-domain-hierarchy", NULL))
> > +		gic->domain = irq_domain_add_linear(node, gic_irqs,
> > +					&gic_irq_domain_hierarchy_ops, gic);
> 
> I really think that looking for a property is the wrong thing to do. If
> "node" is non-NULL, then we're pretty sure that we're initializing from
> DT, and that a pure linear domain should be the right thing, leaving the
> legacy stuff for the few non-DT platforms that are still around.
> 
> Thanks,
> 
> 	M.

The only reason I introduce "arm,irq-domain-hierarchy" property is
trying to keep original behavior when hierarchy irq domain is not used.
Without this, when a board init GIC with DT, all driver will have to use
devicetree. I'm not sure we want to break things like this. I will
remove this and just use linear for all DT in my next version.

Joe.C
