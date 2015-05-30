From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v4 06/12] MIPS: ath79: Add OF support to the IRQ controllers
Date: Sun, 31 May 2015 01:52:29 +0200
Message-ID: <1433029955-7346-7-git-send-email-albeu@free.fr>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433029955-7346-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add OF support for the CPU and MISC interrupt controllers of most
supported ATH79 devices.

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 arch/mips/ath79/irq.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
index 2c3991a..afb0096 100644
--- a/arch/mips/ath79/irq.c
+++ b/arch/mips/ath79/irq.c
@@ -15,7 +15,9 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/of_irq.h>
+#include "../../../drivers/irqchip/irqchip.h"
 
 #include <asm/irq_cpu.h>
 #include <asm/mipsregs.h>
@@ -23,6 +25,7 @@
 #include <asm/mach-ath79/ath79.h>
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
+#include "machtypes.h"
 
 static void ath79_misc_irq_handler(unsigned int irq, struct irq_desc *desc)
 {
@@ -268,8 +271,90 @@ asmlinkage void plat_irq_dispatch(void)
 	}
 }
 
+#ifdef CONFIG_IRQCHIP
+static int misc_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(irq, &ath79_misc_irq_chip, handle_level_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops misc_irq_domain_ops = {
+	.xlate = irq_domain_xlate_onecell,
+	.map = misc_map,
+};
+
+static int __init ath79_misc_intc_of_init(
+	struct device_node *node, struct device_node *parent)
+{
+	void __iomem *base = ath79_reset_base;
+	struct irq_domain *domain;
+	int irq;
+
+	irq = irq_of_parse_and_map(node, 0);
+	if (!irq)
+		panic("Failed to get MISC IRQ");
+
+	domain = irq_domain_add_legacy(node, ATH79_MISC_IRQ_COUNT,
+			ATH79_MISC_IRQ_BASE, 0, &misc_irq_domain_ops, NULL);
+	if (!domain)
+		panic("Failed to add MISC irqdomain");
+
+	/* Disable and clear all interrupts */
+	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
+	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
+
+
+	irq_set_chained_handler(irq, ath79_misc_irq_handler);
+
+	return 0;
+}
+IRQCHIP_DECLARE(ath79_misc_intc, "qca,ar7100-misc-intc",
+		ath79_misc_intc_of_init);
+
+static int __init ar79_cpu_intc_of_init(
+	struct device_node *node, struct device_node *parent)
+{
+	int err, i, count;
+
+	/* Fill the irq_wb_chan table */
+	count = of_count_phandle_with_args(
+		node, "qca,ddr-wb-channels", "#qca,ddr-wb-channel-cells");
+
+	for (i = 0; i < count; i++) {
+		struct of_phandle_args args;
+		u32 irq = i;
+
+		of_property_read_u32_index(
+			node, "qca,ddr-wb-channel-interrupts", i, &irq);
+		if (irq >= ARRAY_SIZE(irq_wb_chan))
+			continue;
+
+		err = of_parse_phandle_with_args(
+			node, "qca,ddr-wb-channels",
+			"#qca,ddr-wb-channel-cells",
+			i, &args);
+		if (err)
+			return err;
+
+		irq_wb_chan[irq] = args.args[0];
+		pr_info("IRQ: Set flush channel of IRQ%d to %d\n",
+			irq, args.args[0]);
+	}
+
+	return mips_cpu_irq_of_init(node, parent);
+}
+IRQCHIP_DECLARE(ar79_cpu_intc, "qca,ar7100-cpu-intc",
+		ar79_cpu_intc_of_init);
+
+#endif
+
 void __init arch_init_irq(void)
 {
+	if (mips_machtype == ATH79_MACH_GENERIC_OF) {
+		irqchip_init();
+		return;
+	}
+
 	if (soc_is_ar71xx() || soc_is_ar724x() ||
 	    soc_is_ar913x() || soc_is_ar933x()) {
 		irq_wb_chan[2] = 3;
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
