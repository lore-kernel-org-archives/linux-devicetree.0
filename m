From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 5/5] of/irq: merge of_irq_map_one()
Date: Fri, 04 Jun 2010 15:21:55 -0600
Message-ID: <20100604212155.10552.19260.stgit@angua>
References: <20100604212134.10552.70717.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100604212134.10552.70717.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Merge common implementation of of_irq_map_one().  Rename it to
__of_irq_map_one() so that arch code can either use the stock
implementation, or override it to handle platform quirks.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
CC: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
CC: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
CC: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
CC: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
CC: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 arch/microblaze/include/asm/prom.h  |    3 -
 arch/microblaze/kernel/prom_parse.c |   73 ------------------------------
 arch/powerpc/include/asm/prom.h     |    3 -
 arch/powerpc/kernel/prom_parse.c    |   55 -----------------------
 drivers/of/irq.c                    |   85 +++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h              |    6 ++
 6 files changed, 91 insertions(+), 134 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index 89fca70..3659930 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -107,9 +107,6 @@ extern const void *of_get_mac_address(struct device_node *np);
 struct pci_dev;
 extern int of_irq_map_pci(struct pci_dev *pdev, struct of_irq *out_irq);
 
-extern int of_irq_to_resource(struct device_node *dev, int index,
-			struct resource *r);
-
 /**
  * of_iomap - Maps the memory mapped IO for a given device_node
  * @device:	the device whose io range will be mapped
diff --git a/arch/microblaze/kernel/prom_parse.c b/arch/microblaze/kernel/prom_parse.c
index 02ec946..70c0471 100644
--- a/arch/microblaze/kernel/prom_parse.c
+++ b/arch/microblaze/kernel/prom_parse.c
@@ -656,49 +656,7 @@ struct device_node *of_irq_find_parent_by_phandle(phandle p)
 int of_irq_map_one(struct device_node *device,
 			int index, struct of_irq *out_irq)
 {
-	struct device_node *p;
-	const u32 *intspec, *tmp, *addr;
-	u32 intsize, intlen;
-	int res;
-
-	pr_debug("of_irq_map_one: dev=%s, index=%d\n",
-			device->full_name, index);
-
-	/* Get the interrupts property */
-	intspec = of_get_property(device, "interrupts", (int *) &intlen);
-	if (intspec == NULL)
-		return -EINVAL;
-	intlen /= sizeof(u32);
-
-	pr_debug(" intspec=%d intlen=%d\n", *intspec, intlen);
-
-	/* Get the reg property (if any) */
-	addr = of_get_property(device, "reg", NULL);
-
-	/* Look for the interrupt parent. */
-	p = of_irq_find_parent(device);
-	if (p == NULL)
-		return -EINVAL;
-
-	/* Get size of interrupt specifier */
-	tmp = of_get_property(p, "#interrupt-cells", NULL);
-	if (tmp == NULL) {
-		of_node_put(p);
-		return -EINVAL;
-	}
-	intsize = *tmp;
-
-	pr_debug(" intsize=%d intlen=%d\n", intsize, intlen);
-
-	/* Check index */
-	if ((index + 1) * intsize > intlen)
-		return -EINVAL;
-
-	/* Get new specifier and map it */
-	res = of_irq_map_raw(p, intspec + index * intsize, intsize,
-				addr, out_irq);
-	of_node_put(p);
-	return res;
+	return __of_irq_map_one(device, index, out_irq);
 }
 EXPORT_SYMBOL_GPL(of_irq_map_one);
 
@@ -740,35 +698,6 @@ const void *of_get_mac_address(struct device_node *np)
 }
 EXPORT_SYMBOL(of_get_mac_address);
 
-int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
-{
-	struct of_irq out_irq;
-	int irq;
-	int res;
-
-	res = of_irq_map_one(dev, index, &out_irq);
-
-	/* Get irq for the device */
-	if (res) {
-		pr_debug("IRQ not found... code = %d", res);
-		return NO_IRQ;
-	}
-	/* Assuming single interrupt controller... */
-	irq = out_irq.specifier[0];
-
-	pr_debug("IRQ found = %d", irq);
-
-	/* Only dereference the resource if both the
-	 * resource and the irq are valid. */
-	if (r && irq != NO_IRQ) {
-		r->start = r->end = irq;
-		r->flags = IORESOURCE_IRQ;
-	}
-
-	return irq;
-}
-EXPORT_SYMBOL_GPL(of_irq_to_resource);
-
 void __iomem *of_iomap(struct device_node *np, int index)
 {
 	struct resource res;
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 187ef4e..2440984 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -136,9 +136,6 @@ extern void of_irq_map_init(unsigned int flags);
 struct pci_dev;
 extern int of_irq_map_pci(struct pci_dev *pdev, struct of_irq *out_irq);
 
-extern int of_irq_to_resource(struct device_node *dev, int index,
-			struct resource *r);
-
 /**
  * of_iomap - Maps the memory mapped IO for a given device_node
  * @device:	the device whose io range will be mapped
diff --git a/arch/powerpc/kernel/prom_parse.c b/arch/powerpc/kernel/prom_parse.c
index 89ca7b3..ef518e3 100644
--- a/arch/powerpc/kernel/prom_parse.c
+++ b/arch/powerpc/kernel/prom_parse.c
@@ -777,49 +777,11 @@ static int of_irq_map_oldworld(struct device_node *device, int index,
 
 int of_irq_map_one(struct device_node *device, int index, struct of_irq *out_irq)
 {
-	struct device_node *p;
-	const u32 *intspec, *tmp, *addr;
-	u32 intsize, intlen;
-	int res = -EINVAL;
-
-	DBG("of_irq_map_one: dev=%s, index=%d\n", device->full_name, index);
-
 	/* OldWorld mac stuff is "special", handle out of line */
 	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
 		return of_irq_map_oldworld(device, index, out_irq);
 
-	/* Get the interrupts property */
-	intspec = of_get_property(device, "interrupts", &intlen);
-	if (intspec == NULL)
-		return -EINVAL;
-	intlen /= sizeof(u32);
-
-	/* Get the reg property (if any) */
-	addr = of_get_property(device, "reg", NULL);
-
-	/* Look for the interrupt parent. */
-	p = of_irq_find_parent(device);
-	if (p == NULL)
-		return -EINVAL;
-
-	/* Get size of interrupt specifier */
-	tmp = of_get_property(p, "#interrupt-cells", NULL);
-	if (tmp == NULL)
-		goto out;
-	intsize = *tmp;
-
-	DBG(" intsize=%d intlen=%d\n", intsize, intlen);
-
-	/* Check index */
-	if ((index + 1) * intsize > intlen)
-		goto out;
-
-	/* Get new specifier and map it */
-	res = of_irq_map_raw(p, intspec + index * intsize, intsize,
-			     addr, out_irq);
-out:
-	of_node_put(p);
-	return res;
+	return __of_irq_map_one(device, index, out_irq);
 }
 EXPORT_SYMBOL_GPL(of_irq_map_one);
 
@@ -861,21 +823,6 @@ const void *of_get_mac_address(struct device_node *np)
 }
 EXPORT_SYMBOL(of_get_mac_address);
 
-int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
-{
-	int irq = irq_of_parse_and_map(dev, index);
-
-	/* Only dereference the resource if both the
-	 * resource and the irq are valid. */
-	if (r && irq != NO_IRQ) {
-		r->start = r->end = irq;
-		r->flags = IORESOURCE_IRQ;
-	}
-
-	return irq;
-}
-EXPORT_SYMBOL_GPL(of_irq_to_resource);
-
 void __iomem *of_iomap(struct device_node *np, int index)
 {
 	struct resource res;
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 351c87a..dd420e5 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -31,7 +31,7 @@
  * Returns a pointer to the interrupt parent node, or NULL if the interrupt
  * parent could not be determined.
  */
-struct device_node *of_irq_find_parent(struct device_node *child)
+static struct device_node *of_irq_find_parent(struct device_node *child)
 {
 	struct device_node *p;
 	const phandle *parp;
@@ -240,6 +240,67 @@ int of_irq_map_raw(struct device_node *parent, const u32 *intspec, u32 ointsize,
 }
 EXPORT_SYMBOL_GPL(of_irq_map_raw);
 
+/**
+ * of_irq_map_one - Resolve an interrupt for a device
+ * @device: the device whose interrupt is to be resolved
+ * @index: index of the interrupt to resolve
+ * @out_irq: structure of_irq filled by this function
+ *
+ * This function resolves an interrupt, walking the tree, for a given
+ * device-tree node. It's the high level pendant to of_irq_map_raw().
+ *
+ * Architecture code must provide of_irq_map_one() which can simply be a
+ * wrapper around __of_irq_map_one(), or can override it to deal with
+ * arch specific quirks and bugs.
+ */
+int __of_irq_map_one(struct device_node *device, int index,
+		     struct of_irq *out_irq)
+{
+	struct device_node *p;
+	const u32 *intspec, *tmp, *addr;
+	u32 intsize, intlen;
+	int res = -EINVAL;
+
+	pr_debug("of_irq_map_one: dev=%s, index=%d\n",
+		 device->full_name, index);
+
+	/* Get the interrupts property */
+	intspec = of_get_property(device, "interrupts", &intlen);
+	if (intspec == NULL)
+		return -EINVAL;
+	intlen /= sizeof(u32);
+
+	pr_debug(" intspec=%d intlen=%d\n", *intspec, intlen);
+
+	/* Get the reg property (if any) */
+	addr = of_get_property(device, "reg", NULL);
+
+	/* Look for the interrupt parent. */
+	p = of_irq_find_parent(device);
+	if (p == NULL)
+		return -EINVAL;
+
+	/* Get size of interrupt specifier */
+	tmp = of_get_property(p, "#interrupt-cells", NULL);
+	if (tmp == NULL)
+		goto out;
+	intsize = *tmp;
+
+	pr_debug(" intsize=%d intlen=%d\n", intsize, intlen);
+
+	/* Check index */
+	if ((index + 1) * intsize > intlen)
+		goto out;
+
+	/* Get new specifier and map it */
+	res = of_irq_map_raw(p, intspec + index * intsize, intsize,
+			     addr, out_irq);
+ out:
+	of_node_put(p);
+	return res;
+}
+EXPORT_SYMBOL_GPL(__of_irq_map_one);
+
 unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 {
 	struct of_irq oirq;
@@ -251,3 +312,25 @@ unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 				     oirq.size);
 }
 EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
+
+/**
+ * of_irq_to_resource - Decode a node's IRQ and return it as a resource
+ * @dev: pointer to device tree node
+ * @index: zero-based index of the irq
+ * @r: pointer to resource structure to return result into.
+ */
+unsigned int of_irq_to_resource(struct device_node *dev, int index,
+				struct resource *r)
+{
+	unsigned int irq = irq_of_parse_and_map(dev, index);
+
+	/* Only dereference the resource if both the
+	 * resource and the irq are valid. */
+	if (r && irq != NO_IRQ) {
+		r->start = r->end = irq;
+		r->flags = IORESOURCE_IRQ;
+	}
+
+	return irq;
+}
+EXPORT_SYMBOL_GPL(of_irq_to_resource);
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 51c520b..935a14d 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -5,6 +5,7 @@
 struct of_irq;
 #include <linux/types.h>
 #include <linux/of.h>
+#include <linux/ioport.h>
 
 /*
  * irq_of_parse_and_map() is used ba all OF enabled platforms; but SPARC
@@ -31,14 +32,17 @@ struct of_irq {
 };
 
 extern struct device_node *of_irq_find_parent_by_phandle(phandle p);
-extern struct device_node *of_irq_find_parent(struct device_node *child);
 extern int of_irq_map_raw(struct device_node *parent, const u32 *intspec,
 			 u32 ointsize, const u32 *addr, struct of_irq *out_irq);
+extern int __of_irq_map_one(struct device_node *device, int index,
+			    struct of_irq *out_irq);
 extern int of_irq_map_one(struct device_node *device, int index,
 			  struct of_irq *out_irq);
 extern unsigned int irq_create_of_mapping(struct device_node *controller,
 					  const u32 *intspec,
 					  unsigned int intsize);
+extern unsigned int of_irq_to_resource(struct device_node *dev, int index,
+				       struct resource *r);
 
 #endif /* CONFIG_OF_IRQ */
 #endif /* CONFIG_OF */
