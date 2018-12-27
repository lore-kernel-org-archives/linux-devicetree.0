From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [RFC PATCH v4 09/13] genirq/msi: Add support for .msi_unprepare callback
Date: Thu, 27 Dec 2018 11:43:09 +0530
Message-ID: <20181227061313.5451-9-lokeshvutla@ti.com>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
 <20181227061313.5451-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181227061313.5451-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: devicetree@vger.kernel.org

Add an optional callback .msi_unprepare to struct msi_domain_ops.
This is used to clear any effect that is done by .msi_prepare callback.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 include/linux/msi.h |  3 +++
 kernel/irq/msi.c    | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 474490826f8c..f35dd19f6c69 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -239,6 +239,8 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
+	void		(*msi_unprepare)(struct irq_domain *domain, int nvec,
+					 void *data);
 	void		(*msi_finish)(msi_alloc_info_t *arg, int retval);
 	void		(*set_desc)(msi_alloc_info_t *arg,
 				    struct msi_desc *desc);
@@ -319,6 +321,7 @@ void platform_msi_domain_free_irqs(struct device *dev);
 /* When an MSI domain is used as an intermediate domain */
 int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
 			    int nvec, msi_alloc_info_t *args);
+void msi_domain_unprepare_irqs(struct irq_domain *domain, int nvec, void *data);
 int msi_domain_populate_irqs(struct irq_domain *domain, struct device *dev,
 			     int virq, int nvec, msi_alloc_info_t *args);
 struct irq_domain *
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index eb7459324113..1a1738690519 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -312,6 +312,16 @@ int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
 	return ret;
 }
 
+void msi_domain_unprepare_irqs(struct irq_domain *domain, int nvec,
+			       void *data)
+{
+	struct msi_domain_info *info = domain->host_data;
+	struct msi_domain_ops *ops = info->ops;
+
+	if (ops->msi_unprepare)
+		ops->msi_unprepare(domain, nvec, data);
+}
+
 int msi_domain_populate_irqs(struct irq_domain *domain, struct device *dev,
 			     int virq, int nvec, msi_alloc_info_t *arg)
 {
-- 
2.19.2
