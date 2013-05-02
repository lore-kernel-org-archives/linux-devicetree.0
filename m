From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/5] irqchip: add support for Marvell Orion SoCs
Date: Fri,  3 May 2013 01:48:35 +0200
Message-ID: <1367538519-23940-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1367538519-23940-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367538519-23940-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds an irqchip driver for the main interrupt controller found
on Marvell Orion SoCs (Kirkwood, Dove, Orion5x, Discovery Innovation).
Corresponding device tree documentation is also added.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Note: This patch triggers a checkpatch warning for
  WARNING: Avoid CamelCase: <handle_IRQ>

Changelog:
v1->v2:
- rename compatible string to "marvell,orion-intc" (Suggested by Jason Gunthorpe)
- request mem regions for irq base registers (Suggested by Jason Gunthorpe)
- make orion_handle_irq static (Suggested by Jason Gunthorpe)
- make use of IRQCHIP_DECLARE (Suggested by Jason Gunthorpe)

Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../interrupt-controller/marvell,orion-intc.txt    |   22 ++++
 drivers/irqchip/Kconfig                            |    5 +
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-orion.c                        |  133 ++++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt
 create mode 100644 drivers/irqchip/irq-orion.c

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt
new file mode 100644
index 0000000..9b7aee9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt
@@ -0,0 +1,22 @@
+Marvell Orion SoC main interrupt controller
+
+Required properties:
+- compatible: shall be "marvell,orion-intc"
+- reg: base address(es) of interrupt registers starting with CAUSE register
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: number of cells to encode an interrupt source, shall be 1.
+
+The interrupt sources map to the corresponding bits in the interrupt
+registers, i.e.
+- 0 maps to bit 0 of first base address,
+- 1 maps to bit 1 of first base address,
+- 32 maps to bit 0 of second base address, and so on.
+
+Example:
+	intc: interrupt-controller {
+		compatible = "marvell,orion-intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+                /* Dove has 64 first level interrupts */
+		reg = <0x20200 0x10>, <0x20210 0x10>;
+	};
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a350969..8da3559 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -2,6 +2,11 @@ config IRQCHIP
 	def_bool y
 	depends on OF_IRQ
 
+config IRQCHIP_ORION
+	bool
+	select IRQ_DOMAIN
+	select MULTI_IRQ_HANDLER
+
 config ARM_GIC
 	bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 10ef57f..2cad23d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
 obj-$(CONFIG_ARCH_MXS)			+= irq-mxs.o
 obj-$(CONFIG_METAG)			+= irq-metag-ext.o
 obj-$(CONFIG_METAG_PERFCOUNTER_IRQS)	+= irq-metag.o
+obj-$(CONFIG_IRQCHIP_ORION)		+= irq-orion.o
 obj-$(CONFIG_ARCH_SUNXI)		+= irq-sun4i.o
 obj-$(CONFIG_ARCH_SPEAR3XX)		+= spear-shirq.o
 obj-$(CONFIG_ARM_GIC)			+= irq-gic.o
diff --git a/drivers/irqchip/irq-orion.c b/drivers/irqchip/irq-orion.c
new file mode 100644
index 0000000..21ebe6c
--- /dev/null
+++ b/drivers/irqchip/irq-orion.c
@@ -0,0 +1,133 @@
+/*
+ * Marvell Orion SoCs IRQ chip driver.
+ *
+ * Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <asm/exception.h>
+#include <asm/mach/irq.h>
+
+#include "irqchip.h"
+
+/* max number of handled irq register blocks */
+#define ORION_MAX_IRQREG		2
+
+#define ORION_IRQ_CAUSE			0x00
+#define ORION_IRQ_MASK			0x04
+#define ORION_IRQ_FIQ_MASK		0x08
+#define ORION_IRQ_ENDP_MASK		0x0c
+
+static void __iomem *orion_irq_base[ORION_MAX_IRQREG];
+static unsigned int orion_irq_regs;
+static struct irq_domain *orion_irq_domain;
+
+static asmlinkage void __exception_irq_entry orion_handle_irq(
+	struct pt_regs *regs)
+{
+	int n;
+	for (n = 0; n < orion_irq_regs; n++) {
+		u32 hwirq_base = n * 32;
+		u32 stat = readl_relaxed(orion_irq_base[n] + ORION_IRQ_CAUSE) &
+			readl_relaxed(orion_irq_base[n] + ORION_IRQ_MASK);
+		while (stat) {
+			u32 hwirq = ffs(stat) - 1;
+			u32 irq = irq_find_mapping(orion_irq_domain,
+						   hwirq_base + hwirq);
+			handle_IRQ(irq, regs);
+			stat &= ~(1 << hwirq);
+		}
+	}
+}
+
+static void orion_irq_mask(struct irq_data *irqd)
+{
+	unsigned int irq = irqd_to_hwirq(irqd);
+	unsigned int irq_off = irq % 32;
+	int reg = irq / 32;
+	u32 val;
+
+	val = readl(orion_irq_base[reg] + ORION_IRQ_MASK);
+	writel(val & ~(1 << irq_off), orion_irq_base[reg] + ORION_IRQ_MASK);
+}
+
+static void orion_irq_unmask(struct irq_data *irqd)
+{
+	unsigned int irq = irqd_to_hwirq(irqd);
+	unsigned int irq_off = irq % 32;
+	int reg = irq / 32;
+	u32 val;
+
+	val = readl(orion_irq_base[reg] + ORION_IRQ_MASK);
+	writel(val | (1 << irq_off), orion_irq_base[reg] + ORION_IRQ_MASK);
+}
+
+static struct irq_chip orion_irq_chip = {
+	.name		= "orion_irq",
+	.irq_mask	= orion_irq_mask,
+	.irq_unmask	= orion_irq_unmask,
+};
+
+static int orion_irq_map(struct irq_domain *d, unsigned int virq,
+			 irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &orion_irq_chip,
+				 handle_level_irq);
+	set_irq_flags(virq, IRQF_VALID | IRQF_PROBE);
+
+	return 0;
+}
+
+static struct irq_domain_ops orion_irq_ops = {
+	.map = orion_irq_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static int __init orion_of_init(struct device_node *np,
+				struct device_node *parent)
+{
+	int n;
+
+	for (n = 0; n < ORION_MAX_IRQREG; n++) {
+		struct resource r;
+
+		/* parsing reg property may fail silently here */
+		if (of_address_to_resource(np, n, &r))
+			continue;
+
+		if (!request_mem_region(r.start, resource_size(&r), np->name))
+			panic("%s: unable to request mem region %d",
+			      np->full_name, n);
+
+		orion_irq_base[n] = ioremap(r.start, resource_size(&r));
+		if (!orion_irq_base[n])
+			panic("%s: unable to map resource %d",
+			      np->full_name, n);
+
+		/* mask all interrupts */
+		writel(0, orion_irq_base[n] + ORION_IRQ_MASK);
+		orion_irq_regs++;
+	}
+
+	/* at least one irq reg must be set */
+	if (!orion_irq_regs)
+		panic("%s: unable to map IRQC registers\n", np->full_name);
+
+	orion_irq_domain = irq_domain_add_linear(np, orion_irq_regs * 32,
+						 &orion_irq_ops, NULL);
+	if (!orion_irq_domain)
+		panic("%s: unable to create IRQ domain\n", np->full_name);
+
+	set_handle_irq(orion_handle_irq);
+
+	return 0;
+}
+IRQCHIP_DECLARE(orion_intc, "marvell,orion-intc", orion_of_init);
-- 
1.7.10.4
