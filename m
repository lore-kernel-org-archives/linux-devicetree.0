From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 3/4] irqchip: Add BCM2835 AUX interrupt controller
Date: Wed, 14 Jun 2017 17:29:09 +0100
Message-ID: <1497457750-35585-4-git-send-email-phil@raspberrypi.org>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Devices in the BCM2835 AUX block share a common interrupt line, with a
register indicating which devices have active IRQs. Expose this as a
nested interrupt controller to avoid IRQ sharing problems (easily
observed if UART1 and SPI1/2 are enabled simultaneously).

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/irqchip/Makefile          |   2 +-
 drivers/irqchip/irq-bcm2835-aux.c | 153 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-bcm2835-aux.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index b64c59b..cf01920 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
-obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
+obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o irq-bcm2835-aux.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
 obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
 obj-$(CONFIG_FARADAY_FTINTC010)		+= irq-ftintc010.o
diff --git a/drivers/irqchip/irq-bcm2835-aux.c b/drivers/irqchip/irq-bcm2835-aux.c
new file mode 100644
index 0000000..2151d51
--- /dev/null
+++ b/drivers/irqchip/irq-bcm2835-aux.c
@@ -0,0 +1,153 @@
+/*
+ * Copyright (C) 2017 Raspberry Pi (Trading) Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/interrupt-controller/bcm2835-aux-intc.h>
+
+#define BCM2835_AUXIRQ		0x00
+
+#define BCM2835_AUX_IRQ_UART_MASK BIT(BCM2835_AUX_IRQ_UART)
+#define BCM2835_AUX_IRQ_SPI1_MASK BIT(BCM2835_AUX_IRQ_SPI1)
+#define BCM2835_AUX_IRQ_SPI2_MASK BIT(BCM2835_AUX_IRQ_SPI2)
+
+#define BCM2835_AUX_IRQ_ALL_MASK \
+	(BCM2835_AUX_IRQ_UART_MASK | \
+	 BCM2835_AUX_IRQ_SPI1_MASK | \
+	 BCM2835_AUX_IRQ_SPI2_MASK)
+
+struct aux_irq_state {
+	void __iomem      *status;
+	struct irq_domain *domain;
+};
+
+static struct aux_irq_state aux_irq __read_mostly;
+
+static irqreturn_t bcm2835_aux_irq_handler(int irq, void *dev_id)
+{
+	u32 stat = readl_relaxed(aux_irq.status);
+
+	if (stat & BCM2835_AUX_IRQ_UART_MASK)
+		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
+						     BCM2835_AUX_IRQ_UART));
+
+	if (stat & BCM2835_AUX_IRQ_SPI1_MASK)
+		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
+						     BCM2835_AUX_IRQ_SPI1));
+
+	if (stat & BCM2835_AUX_IRQ_SPI2_MASK)
+		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
+						     BCM2835_AUX_IRQ_SPI2));
+
+	return (stat & BCM2835_AUX_IRQ_ALL_MASK) ? IRQ_HANDLED : IRQ_NONE;
+}
+
+/*
+ * The irq_mask and irq_unmask function pointers are used without
+ * validity checks, so they must not be NULL. Create a dummy function
+ * with the expected type for use as a no-op.
+ */
+static void bcm2835_aux_irq_dummy(struct irq_data *data)
+{
+}
+
+static struct irq_chip bcm2835_aux_irq_chip = {
+	.name = "bcm2835-aux_irq",
+	.irq_mask = bcm2835_aux_irq_dummy,
+	.irq_unmask = bcm2835_aux_irq_dummy,
+};
+
+static int bcm2835_aux_irq_xlate(struct irq_domain *d,
+				 struct device_node *ctrlr,
+				 const u32 *intspec, unsigned int intsize,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type)
+{
+	if (WARN_ON(intsize != 1))
+		return -EINVAL;
+
+	if (WARN_ON(intspec[0] >= BCM2835_AUX_IRQ_COUNT))
+		return -EINVAL;
+
+	*out_hwirq = intspec[0];
+	*out_type = IRQ_TYPE_LEVEL_HIGH;
+
+	return 0;
+}
+
+static int bcm2835_aux_irq_map(struct irq_domain *d, unsigned int irq,
+			       irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &bcm2835_aux_irq_chip,
+				 handle_level_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops bcm2835_aux_irq_ops = {
+	.xlate = bcm2835_aux_irq_xlate,
+	.map = bcm2835_aux_irq_map,
+};
+
+static int bcm2835_aux_irq_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	int parent_irq;
+	struct resource *res;
+	void __iomem *reg;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reg = devm_ioremap_resource(dev, res);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq)
+		return -ENXIO;
+
+	aux_irq.status = reg + BCM2835_AUXIRQ;
+	aux_irq.domain = irq_domain_add_linear(node,
+					       BCM2835_AUX_IRQ_COUNT,
+					       &bcm2835_aux_irq_ops,
+					       NULL);
+	if (!aux_irq.domain)
+		return -ENXIO;
+
+	return  devm_request_irq(dev, parent_irq, bcm2835_aux_irq_handler,
+				 0, "bcm2835-aux-intc", NULL);
+}
+
+static const struct of_device_id bcm2835_aux_irq_of_match[] = {
+	{ .compatible = "brcm,bcm2835-aux-intc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm2835_aux_irq_of_match);
+
+static struct platform_driver bcm2835_aux_irq_driver = {
+	.driver = {
+		.name = "bcm2835-aux-intc",
+		.of_match_table = bcm2835_aux_irq_of_match,
+	},
+	.probe          = bcm2835_aux_irq_probe,
+};
+builtin_platform_driver(bcm2835_aux_irq_driver);
+
+MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.org>");
+MODULE_DESCRIPTION("BCM2835 auxiliary peripheral interrupt driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
