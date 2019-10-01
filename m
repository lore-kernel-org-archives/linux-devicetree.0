From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/7] irqchip/irq-bcm2835: Add support for 7211 interrupt controller
Date: Tue,  1 Oct 2019 15:48:38 -0700
Message-ID: <20191001224842.9382-4-f.fainelli@gmail.com>
References: <20191001224842.9382-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001224842.9382-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

BCM7211 has a number of similarities with BCM2836, except the register
offsets are different and the bank bits are also different, account for
all of these differences.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm2835.c | 86 +++++++++++++++++++++++++++++------
 1 file changed, 72 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2835.c b/drivers/irqchip/irq-bcm2835.c
index 418245d31921..55afc3487723 100644
--- a/drivers/irqchip/irq-bcm2835.c
+++ b/drivers/irqchip/irq-bcm2835.c
@@ -57,19 +57,34 @@
 #define SHORTCUT_SHIFT		10
 #define BANK1_HWIRQ		BIT(8)
 #define BANK2_HWIRQ		BIT(9)
+#define BANK1_HWIRQ_BCM7211	BIT(24)
+#define BANK2_HWIRQ_BCM7211	BIT(25)
 #define BANK0_VALID_MASK	(BANK0_HWIRQ_MASK | BANK1_HWIRQ | BANK2_HWIRQ \
 					| SHORTCUT1_MASK | SHORTCUT2_MASK)
+#define BANK0_VALID_MASK_BCM7211 (BANK0_HWIRQ_MASK | BANK1_HWIRQ_BCM7211 | \
+				  BANK2_HWIRQ_BCM7211 | SHORTCUT1_MASK | \
+				  SHORTCUT2_MASK)
 
 #define REG_FIQ_CONTROL		0x0c
 
 #define NR_BANKS		3
 #define IRQS_PER_BANK		32
 
+enum armctrl_type {
+	ARMCTRL_BCM2835 = 0,
+	ARMCTRL_BCM2836,
+	ARMCTRL_BCM7211
+};
+
 static const int reg_pending[] __initconst = { 0x00, 0x04, 0x08 };
 static const int reg_enable[] __initconst = { 0x18, 0x10, 0x14 };
 static const int reg_disable[] __initconst = { 0x24, 0x1c, 0x20 };
 static const int bank_irqs[] __initconst = { 8, 32, 32 };
 
+static const int reg_pending_bcm7211[] __initconst = { 0x08, 0x00, 0x04 };
+static const int reg_enable_bcm7211[] __initconst = { 0x18, 0x10, 0x14 };
+static const int reg_disable_bcm7211[] __initconst = { 0x28, 0x20, 0x24 };
+
 static const int shortcuts[] = {
 	7, 9, 10, 18, 19,		/* Bank 1 */
 	21, 22, 23, 24, 25, 30		/* Bank 2 */
@@ -87,6 +102,7 @@ static struct armctrl_ic intc __read_mostly;
 static void __exception_irq_entry bcm2835_handle_irq(
 	struct pt_regs *regs);
 static void bcm2836_chained_handle_irq(struct irq_desc *desc);
+static void bcm7211_chained_handle_irq(struct irq_desc *desc);
 
 static void armctrl_mask_irq(struct irq_data *d)
 {
@@ -131,11 +147,14 @@ static const struct irq_domain_ops armctrl_ops = {
 
 static int __init armctrl_of_init(struct device_node *node,
 				  struct device_node *parent,
-				  bool is_2836)
+				  enum armctrl_type type)
 {
 	void __iomem *base;
 	int irq, b, i;
 
+	if (type > ARMCTRL_BCM7211)
+		return -EINVAL;
+
 	base = of_iomap(node, 0);
 	if (!base)
 		panic("%pOF: unable to map IC registers\n", node);
@@ -146,9 +165,19 @@ static int __init armctrl_of_init(struct device_node *node,
 		panic("%pOF: unable to create IRQ domain\n", node);
 
 	for (b = 0; b < NR_BANKS; b++) {
-		intc.pending[b] = base + reg_pending[b];
-		intc.enable[b] = base + reg_enable[b];
-		intc.disable[b] = base + reg_disable[b];
+		if (type <= ARMCTRL_BCM2836) {
+			intc.pending[b] = base + reg_pending[b];
+			intc.enable[b] = base + reg_enable[b];
+			intc.disable[b] = base + reg_disable[b];
+		} else {
+			intc.pending[b] = base + reg_pending_bcm7211[b];
+			intc.enable[b] = base + reg_enable_bcm7211[b];
+			intc.disable[b] = base + reg_disable_bcm7211[b];
+		}
+
+		if (type == ARMCTRL_BCM7211)
+			armctrl_chip.flags |= IRQCHIP_MASK_ON_SUSPEND |
+					      IRQCHIP_SKIP_SET_WAKE;
 
 		for (i = 0; i < bank_irqs[b]; i++) {
 			irq = irq_create_mapping(intc.domain, MAKE_HWIRQ(b, i));
@@ -159,14 +188,19 @@ static int __init armctrl_of_init(struct device_node *node,
 		}
 	}
 
-	if (is_2836) {
+	if (type >= ARMCTRL_BCM2836) {
 		int parent_irq = irq_of_parse_and_map(node, 0);
 
 		if (!parent_irq) {
 			panic("%pOF: unable to get parent interrupt.\n",
 			      node);
 		}
-		irq_set_chained_handler(parent_irq, bcm2836_chained_handle_irq);
+		if (type == ARMCTRL_BCM2836)
+			irq_set_chained_handler(parent_irq,
+						bcm2836_chained_handle_irq);
+		else
+			irq_set_chained_handler(parent_irq,
+						bcm7211_chained_handle_irq);
 	} else {
 		set_handle_irq(bcm2835_handle_irq);
 	}
@@ -177,13 +211,19 @@ static int __init armctrl_of_init(struct device_node *node,
 static int __init bcm2835_armctrl_of_init(struct device_node *node,
 					  struct device_node *parent)
 {
-	return armctrl_of_init(node, parent, false);
+	return armctrl_of_init(node, parent, ARMCTRL_BCM2835);
 }
 
 static int __init bcm2836_armctrl_of_init(struct device_node *node,
 					  struct device_node *parent)
 {
-	return armctrl_of_init(node, parent, true);
+	return armctrl_of_init(node, parent, ARMCTRL_BCM2836);
+}
+
+static int __init bcm7211_armctrl_of_init(struct device_node *node,
+					  struct device_node *parent)
+{
+	return armctrl_of_init(node, parent, ARMCTRL_BCM7211);
 }
 
 
@@ -205,9 +245,11 @@ static u32 armctrl_translate_shortcut(int bank, u32 stat)
 	return MAKE_HWIRQ(bank, shortcuts[ffs(stat >> SHORTCUT_SHIFT) - 1]);
 }
 
-static u32 get_next_armctrl_hwirq(void)
+static u32 get_next_armctrl_hwirq(u32 valid_mask,
+				  u32 bank1_mask,
+				  u32 bank2_mask)
 {
-	u32 stat = readl_relaxed(intc.pending[0]) & BANK0_VALID_MASK;
+	u32 stat = readl_relaxed(intc.pending[0]) & valid_mask;
 
 	if (stat == 0)
 		return ~0;
@@ -217,9 +259,9 @@ static u32 get_next_armctrl_hwirq(void)
 		return armctrl_translate_shortcut(1, stat & SHORTCUT1_MASK);
 	else if (stat & SHORTCUT2_MASK)
 		return armctrl_translate_shortcut(2, stat & SHORTCUT2_MASK);
-	else if (stat & BANK1_HWIRQ)
+	else if (stat & bank1_mask)
 		return armctrl_translate_bank(1);
-	else if (stat & BANK2_HWIRQ)
+	else if (stat & bank2_mask)
 		return armctrl_translate_bank(2);
 	else
 		BUG();
@@ -230,7 +272,9 @@ static void __exception_irq_entry bcm2835_handle_irq(
 {
 	u32 hwirq;
 
-	while ((hwirq = get_next_armctrl_hwirq()) != ~0)
+	while ((hwirq = get_next_armctrl_hwirq(BANK0_VALID_MASK,
+					       BANK1_HWIRQ,
+					       BANK2_HWIRQ)) != ~0)
 		handle_domain_irq(intc.domain, hwirq, regs);
 }
 
@@ -238,7 +282,19 @@ static void bcm2836_chained_handle_irq(struct irq_desc *desc)
 {
 	u32 hwirq;
 
-	while ((hwirq = get_next_armctrl_hwirq()) != ~0)
+	while ((hwirq = get_next_armctrl_hwirq(BANK0_VALID_MASK,
+					       BANK1_HWIRQ,
+					       BANK2_HWIRQ)) != ~0)
+		generic_handle_irq(irq_linear_revmap(intc.domain, hwirq));
+}
+
+static void bcm7211_chained_handle_irq(struct irq_desc *desc)
+{
+	u32 hwirq;
+
+	while ((hwirq = get_next_armctrl_hwirq(BANK0_VALID_MASK_BCM7211,
+					       BANK1_HWIRQ_BCM7211,
+					       BANK2_HWIRQ_BCM7211)) != ~0)
 		generic_handle_irq(irq_linear_revmap(intc.domain, hwirq));
 }
 
@@ -246,3 +302,5 @@ IRQCHIP_DECLARE(bcm2835_armctrl_ic, "brcm,bcm2835-armctrl-ic",
 		bcm2835_armctrl_of_init);
 IRQCHIP_DECLARE(bcm2836_armctrl_ic, "brcm,bcm2836-armctrl-ic",
 		bcm2836_armctrl_of_init);
+IRQCHIP_DECLARE(bcm7211_armctrl_ic, "brcm,bcm7211-armctrl-ic",
+		bcm7211_armctrl_of_init);
-- 
2.17.1
