From: Yasha Cherikovsky <yasha.che3@gmail.com>
Subject: [RFC v2 3/7] irqchip/rtl8186: Add RTL8186 interrupt controller driver
Date: Mon,  1 Oct 2018 13:29:48 +0300
Message-ID: <20181001102952.7913-4-yasha.che3@gmail.com>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001102952.7913-1-yasha.che3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: Yasha Cherikovsky <yasha.che3@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Realtek RTL8186 SoC is a MIPS based SoC
used in some home routers [1][2].

This adds a driver to handle the interrupt controller
on this SoC.

[1] https://www.linux-mips.org/wiki/Realtek_SOC#Realtek_RTL8186
[2] https://wikidevi.com/wiki/Realtek_RTL8186

Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/irqchip/Kconfig       |   5 ++
 drivers/irqchip/Makefile      |   1 +
 drivers/irqchip/irq-rtl8186.c | 107 ++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/irqchip/irq-rtl8186.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e9233db16e03..83099905a871 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -371,4 +371,9 @@ config QCOM_PDC
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
 
+config RTL8186_IRQ
+	bool
+	depends on MACH_RTL8186
+	select IRQ_DOMAIN
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 15f268f646bf..2e0bb859a8f4 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -87,3 +87,4 @@ obj-$(CONFIG_MESON_IRQ_GPIO)		+= irq-meson-gpio.o
 obj-$(CONFIG_GOLDFISH_PIC) 		+= irq-goldfish-pic.o
 obj-$(CONFIG_NDS32)			+= irq-ativic32.o
 obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
+obj-$(CONFIG_RTL8186_IRQ)		+= irq-rtl8186.o
diff --git a/drivers/irqchip/irq-rtl8186.c b/drivers/irqchip/irq-rtl8186.c
new file mode 100644
index 000000000000..3eb6b947d5a0
--- /dev/null
+++ b/drivers/irqchip/irq-rtl8186.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTL8186 SoC interrupt controller driver.
+ *
+ * Copyright (C) 2018 Yasha Cherikovsky
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#define RTL8186_NR_IRQS 11
+
+#define GIMR 0x00
+#define GISR 0x04
+
+static struct {
+	void __iomem *base;
+	struct irq_domain *domain;
+} intc;
+
+
+asmlinkage void plat_irq_dispatch(void)
+{
+	u32 hwirq, virq;
+	u32 gimr = readl(intc.base + GIMR);
+	u32 gisr = readl(intc.base + GISR);
+	u32 pending = gimr & gisr & ((1 << RTL8186_NR_IRQS) - 1);
+
+	if (!pending) {
+		spurious_interrupt();
+		return;
+	}
+
+	while (pending) {
+		hwirq = fls(pending) - 1;
+		virq = irq_linear_revmap(intc.domain, hwirq);
+		do_IRQ(virq);
+		pending &= ~BIT(hwirq);
+	}
+}
+
+static void rtl8186_irq_mask(struct irq_data *data)
+{
+	unsigned long irq = data->hwirq;
+
+	writel(readl(intc.base + GIMR) & (~(BIT(irq))), intc.base + GIMR);
+}
+
+static void rtl8186_irq_unmask(struct irq_data *data)
+{
+	unsigned long irq = data->hwirq;
+
+	writel((readl(intc.base + GIMR) | (BIT(irq))), intc.base + GIMR);
+}
+
+static struct irq_chip rtl8186_irq_chip = {
+	.name = "RTL8186",
+	.irq_mask = rtl8186_irq_mask,
+	.irq_unmask = rtl8186_irq_unmask,
+};
+
+static int rtl8186_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
+				       irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &rtl8186_irq_chip, handle_level_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops rtl8186_irq_ops = {
+	.map = rtl8186_intc_irq_domain_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static int __init rtl8186_intc_of_init(struct device_node *node,
+				       struct device_node *parent)
+{
+	intc.base = of_io_request_and_map(node, 0, of_node_full_name(node));
+
+	if (IS_ERR(intc.base))
+		panic("%pOF: unable to map resource", node);
+
+	intc.domain = irq_domain_add_linear(node, RTL8186_NR_IRQS,
+					    &rtl8186_irq_ops, NULL);
+
+	if (!intc.domain)
+		panic("%pOF: unable to create IRQ domain\n", node);
+
+	/* Start with all interrupts disabled */
+	writel(0, intc.base + GIMR);
+
+	/*
+	 * Enable all hardware interrupts in CP0 status register.
+	 * Software interrupts are disabled.
+	 */
+	set_c0_status(ST0_IM);
+	clear_c0_status(STATUSF_IP0 | STATUSF_IP1);
+	clear_c0_cause(CAUSEF_IP);
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(rtl8186_intc, "realtek,rtl8186-intc", rtl8186_intc_of_init);
-- 
2.19.0
