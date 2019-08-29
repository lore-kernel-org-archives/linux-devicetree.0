From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] irqchip/meson-gpio: Add support for meson sm1 SoCs
Date: Thu, 29 Aug 2019 18:16:35 +0200
Message-ID: <20190829161635.25067-3-jbrunet@baylibre.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829161635.25067-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The meson sm1 SoCs uses the same type of GPIO interrupt controller IP
block as the other meson SoCs, A total of 100 pins can be spied on:

- 223:100 undefined (no interrupt)
- 99:97   3 pins on bank GPIOE
- 96:77   20 pins on bank GPIOX
- 76:61   16 pins on bank GPIOA
- 60:53   8 pins on bank GPIOC
- 52:37   16 pins on bank BOOT
- 36:28   9 pins on bank GPIOH
- 27:12   16 pins on bank GPIOZ
- 11:0    12 pins in the AO domain

Mapping is the same as the g12a family but the sm1 controller
allows to trig an irq on both edges of the input signal. This was
not possible with the previous SoCs families

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/irqchip/irq-meson-gpio.c | 52 +++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index dcdc23b9dce6..829084b568fa 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -24,14 +24,25 @@
 #define REG_PIN_47_SEL	0x08
 #define REG_FILTER_SEL	0x0c
 
-#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
+/*
+ * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
+ * bits 24 to 31. Tests on the actual HW show that these bits are
+ * stuck at 0. Bits 8 to 15 are responsive and have the expected
+ * effect.
+ */
 #define REG_EDGE_POL_EDGE(x)	BIT(x)
 #define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
+#define REG_BOTH_EDGE(x)	BIT(8 + (x))
+#define REG_EDGE_POL_MASK(x)    (	\
+		REG_EDGE_POL_EDGE(x) |	\
+		REG_EDGE_POL_LOW(x)  |	\
+		REG_BOTH_EDGE(x))
 #define REG_PIN_SEL_SHIFT(x)	(((x) % 4) * 8)
 #define REG_FILTER_SEL_SHIFT(x)	((x) * 4)
 
 struct meson_gpio_irq_params {
 	unsigned int nr_hwirq;
+	bool support_edge_both;
 };
 
 static const struct meson_gpio_irq_params meson8_params = {
@@ -54,6 +65,11 @@ static const struct meson_gpio_irq_params axg_params = {
 	.nr_hwirq = 100,
 };
 
+static const struct meson_gpio_irq_params sm1_params = {
+	.nr_hwirq = 100,
+	.support_edge_both = true,
+};
+
 static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
@@ -61,11 +77,12 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
 	{ .compatible = "amlogic,meson-axg-gpio-intc", .data = &axg_params },
 	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
+	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
 	{ }
 };
 
 struct meson_gpio_irq_controller {
-	unsigned int nr_hwirq;
+	const struct meson_gpio_irq_params *params;
 	void __iomem *base;
 	u32 channel_irqs[NUM_CHANNEL];
 	DECLARE_BITMAP(channel_map, NUM_CHANNEL);
@@ -168,14 +185,22 @@ static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
 	 */
 	type &= IRQ_TYPE_SENSE_MASK;
 
-	if (type == IRQ_TYPE_EDGE_BOTH)
-		return -EINVAL;
+	/*
+	 * New controller support EDGE_BOTH trigger. This setting takes
+	 * precedence over the other edge/polarity settings
+	 */
+	if (type == IRQ_TYPE_EDGE_BOTH) {
+		if (!ctl->params->support_edge_both)
+			return -EINVAL;
 
-	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
-		val |= REG_EDGE_POL_EDGE(idx);
+		val |= REG_BOTH_EDGE(idx);
+	} else {
+		if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+			val |= REG_EDGE_POL_EDGE(idx);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
-		val |= REG_EDGE_POL_LOW(idx);
+		if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+			val |= REG_EDGE_POL_LOW(idx);
+	}
 
 	spin_lock(&ctl->lock);
 
@@ -199,7 +224,7 @@ static unsigned int meson_gpio_irq_type_output(unsigned int type)
 	 */
 	if (sense & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
 		type |= IRQ_TYPE_LEVEL_HIGH;
-	else if (sense & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+	else
 		type |= IRQ_TYPE_EDGE_RISING;
 
 	return type;
@@ -328,15 +353,13 @@ static int __init meson_gpio_irq_parse_dt(struct device_node *node,
 					  struct meson_gpio_irq_controller *ctl)
 {
 	const struct of_device_id *match;
-	const struct meson_gpio_irq_params *params;
 	int ret;
 
 	match = of_match_node(meson_irq_gpio_matches, node);
 	if (!match)
 		return -ENODEV;
 
-	params = match->data;
-	ctl->nr_hwirq = params->nr_hwirq;
+	ctl->params = match->data;
 
 	ret = of_property_read_variable_u32_array(node,
 						  "amlogic,channel-interrupts",
@@ -385,7 +408,8 @@ static int __init meson_gpio_irq_of_init(struct device_node *node,
 	if (ret)
 		goto free_channel_irqs;
 
-	domain = irq_domain_create_hierarchy(parent_domain, 0, ctl->nr_hwirq,
+	domain = irq_domain_create_hierarchy(parent_domain, 0,
+					     ctl->params->nr_hwirq,
 					     of_node_to_fwnode(node),
 					     &meson_gpio_irq_domain_ops,
 					     ctl);
@@ -396,7 +420,7 @@ static int __init meson_gpio_irq_of_init(struct device_node *node,
 	}
 
 	pr_info("%d to %d gpio interrupt mux initialized\n",
-		ctl->nr_hwirq, NUM_CHANNEL);
+		ctl->params->nr_hwirq, NUM_CHANNEL);
 
 	return 0;
 
-- 
2.21.0
