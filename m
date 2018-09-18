From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V5 1/3] irqchip: add C-SKY irqchip drivers
Date: Tue, 18 Sep 2018 16:43:31 +0800
Message-ID: <20180918084331.GA10950@guoren>
References: <a70337117db84f6e1091d0b3fc28acb691ac9b35.1537087118.git.ren_guo@c-sky.com>
 <86in35mfas.wl-marc.zyngier@arm.com>
 <20180917020928.GA22452@guoren-Inspiron-7460>
 <86tvmoz22k.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86tvmoz22k.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 02:27:31PM +0100, Marc Zyngier wrote:
> On Mon, 17 Sep 2018 03:09:29 +0100,
> Guo Ren <ren_guo@c-sky.com> wrote:
> 
> [...]
> 
> > > > +
> > > > +	irq_set_default_host(root_domain);
> > > 
> > > Please drop this. There is no reason to use this on any modern, DT
> > > based architecture.
Ok.

> > Please let me keep this and in my arch/csky/kernel/smp.c:
> > 
> > void __init setup_smp_ipi(void)
> > {
> > 	...
> > 	irq_create_mapping(NULL, IPI_IRQ);
> >	rc = request_percpu_irq(IPI_IRQ, handle_ipi, "IPI Interrupt", &ipi_dummy_dev);
> 
> This looks quite wrong. Reading the code at
> https://lkml.org/lkml/2018/9/12/674, it really looks like you're
> assuming that IPI_IRQ will be mapped to a Linux IRQ with the same
> number. Nothing could be farther from the truth.
Yes, you are right. I should use irq_create_mapping() return value as
the arg for request_percpu_irq. It's a stupid bug, thoug it happens to
work.

> The Linux IRQ is returned as the result of irq_create_mapping, which
> you're ignoring. You'd be better off creating this mapping from the
> irqchip code, and expose the resulting Linux IRQ to oyu SMP code by
> any mean of your choice (such as moving the send_ipi_message into the
> irqchip code as well).
Ok, see my diff below, is that OK?

--- a/drivers/irqchip/irq-csky-mpintc.c
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -16,6 +16,7 @@
 #include <asm/reg_ops.h>
 #include <asm/smp.h>
 
+static struct irq_domain *root_domain;
 static void __iomem *INTCG_base;
 static void __iomem *INTCL_base;
 
@@ -46,7 +47,7 @@ static void csky_mpintc_handler(struct pt_regs *regs)
 	void __iomem *reg_base = this_cpu_read(intcl_reg);
 
 	do {
-		handle_domain_irq(NULL,
+		handle_domain_irq(root_domain,
 				  readl_relaxed(reg_base + INTCL_RDYIR),
 				  regs);
 	} while (readl_relaxed(reg_base + INTCL_HPPIR) & BIT(31));
@@ -139,13 +140,17 @@ static void csky_mpintc_send_ipi(const unsigned long *mask, unsigned long irq)
 	 */
 	writel_relaxed((*mask) << 8 | irq, reg_base + INTCL_SIGR);
 }
+
+static int csky_mpintc_ipi_irq_mapping(void)
+{
+	return irq_create_mapping(root_domain, IPI_IRQ);
+}
 #endif
 
 /* C-SKY multi processor interrupt controller */
 static int __init
 csky_mpintc_init(struct device_node *node, struct device_node *parent)
 {
-	struct irq_domain *root_domain;
 	unsigned int cpu, nr_irq;
 	int ret;
 
@@ -172,8 +177,6 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 	if (!root_domain)
 		return -ENXIO;
 
-	irq_set_default_host(root_domain);
-
 	/* for every cpu */
 	for_each_present_cpu(cpu) {
 		per_cpu(intcl_reg, cpu) = INTCL_base + (INTCL_SIZE * cpu);
@@ -184,6 +187,8 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 
 #ifdef CONFIG_SMP
 	set_send_ipi(&csky_mpintc_send_ipi);
+
+	set_ipi_irq_mapping(&csky_mpintc_ipi_irq_mapping);
 #endif
 
 	return 0;

diff --git a/arch/csky/include/asm/smp.h b/arch/csky/include/asm/smp.h
index 9a53abf..fed3a5a 100644
--- a/arch/csky/include/asm/smp.h
+++ b/arch/csky/include/asm/smp.h
@@ -7,6 +7,8 @@
 
 #ifdef CONFIG_SMP
 
+#define IPI_IRQ	15
+
 void __init setup_smp(void);
 
 void __init setup_smp_ipi(void);
@@ -19,6 +21,8 @@ void arch_send_call_function_single_ipi(int cpu);
 
 void __init set_send_ipi(void (*func)(const unsigned long *, unsigned long));
 
+void __init set_ipi_irq_mapping(int (*func)(void));
+
 #define raw_smp_processor_id()	(current_thread_info()->cpu)
 
 #endif /* CONFIG_SMP */
diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 522c73f..f8343f6 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -20,8 +20,6 @@
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
 
-#define IPI_IRQ	15
-
 static struct {
 	unsigned long bits ____cacheline_aligned;
 } ipi_data[NR_CPUS] __cacheline_aligned;
@@ -121,13 +119,23 @@ void __init enable_smp_ipi(void)
 	enable_percpu_irq(IPI_IRQ, 0);
 }
 
+static int (*arch_ipi_irq_mapping)(void) = NULL;
+
+void __init set_ipi_irq_mapping(int (*func)(void))
+{
+	if (arch_ipi_irq_mapping)
+		return;
+
+	arch_ipi_irq_mapping = func;
+}
+
 void __init setup_smp_ipi(void)
 {
-	int rc;
+	int rc, irq;
 
-	irq_create_mapping(NULL, IPI_IRQ);
+	irq = arch_ipi_irq_mapping();
 
-	rc = request_percpu_irq(IPI_IRQ, handle_ipi, "IPI Interrupt", &ipi_dummy_dev);
+	rc = request_percpu_irq(irq, handle_ipi, "IPI Interrupt", &ipi_dummy_dev);
 	if (rc)
 		panic("%s IRQ request failed\n", __func__);
