From: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 2/6] PCI: OF: Add generic function to parse and allocate PCI resources
Date: Wed, 10 Jan 2018 23:47:31 +0100
Message-ID: <0f07493122a00ae5f118604c5046d844e77cc11c.1515621150.git.cyrille.pitchen@free-electrons.com>
References: <cover.1515621150.git.cyrille.pitchen@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1515621150.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.1515621150.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.1515621150.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch moves the gen_pci_parse_request_of_pci_ranges() function from
drivers/pci/host/pci-host-common.c into drivers/pci/of.c to easily share
common source code between PCI host drivers.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/pci/host/pci-host-common.c | 49 ++----------------------------------
 drivers/pci/of.c                   | 51 ++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h                |  9 +++++++
 3 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/drivers/pci/host/pci-host-common.c b/drivers/pci/host/pci-host-common.c
index c4b891c84703..a613ea310e76 100644
--- a/drivers/pci/host/pci-host-common.c
+++ b/drivers/pci/host/pci-host-common.c
@@ -24,50 +24,6 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
-static int gen_pci_parse_request_of_pci_ranges(struct device *dev,
-		       struct list_head *resources, struct resource **bus_range)
-{
-	int err, res_valid = 0;
-	struct device_node *np = dev->of_node;
-	resource_size_t iobase;
-	struct resource_entry *win, *tmp;
-
-	err = of_pci_get_host_bridge_resources(np, 0, 0xff, resources, &iobase);
-	if (err)
-		return err;
-
-	err = devm_request_pci_bus_resources(dev, resources);
-	if (err)
-		return err;
-
-	resource_list_for_each_entry_safe(win, tmp, resources) {
-		struct resource *res = win->res;
-
-		switch (resource_type(res)) {
-		case IORESOURCE_IO:
-			err = pci_remap_iospace(res, iobase);
-			if (err) {
-				dev_warn(dev, "error %d: failed to map resource %pR\n",
-					 err, res);
-				resource_list_destroy_entry(win);
-			}
-			break;
-		case IORESOURCE_MEM:
-			res_valid |= !(res->flags & IORESOURCE_PREFETCH);
-			break;
-		case IORESOURCE_BUS:
-			*bus_range = res;
-			break;
-		}
-	}
-
-	if (res_valid)
-		return 0;
-
-	dev_err(dev, "non-prefetchable memory resource required\n");
-	return -EINVAL;
-}
-
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
@@ -82,9 +38,9 @@ static struct pci_config_window *gen_pci_init(struct device *dev,
 	struct pci_config_window *cfg;
 
 	/* Parse our PCI ranges and request their resources */
-	err = gen_pci_parse_request_of_pci_ranges(dev, resources, &bus_range);
+	err = pci_parse_request_of_pci_ranges(dev, resources, &bus_range);
 	if (err)
-		goto err_out;
+		return ERR_PTR(err);
 
 	err = of_address_to_resource(dev->of_node, 0, &cfgres);
 	if (err) {
@@ -135,7 +91,6 @@ int pci_host_common_probe(struct platform_device *pdev,
 	of_pci_check_probe_only();
 
 	/* Parse and map our Configuration Space windows */
-	INIT_LIST_HEAD(&resources);
 	cfg = gen_pci_init(dev, &resources, ops);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index e112da11630e..54e210501b73 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -88,3 +88,54 @@ struct irq_domain *pci_host_bridge_of_msi_domain(struct pci_bus *bus)
 	return NULL;
 #endif
 }
+
+int pci_parse_request_of_pci_ranges(struct device *dev,
+				    struct list_head *resources,
+				    struct resource **bus_range)
+{
+	int err, res_valid = 0;
+	struct device_node *np = dev->of_node;
+	resource_size_t iobase;
+	struct resource_entry *win, *tmp;
+
+	INIT_LIST_HEAD(resources);
+	err = of_pci_get_host_bridge_resources(np, 0, 0xff, resources, &iobase);
+	if (err)
+		return err;
+
+	err = devm_request_pci_bus_resources(dev, resources);
+	if (err)
+		goto out_release_res;
+
+	resource_list_for_each_entry_safe(win, tmp, resources) {
+		struct resource *res = win->res;
+
+		switch (resource_type(res)) {
+		case IORESOURCE_IO:
+			err = pci_remap_iospace(res, iobase);
+			if (err) {
+				dev_warn(dev, "error %d: failed to map resource %pR\n",
+					 err, res);
+				resource_list_destroy_entry(win);
+			}
+			break;
+		case IORESOURCE_MEM:
+			res_valid |= !(res->flags & IORESOURCE_PREFETCH);
+			break;
+		case IORESOURCE_BUS:
+			if (bus_range)
+				*bus_range = res;
+			break;
+		}
+	}
+
+	if (res_valid)
+		return 0;
+
+	dev_err(dev, "non-prefetchable memory resource required\n");
+	err = -EINVAL;
+
+ out_release_res:
+	pci_free_resource_list(resources);
+	return err;
+}
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 978aad7841e5..a1b0672fd38a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2163,6 +2163,9 @@ void pci_release_of_node(struct pci_dev *dev);
 void pci_set_bus_of_node(struct pci_bus *bus);
 void pci_release_bus_of_node(struct pci_bus *bus);
 struct irq_domain *pci_host_bridge_of_msi_domain(struct pci_bus *bus);
+int pci_parse_request_of_pci_ranges(struct device *dev,
+				    struct list_head *resources,
+				    struct resource **bus_range);
 
 /* Arch may override this (weak) */
 struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus);
@@ -2187,6 +2190,12 @@ static inline struct device_node *
 pci_device_to_OF_node(const struct pci_dev *pdev) { return NULL; }
 static inline struct irq_domain *
 pci_host_bridge_of_msi_domain(struct pci_bus *bus) { return NULL; }
+static inline int pci_parse_request_of_pci_ranges(struct device *dev,
+						  struct list_head *resources,
+						  struct resource **bus_range)
+{
+	return -EINVAL;
+}
 #endif	/* CONFIG_OF */
 
 #ifdef CONFIG_ACPI
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
