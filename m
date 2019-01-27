From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH v2 2/4] Irqchip: Ingenic: Unify the function name prefix to "ingenic_intc_".
Date: Sun, 27 Jan 2019 23:50:30 +0800
Message-ID: <1548604232-19159-3-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-2-git-send-email-zhouyanjie@zoho.com>
 <1548604232-19159-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548604232-19159-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

For the sake of uniform style, function "intc_irq_set_mask" is
changed to "ingenic_intc_intc_irq_set_mask".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 5f775a1..32d090a 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -63,7 +63,8 @@ static void ingenic_chained_handle_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
+static void ingenic_intc_irq_set_mask(struct irq_chip_generic *gc,
+						uint32_t mask)
 {
 	struct irq_chip_regs *regs = &gc->chip_types->regs;
 
@@ -74,13 +75,13 @@ static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
 void ingenic_intc_irq_suspend(struct irq_data *data)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
-	intc_irq_set_mask(gc, gc->wake_active);
+	ingenic_intc_irq_set_mask(gc, gc->wake_active);
 }
 
 void ingenic_intc_irq_resume(struct irq_data *data)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
-	intc_irq_set_mask(gc, gc->mask_cache);
+	ingenic_intc_irq_set_mask(gc, gc->mask_cache);
 }
 
 static int __init ingenic_intc_of_init(struct device_node *node,
-- 
2.7.4
