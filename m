From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] irq_domain/microblaze: Convert microblaze to use irq_domains
Date: Thu, 26 Jan 2012 14:28:12 -0700
Message-ID: <1327613292-20580-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

***totally untested.  Don't apply yet***

Michal, I leave it to you to test this patch.  I've turned on SPARSE_IRQ, but
you may decide that isn't valuable.  I've compile tested it, but that's
about it (in fact, I had to hack head.S to get it to build because I don't have
an up-to-date compiler for microblaze.  It fails on an unknown opcode 'lwr')

This builds on top of my irq_domain tree:
git://git.secretlab.ca/git/linux-2.6 irqdomain/next

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 arch/microblaze/Kconfig               |    2 +
 arch/microblaze/include/asm/hardirq.h |    2 +-
 arch/microblaze/include/asm/irq.h     |   41 +----------------------
 arch/microblaze/kernel/intc.c         |   58 +++++++++++++++++++-------------
 arch/microblaze/kernel/irq.c          |   22 ++-----------
 5 files changed, 41 insertions(+), 84 deletions(-)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 74f23a4..1e6f59c 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -14,6 +14,8 @@ config MICROBLAZE
 	select TRACING_SUPPORT
 	select OF
 	select OF_EARLY_FLATTREE
+	select IRQ_DOMAIN
+	select SPARSE_IRQ
 	select HAVE_GENERIC_HARDIRQS
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
diff --git a/arch/microblaze/include/asm/hardirq.h b/arch/microblaze/include/asm/hardirq.h
index cd1ac9a..a265aa0 100644
--- a/arch/microblaze/include/asm/hardirq.h
+++ b/arch/microblaze/include/asm/hardirq.h
@@ -10,7 +10,7 @@
 #define _ASM_MICROBLAZE_HARDIRQ_H
 
 /* should be defined in each interrupt controller driver */
-extern unsigned int get_irq(struct pt_regs *regs);
+extern unsigned int get_irq(void);
 
 #include <asm-generic/hardirq.h>
 
diff --git a/arch/microblaze/include/asm/irq.h b/arch/microblaze/include/asm/irq.h
index 7798ad1..5ddbf69 100644
--- a/arch/microblaze/include/asm/irq.h
+++ b/arch/microblaze/include/asm/irq.h
@@ -9,49 +9,10 @@
 #ifndef _ASM_MICROBLAZE_IRQ_H
 #define _ASM_MICROBLAZE_IRQ_H
 
-
-/*
- * Linux IRQ# is currently offset by one to map to the hardware
- * irq number. So hardware IRQ0 maps to Linux irq 1.
- */
-#define NO_IRQ_OFFSET	1
-#define IRQ_OFFSET	NO_IRQ_OFFSET
-#define NR_IRQS		(32 + IRQ_OFFSET)
+#define NR_IRQS		(64)
 #include <asm-generic/irq.h>
 
-/* This type is the placeholder for a hardware interrupt number. It has to
- * be big enough to enclose whatever representation is used by a given
- * platform.
- */
-typedef unsigned long irq_hw_number_t;
-
-extern unsigned int nr_irq;
-
 struct pt_regs;
 extern void do_IRQ(struct pt_regs *regs);
 
-/** FIXME - not implement
- * irq_dispose_mapping - Unmap an interrupt
- * @virq: linux virq number of the interrupt to unmap
- */
-static inline void irq_dispose_mapping(unsigned int virq)
-{
-	return;
-}
-
-struct irq_domain;
-
-/**
- * irq_create_mapping - Map a hardware interrupt into linux virq space
- * @host: host owning this hardware interrupt or NULL for default host
- * @hwirq: hardware irq number in that host space
- *
- * Only one mapping per hardware interrupt is permitted. Returns a linux
- * virq number.
- * If the sense/trigger is to be specified, set_irq_type() should be called
- * on the number returned from that call.
- */
-extern unsigned int irq_create_mapping(struct irq_domain *host,
-					irq_hw_number_t hwirq);
-
 #endif /* _ASM_MICROBLAZE_IRQ_H */
diff --git a/arch/microblaze/kernel/intc.c b/arch/microblaze/kernel/intc.c
index 44b177e..cc1f6eb 100644
--- a/arch/microblaze/kernel/intc.c
+++ b/arch/microblaze/kernel/intc.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/irqdomain.h>
 #include <linux/irq.h>
 #include <asm/page.h>
 #include <linux/io.h>
@@ -25,8 +26,6 @@ static unsigned int intc_baseaddr;
 #define INTC_BASE	intc_baseaddr
 #endif
 
-unsigned int nr_irq;
-
 /* No one else should require these constants, so define them locally here. */
 #define ISR 0x00			/* Interrupt Status Register */
 #define IPR 0x04			/* Interrupt Pending Register */
@@ -84,24 +83,43 @@ static struct irq_chip intc_dev = {
 	.irq_mask_ack = intc_mask_ack,
 };
 
-unsigned int get_irq(struct pt_regs *regs)
+static struct irq_domain *root_domain;
+
+unsigned int get_irq(void)
 {
-	int irq;
+	unsigned int hwirq, irq;
 
-	/*
-	 * NOTE: This function is the one that needs to be improved in
-	 * order to handle multiple interrupt controllers. It currently
-	 * is hardcoded to check for interrupts only on the first INTC.
-	 */
-	irq = in_be32(INTC_BASE + IVR) + NO_IRQ_OFFSET;
-	pr_debug("get_irq: %d\n", irq);
+	hwirq = in_be32(INTC_BASE + IVR);
+	irq = irq_find_mapping(root_domain, in_be32(INTC_BASE + IVR));
+	pr_debug("get_irq: hwirq=%d, irq=%d\n", hwirq, irq);
 
 	return irq;
 }
 
+int xintc_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	u32 intr_mask = (u32)d->host_data;
+
+	if (intr_mask & (1 << hw)) {
+		irq_set_chip_and_handler_name(irq, &intc_dev,
+						handle_edge_irq, "edge");
+		irq_clear_status_flags(irq, IRQ_LEVEL);
+	} else {
+		irq_set_chip_and_handler_name(irq, &intc_dev,
+						handle_level_irq, "level");
+		irq_set_status_flags(irq, IRQ_LEVEL);
+	}
+	return 0;
+}
+
+static const struct irq_domain_ops xintc_irq_domain_ops = {
+	.xlate = irq_domain_xlate_onetwocell,
+	.map = xintc_map,
+};
+
 void __init init_IRQ(void)
 {
-	u32 i, intr_mask;
+	u32 nr_irq, intr_mask;
 	struct device_node *intc = NULL;
 #ifdef CONFIG_SELFMOD_INTC
 	unsigned int intc_baseaddr = 0;
@@ -146,16 +164,8 @@ void __init init_IRQ(void)
 	/* Turn on the Master Enable. */
 	out_be32(intc_baseaddr + MER, MER_HIE | MER_ME);
 
-	for (i = IRQ_OFFSET; i < (nr_irq + IRQ_OFFSET); ++i) {
-		if (intr_mask & (0x00000001 << (i - IRQ_OFFSET))) {
-			irq_set_chip_and_handler_name(i, &intc_dev,
-				handle_edge_irq, "edge");
-			irq_clear_status_flags(i, IRQ_LEVEL);
-		} else {
-			irq_set_chip_and_handler_name(i, &intc_dev,
-				handle_level_irq, "level");
-			irq_set_status_flags(i, IRQ_LEVEL);
-		}
-		irq_get_irq_data(i)->hwirq = i - IRQ_OFFSET;
-	}
+	/* Yeah, okay, casting the intr_mask to a void* is butt-ugly, but I'm
+	 * lazy and Michal can clean it up to something nicer when he tests
+	 * and commits this patch.  ~~gcl */
+	root_domain = irq_domain_add_linear(intc, nr_irq, &xintc_irq_domain_ops, (void*)intr_mask);
 }
diff --git a/arch/microblaze/kernel/irq.c b/arch/microblaze/kernel/irq.c
index 3f613df..91ce0e5 100644
--- a/arch/microblaze/kernel/irq.c
+++ b/arch/microblaze/kernel/irq.c
@@ -31,13 +31,12 @@ void __irq_entry do_IRQ(struct pt_regs *regs)
 	trace_hardirqs_off();
 
 	irq_enter();
-	irq = get_irq(regs);
+	irq = get_irq();
 next_irq:
 	BUG_ON(!irq);
-	/* Substract 1 because of get_irq */
-	generic_handle_irq(irq + IRQ_OFFSET - NO_IRQ_OFFSET);
+	generic_handle_irq(irq);
 
-	irq = get_irq(regs);
+	irq = get_irq();
 	if (irq) {
 		pr_debug("next irq: %d\n", irq);
 		++concurrent_irq;
@@ -48,18 +47,3 @@ next_irq:
 	set_irq_regs(old_regs);
 	trace_hardirqs_on();
 }
-
-/* MS: There is no any advance mapping mechanism. We are using simple 32bit
-  intc without any cascades or any connection that's why mapping is 1:1 */
-unsigned int irq_create_mapping(struct irq_domain *host, irq_hw_number_t hwirq)
-{
-	return hwirq + IRQ_OFFSET;
-}
-EXPORT_SYMBOL_GPL(irq_create_mapping);
-
-unsigned int irq_create_of_mapping(struct device_node *controller,
-				   const u32 *intspec, unsigned int intsize)
-{
-	return intspec[0] + IRQ_OFFSET;
-}
-EXPORT_SYMBOL_GPL(irq_create_of_mapping);
-- 
1.7.5.4
