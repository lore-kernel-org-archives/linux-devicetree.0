From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] of: return -ENOSYS instead of -EINVAL in stub implementations
Date: Wed, 28 May 2014 19:20:04 +0100
Message-ID: <1401301204-12834-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sudeep.holla-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Currently the stub implementation(when !CONFIG_OF) of few of_* helpers
return -EINVAL. This makes it difficult to distinguish between the
function not being implemented and the function returning error due to
invalid parameters.

This patch replaces -EINVAL with -ENOSYS in the stub implementations
of those of_* helpers.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 include/linux/of_address.h | 2 +-
 include/linux/of_iommu.h   | 2 +-
 include/linux/of_irq.h     | 2 +-
 include/linux/of_pci.h     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

Hi,

This was identified on one of the patch review on LKML[1].
Looking into the of_* helpers revealed few such instances.

Regards,
Sudeep

[1] https://lkml.org/lkml/2014/5/21/152

diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 5f6ed6b..d442cda 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -100,7 +100,7 @@ void __iomem *of_iomap(struct device_node *node, int index);
 static inline int of_address_to_resource(struct device_node *dev, int index,
 					 struct resource *r)
 {
-	return -EINVAL;
+	return -ENOSYS;
 }
 
 static inline void __iomem *of_iomap(struct device_node *device, int index)
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 51a560f..a5f257e 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -13,7 +13,7 @@ static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
 			    int index, unsigned long *busno, dma_addr_t *addr,
 			    size_t *size)
 {
-	return -EINVAL;
+	return -ENOSYS;
 }
 
 #endif	/* CONFIG_OF_IOMMU */
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 6404253..0c5945c 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -27,7 +27,7 @@ extern int of_irq_parse_oldworld(struct device_node *device, int index,
 static inline int of_irq_parse_oldworld(struct device_node *device, int index,
 				      struct of_phandle_args *out_irq)
 {
-	return -EINVAL;
+	return -ENOSYS;
 }
 #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
 
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 1a1f5ff..15b8307 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -20,7 +20,7 @@ int of_pci_msi_chip_add(struct msi_chip *chip);
 void of_pci_msi_chip_remove(struct msi_chip *chip);
 struct msi_chip *of_pci_find_msi_chip_by_node(struct device_node *of_node);
 #else
-static inline int of_pci_msi_chip_add(struct msi_chip *chip) { return -EINVAL; }
+static inline int of_pci_msi_chip_add(struct msi_chip *chip) { return -ENOSYS; }
 static inline void of_pci_msi_chip_remove(struct msi_chip *chip) { }
 static inline struct msi_chip *
 of_pci_find_msi_chip_by_node(struct device_node *of_node) { return NULL; }
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
