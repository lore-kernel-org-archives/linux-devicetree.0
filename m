From: Sergei Ianovich <ynvich@gmail.com>
Subject: [PATCH v6] arm: pxa: support ICP DAS LP-8x4x FPGA irq
Date: Sat, 27 Feb 2016 18:56:01 +0300
Message-ID: <1456588562-24715-1-git-send-email-ynvich@gmail.com>
References: <1450207582-17957-1-git-send-email-ynvich@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450207582-17957-1-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sergei Ianovich <ynvich@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

ICP DAS LP-8x4x contains FPGA chip. The chip functions as an interrupt
source providing 16 additional interrupts among other things. The
interrupt lines are muxed to a GPIO pin of a 2nd level PXA-GPIO
interrupt controller. GPIO pins of the 2nd level controller are in turn
muxed to a CPU interrupt line.

Until pxa is completely converted to device tree, it is impossible
to use IRQCHIP_DECLARE() and the irqdomain needs to added manually.
Drivers for the on-CPU IRQs and GPIO-IRQs are loaded using
postcore_initcall(). We need to have all irq domain drivers loaded prior
to DT parsing in order to allow normal initialization of IRQ resources
with DT.

Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Rob Herring <robh@kernel.org>
CC: Marc Zyngier <marc.zyngier@arm.com>

   v5..v6
   fixes according to Rob Herring review comments:
   * drop wildcards in binding and file names
   * rename alias 'fpga'->'fpga_irq'

   fixes according to Marc Zyngier review comments:
   * use writeb/readb not iowrite8/ioread8
   * redefine 2nd mask using inversion on 1st
   * add comments

   v4..v5
   * constify struct of_device_id
   * drop irq number from handler signature

   v3.2..v4
   * move DTS binding to a different patch (8/21)

   v3.1..v3.2
   fixes to apply Linus Walleij's "Reviewed-by":
   * add kerneldoc comment for state container struct
   * rename irq -> hwirq for clarity
   * drop overzealous error checks from the hotpaths

   v3..v3.1
   fixes according to Linus Walleij review comments:
   * update commit message
   * use state container instead of global variables
   * get hardware irq nums from irq_data, don't calculate them
   * use BIT() macro
   * add defines for system irq register masks
   * replace cycle control variable with break
   * use better names for resource variables
   * add a linear domain instead of a legacy one
   * use irq_create_mapping() instead of irq_alloc_desc()

   v2..v3
   * no changes (except number 09/16 -> 11/21)

   v0..v2
   * extract irqchip and move to drivers/irqchip/
   * use device tree
   * use devm helpers where possible
---
 .../interrupt-controller/icpdas-lp8x4x-irq.txt     |  49 ++++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-lp8841.c                       | 246 +++++++++++++++++++++
 4 files changed, 301 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
 create mode 100644 drivers/irqchip/irq-lp8841.c

diff --git a/Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
new file mode 100644
index 0000000..a72109b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
@@ -0,0 +1,49 @@
+ICP DAS LP-8841 FPGA Interrupt Controller
+
+ICP DAS LP-8841 contains FPGA chip. The chip functions as a interrupt
+source providing 16 additional interrupts among other things.
+
+Required properties:
+- compatible : should be "icpdas,lp8x4x-irq"
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- interrupt-controller : identifies the node as an interrupt controller
+
+- #interrupt-cells : should be 1
+
+- interrupts : should provide interrupt
+
+Optional properties:
+
+- interrupt-parent : should provide a link to interrupt controller either
+		     explicitly and implicitly from a parent node
+
+Example:
+
+fpgairq: irq@9006 {
+	compatible = "icpdas,lp8841-irq";
+	reg = <0x9006 0x16>;
+	interrupt-parent = <&gpio>;
+	interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+	#interrupt-cells = <1>;
+	interrupt-controller;
+	status = "okay";
+};
+
+serial@9050 {
+	compatible = "icpdas,lp8841-uart";
+	reg =  <0x9050 0x10
+		0x9030 0x02>;
+	interrupts = <13>;
+	status = "okay";
+};
+
+serial@9060 {
+	compatible = "icpdas,lp8841-uart";
+	reg =  <0x9060 0x10
+		0x9032 0x02>;
+	interrupts = <14>;
+	status = "okay";
+};
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index fb50911..786073b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -218,3 +218,8 @@ config IRQ_MXS
 	def_bool y if MACH_ASM9260 || ARCH_MXS
 	select IRQ_DOMAIN
 	select STMP_DEVICE
+
+config LP8841_IRQ
+	bool
+	def_bool y if MACH_PXA27X_DT
+	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 18caacb..05313d1 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
 obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
 obj-$(CONFIG_PIC32_EVIC)		+= irq-pic32-evic.o
+obj-$(CONFIG_LP8841_IRQ)		+= irq-lp8841.o
diff --git a/drivers/irqchip/irq-lp8841.c b/drivers/irqchip/irq-lp8841.c
new file mode 100644
index 0000000..6a019f0
--- /dev/null
+++ b/drivers/irqchip/irq-lp8841.c
@@ -0,0 +1,246 @@
+/*
+ *  linux/drivers/irqchip/irq-lp8841.c
+ *
+ *  Support for ICP DAS LP-8841 FPGA irq
+ *  Copyright (C) 2013 Sergei Ianovich <ynvich@gmail.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation or any later version.
+ */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define MODULE_NAME		"irq-lp8841"
+
+#define EOI			0x00000000
+#define INSINT			0x00000002
+#define ENSYSINT		0x00000004
+#define PRIMINT			0x00000006
+#define PRIMINT_MASK		0xe0
+#define SECOINT			0x00000008
+#define SECOINT_MASK		(~(u8)PRIMINT_MASK)
+#define ENRISEINT		0x0000000A
+#define CLRRISEINT		0x0000000C
+#define ENHILVINT		0x0000000E
+#define CLRHILVINT		0x00000010
+#define ENFALLINT		0x00000012
+#define CLRFALLINT		0x00000014
+#define IRQ_MEM_SIZE		0x00000016
+#define LP8841_NUM_IRQ_DEFAULT	16
+
+/**
+ * struct lp8841_irq_data - LP8841 custom irq controller state container
+ * @base:               base IO memory address
+ * @irq_domain:         Interrupt translation domain; responsible for mapping
+ *                      between hwirq number and linux irq number
+ * @irq_sys_enabled:    mask keeping track of interrupts enabled in the
+ *                      register which vendor calls 'system'
+ * @irq_high_enabled:   mask keeping track of interrupts enabled in the
+ *                      register which vendor calls 'high'
+ *
+ * The structure implements State Container from
+ * Documentation/driver-model/design-patterns.txt
+ */
+
+struct lp8841_irq_data {
+	void			*base;
+	struct irq_domain	*domain;
+	unsigned char		irq_sys_enabled;
+	unsigned char		irq_high_enabled;
+};
+
+static void lp8841_mask_irq(struct irq_data *d)
+{
+	unsigned mask;
+	unsigned long hwirq = d->hwirq;
+	struct lp8841_irq_data *host = irq_data_get_irq_chip_data(d);
+
+	if (hwirq < 8) {
+		host->irq_high_enabled &= ~BIT(hwirq);
+
+		mask = readb(host->base + ENHILVINT);
+		mask &= ~BIT(hwirq);
+		writeb(mask, host->base + ENHILVINT);
+	} else {
+		hwirq -= 8;
+		host->irq_sys_enabled &= ~BIT(hwirq);
+
+		mask = readb(host->base + ENSYSINT);
+		mask &= ~BIT(hwirq);
+		writeb(mask, host->base + ENSYSINT);
+	}
+}
+
+static void lp8841_unmask_irq(struct irq_data *d)
+{
+	unsigned mask;
+	unsigned long hwirq = d->hwirq;
+	struct lp8841_irq_data *host = irq_data_get_irq_chip_data(d);
+
+	if (hwirq < 8) {
+		host->irq_high_enabled |= BIT(hwirq);
+		mask = readb(host->base + CLRHILVINT);
+		mask |= BIT(hwirq);
+		writeb(mask, host->base + CLRHILVINT);
+
+		mask = readb(host->base + ENHILVINT);
+		mask |= BIT(hwirq);
+		writeb(mask, host->base + ENHILVINT);
+	} else {
+		hwirq -= 8;
+		host->irq_sys_enabled |= BIT(hwirq);
+
+		mask = readb(host->base + SECOINT);
+		mask |= BIT(hwirq);
+		writeb(mask, host->base + SECOINT);
+
+		mask = readb(host->base + ENSYSINT);
+		mask |= BIT(hwirq);
+		writeb(mask, host->base + ENSYSINT);
+	}
+}
+
+static struct irq_chip lp8841_irq_chip = {
+	.name			= "FPGA",
+	.irq_ack		= lp8841_mask_irq,
+	.irq_mask		= lp8841_mask_irq,
+	.irq_mask_ack		= lp8841_mask_irq,
+	.irq_unmask		= lp8841_unmask_irq,
+};
+
+static void lp8841_irq_handler(struct irq_desc *desc)
+{
+	int n;
+	unsigned long mask;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct lp8841_irq_data *host = irq_desc_get_handler_data(desc);
+
+	chained_irq_enter(chip, desc);
+
+	for (;;) {
+		mask = readb(host->base + CLRHILVINT) & 0xff;
+		/* load two registers into a single byte */
+		mask |= (readb(host->base + SECOINT) & SECOINT_MASK) << 8;
+		mask |= (readb(host->base + PRIMINT) & PRIMINT_MASK) << 8;
+		if (mask == 0)
+			break;
+		for_each_set_bit(n, &mask, BITS_PER_LONG)
+			generic_handle_irq(irq_find_mapping(host->domain, n));
+	}
+
+	writeb(0, host->base + EOI);
+	chained_irq_exit(chip, desc);
+}
+
+static int lp8841_irq_domain_map(struct irq_domain *d, unsigned int irq,
+				 irq_hw_number_t hw)
+{
+	struct lp8841_irq_data *host = d->host_data;
+	int err;
+
+	err = irq_set_chip_data(irq, host);
+	if (err < 0)
+		return err;
+
+	irq_set_chip_and_handler(irq, &lp8841_irq_chip, handle_level_irq);
+	irq_set_probe(irq);
+	return 0;
+}
+
+const struct irq_domain_ops lp8841_irq_domain_ops = {
+	.map	= lp8841_irq_domain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static const struct of_device_id lp8841_irq_dt_ids[] = {
+	{ .compatible = "icpdas,lp8841-irq", },
+	{}
+};
+
+/*
+ * REVISIT probing will need to rewritten when PXA is converted to DT
+ */
+
+static int lp8841_irq_probe(struct platform_device *pdev)
+{
+	struct resource *res_mem;
+	int irq;
+	struct device_node *np = pdev->dev.of_node;
+	struct lp8841_irq_data *host;
+	int i, err;
+
+	irq = platform_get_irq(pdev, 0);
+	if (IS_ERR_VALUE(irq)) {
+		dev_err(&pdev->dev, "bad irq %i\n", irq);
+		return irq;
+	}
+
+	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res_mem || resource_size(res_mem) < IRQ_MEM_SIZE) {
+		dev_err(&pdev->dev, "bad IOmem %p\n", res_mem);
+		if (res_mem)
+			dev_err(&pdev->dev, "bad start %p or size %u\n",
+					(void *) res_mem->start,
+					resource_size(res_mem));
+		return -ENODEV;
+	}
+
+	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	host->base = devm_ioremap_resource(&pdev->dev, res_mem);
+	if (!host->base) {
+		dev_err(&pdev->dev, "Failed to ioremap %p\n", host->base);
+		return -EFAULT;
+	}
+
+	host->domain = irq_domain_add_linear(np, LP8841_NUM_IRQ_DEFAULT,
+				       &lp8841_irq_domain_ops, host);
+	if (!host->domain) {
+		dev_err(&pdev->dev, "Failed to add IRQ domain\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < LP8841_NUM_IRQ_DEFAULT; i++) {
+		err = irq_create_mapping(host->domain, i);
+		if (err < 0)
+			dev_err(&pdev->dev, "Failed to map IRQ %i\n", i);
+	}
+
+	/* Initialize chip registers */
+	writeb(0, host->base + CLRRISEINT);
+	writeb(0, host->base + ENRISEINT);
+	writeb(0, host->base + CLRFALLINT);
+	writeb(0, host->base + ENFALLINT);
+	writeb(0, host->base + CLRHILVINT);
+	writeb(0, host->base + ENHILVINT);
+	writeb(0, host->base + ENSYSINT);
+	writeb(0, host->base + SECOINT);
+
+	irq_set_handler_data(irq, host);
+	irq_set_chained_handler(irq, lp8841_irq_handler);
+
+	pr_info(MODULE_NAME ": %i IRQs\n", LP8841_NUM_IRQ_DEFAULT);
+	return 0;
+}
+
+static struct platform_driver lp8841_irq_driver = {
+	.probe		= lp8841_irq_probe,
+	.driver		= {
+		.name	= MODULE_NAME,
+		.of_match_table = lp8841_irq_dt_ids,
+	},
+};
+
+static int __init lp8841_irq_init(void)
+{
+	return platform_driver_register(&lp8841_irq_driver);
+}
+device_initcall(lp8841_irq_init);
-- 
2.7.0
