From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Thu, 26 Jul 2018 16:37:21 +0200
Message-ID: <20180726143723.16585-8-hch@lst.de>
References: <20180726143723.16585-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180726143723.16585-1-hch@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

This patch adds a driver for the Platform Level Interrupt Controller (PLIC)
specified as part of the RISC-V supervisor level ISA manual, in the memory
layout implemented by SiFive and qemu.

The PLIC connects global interrupt sources to the local interrupt controller
on each hart.

This driver is based on the driver in the RISC-V tree from Palmer Dabbelt,
but has been almost entirely rewritten since.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/Kconfig          |  13 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-riscv-plic.c | 219 +++++++++++++++++++++++++++++++
 3 files changed, 233 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-plic.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e9233db16e03..5ac6dd922a0d 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -372,3 +372,16 @@ config QCOM_PDC
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
 
 endmenu
+
+config RISCV_PLIC
+	bool "Platform-Level Interrupt Controller"
+	depends on RISCV
+	default y
+	help
+	   This enables support for the PLIC chip found in standard RISC-V
+	   systems.  The PLIC controls devices interrupts and connects them to
+	   each core's local interrupt controller.  Aside from timer and
+	   software interrupts, all other interrupt sources (MSI, GPIO, etc)
+	   are subordinate to the PLIC.
+
+	   If you don't know what to do here, say Y.
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 15f268f646bf..bf9238da8a31 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -87,3 +87,4 @@ obj-$(CONFIG_MESON_IRQ_GPIO)		+= irq-meson-gpio.o
 obj-$(CONFIG_GOLDFISH_PIC) 		+= irq-goldfish-pic.o
 obj-$(CONFIG_NDS32)			+= irq-ativic32.o
 obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
+obj-$(CONFIG_RISCV_PLIC)		+= irq-riscv-plic.o
diff --git a/drivers/irqchip/irq-riscv-plic.c b/drivers/irqchip/irq-riscv-plic.c
new file mode 100644
index 000000000000..274fe2cba544
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-plic.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2018 Christoph Hellwig
+ */
+#define pr_fmt(fmt) "plic: " fmt
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+/*
+ * From the RISC-V Priviledged Spec v1.10:
+ *
+ * Global interrupt sources are assigned small unsigned integer identifiers,
+ * beginning at the value 1.  An interrupt ID of 0 is reserved to mean "no
+ * interrupt".  Interrupt identifiers are also used to break ties when two or
+ * more interrupt sources have the same assigned priority. Smaller values of
+ * interrupt ID take precedence over larger values of interrupt ID.
+ *
+ * While the RISC-V supervisor spec doesn't define the maximum number of
+ * devices supported by the PLIC, the largest number supported by devices
+ * marked as 'riscv,plic0' (which is the only device type this driver supports,
+ * and is the only extant PLIC as of now) is 1024.  As mentioned above, device
+ * 0 is defined to be non-existent so this device really only supports 1023
+ * devices.
+ */
+#define MAX_DEVICES			1024
+#define MAX_CONTEXTS			15872
+
+/*
+ * Each interrupt source has a priority register associated with it.
+ * We always hardwire it to one in Linux.
+ */
+#define PRIORITY_BASE			0
+#define	    PRIORITY_PER_ID		4
+
+/*
+ * Each hart context has a vector of interupt enable bits associated with it.
+ * There's one bit for each interrupt source.
+ */
+#define ENABLE_BASE			0x2000
+#define     ENABLE_PER_HART		0x80
+
+/*
+ * Each hart context has a set of control registers associated with it.  Right
+ * now there's only two: a source priority threshold over which the hart will
+ * take an interrupt, and a register to claim interrupts.
+ */
+#define CONTEXT_BASE			0x200000
+#define     CONTEXT_PER_HART		0x1000
+#define     CONTEXT_THRESHOLD		0x00
+#define     CONTEXT_CLAIM		0x04
+
+static void __iomem *plic_regs;
+
+static inline void __iomem *plic_hart_offset(int ctxid)
+{
+	return plic_regs + CONTEXT_BASE + ctxid * CONTEXT_PER_HART;
+}
+
+/*
+ * Protect mask operations on the registers given that we can't assume that
+ * atomic memory operations work on them.
+ */
+static DEFINE_SPINLOCK(plic_toggle_lock);
+
+static inline void plic_toggle(int ctxid, int hwirq, int enable)
+{
+	u32 __iomem *reg = plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
+	u32 hwirq_mask = 1 << (hwirq % 32);
+
+	spin_lock(&plic_toggle_lock);
+	if (enable)
+		writel(readl(reg) | hwirq_mask, reg);
+	else
+		writel(readl(reg) & ~hwirq_mask, reg);
+	spin_unlock(&plic_toggle_lock);
+}
+
+static inline void plic_irq_toggle(struct irq_data *d, int enable)
+{
+	int cpu;
+
+	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
+	for_each_present_cpu(cpu)
+		plic_toggle(cpu, d->hwirq, enable);
+}
+
+static void plic_irq_enable(struct irq_data *d)
+{
+	plic_irq_toggle(d, 1);
+}
+
+static void plic_irq_disable(struct irq_data *d)
+{
+	plic_irq_toggle(d, 0);
+}
+
+static struct irq_chip plic_chip = {
+	.name		= "riscv,plic0",
+	/*
+	 * There is no need to mask/unmask PLIC interrupts.  They are "masked"
+	 * by reading claim and "unmasked" when writing it back.
+	 */
+	.irq_enable	= plic_irq_enable,
+	.irq_disable	= plic_irq_disable,
+};
+
+static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &plic_chip, handle_simple_irq);
+	irq_set_chip_data(irq, NULL);
+	irq_set_noprobe(irq);
+	return 0;
+}
+
+static const struct irq_domain_ops plic_irqdomain_ops = {
+	.map		= plic_irqdomain_map,
+	.xlate		= irq_domain_xlate_onecell,
+};
+
+static struct irq_domain *plic_irqdomain;
+
+/*
+ * Handling an interrupt is a two-step process: first you claim the interrupt
+ * by reading the claim register, then you complete the interrupt by writing
+ * that source ID back to the same claim register.  This automatically enables
+ * and disables the interrupt, so there's nothing else to do.
+ */
+static void plic_handle_irq(struct pt_regs *regs)
+{
+	void __iomem *claim =
+		plic_hart_offset(smp_processor_id()) + CONTEXT_CLAIM;
+	irq_hw_number_t hwirq;
+
+	csr_clear(sie, SIE_STIE);
+	while ((hwirq = readl(claim))) {
+		int irq = irq_find_mapping(plic_irqdomain, hwirq);
+
+		if (unlikely(irq <= 0)) {
+			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
+					hwirq);
+			ack_bad_irq(irq);
+		} else {
+			generic_handle_irq(irq);
+		}
+		writel(hwirq, claim);
+	}
+	csr_set(sie, SIE_STIE);
+}
+
+static int __init plic_init(struct device_node *node,
+		struct device_node *parent)
+{
+	int error = 0, nr_mapped = 0, nr_handlers, cpu;
+	u32 nr_irqs;
+
+	if (plic_regs) {
+		pr_warning("PLIC already present.\n");
+		return -ENXIO;
+	}
+
+	plic_regs = of_iomap(node, 0);
+	if (WARN_ON(!plic_regs))
+		return -EIO;
+
+	error = -EINVAL;
+	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
+	if (WARN_ON(!nr_irqs))
+		goto out_iounmap;
+
+	nr_handlers = of_irq_count(node);
+	if (WARN_ON(!nr_handlers))
+		goto out_iounmap;
+	if (WARN_ON(nr_handlers < num_possible_cpus()))
+		goto out_iounmap;
+
+	error = -ENOMEM;
+	plic_irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
+			&plic_irqdomain_ops, NULL);
+	if (WARN_ON(!plic_irqdomain))
+		goto out_iounmap;
+
+	/*
+	 * We assume that each present hart is wire up to the PLIC.
+	 * If that isn't the case in the future this code will need to be
+	 * modified.
+	 */
+	for_each_present_cpu(cpu) {
+		irq_hw_number_t hwirq;
+
+		/* priority must be > threshold to trigger an interrupt */
+		writel(0, plic_hart_offset(cpu) + CONTEXT_THRESHOLD);
+		for (hwirq = 1; hwirq <= nr_irqs; ++hwirq)
+			plic_toggle(cpu, hwirq, 0);
+		nr_mapped++;
+	}
+
+	pr_info("mapped %d interrupts to %d (out of %d) handlers.\n",
+		nr_irqs, nr_mapped, nr_handlers);
+	set_handle_irq(plic_handle_irq);
+	return 0;
+
+out_iounmap:
+	iounmap(plic_regs);
+	return error;
+}
+
+IRQCHIP_DECLARE(plic0, "riscv,plic0", plic_init);
-- 
2.18.0
