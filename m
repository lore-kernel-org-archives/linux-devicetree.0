From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V10 1/8] irqchip: add C-SKY SMP interrupt controller
Date: Mon, 8 Oct 2018 17:35:19 +0100
Message-ID: <404fb433-020e-28f9-2434-a22c6db36a15@arm.com>
References: <cover.1538672812.git.ren_guo@c-sky.com>
 <e06484474231375248e3e7a6ab47cf8ff8893129.1538672812.git.ren_guo@c-sky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e06484474231375248e3e7a6ab47cf8ff8893129.1538672812.git.ren_guo@c-sky.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guo,

On 04/10/18 18:22, Guo Ren wrote:
>   - Irq-csky-mpintc is C-SKY smp system interrupt controller and it
>     could support 16 soft irqs, 16 private irqs, and 992 max common
>     irqs.
> 
> Changelog:
>   - pass checkpatch.pl
>   - Move IPI_IRQ into the driver
>   - Remove irq_set_default_host() and use set_ipi_irq_mapping()
>   - Change name with upstream feed-back
>   - Change irq map, reserve soft_irq & private_irq space
>   - Add License and Copyright
>   - Support set_affinity for irq balance in SMP
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>   drivers/irqchip/Kconfig           |   9 ++
>   drivers/irqchip/Makefile          |   1 +
>   drivers/irqchip/irq-csky-mpintc.c | 197 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 207 insertions(+)
>   create mode 100644 drivers/irqchip/irq-csky-mpintc.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 383e7b7..8103f6f 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -371,6 +371,15 @@ config QCOM_PDC
>   	  Power Domain Controller driver to manage and configure wakeup
>   	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
>   
> +config CSKY_MPINTC
> +	bool "C-SKY Multi Processor Interrupt Controller"
> +	depends on CSKY
> +	help
> +	  Say yes here to enable C-SKY SMP interrupt controller driver used
> +	  for C-SKY SMP system.
> +	  In fact it's not mmio map in hw and it use ld/st to visit the
> +	  controller's register inside CPU.
> +
>   endmenu
>   
>   config SIFIVE_PLIC
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index fbd1ec8..6b739ea 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -87,4 +87,5 @@ obj-$(CONFIG_MESON_IRQ_GPIO)		+= irq-meson-gpio.o
>   obj-$(CONFIG_GOLDFISH_PIC) 		+= irq-goldfish-pic.o
>   obj-$(CONFIG_NDS32)			+= irq-ativic32.o
>   obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
> +obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
>   obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
> diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-mpintc.c
> new file mode 100644
> index 0000000..a008f8e
> --- /dev/null
> +++ b/drivers/irqchip/irq-csky-mpintc.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2018 Hangzhou C-SKY Microsystems co.,ltd.
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/module.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/smp.h>
> +#include <linux/io.h>
> +#include <asm/irq.h>
> +#include <asm/traps.h>
> +#include <asm/reg_ops.h>
> +
> +static struct irq_domain *root_domain;
> +static void __iomem *INTCG_base;
> +static void __iomem *INTCL_base;
> +
> +#define IPI_IRQ		15
> +#define INTC_IRQS	256
> +#define COMM_IRQ_BASE	32
> +
> +#define INTCG_SIZE	0x8000
> +#define INTCL_SIZE	0x1000
> +
> +#define INTCG_ICTLR	0x0
> +#define INTCG_CICFGR	0x100
> +#define INTCG_CIDSTR	0x1000
> +
> +#define INTCL_PICTLR	0x0
> +#define INTCL_SIGR	0x60
> +#define INTCL_HPPIR	0x68
> +#define INTCL_RDYIR	0x6c
> +#define INTCL_SENR	0xa0
> +#define INTCL_CENR	0xa4
> +#define INTCL_CACR	0xb4
> +
> +static DEFINE_PER_CPU(void __iomem *, intcl_reg);
> +
> +static void csky_mpintc_handler(struct pt_regs *regs)
> +{
> +	void __iomem *reg_base = this_cpu_read(intcl_reg);
> +
> +	do {
> +		handle_domain_irq(root_domain,
> +				  readl_relaxed(reg_base + INTCL_RDYIR),
> +				  regs);
> +	} while (readl_relaxed(reg_base + INTCL_HPPIR) & BIT(31));
> +}
> +
> +static void csky_mpintc_enable(struct irq_data *d)
> +{
> +	void __iomem *reg_base = this_cpu_read(intcl_reg);
> +
> +	writel_relaxed(d->hwirq, reg_base + INTCL_SENR);
> +}
> +
> +static void csky_mpintc_disable(struct irq_data *d)
> +{
> +	void __iomem *reg_base = this_cpu_read(intcl_reg);
> +
> +	writel_relaxed(d->hwirq, reg_base + INTCL_CENR);
> +}
> +
> +static void csky_mpintc_eoi(struct irq_data *d)
> +{
> +	void __iomem *reg_base = this_cpu_read(intcl_reg);
> +
> +	writel_relaxed(d->hwirq, reg_base + INTCL_CACR);
> +}
> +
> +#ifdef CONFIG_SMP
> +static int csky_irq_set_affinity(struct irq_data *d,
> +				 const struct cpumask *mask_val,
> +				 bool force)
> +{
> +	unsigned int cpu;
> +	unsigned int offset = 4 * (d->hwirq - COMM_IRQ_BASE);
> +
> +	if (!force)
> +		cpu = cpumask_any_and(mask_val, cpu_online_mask);
> +	else
> +		cpu = cpumask_first(mask_val);
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	/* Enable interrupt destination */
> +	cpu |= BIT(31);
> +
> +	writel_relaxed(cpu, INTCG_base + INTCG_CIDSTR + offset);
> +
> +	irq_data_update_effective_affinity(d, cpumask_of(cpu));
> +
> +	return IRQ_SET_MASK_OK_DONE;
> +}
> +#endif
> +
> +static struct irq_chip csky_irq_chip = {
> +	.name           = "C-SKY SMP Intc",
> +	.irq_eoi	= csky_mpintc_eoi,
> +	.irq_enable	= csky_mpintc_enable,
> +	.irq_disable	= csky_mpintc_disable,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity = csky_irq_set_affinity,
> +#endif
> +};
> +
> +static int csky_irqdomain_map(struct irq_domain *d, unsigned int irq,
> +			      irq_hw_number_t hwirq)
> +{
> +	if (hwirq < COMM_IRQ_BASE) {
> +		irq_set_percpu_devid(irq);
> +		irq_set_chip_and_handler(irq, &csky_irq_chip,
> +					 handle_percpu_irq);
> +	} else {
> +		irq_set_chip_and_handler(irq, &csky_irq_chip,
> +					 handle_fasteoi_irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops csky_irqdomain_ops = {
> +	.map	= csky_irqdomain_map,
> +	.xlate	= irq_domain_xlate_onecell,
> +};
> +
> +#ifdef CONFIG_SMP
> +static void csky_mpintc_send_ipi(const unsigned long *mask)
> +{

Why isn't this a cpumask? It should be this driver's job to convert the 
cpumask to an interrupt-controller specific representation, and not the 
SMP code's.

> +	void __iomem *reg_base = this_cpu_read(intcl_reg);
> +
> +	/*
> +	 * INTCL_SIGR[3:0] INTID
> +	 * INTCL_SIGR[8:15] CPUMASK
> +	 */
> +	writel_relaxed((*mask) << 8 | IPI_IRQ, reg_base + INTCL_SIGR);
> +}
> +
> +static int csky_mpintc_ipi_irq_mapping(void)
> +{
> +	return irq_create_mapping(root_domain, IPI_IRQ);
> +}
> +#endif
> +
> +/* C-SKY multi processor interrupt controller */
> +static int __init
> +csky_mpintc_init(struct device_node *node, struct device_node *parent)
> +{
> +	unsigned int cpu, nr_irq;
> +	int ret;
> +
> +	if (parent)
> +		return 0;
> +
> +	ret = of_property_read_u32(node, "csky,num-irqs", &nr_irq);
> +	if (ret < 0)
> +		nr_irq = INTC_IRQS;
> +
> +	if (INTCG_base == NULL) {
> +		INTCG_base = ioremap(mfcr("cr<31, 14>"),
> +				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
> +		if (INTCG_base == NULL)
> +			return -EIO;
> +
> +		INTCL_base = INTCG_base + INTCG_SIZE;
> +
> +		writel_relaxed(BIT(0), INTCG_base + INTCG_ICTLR);
> +	}
> +
> +	root_domain = irq_domain_add_linear(node, nr_irq, &csky_irqdomain_ops,
> +					    NULL);
> +	if (!root_domain)
> +		return -ENXIO;
> +
> +	/* for every cpu */
> +	for_each_present_cpu(cpu) {
> +		per_cpu(intcl_reg, cpu) = INTCL_base + (INTCL_SIZE * cpu);
> +		writel_relaxed(BIT(0), per_cpu(intcl_reg, cpu) + INTCL_PICTLR);
> +	}
> +
> +	set_handle_irq(&csky_mpintc_handler);
> +
> +#ifdef CONFIG_SMP
> +	set_send_ipi(&csky_mpintc_send_ipi);
> +
> +	set_ipi_irq_mapping(&csky_mpintc_ipi_irq_mapping);

Since you seem to be inventing a new set_send_ipi callback, why don't 
you define it as:

void set_send_ipi(void (*func)(const struct cpumask *),
		  unsigned int ipi_irq);

after having created the mapping for the IPI interrupt? It would avoid 
this rather pointless mapping callback.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
