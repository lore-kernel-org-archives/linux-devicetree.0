From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 2/9] genirq: introduce irq_domain_translate_twocell
Date: Fri, 25 Jan 2019 11:22:55 -0500
Message-ID: <20190125162302.14036-3-masneyb@onstation.org>
References: <20190125162302.14036-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new function irq_domain_translate_twocell() that is to be used as
the translate function in struct irq_domain_ops for v2 IRQ interfaces.
This is based on irq_domain_xlate_twocell().

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 include/linux/irqdomain.h |  5 +++++
 kernel/irq/irqdomain.c    | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 35965f41d7be..fcefe0c7263f 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -419,6 +419,11 @@ int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
 
+int irq_domain_translate_twocell(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type);
+
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
 int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 8b0be4bd6565..15c2a291aa3c 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -968,6 +968,27 @@ const struct irq_domain_ops irq_domain_simple_ops = {
 };
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
 
+/**
+ * irq_domain_translate_twocell() - Generic translate for direct two cell
+ * bindings
+ *
+ * Device Tree IRQ specifier translation function which works with two cell
+ * bindings where the cell values map directly to the hwirq number
+ * and linux irq flags.
+ */
+int irq_domain_translate_twocell(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type)
+{
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+	*out_hwirq = fwspec->param[0];
+	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
+
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)
 {
-- 
2.17.2
