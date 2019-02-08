Return-Path: <SRS0=+tgD=QP=bgdev.pl=brgl@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 03/33] ARM: davinci: select GENERIC_IRQ_MULTI_HANDLER
Date: Fri,  8 Feb 2019 18:31:24 +0100
Message-Id: <20190208173154.4665-4-brgl@bgdev.pl>
In-Reply-To: <20190208173154.4665-1-brgl@bgdev.pl>
References: <20190208173154.4665-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner --to=David Lechner <tglx@linutronix.dedavid>, lechnology.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

In order to support SPARSE_IRQ we first need to make davinci use the
generic irq handler for ARM. Translate the legacy assembly to C and
put the irq handlers into their respective drivers (aintc and cp-intc).

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/Kconfig                              |  1 +
 arch/arm/mach-davinci/cp_intc.c               | 28 +++++++++++++
 .../mach-davinci/include/mach/entry-macro.S   | 39 -------------------
 arch/arm/mach-davinci/irq.c                   | 23 +++++++++++
 4 files changed, 52 insertions(+), 39 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/include/mach/entry-macro.S

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 664e918e2624..f7770fdcad68 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -589,6 +589,7 @@ config ARCH_DAVINCI
 	select GENERIC_ALLOCATOR
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_IRQ_CHIP
+	select GENERIC_IRQ_MULTI_HANDLER
 	select GPIOLIB
 	select HAVE_IDE
 	select PM_GENERIC_DOMAINS if PM
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index 67805ca74ff8..4a372add8cf9 100644
--- a/arch/arm/mach-davinci/cp_intc.c
+++ b/arch/arm/mach-davinci/cp_intc.c
@@ -19,9 +19,13 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
+#include <asm/exception.h>
 #include <mach/common.h>
 #include "cp_intc.h"
 
+#define DAVINCI_CP_INTC_PRI_INDX_MASK		GENMASK(9, 0)
+#define DAVINCI_CP_INTC_GPIR_NONE		BIT(31)
+
 static inline unsigned int cp_intc_read(unsigned offset)
 {
 	return __raw_readl(davinci_intc_base + offset);
@@ -97,6 +101,28 @@ static struct irq_chip cp_intc_irq_chip = {
 
 static struct irq_domain *cp_intc_domain;
 
+static asmlinkage void __exception_irq_entry
+cp_intc_handle_irq(struct pt_regs *regs)
+{
+	int gpir, irqnr, none;
+
+	/*
+	 * The interrupt number is in first ten bits. The NONE field set to 1
+	 * indicates a spurious irq.
+	 */
+
+	gpir = cp_intc_read(CP_INTC_PRIO_IDX);
+	irqnr = gpir & DAVINCI_CP_INTC_PRI_INDX_MASK;
+	none = gpir & DAVINCI_CP_INTC_GPIR_NONE;
+
+	if (unlikely(none)) {
+		pr_err_once("%s: spurious irq!\n", __func__);
+		return;
+	}
+
+	handle_domain_irq(cp_intc_domain, irqnr, regs);
+}
+
 static int cp_intc_host_map(struct irq_domain *h, unsigned int virq,
 			  irq_hw_number_t hw)
 {
@@ -196,6 +222,8 @@ int __init cp_intc_of_init(struct device_node *node, struct device_node *parent)
 		return -EINVAL;
 	}
 
+	set_handle_irq(cp_intc_handle_irq);
+
 	/* Enable global interrupt */
 	cp_intc_write(1, CP_INTC_GLOBAL_ENABLE);
 
diff --git a/arch/arm/mach-davinci/include/mach/entry-macro.S b/arch/arm/mach-davinci/include/mach/entry-macro.S
deleted file mode 100644
index cf5f573eb5fd..000000000000
--- a/arch/arm/mach-davinci/include/mach/entry-macro.S
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * Low-level IRQ helper macros for TI DaVinci-based platforms
- *
- * Author: Kevin Hilman, MontaVista Software, Inc. <source@mvista.com>
- *
- * 2007 (c) MontaVista Software, Inc. This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- */
-#include <mach/irqs.h>
-
-		.macro  get_irqnr_preamble, base, tmp
-		ldr \base, =davinci_intc_base
-		ldr \base, [\base]
-		.endm
-
-		.macro	get_irqnr_and_base, irqnr, irqstat, base, tmp
-#if defined(CONFIG_AINTC) && defined(CONFIG_CP_INTC)
-		ldr \tmp, =davinci_intc_type
-		ldr \tmp, [\tmp]
-		cmp \tmp, #DAVINCI_INTC_TYPE_CP_INTC
-		beq 1001f
-#endif
-#if defined(CONFIG_AINTC)
-		ldr \tmp, [\base, #0x14]
-		movs \tmp, \tmp, lsr #2
-		sub \irqnr, \tmp, #1
-		b 1002f
-#endif
-#if defined(CONFIG_CP_INTC)
-1001:		ldr \irqnr, [\base, #0x80] /* get irq number */
-		mov \tmp, \irqnr, lsr #31
-		and \irqnr, \irqnr, #0xff  /* irq is in bits 0-9 */
-		and \tmp, \tmp, #0x1
-		cmp \tmp, #0x1
-#endif
-1002:
-		.endm
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index 07d8ef8037e4..3ce821a06e52 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -29,11 +29,13 @@
 #include <mach/cputype.h>
 #include <mach/common.h>
 #include <asm/mach/irq.h>
+#include <asm/exception.h>
 
 #define FIQ_REG0_OFFSET		0x0000
 #define FIQ_REG1_OFFSET		0x0004
 #define IRQ_REG0_OFFSET		0x0008
 #define IRQ_REG1_OFFSET		0x000C
+#define IRQ_IRQENTRY_OFFSET	0x0014
 #define IRQ_ENT_REG0_OFFSET	0x0018
 #define IRQ_ENT_REG1_OFFSET	0x001C
 #define IRQ_INCTL_REG_OFFSET	0x0020
@@ -48,6 +50,11 @@ static inline void davinci_irq_writel(unsigned long value, int offset)
 	__raw_writel(value, davinci_intc_base + offset);
 }
 
+static inline unsigned long davinci_irq_readl(int offset)
+{
+	return __raw_readl(davinci_intc_base + offset);
+}
+
 static __init void
 davinci_irq_setup_gc(void __iomem *base,
 		     unsigned int irq_start, unsigned int num)
@@ -70,6 +77,21 @@ davinci_irq_setup_gc(void __iomem *base,
 			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
 }
 
+static asmlinkage void __exception_irq_entry
+davinci_handle_irq(struct pt_regs *regs)
+{
+	int irqnr = davinci_irq_readl(IRQ_IRQENTRY_OFFSET);
+
+	/*
+	 * Use the formula for entry vector index generation from section
+	 * 8.3.3 of the manual.
+	 */
+	irqnr >>= 2;
+	irqnr -= 1;
+
+	handle_domain_irq(davinci_irq_domain, irqnr, regs);
+}
+
 /* ARM Interrupt Controller Initialization */
 void __init davinci_irq_init(void)
 {
@@ -133,4 +155,5 @@ void __init davinci_irq_init(void)
 		davinci_irq_setup_gc(davinci_intc_base + j, irq_base + i, 32);
 
 	irq_set_handler(IRQ_TINT1_TINT34, handle_level_irq);
+	set_handle_irq(davinci_handle_irq);
 }
-- 
2.20.1
