From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 3/4] PCI/MSI:  Add helper function pci_msi_domain_get_msi_rid().
Date: Thu,  1 Oct 2015 17:50:24 -0700
Message-ID: <1443747025-9918-4-git-send-email-ddaney.cavm@gmail.com>
References: <1443747025-9918-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443747025-9918-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Add pci_msi_domain_get_msi_rid() to return the MSI requester id (RID).
Initially needed by gic-v3 based systems. It will be used by follow on
patch to drivers/irqchip/irq-gic-v3-its-pci-msi.c

Initially supports mapping the RID via OF device tree.  In the future,
this could be extended to use ACPI _IORT tables as well.

Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/msi.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/msi.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index d449714..81a2798 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -20,6 +20,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/irqdomain.h>
+#include <linux/of_irq.h>
 
 #include "pci.h"
 
@@ -1327,4 +1328,33 @@ struct irq_domain *pci_msi_create_default_irq_domain(struct device_node *node,
 
 	return domain;
 }
+
+static int get_msi_id_cb(struct pci_dev *pdev, u16 alias, void *data)
+{
+	u32 *pa = data;
+
+	*pa = alias;
+	return 0;
+}
+/**
+ * pci_msi_domain_get_msi_rid - Get the MSI requester id (RID)
+ * @domain:	The interrupt domain
+ * @pdev:	The PCI device.
+ *
+ * The RID for a device is formed from the alias, with a firmware
+ * supplied mapping applied
+ *
+ * Returns: The RID.
+ */
+u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
+{
+	u32 rid = 0;
+
+	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
+
+	if (domain->of_node)
+		rid = of_msi_map_rid(&pdev->dev, domain->of_node, rid);
+
+	return rid;
+}
 #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
diff --git a/include/linux/msi.h b/include/linux/msi.h
index ad939d0..56e3b76 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -293,6 +293,7 @@ irq_hw_number_t pci_msi_domain_calc_hwirq(struct pci_dev *dev,
 					  struct msi_desc *desc);
 int pci_msi_domain_check_cap(struct irq_domain *domain,
 			     struct msi_domain_info *info, struct device *dev);
+u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
 #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
 
 #endif /* LINUX_MSI_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
