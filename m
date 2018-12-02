From: Mesih Kilinc <mesihkilinc@gmail.com>
Subject: [PATCH v6 07/17] irqchip/sun4i: Add support for Allwinner ARMv5 F1C100s
Date: Sun,  2 Dec 2018 23:23:41 +0300
Message-ID: <5fe6eafae0bd8994dcdb5ea6b9255a64e6cdf02c.1543781680.git.mesihkilinc@gmail.com>
References: <cover.1543781680.git.mesihkilinc@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1543781680.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for suniv Allwinner ARMv5 F1C100s SoC which has
stripped version of interrupt controller that found in A10/A13.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/irqchip/irq-sun4i.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
index 507f4e3..fb78d66 100644
--- a/drivers/irqchip/irq-sun4i.c
+++ b/drivers/irqchip/irq-sun4i.c
@@ -32,6 +32,8 @@
 #define SUN4I_IRQ_MASK_REG(data, x)	((data)->mask_reg_offset + 0x4 * x)
 #define SUN4I_IRQ_ENABLE_REG_OFFSET	0x40
 #define SUN4I_IRQ_MASK_REG_OFFSET	0x50
+#define SUNIV_IRQ_ENABLE_REG_OFFSET	0x20
+#define SUNIV_IRQ_MASK_REG_OFFSET	0x30
 
 struct sun4i_irq_chip_data {
 	void __iomem *irq_base;
@@ -105,15 +107,6 @@ static const struct irq_domain_ops sun4i_irq_ops = {
 static int __init sun4i_of_init(struct device_node *node,
 				struct device_node *parent)
 {
-	irq_ic_data = kzalloc(sizeof(struct sun4i_irq_chip_data), GFP_KERNEL);
-	if (!irq_ic_data) {
-		pr_err("kzalloc failed!\n");
-		return -ENOMEM;
-	}
-
-	irq_ic_data->enable_reg_offset = SUN4I_IRQ_ENABLE_REG_OFFSET;
-	irq_ic_data->mask_reg_offset = SUN4I_IRQ_MASK_REG_OFFSET;
-
 	irq_ic_data->irq_base = of_iomap(node, 0);
 	if (!irq_ic_data->irq_base)
 		panic("%pOF: unable to map IC registers\n",
@@ -149,7 +142,41 @@ static int __init sun4i_of_init(struct device_node *node,
 
 	return 0;
 }
-IRQCHIP_DECLARE(allwinner_sun4i_ic, "allwinner,sun4i-a10-ic", sun4i_of_init);
+
+static int __init sun4i_ic_of_init(struct device_node *node,
+				   struct device_node *parent)
+{
+	irq_ic_data = kzalloc(sizeof(struct sun4i_irq_chip_data), GFP_KERNEL);
+	if (!irq_ic_data) {
+		pr_err("kzalloc failed!\n");
+		return -ENOMEM;
+	}
+
+	irq_ic_data->enable_reg_offset = SUN4I_IRQ_ENABLE_REG_OFFSET;
+	irq_ic_data->mask_reg_offset = SUN4I_IRQ_MASK_REG_OFFSET;
+
+	return sun4i_of_init(node, parent);
+}
+
+IRQCHIP_DECLARE(allwinner_sun4i_ic, "allwinner,sun4i-a10-ic", sun4i_ic_of_init);
+
+static int __init suniv_ic_of_init(struct device_node *node,
+				   struct device_node *parent)
+{
+	irq_ic_data = kzalloc(sizeof(struct sun4i_irq_chip_data), GFP_KERNEL);
+	if (!irq_ic_data) {
+		pr_err("kzalloc failed!\n");
+		return -ENOMEM;
+	}
+
+	irq_ic_data->enable_reg_offset = SUNIV_IRQ_ENABLE_REG_OFFSET;
+	irq_ic_data->mask_reg_offset = SUNIV_IRQ_MASK_REG_OFFSET;
+
+	return sun4i_of_init(node, parent);
+}
+
+IRQCHIP_DECLARE(allwinner_sunvi_ic, "allwinner,suniv-f1c100s-ic",
+		suniv_ic_of_init);
 
 static void __exception_irq_entry sun4i_handle_irq(struct pt_regs *regs)
 {
-- 
2.7.4
