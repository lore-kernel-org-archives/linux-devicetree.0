From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 03/11] genirq: introduce irq_chip_mask_ack_parent()
Date: Thu,  7 Feb 2019 21:16:23 -0500
Message-ID: <20190208021631.30252-4-masneyb@onstation.org>
References: <20190208021631.30252-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208021631.30252-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

The hierarchical irqchip never before ran into a situation
where the parent is not "simple", i.e. does not implement
.irq_ack() and .irq_mask() like most, but the qcom-pm8xxx.c
happens to implement only .irq_mask_ack().

Since we want to make ssbi-gpio a hierarchical child of this
irqchip, it must *also* only implement .irq_mask_ack()
and call down to the parent, and for this we of course
need irq_chip_mask_ack_parent().

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is a new patch introduced in v2.

 include/linux/irq.h |  1 +
 kernel/irq/chip.c   | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index def2b2aac8b1..9a1a67d2e07d 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -605,6 +605,7 @@ extern void irq_chip_disable_parent(struct irq_data *data);
 extern void irq_chip_ack_parent(struct irq_data *data);
 extern int irq_chip_retrigger_hierarchy(struct irq_data *data);
 extern void irq_chip_mask_parent(struct irq_data *data);
+extern void irq_chip_mask_ack_parent(struct irq_data *data);
 extern void irq_chip_unmask_parent(struct irq_data *data);
 extern void irq_chip_eoi_parent(struct irq_data *data);
 extern int irq_chip_set_affinity_parent(struct irq_data *data,
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 086d5a34b5a0..0aefc2e69cf5 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1277,6 +1277,17 @@ void irq_chip_mask_parent(struct irq_data *data)
 }
 EXPORT_SYMBOL_GPL(irq_chip_mask_parent);
 
+/**
+ * irq_chip_mask_ack_parent - Mask and acknowledge the parent interrupt
+ * @data:	Pointer to interrupt specific data
+ */
+void irq_chip_mask_ack_parent(struct irq_data *data)
+{
+	data = data->parent_data;
+	data->chip->irq_mask_ack(data);
+}
+EXPORT_SYMBOL_GPL(irq_chip_mask_ack_parent);
+
 /**
  * irq_chip_unmask_parent - Unmask the parent interrupt
  * @data:	Pointer to interrupt specific data
-- 
2.17.2
