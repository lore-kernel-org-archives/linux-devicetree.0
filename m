From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 09/19] irqchip: i8259: Add plat-poll support
Date: Thu,  5 Sep 2019 22:43:06 +0800
Message-ID: <20190905144316.12527-10-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

For some platforms (e.g. Loongson-3), platfrom interrupt controller
supports polling interrupt vector from i8259 automaticly and generating
sepreated interrupt.

Thus we add plat-poll OF property for these platforms and setup sepreated
chained interrupt handler.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-i8259.c | 47 ++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index d000870d9b6b..e7a9895f3b2d 100644
--- a/drivers/irqchip/irq-i8259.c
+++ b/drivers/irqchip/irq-i8259.c
@@ -40,6 +40,12 @@ static void mask_and_ack_8259A(struct irq_data *d);
 static void init_8259A(int auto_eoi);
 static int (*i8259_poll)(void) = i8259_irq;
 
+struct plat_poll_priv {
+	struct irq_domain *domain;
+	int hwirq;
+};
+static struct plat_poll_priv plat_poll_priv[16];
+
 static struct irq_chip i8259A_chip = {
 	.name			= "XT-PIC",
 	.irq_mask		= disable_8259A_irq,
@@ -346,22 +352,51 @@ static void i8259_irq_dispatch(struct irq_desc *desc)
 	generic_handle_irq(irq);
 }
 
+static void plat_poll_irq_dispatch(struct irq_desc *desc)
+{
+	struct plat_poll_priv *priv = irq_desc_get_handler_data(desc);
+	unsigned int irq;
+
+	irq = irq_linear_revmap(priv->domain, priv->hwirq);
+	generic_handle_irq(irq);
+}
+
 int __init i8259_of_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *domain;
-	unsigned int parent_irq;
 
 	domain = __init_i8259_irqs(node);
 
-	parent_irq = irq_of_parse_and_map(node, 0);
-	if (!parent_irq) {
-		pr_err("Failed to map i8259 parent IRQ\n");
-		irq_domain_remove(domain);
-		return -ENODEV;
+	if (of_find_property(node, "plat-poll", NULL)) {
+		int i;
+
+		for (i = 0; i < 16; i++) {
+			int parent_irq = irq_of_parse_and_map(node, i);
+
+			if (!parent_irq) {
+				pr_err("Failed to map %d plat-poll i8259 parent IRQ\n", i);
+				irq_domain_remove(domain);
+				return -ENODEV;
+			}
+			plat_poll_priv[i].domain = domain;
+			plat_poll_priv[i].hwirq = i;
+			irq_set_chained_handler_and_data(parent_irq,
+				plat_poll_irq_dispatch,
+				&plat_poll_priv[i]);
+		}
+	} else {
+		unsigned int parent_irq;
+
+		parent_irq = irq_of_parse_and_map(node, 0);
+		if (!parent_irq) {
+			pr_err("Failed to map i8259 parent IRQ\n");
+			irq_domain_remove(domain);
+			return -ENODEV;
 	}
 
 	irq_set_chained_handler_and_data(parent_irq, i8259_irq_dispatch,
 					 domain);
+	}
 	return 0;
 }
 IRQCHIP_DECLARE(i8259, "intel,i8259", i8259_of_init);
-- 
2.22.0
