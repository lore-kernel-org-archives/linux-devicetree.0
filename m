From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] of: pci: remove unused MSI controller helpers
Date: Thu,  1 Sep 2016 17:38:04 +0200
Message-ID: <1472744284-18305-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472744284-18305-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472744284-18305-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All the users of the small MSI controller API have been migrated to use
the generic MSI infrastructure instead. We no longer need a global
chained list of msi_controller. Instead, MSI controllers are now
represented as irq domains attached to OF nodes, and the resolution
between a device requesting an MSI and the corresponding MSI controller
is done by the generic interrupt resolution logic.

Therefore, this API is now completely useless, and can be removed from
the kernel.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/of/of_pci.c    | 45 ---------------------------------------------
 include/linux/of_pci.h | 11 -----------
 2 files changed, 56 deletions(-)

diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
index 589b30c..ea15616 100644
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@ -263,48 +263,3 @@ parse_failed:
 }
 EXPORT_SYMBOL_GPL(of_pci_get_host_bridge_resources);
 #endif /* CONFIG_OF_ADDRESS */
-
-#ifdef CONFIG_PCI_MSI
-
-static LIST_HEAD(of_pci_msi_chip_list);
-static DEFINE_MUTEX(of_pci_msi_chip_mutex);
-
-int of_pci_msi_chip_add(struct msi_controller *chip)
-{
-	if (!of_property_read_bool(chip->of_node, "msi-controller"))
-		return -EINVAL;
-
-	mutex_lock(&of_pci_msi_chip_mutex);
-	list_add(&chip->list, &of_pci_msi_chip_list);
-	mutex_unlock(&of_pci_msi_chip_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(of_pci_msi_chip_add);
-
-void of_pci_msi_chip_remove(struct msi_controller *chip)
-{
-	mutex_lock(&of_pci_msi_chip_mutex);
-	list_del(&chip->list);
-	mutex_unlock(&of_pci_msi_chip_mutex);
-}
-EXPORT_SYMBOL_GPL(of_pci_msi_chip_remove);
-
-struct msi_controller *of_pci_find_msi_chip_by_node(struct device_node *of_node)
-{
-	struct msi_controller *c;
-
-	mutex_lock(&of_pci_msi_chip_mutex);
-	list_for_each_entry(c, &of_pci_msi_chip_list, list) {
-		if (c->of_node == of_node) {
-			mutex_unlock(&of_pci_msi_chip_mutex);
-			return c;
-		}
-	}
-	mutex_unlock(&of_pci_msi_chip_mutex);
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(of_pci_find_msi_chip_by_node);
-
-#endif /* CONFIG_PCI_MSI */
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index b969e94..569c3f6 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -68,15 +68,4 @@ static inline int of_pci_get_host_bridge_resources(struct device_node *dev,
 }
 #endif
 
-#if defined(CONFIG_OF) && defined(CONFIG_PCI_MSI)
-int of_pci_msi_chip_add(struct msi_controller *chip);
-void of_pci_msi_chip_remove(struct msi_controller *chip);
-struct msi_controller *of_pci_find_msi_chip_by_node(struct device_node *of_node);
-#else
-static inline int of_pci_msi_chip_add(struct msi_controller *chip) { return -EINVAL; }
-static inline void of_pci_msi_chip_remove(struct msi_controller *chip) { }
-static inline struct msi_controller *
-of_pci_find_msi_chip_by_node(struct device_node *of_node) { return NULL; }
-#endif
-
 #endif
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
