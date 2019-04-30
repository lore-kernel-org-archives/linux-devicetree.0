From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 06/14] genirq: Introduce irq_chip_{request,release}_resource_parent() apis
Date: Tue, 30 Apr 2019 15:42:22 +0530
Message-ID: <20190430101230.21794-7-lokeshvutla@ti.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430101230.21794-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Introduce irq_chip_{request,release}_resource_parent() apis so
that these can be used in hierarchical irqchips.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes since v7:
-None

 include/linux/irq.h |  2 ++
 kernel/irq/chip.c   | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 7ae8de5ad0f2..fb301cf29148 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -625,6 +625,8 @@ extern int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on);
 extern int irq_chip_set_vcpu_affinity_parent(struct irq_data *data,
 					     void *vcpu_info);
 extern int irq_chip_set_type_parent(struct irq_data *data, unsigned int type);
+extern int irq_chip_request_resources_parent(struct irq_data *data);
+extern void irq_chip_release_resources_parent(struct irq_data *data);
 #endif
 
 /* Handling of unhandled and spurious interrupts: */
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 51128bea3846..29d6c7d070b4 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1459,6 +1459,33 @@ int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on)
 	return -ENOSYS;
 }
 EXPORT_SYMBOL_GPL(irq_chip_set_wake_parent);
+
+/**
+ * irq_chip_request_resources_parent - Request resources on the parent interrupt
+ * @data:	Pointer to interrupt specific data
+ */
+int irq_chip_request_resources_parent(struct irq_data *data)
+{
+	data = data->parent_data;
+
+	if (data->chip->irq_request_resources)
+		return data->chip->irq_request_resources(data);
+
+	return -ENOSYS;
+}
+EXPORT_SYMBOL_GPL(irq_chip_request_resources_parent);
+
+/**
+ * irq_chip_release_resources_parent - Release resources on the parent interrupt
+ * @data:	Pointer to interrupt specific data
+ */
+void irq_chip_release_resources_parent(struct irq_data *data)
+{
+	data = data->parent_data;
+	if (data->chip->irq_release_resources)
+		data->chip->irq_release_resources(data);
+}
+EXPORT_SYMBOL_GPL(irq_chip_release_resources_parent);
 #endif
 
 /**
-- 
2.21.0
