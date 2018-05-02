From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 10/17] irqchip/irq-mvebu-sei: add new driver for Marvell
 SEI
Date: Wed, 2 May 2018 17:56:07 +0200
Message-ID: <20180502175607.3a34a068@windsurf>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-11-miquel.raynal@bootlin.com>
 <20180502111744.5391afff@windsurf.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180502111744.5391afff@windsurf.home>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 2 May 2018 11:17:44 +0200, Thomas Petazzoni wrote:

> > +static const struct irq_domain_ops mvebu_sei_ap_domain_ops = {
> > +	.xlate = irq_domain_xlate_onecell,
> > +	.alloc = mvebu_sei_irq_domain_alloc,
> > +	.free = mvebu_sei_irq_domain_free,
> > +};
> > +
> > +static const struct irq_domain_ops mvebu_sei_cp_domain_ops = {
> > +	.xlate = irq_domain_xlate_twocell,
> > +	.alloc = mvebu_sei_irq_domain_alloc,
> > +	.free = mvebu_sei_irq_domain_free,
> > +};  
> 
> Why do you need two cells for the interrupts coming from the CP and
> only one cell for the interrupts coming from the AP ?
> 
> For thermal in the AP, you do:
> 
> +					interrupt-parent = <&sei_wired_controller>;
> +					interrupts = <18>;
> 
> i.e, you don't specify an interrupt type. For thermal in the CP, you do:
> 
> +				interrupts-extended =
> +					<&CP110_LABEL(icu_sei) 116 IRQ_TYPE_LEVEL_HIGH>;
> 
> here you specify an interrupt type. I'm not sure why you have this
> difference. Even more so because I think a SEI level interrupt is not
> possible, since you only have a "SET" register and no "CLR" register.

OK, my comment is not very correct here, I'm comparing apple to
oranges. The former its an interrupt directly pointing to the GICP_SEI,
while the latter is an interrupt of the ICU, which itself will notify
the GICP_SEI through an MSI.

However, I'm still confused as to why you have .xlate =
irq_domain_xlate_twocell for the mvebu_sei_cp_domain_ops. I think there
is no need for ->xlate() call back here because it's going to be a MSI
domain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
