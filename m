From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: use pr_fmt prefix for all console printing
Date: Thu,  2 Jun 2016 10:14:59 -0500
Message-ID: <1464880499-29864-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

Clean-up all the DT printk functions to use common pr_fmt prefix.

Some print statements such as kmalloc errors were redundant, so just
drop those.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c         | 49 ++++++++++++++++++++++----------------------
 drivers/of/base.c            | 11 ++++++----
 drivers/of/dynamic.c         | 47 +++++++++++++++++++++---------------------
 drivers/of/fdt.c             | 12 +++++------
 drivers/of/fdt_address.c     | 35 ++++++++++++++++---------------
 drivers/of/irq.c             |  2 ++
 drivers/of/of_numa.c         | 22 ++++++--------------
 drivers/of/of_pci.c          |  6 ++++--
 drivers/of/of_reserved_mem.c | 22 ++++++++++----------
 drivers/of/overlay.c         | 43 +++++++++++++++-----------------------
 drivers/of/platform.c        | 16 +++++++--------
 drivers/of/resolver.c        |  2 ++
 12 files changed, 130 insertions(+), 137 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 0a553c0..02b2903 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1,4 +1,6 @@
 
+#define pr_fmt(fmt)	"OF: " fmt
+
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -24,10 +26,10 @@ static int __of_address_to_resource(struct device_node *dev,
 #ifdef DEBUG
 static void of_dump_addr(const char *s, const __be32 *addr, int na)
 {
-	printk(KERN_DEBUG "%s", s);
+	pr_debug("%s", s);
 	while (na--)
-		printk(" %08x", be32_to_cpu(*(addr++)));
-	printk("\n");
+		pr_cont(" %08x", be32_to_cpu(*(addr++)));
+	pr_cont("\n");
 }
 #else
 static void of_dump_addr(const char *s, const __be32 *addr, int na) { }
@@ -68,7 +70,7 @@ static u64 of_bus_default_map(__be32 *addr, const __be32 *range,
 	s  = of_read_number(range + na + pna, ns);
 	da = of_read_number(addr, na);
 
-	pr_debug("OF: default map, cp=%llx, s=%llx, da=%llx\n",
+	pr_debug("default map, cp=%llx, s=%llx, da=%llx\n",
 		 (unsigned long long)cp, (unsigned long long)s,
 		 (unsigned long long)da);
 
@@ -156,7 +158,7 @@ static u64 of_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
 	s  = of_read_number(range + na + pna, ns);
 	da = of_read_number(addr + 1, na - 1);
 
-	pr_debug("OF: PCI map, cp=%llx, s=%llx, da=%llx\n",
+	pr_debug("PCI map, cp=%llx, s=%llx, da=%llx\n",
 		 (unsigned long long)cp, (unsigned long long)s,
 		 (unsigned long long)da);
 
@@ -381,7 +383,7 @@ static u64 of_bus_isa_map(__be32 *addr, const __be32 *range, int na, int ns,
 	s  = of_read_number(range + na + pna, ns);
 	da = of_read_number(addr + 1, na - 1);
 
-	pr_debug("OF: ISA map, cp=%llx, s=%llx, da=%llx\n",
+	pr_debug("ISA map, cp=%llx, s=%llx, da=%llx\n",
 		 (unsigned long long)cp, (unsigned long long)s,
 		 (unsigned long long)da);
 
@@ -504,17 +506,17 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
 	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
-		pr_debug("OF: no ranges; cannot translate\n");
+		pr_debug("no ranges; cannot translate\n");
 		return 1;
 	}
 	if (ranges == NULL || rlen == 0) {
 		offset = of_read_number(addr, na);
 		memset(addr, 0, pna * 4);
-		pr_debug("OF: empty ranges; 1:1 translation\n");
+		pr_debug("empty ranges; 1:1 translation\n");
 		goto finish;
 	}
 
-	pr_debug("OF: walking ranges...\n");
+	pr_debug("walking ranges...\n");
 
 	/* Now walk through the ranges */
 	rlen /= 4;
@@ -525,14 +527,14 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 			break;
 	}
 	if (offset == OF_BAD_ADDR) {
-		pr_debug("OF: not found !\n");
+		pr_debug("not found !\n");
 		return 1;
 	}
 	memcpy(addr, ranges + na, 4 * pna);
 
  finish:
-	of_dump_addr("OF: parent translation for:", addr, pna);
-	pr_debug("OF: with offset: %llx\n", (unsigned long long)offset);
+	of_dump_addr("parent translation for:", addr, pna);
+	pr_debug("with offset: %llx\n", (unsigned long long)offset);
 
 	/* Translate it into parent bus space */
 	return pbus->translate(addr, offset, pna);
@@ -557,7 +559,7 @@ static u64 __of_translate_address(struct device_node *dev,
 	int na, ns, pna, pns;
 	u64 result = OF_BAD_ADDR;
 
-	pr_debug("OF: ** translation for device %s **\n", of_node_full_name(dev));
+	pr_debug("** translation for device %s **\n", of_node_full_name(dev));
 
 	/* Increase refcount at current level */
 	of_node_get(dev);
@@ -571,14 +573,14 @@ static u64 __of_translate_address(struct device_node *dev,
 	/* Count address cells & copy address locally */
 	bus->count_cells(dev, &na, &ns);
 	if (!OF_CHECK_COUNTS(na, ns)) {
-		pr_debug("OF: Bad cell count for %s\n", of_node_full_name(dev));
+		pr_debug("Bad cell count for %s\n", of_node_full_name(dev));
 		goto bail;
 	}
 	memcpy(addr, in_addr, na * 4);
 
-	pr_debug("OF: bus is %s (na=%d, ns=%d) on %s\n",
+	pr_debug("bus is %s (na=%d, ns=%d) on %s\n",
 	    bus->name, na, ns, of_node_full_name(parent));
-	of_dump_addr("OF: translating address:", addr, na);
+	of_dump_addr("translating address:", addr, na);
 
 	/* Translate */
 	for (;;) {
@@ -589,7 +591,7 @@ static u64 __of_translate_address(struct device_node *dev,
 
 		/* If root, we have finished */
 		if (parent == NULL) {
-			pr_debug("OF: reached root node\n");
+			pr_debug("reached root node\n");
 			result = of_read_number(addr, na);
 			break;
 		}
@@ -598,12 +600,12 @@ static u64 __of_translate_address(struct device_node *dev,
 		pbus = of_match_bus(parent);
 		pbus->count_cells(dev, &pna, &pns);
 		if (!OF_CHECK_COUNTS(pna, pns)) {
-			pr_err("prom_parse: Bad cell count for %s\n",
+			pr_err("Bad cell count for %s\n",
 			       of_node_full_name(dev));
 			break;
 		}
 
-		pr_debug("OF: parent bus is %s (na=%d, ns=%d) on %s\n",
+		pr_debug("parent bus is %s (na=%d, ns=%d) on %s\n",
 		    pbus->name, pna, pns, of_node_full_name(parent));
 
 		/* Apply bus translation */
@@ -615,7 +617,7 @@ static u64 __of_translate_address(struct device_node *dev,
 		ns = pns;
 		bus = pbus;
 
-		of_dump_addr("OF: one level translation:", addr, na);
+		of_dump_addr("one level translation:", addr, na);
 	}
  bail:
 	of_node_put(parent);
@@ -853,8 +855,7 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	}
 
 	if (!ranges) {
-		pr_debug("%s: no dma-ranges found for node(%s)\n",
-			 __func__, np->full_name);
+		pr_debug("no dma-ranges found for node(%s)\n", np->full_name);
 		ret = -ENODEV;
 		goto out;
 	}
@@ -871,8 +872,8 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	dmaaddr = of_read_number(ranges, naddr);
 	*paddr = of_translate_dma_address(np, ranges);
 	if (*paddr == OF_BAD_ADDR) {
-		pr_err("%s: translation of DMA address(%pad) to CPU address failed node(%s)\n",
-		       __func__, dma_addr, np->full_name);
+		pr_err("translation of DMA address(%pad) to CPU address failed node(%s)\n",
+		       dma_addr, np->full_name);
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ebf84e3..85a8f52 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -17,6 +17,9 @@
  *      as published by the Free Software Foundation; either version
  *      2 of the License, or (at your option) any later version.
  */
+
+#define pr_fmt(fmt)	"OF: " fmt
+
 #include <linux/console.h>
 #include <linux/ctype.h>
 #include <linux/cpu.h>
@@ -127,7 +130,7 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
 	}
 
 	if (name != orig_name)
-		pr_warn("device-tree: Duplicate name in %s, renamed to \"%s\"\n",
+		pr_warn("Duplicate name in %s, renamed to \"%s\"\n",
 			kobject_name(kobj), name);
 	return name;
 }
@@ -198,7 +201,7 @@ void __init of_core_init(void)
 	of_kset = kset_create_and_add("devicetree", NULL, firmware_kobj);
 	if (!of_kset) {
 		mutex_unlock(&of_mutex);
-		pr_err("devicetree: failed to register existing nodes\n");
+		pr_err("failed to register existing nodes\n");
 		return;
 	}
 	for_each_of_allnodes(np)
@@ -2257,8 +2260,8 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		of_node_put(node);
 
 		if (!port) {
-			pr_err("%s(): no port node found in %s\n",
-			       __func__, parent->full_name);
+			pr_err("graph: no port node found in %s\n",
+			       parent->full_name);
 			return NULL;
 		}
 	} else {
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 3033fa3..a3c9750 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -6,6 +6,8 @@
  * device tree nodes.
  */
 
+#define pr_fmt(fmt)	"OF: " fmt
+
 #include <linux/of.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -96,13 +98,13 @@ int of_reconfig_notify(unsigned long action, struct of_reconfig_data *p)
 	switch (action) {
 	case OF_RECONFIG_ATTACH_NODE:
 	case OF_RECONFIG_DETACH_NODE:
-		pr_debug("of/notify %-15s %s\n", action_names[action],
+		pr_debug("notify %-15s %s\n", action_names[action],
 			pr->dn->full_name);
 		break;
 	case OF_RECONFIG_ADD_PROPERTY:
 	case OF_RECONFIG_REMOVE_PROPERTY:
 	case OF_RECONFIG_UPDATE_PROPERTY:
-		pr_debug("of/notify %-15s %s:%s\n", action_names[action],
+		pr_debug("notify %-15s %s:%s\n", action_names[action],
 			pr->dn->full_name, pr->prop->name);
 		break;
 
@@ -460,12 +462,12 @@ static void __of_changeset_entry_dump(struct of_changeset_entry *ce)
 	case OF_RECONFIG_ADD_PROPERTY:
 	case OF_RECONFIG_REMOVE_PROPERTY:
 	case OF_RECONFIG_UPDATE_PROPERTY:
-		pr_debug("of/cset<%p> %-15s %s/%s\n", ce, action_names[ce->action],
+		pr_debug("cset<%p> %-15s %s/%s\n", ce, action_names[ce->action],
 			ce->np->full_name, ce->prop->name);
 		break;
 	case OF_RECONFIG_ATTACH_NODE:
 	case OF_RECONFIG_DETACH_NODE:
-		pr_debug("of/cset<%p> %-15s %s\n", ce, action_names[ce->action],
+		pr_debug("cset<%p> %-15s %s\n", ce, action_names[ce->action],
 			ce->np->full_name);
 		break;
 	}
@@ -531,13 +533,13 @@ static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool reve
 		ret = of_property_notify(ce->action, ce->np, ce->prop, ce->old_prop);
 		break;
 	default:
-		pr_err("%s: invalid devicetree changeset action: %i\n", __func__,
+		pr_err("invalid devicetree changeset action: %i\n",
 			(int)ce->action);
 		return;
 	}
 
 	if (ret)
-		pr_err("%s: notifier error @%s\n", __func__, ce->np->full_name);
+		pr_err("changeset notifier error @%s\n", ce->np->full_name);
 }
 
 static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
@@ -568,8 +570,8 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 
 		ret = __of_add_property(ce->np, ce->prop);
 		if (ret) {
-			pr_err("%s: add_property failed @%s/%s\n",
-				__func__, ce->np->full_name,
+			pr_err("changeset: add_property failed @%s/%s\n",
+				ce->np->full_name,
 				ce->prop->name);
 			break;
 		}
@@ -577,8 +579,8 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 	case OF_RECONFIG_REMOVE_PROPERTY:
 		ret = __of_remove_property(ce->np, ce->prop);
 		if (ret) {
-			pr_err("%s: remove_property failed @%s/%s\n",
-				__func__, ce->np->full_name,
+			pr_err("changeset: remove_property failed @%s/%s\n",
+				ce->np->full_name,
 				ce->prop->name);
 			break;
 		}
@@ -596,8 +598,8 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 
 		ret = __of_update_property(ce->np, ce->prop, &old_prop);
 		if (ret) {
-			pr_err("%s: update_property failed @%s/%s\n",
-				__func__, ce->np->full_name,
+			pr_err("changeset: update_property failed @%s/%s\n",
+				ce->np->full_name,
 				ce->prop->name);
 			break;
 		}
@@ -677,24 +679,24 @@ int __of_changeset_apply(struct of_changeset *ocs)
 	int ret;
 
 	/* perform the rest of the work */
-	pr_debug("of_changeset: applying...\n");
+	pr_debug("changeset: applying...\n");
 	list_for_each_entry(ce, &ocs->entries, node) {
 		ret = __of_changeset_entry_apply(ce);
 		if (ret) {
-			pr_err("%s: Error applying changeset (%d)\n", __func__, ret);
+			pr_err("Error applying changeset (%d)\n", ret);
 			list_for_each_entry_continue_reverse(ce, &ocs->entries, node)
 				__of_changeset_entry_revert(ce);
 			return ret;
 		}
 	}
-	pr_debug("of_changeset: applied, emitting notifiers.\n");
+	pr_debug("changeset: applied, emitting notifiers.\n");
 
 	/* drop the global lock while emitting notifiers */
 	mutex_unlock(&of_mutex);
 	list_for_each_entry(ce, &ocs->entries, node)
 		__of_changeset_entry_notify(ce, 0);
 	mutex_lock(&of_mutex);
-	pr_debug("of_changeset: notifiers sent.\n");
+	pr_debug("changeset: notifiers sent.\n");
 
 	return 0;
 }
@@ -728,24 +730,24 @@ int __of_changeset_revert(struct of_changeset *ocs)
 	struct of_changeset_entry *ce;
 	int ret;
 
-	pr_debug("of_changeset: reverting...\n");
+	pr_debug("changeset: reverting...\n");
 	list_for_each_entry_reverse(ce, &ocs->entries, node) {
 		ret = __of_changeset_entry_revert(ce);
 		if (ret) {
-			pr_err("%s: Error reverting changeset (%d)\n", __func__, ret);
+			pr_err("Error reverting changeset (%d)\n", ret);
 			list_for_each_entry_continue(ce, &ocs->entries, node)
 				__of_changeset_entry_apply(ce);
 			return ret;
 		}
 	}
-	pr_debug("of_changeset: reverted, emitting notifiers.\n");
+	pr_debug("changeset: reverted, emitting notifiers.\n");
 
 	/* drop the global lock while emitting notifiers */
 	mutex_unlock(&of_mutex);
 	list_for_each_entry_reverse(ce, &ocs->entries, node)
 		__of_changeset_entry_notify(ce, 1);
 	mutex_lock(&of_mutex);
-	pr_debug("of_changeset: notifiers sent.\n");
+	pr_debug("changeset: notifiers sent.\n");
 
 	return 0;
 }
@@ -795,10 +797,9 @@ int of_changeset_action(struct of_changeset *ocs, unsigned long action,
 	struct of_changeset_entry *ce;
 
 	ce = kzalloc(sizeof(*ce), GFP_KERNEL);
-	if (!ce) {
-		pr_err("%s: Failed to allocate\n", __func__);
+	if (!ce)
 		return -ENOMEM;
-	}
+
 	/* get a reference to the node */
 	ce->action = action;
 	ce->np = of_node_get(np);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 14f2f8c..5e38cb9 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -9,6 +9,8 @@
  * version 2 as published by the Free Software Foundation.
  */
 
+#define pr_fmt(fmt)	"OF: fdt:" fmt
+
 #include <linux/crc32.h>
 #include <linux/kernel.h>
 #include <linux/initrd.h>
@@ -182,14 +184,12 @@ static void populate_properties(const void *blob,
 
 		val = fdt_getprop_by_offset(blob, cur, &pname, &sz);
 		if (!val) {
-			pr_warn("%s: Cannot locate property at 0x%x\n",
-				__func__, cur);
+			pr_warn("Cannot locate property at 0x%x\n", cur);
 			continue;
 		}
 
 		if (!pname) {
-			pr_warn("%s: Cannot find property name at 0x%x\n",
-				__func__, cur);
+			pr_warn("Cannot find property name at 0x%x\n", cur);
 			continue;
 		}
 
@@ -428,7 +428,7 @@ static int unflatten_dt_nodes(const void *blob,
 	}
 
 	if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
-		pr_err("%s: Error %d processing FDT\n", __func__, offset);
+		pr_err("Error %d processing FDT\n", offset);
 		return -EINVAL;
 	}
 
@@ -1270,7 +1270,7 @@ static int __init of_fdt_raw_init(void)
 
 	if (of_fdt_crc32 != crc32_be(~0, initial_boot_params,
 				     fdt_totalsize(initial_boot_params))) {
-		pr_warn("fdt: not creating '/sys/firmware/fdt': CRC check failed\n");
+		pr_warn("not creating '/sys/firmware/fdt': CRC check failed\n");
 		return 0;
 	}
 	of_fdt_raw_attr.size = fdt_totalsize(initial_boot_params);
diff --git a/drivers/of/fdt_address.c b/drivers/of/fdt_address.c
index dca8f9b..843a542 100644
--- a/drivers/of/fdt_address.c
+++ b/drivers/of/fdt_address.c
@@ -12,6 +12,9 @@
  * the Free Software Foundation; either version 2, or (at your option)
  * any later version.
  */
+
+#define pr_fmt(fmt)	"OF: fdt: " fmt
+
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
@@ -30,7 +33,7 @@ static void __init of_dump_addr(const char *s, const __be32 *addr, int na)
 	pr_debug("%s", s);
 	while(na--)
 		pr_cont(" %08x", *(addr++));
-	pr_debug("\n");
+	pr_cont("\n");
 }
 #else
 static void __init of_dump_addr(const char *s, const __be32 *addr, int na) { }
@@ -77,7 +80,7 @@ static u64 __init fdt_bus_default_map(__be32 *addr, const __be32 *range,
 	s  = of_read_number(range + na + pna, ns);
 	da = of_read_number(addr, na);
 
-	pr_debug("FDT: default map, cp=%llx, s=%llx, da=%llx\n",
+	pr_debug("default map, cp=%llx, s=%llx, da=%llx\n",
 	    cp, s, da);
 
 	if (da < cp || da >= (cp + s))
@@ -123,11 +126,11 @@ static int __init fdt_translate_one(const void *blob, int parent,
 	if (rlen == 0) {
 		offset = of_read_number(addr, na);
 		memset(addr, 0, pna * 4);
-		pr_debug("FDT: empty ranges, 1:1 translation\n");
+		pr_debug("empty ranges, 1:1 translation\n");
 		goto finish;
 	}
 
-	pr_debug("FDT: walking ranges...\n");
+	pr_debug("walking ranges...\n");
 
 	/* Now walk through the ranges */
 	rlen /= 4;
@@ -138,14 +141,14 @@ static int __init fdt_translate_one(const void *blob, int parent,
 			break;
 	}
 	if (offset == OF_BAD_ADDR) {
-		pr_debug("FDT: not found !\n");
+		pr_debug("not found !\n");
 		return 1;
 	}
 	memcpy(addr, ranges + na, 4 * pna);
 
  finish:
-	of_dump_addr("FDT: parent translation for:", addr, pna);
-	pr_debug("FDT: with offset: %llx\n", offset);
+	of_dump_addr("parent translation for:", addr, pna);
+	pr_debug("with offset: %llx\n", offset);
 
 	/* Translate it into parent bus space */
 	return pbus->translate(addr, offset, pna);
@@ -170,12 +173,12 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 	int na, ns, pna, pns;
 	u64 result = OF_BAD_ADDR;
 
-	pr_debug("FDT: ** translation for device %s **\n",
+	pr_debug("** translation for device %s **\n",
 		 fdt_get_name(blob, node_offset, NULL));
 
 	reg = fdt_getprop(blob, node_offset, "reg", &len);
 	if (!reg) {
-		pr_err("FDT: warning: device tree node '%s' has no address.\n",
+		pr_err("warning: device tree node '%s' has no address.\n",
 			fdt_get_name(blob, node_offset, NULL));
 		goto bail;
 	}
@@ -189,15 +192,15 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 	/* Cound address cells & copy address locally */
 	bus->count_cells(blob, parent, &na, &ns);
 	if (!OF_CHECK_COUNTS(na, ns)) {
-		pr_err("FDT: Bad cell count for %s\n",
+		pr_err("Bad cell count for %s\n",
 		       fdt_get_name(blob, node_offset, NULL));
 		goto bail;
 	}
 	memcpy(addr, reg, na * 4);
 
-	pr_debug("FDT: bus (na=%d, ns=%d) on %s\n",
+	pr_debug("bus (na=%d, ns=%d) on %s\n",
 		 na, ns, fdt_get_name(blob, parent, NULL));
-	of_dump_addr("OF: translating address:", addr, na);
+	of_dump_addr("translating address:", addr, na);
 
 	/* Translate */
 	for (;;) {
@@ -207,7 +210,7 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 
 		/* If root, we have finished */
 		if (parent < 0) {
-			pr_debug("FDT: reached root node\n");
+			pr_debug("reached root node\n");
 			result = of_read_number(addr, na);
 			break;
 		}
@@ -216,12 +219,12 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 		pbus = &of_busses[0];
 		pbus->count_cells(blob, parent, &pna, &pns);
 		if (!OF_CHECK_COUNTS(pna, pns)) {
-			pr_err("FDT: Bad cell count for %s\n",
+			pr_err("Bad cell count for %s\n",
 				fdt_get_name(blob, node_offset, NULL));
 			break;
 		}
 
-		pr_debug("FDT: parent bus (na=%d, ns=%d) on %s\n",
+		pr_debug("parent bus (na=%d, ns=%d) on %s\n",
 			 pna, pns, fdt_get_name(blob, parent, NULL));
 
 		/* Apply bus translation */
@@ -234,7 +237,7 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 		ns = pns;
 		bus = pbus;
 
-		of_dump_addr("FDT: one level translation:", addr, na);
+		of_dump_addr("one level translation:", addr, na);
 	}
  bail:
 	return result;
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e7bfc17..c4c95b8 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -18,6 +18,8 @@
  * driver.
  */
 
+#define pr_fmt(fmt)	"OF: " fmt
+
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/list.h>
diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 0f2784b..e5764c5 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -16,6 +16,8 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define pr_fmt(fmt)	"OF: " fmt
+
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/nodemask.h>
@@ -65,11 +67,7 @@ static int __init of_numa_parse_memory_nodes(void)
 	u32 nid;
 	int r = 0;
 
-	for (;;) {
-		np = of_find_node_by_type(np, "memory");
-		if (!np)
-			break;
-
+	for_each_node_by_type(np, "memory") {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
 		if (r == -EINVAL)
 			/*
@@ -83,18 +81,10 @@ static int __init of_numa_parse_memory_nodes(void)
 			break;
 
 		r = of_address_to_resource(np, 0, &rsrc);
-		if (r) {
-			pr_err("NUMA: bad reg property in memory node\n");
-			break;
-		}
-
-		pr_debug("NUMA:  base = %llx len = %llx, node = %u\n",
-			 rsrc.start, rsrc.end - rsrc.start + 1, nid);
-
-		r = numa_add_memblk(nid, rsrc.start,
+		for (i = 0; !r; i++, r = of_address_to_resource(np, i, &rsrc)) {
+			r = numa_add_memblk(nid, rsrc.start,
 				    rsrc.end - rsrc.start + 1);
-		if (r)
-			break;
+		}
 	}
 	of_node_put(np);
 
diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
index 13f4fed..589b30c 100644
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@ -1,3 +1,5 @@
+#define pr_fmt(fmt)	"OF: PCI: " fmt
+
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/of.h>
@@ -138,7 +140,7 @@ void of_pci_check_probe_only(void)
 	else
 		pci_clear_flags(PCI_PROBE_ONLY);
 
-	pr_info("PCI: PROBE_ONLY %sabled\n", val ? "en" : "dis");
+	pr_info("PROBE_ONLY %sabled\n", val ? "en" : "dis");
 }
 EXPORT_SYMBOL_GPL(of_pci_check_probe_only);
 
@@ -181,7 +183,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
 	if (!bus_range)
 		return -ENOMEM;
 
-	pr_info("PCI host bridge %s ranges:\n", dev->full_name);
+	pr_info("host bridge %s ranges:\n", dev->full_name);
 
 	err = of_pci_parse_bus_range(dev, bus_range);
 	if (err) {
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ed01c01..bcbc132 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -13,6 +13,8 @@
  * License or (at your optional) any later version of the license.
  */
 
+#define pr_fmt(fmt)	"OF: reserved mem: " fmt
+
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -75,7 +77,7 @@ void __init fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
 
 	if (reserved_mem_count == ARRAY_SIZE(reserved_mem)) {
-		pr_err("Reserved memory: not enough space all defined regions.\n");
+		pr_err("not enough space all defined regions.\n");
 		return;
 	}
 
@@ -108,8 +110,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 		return -EINVAL;
 
 	if (len != dt_root_size_cells * sizeof(__be32)) {
-		pr_err("Reserved memory: invalid size property in '%s' node.\n",
-				uname);
+		pr_err("invalid size property in '%s' node.\n", uname);
 		return -EINVAL;
 	}
 	size = dt_mem_next_cell(dt_root_size_cells, &prop);
@@ -119,7 +120,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 	prop = of_get_flat_dt_prop(node, "alignment", &len);
 	if (prop) {
 		if (len != dt_root_addr_cells * sizeof(__be32)) {
-			pr_err("Reserved memory: invalid alignment property in '%s' node.\n",
+			pr_err("invalid alignment property in '%s' node.\n",
 				uname);
 			return -EINVAL;
 		}
@@ -134,7 +135,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 	if (prop) {
 
 		if (len % t_len != 0) {
-			pr_err("Reserved memory: invalid alloc-ranges property in '%s', skipping node.\n",
+			pr_err("invalid alloc-ranges property in '%s', skipping node.\n",
 			       uname);
 			return -EINVAL;
 		}
@@ -149,7 +150,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 			ret = early_init_dt_alloc_reserved_memory_arch(size,
 					align, start, end, nomap, &base);
 			if (ret == 0) {
-				pr_debug("Reserved memory: allocated memory for '%s' node: base %pa, size %ld MiB\n",
+				pr_debug("allocated memory for '%s' node: base %pa, size %ld MiB\n",
 					uname, &base,
 					(unsigned long)size / SZ_1M);
 				break;
@@ -161,13 +162,12 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
 							0, 0, nomap, &base);
 		if (ret == 0)
-			pr_debug("Reserved memory: allocated memory for '%s' node: base %pa, size %ld MiB\n",
+			pr_debug("allocated memory for '%s' node: base %pa, size %ld MiB\n",
 				uname, &base, (unsigned long)size / SZ_1M);
 	}
 
 	if (base == 0) {
-		pr_info("Reserved memory: failed to allocate memory for node '%s'\n",
-			uname);
+		pr_info("failed to allocate memory for node '%s'\n", uname);
 		return -ENOMEM;
 	}
 
@@ -196,7 +196,7 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 			continue;
 
 		if (initfn(rmem) == 0) {
-			pr_info("Reserved memory: initialized node %s, compatible id %s\n",
+			pr_info("initialized node %s, compatible id %s\n",
 				rmem->name, compat);
 			return 0;
 		}
@@ -238,7 +238,7 @@ static void __init __rmem_check_for_overlap(void)
 
 			this_end = this->base + this->size;
 			next_end = next->base + next->size;
-			pr_err("Reserved memory: OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
+			pr_err("OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
 			       this->name, &this->base, &this_end,
 			       next->name, &next->base, &next_end);
 		}
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8225081..318dbb5 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -8,7 +8,9 @@
  * modify it under the terms of the GNU General Public License
  * version 2 as published by the Free Software Foundation.
  */
-#undef DEBUG
+
+#define pr_fmt(fmt)	"OF: overlay: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -137,8 +139,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 	for_each_property_of_node(overlay, prop) {
 		ret = of_overlay_apply_single_property(ov, target, prop);
 		if (ret) {
-			pr_err("%s: Failed to apply prop @%s/%s\n",
-				__func__, target->full_name, prop->name);
+			pr_err("Failed to apply prop @%s/%s\n",
+			       target->full_name, prop->name);
 			return ret;
 		}
 	}
@@ -146,9 +148,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 	for_each_child_of_node(overlay, child) {
 		ret = of_overlay_apply_single_device_node(ov, target, child);
 		if (ret != 0) {
-			pr_err("%s: Failed to apply single node @%s/%s\n",
-					__func__, target->full_name,
-					child->name);
+			pr_err("Failed to apply single node @%s/%s\n",
+			       target->full_name, child->name);
 			of_node_put(child);
 			return ret;
 		}
@@ -176,8 +177,7 @@ static int of_overlay_apply(struct of_overlay *ov)
 
 		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay);
 		if (err != 0) {
-			pr_err("%s: overlay failed '%s'\n",
-				__func__, ovinfo->target->full_name);
+			pr_err("apply failed '%s'\n", ovinfo->target->full_name);
 			return err;
 		}
 	}
@@ -208,7 +208,7 @@ static struct device_node *find_target_node(struct device_node *info_node)
 	if (ret == 0)
 		return of_find_node_by_path(path);
 
-	pr_err("%s: Failed to find target for node %p (%s)\n", __func__,
+	pr_err("Failed to find target for node %p (%s)\n",
 		info_node, info_node->name);
 
 	return NULL;
@@ -355,8 +355,6 @@ int of_overlay_create(struct device_node *tree)
 
 	id = idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL);
 	if (id < 0) {
-		pr_err("%s: idr_alloc() failed for tree@%s\n",
-				__func__, tree->full_name);
 		err = id;
 		goto err_destroy_trans;
 	}
@@ -365,26 +363,21 @@ int of_overlay_create(struct device_node *tree)
 	/* build the overlay info structures */
 	err = of_build_overlay_info(ov, tree);
 	if (err) {
-		pr_err("%s: of_build_overlay_info() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("of_build_overlay_info() failed for tree@%s\n",
+		       tree->full_name);
 		goto err_free_idr;
 	}
 
 	/* apply the overlay */
 	err = of_overlay_apply(ov);
-	if (err) {
-		pr_err("%s: of_overlay_apply() failed for tree@%s\n",
-				__func__, tree->full_name);
+	if (err)
 		goto err_abort_trans;
-	}
 
 	/* apply the changeset */
 	err = __of_changeset_apply(&ov->cset);
-	if (err) {
-		pr_err("%s: __of_changeset_apply() failed for tree@%s\n",
-				__func__, tree->full_name);
+	if (err)
 		goto err_revert_overlay;
-	}
+
 
 	/* add to the tail of the overlay list */
 	list_add_tail(&ov->node, &ov_list);
@@ -469,8 +462,7 @@ static int overlay_removal_is_ok(struct of_overlay *ov)
 
 	list_for_each_entry(ce, &ov->cset.entries, node) {
 		if (!overlay_is_topmost(ov, ce->np)) {
-			pr_err("%s: overlay #%d is not topmost\n",
-					__func__, ov->id);
+			pr_err("overlay #%d is not topmost\n", ov->id);
 			return 0;
 		}
 	}
@@ -496,16 +488,13 @@ int of_overlay_destroy(int id)
 	ov = idr_find(&ov_idr, id);
 	if (ov == NULL) {
 		err = -ENODEV;
-		pr_err("%s: Could not find overlay #%d\n",
-				__func__, id);
+		pr_err("destroy: Could not find overlay #%d\n", id);
 		goto out;
 	}
 
 	/* check whether the overlay is safe to remove */
 	if (!overlay_removal_is_ok(ov)) {
 		err = -EBUSY;
-		pr_err("%s: removal check failed for overlay #%d\n",
-				__func__, id);
 		goto out;
 	}
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 16e8daf..7b904b8 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -11,6 +11,9 @@
  *  2 of the License, or (at your option) any later version.
  *
  */
+
+#define pr_fmt(fmt)	"OF: " fmt
+
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/amba/bus.h>
@@ -234,11 +237,8 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 		return NULL;
 
 	dev = amba_device_alloc(NULL, 0, 0);
-	if (!dev) {
-		pr_err("%s(): amba_device_alloc() failed for %s\n",
-		       __func__, node->full_name);
+	if (!dev)
 		goto err_clear_flag;
-	}
 
 	/* setup generic device info */
 	dev->dev.of_node = of_node_get(node);
@@ -261,15 +261,15 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 
 	ret = of_address_to_resource(node, 0, &dev->res);
 	if (ret) {
-		pr_err("%s(): of_address_to_resource() failed (%d) for %s\n",
-		       __func__, ret, node->full_name);
+		pr_err("amba: of_address_to_resource() failed (%d) for %s\n",
+		       ret, node->full_name);
 		goto err_free;
 	}
 
 	ret = amba_device_add(dev, &iomem_resource);
 	if (ret) {
-		pr_err("%s(): amba_device_add() failed (%d) for %s\n",
-		       __func__, ret, node->full_name);
+		pr_err("amba_device_add() failed (%d) for %s\n",
+		       ret, node->full_name);
 		goto err_free;
 	}
 
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index d313d49..7414611 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -9,6 +9,8 @@
  * version 2 as published by the Free Software Foundation.
  */
 
+#define pr_fmt(fmt)	"OF: resolver: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-- 
2.7.4
