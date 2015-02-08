From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 2/4] CRISv32: add irq domains support
Date: Sun,  8 Feb 2015 16:35:43 +0100
Message-ID: <1423409745-2230-2-git-send-email-rabin@rab.in>
References: <1423409745-2230-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423409745-2230-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: devicetree@vger.kernel.org

Add support for IRQ domains to the CRISv32 interrupt controller.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 arch/cris/Kconfig               |  1 +
 arch/cris/arch-v32/kernel/irq.c | 28 +++++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index cbbc2dc..66f71df 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -55,6 +55,7 @@ config CRIS
 	select ARCH_REQUIRE_GPIOLIB
 	select OF
 	select OF_EARLY_FLATTREE
+	select IRQ_DOMAIN if ETRAX_ARCH_V32
 
 config HZ
 	int
diff --git a/arch/cris/arch-v32/kernel/irq.c b/arch/cris/arch-v32/kernel/irq.c
index 25437ae..bc871d2 100644
--- a/arch/cris/arch-v32/kernel/irq.c
+++ b/arch/cris/arch-v32/kernel/irq.c
@@ -10,6 +10,8 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/profile.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/threads.h>
@@ -431,6 +433,19 @@ crisv32_do_multiple(struct pt_regs* regs)
 	irq_exit();
 }
 
+static int crisv32_irq_map(struct irq_domain *h, unsigned int virq,
+			   irq_hw_number_t hw_irq_num)
+{
+	irq_set_chip_and_handler(virq, &crisv32_irq_type, handle_simple_irq);
+
+	return 0;
+}
+
+static struct irq_domain_ops crisv32_irq_ops = {
+	.map	= crisv32_irq_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
 /*
  * This is called by start_kernel. It fixes the IRQ masks and setup the
  * interrupt vector table to point to bad_interrupt pointers.
@@ -441,6 +456,8 @@ init_IRQ(void)
 	int i;
 	int j;
 	reg_intr_vect_rw_mask vect_mask = {0};
+	struct device_node *np;
+	struct irq_domain *domain;
 
 	/* Clear all interrupts masks. */
 	for (i = 0; i < NBR_REGS; i++)
@@ -449,10 +466,15 @@ init_IRQ(void)
 	for (i = 0; i < 256; i++)
 		etrax_irv->v[i] = weird_irq;
 
-	/* Point all IRQ's to bad handlers. */
+	np = of_find_compatible_node(NULL, NULL, "axis,crisv32-intc");
+	domain = irq_domain_add_legacy(np, NR_IRQS - FIRST_IRQ,
+				       FIRST_IRQ, FIRST_IRQ,
+				       &crisv32_irq_ops, NULL);
+	BUG_ON(!domain);
+	irq_set_default_host(domain);
+	of_node_put(np);
+
 	for (i = FIRST_IRQ, j = 0; j < NR_IRQS; i++, j++) {
-		irq_set_chip_and_handler(j, &crisv32_irq_type,
-					 handle_simple_irq);
 		set_exception_vector(i, interrupt[j]);
 	}
 
-- 
2.1.4
