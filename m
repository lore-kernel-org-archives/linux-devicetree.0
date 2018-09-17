From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V5 1/3] irqchip: add C-SKY irqchip drivers
Date: Mon, 17 Sep 2018 10:09:29 +0800
Message-ID: <20180917020928.GA22452@guoren-Inspiron-7460>
References: <a70337117db84f6e1091d0b3fc28acb691ac9b35.1537087118.git.ren_guo@c-sky.com>
 <86in35mfas.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86in35mfas.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 16, 2018 at 08:07:55PM +0100, Marc Zyngier wrote:
> On Sun, 16 Sep 2018 09:50:02 +0100,
> Guo Ren <ren_guo@c-sky.com> wrote:
> > +static void csky_mpintc_handler(struct pt_regs *regs)
> > +{
> > +	void __iomem *reg_base = this_cpu_read(intcl_reg);
> > +
> > +	do {
> > +		handle_domain_irq(NULL,
> 
> It is definitely odd to call into handle_domain_irq without a
> domain. A new architecture (which C-SKY apparently is) shouldn't
> depend on this, and should always provide a domain.
Ok, I'll change it to handle_domain_irq(root_domain and prepare the
root_domain definition.

> > +	ret = of_property_read_u32(node, "csky,num-irqs", &nr_irq);
> > +	if (ret < 0) {
> > +		nr_irq = INTC_IRQS;
> > +	}
> 
> Drop the extra braces.
Ok, and change it to: 
	if (ret < 0)
		nr_irq = INTC_IRQS

> > +
> > +	irq_set_default_host(root_domain);
> 
> Please drop this. There is no reason to use this on any modern, DT
> based architecture.
Please let me keep this and in my arch/csky/kernel/smp.c:

void __init setup_smp_ipi(void)
{
	...
	irq_create_mapping(NULL, IPI_IRQ);

I need irq_set_default_host to pass the domain and this api is used by
a lot of drivers:

$ grep irq_set_default_host drivers/irqchip -r | wc -l
16

In future we could find a better solution.

> > diff --git a/irq-csky-apb-intc.c b/irq-csky-apb-intc.c
> > new file mode 100644
> > index 0000000..d56e6b5
> > --- /dev/null
> > +++ b/irq-csky-apb-intc.c
> 
> This is a separate driver, right? Please make it a separate patch.
Ok, no problem.

> > +static inline int handle_irq_perbit(struct pt_regs *regs, u32 hwirq, u32 irq_base)
> 
> Consider using bool as the return type, and use true/false as return
> values.
Ok, no problem.


> > +	int ret;
> 
> bool.
Ok, no problem.


> > +	int ret;
> 
> bool.
Ok, no problem.
