From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] OF: Introduce Device Tree resolve support.
Date: Thu,  2 Oct 2014 16:27:03 +0100
Message-ID: <1412263624-21838-2-git-send-email-grant.likely@linaro.org>
References: <1412263624-21838-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412263624-21838-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Introduce support for dynamic device tree resolution.
Using it, it is possible to prepare a device tree that's
been loaded on runtime to be modified and inserted at the kernel
live tree.

Export of of_resolve and bug fix of double free by
	Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
[grant.likely: Don't need to select CONFIG_OF_DYNAMIC and CONFIG_OF_DEVICE]
[grant.likely: Don't need to depend on OF or !SPARC]
[grant.likely: Factor out duplicate code blocks into single function]
Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/dynamic-resolution-notes.txt        |  25 ++
 drivers/of/Kconfig                                 |   3 +
 drivers/of/Makefile                                |   1 +
 drivers/of/resolver.c                              | 336 +++++++++++++++++++++
 include/linux/of.h                                 |   3 +
 5 files changed, 368 insertions(+)
 create mode 100644 Documentation/devicetree/dynamic-resolution-notes.txt
 create mode 100644 drivers/of/resolver.c

diff --git a/Documentation/devicetree/dynamic-resolution-notes.txt b/Documentation/devicetree/dynamic-resolution-notes.txt
new file mode 100644
index 000000000000..083d23262abe
--- /dev/null
+++ b/Documentation/devicetree/dynamic-resolution-notes.txt
@@ -0,0 +1,25 @@
+Device Tree Dynamic Resolver Notes
+----------------------------------
+
+This document describes the implementation of the in-kernel
+Device Tree resolver, residing in drivers/of/resolver.c and is a
+companion document to Documentation/devicetree/dt-object-internal.txt[1]
+
+How the resolver works
+----------------------
+
+The resolver is given as an input an arbitrary tree compiled with the
+proper dtc option and having a /plugin/ tag. This generates the
+appropriate __fixups__ & __local_fixups__ nodes as described in [1].
+
+In sequence the resolver works by the following steps:
+
+1. Get the maximum device tree phandle value from the live tree + 1.
+2. Adjust all the local phandles of the tree to resolve by that amount.
+3. Using the __local__fixups__ node information adjust all local references
+   by the same amount.
+4. For each property in the __fixups__ node locate the node it references
+   in the live tree. This is the label used to tag the node.
+5. Retrieve the phandle of the target of the fixup.
+6. For each fixup in the property locate the node:property:offset location
+   and replace it with the phandle value.
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 5160c4eb73c2..6b81a36f6420 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -79,4 +79,7 @@ config OF_RESERVED_MEM
 	help
 	  Helpers to allow for reservation of memory regions
 
+config OF_RESOLVE
+	bool
+
 endmenu # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 2b6a7b129d10..ca9209ce50cd 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_OF_PCI)	+= of_pci.o
 obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
 obj-$(CONFIG_OF_MTD)	+= of_mtd.o
 obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
+obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 
 CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
 CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
new file mode 100644
index 000000000000..aed7959f800d
--- /dev/null
+++ b/drivers/of/resolver.c
@@ -0,0 +1,336 @@
+/*
+ * Functions for dealing with DT resolution
+ *
+ * Copyright (C) 2012 Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
+ * Copyright (C) 2012 Texas Instruments Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/string.h>
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+
+/* illegal phandle value (set when unresolved) */
+#define OF_PHANDLE_ILLEGAL	0xdeadbeef
+
+/**
+ * Find a node with the give full name by recursively following any of
+ * the child node links.
+ */
+static struct device_node *__of_find_node_by_full_name(struct device_node *node,
+		const char *full_name)
+{
+	struct device_node *child, *found;
+
+	if (node == NULL)
+		return NULL;
+
+	/* check */
+	if (of_node_cmp(node->full_name, full_name) == 0)
+		return node;
+
+	for_each_child_of_node(node, child) {
+		found = __of_find_node_by_full_name(child, full_name);
+		if (found != NULL)
+			return found;
+	}
+
+	return NULL;
+}
+
+/*
+ * Find live tree's maximum phandle value.
+ */
+static phandle of_get_tree_max_phandle(void)
+{
+	struct device_node *node;
+	phandle phandle;
+	unsigned long flags;
+
+	/* now search recursively */
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	phandle = 0;
+	for_each_of_allnodes(node) {
+		if (node->phandle != OF_PHANDLE_ILLEGAL &&
+				node->phandle > phandle)
+			phandle = node->phandle;
+	}
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	return phandle;
+}
+
+/*
+ * Adjust a subtree's phandle values by a given delta.
+ * Makes sure not to just adjust the device node's phandle value,
+ * but modify the phandle properties values as well.
+ */
+static void __of_adjust_tree_phandles(struct device_node *node,
+		int phandle_delta)
+{
+	struct device_node *child;
+	struct property *prop;
+	phandle phandle;
+
+	/* first adjust the node's phandle direct value */
+	if (node->phandle != 0 && node->phandle != OF_PHANDLE_ILLEGAL)
+		node->phandle += phandle_delta;
+
+	/* now adjust phandle & linux,phandle values */
+	for_each_property_of_node(node, prop) {
+
+		/* only look for these two */
+		if (of_prop_cmp(prop->name, "phandle") != 0 &&
+		    of_prop_cmp(prop->name, "linux,phandle") != 0)
+			continue;
+
+		/* must be big enough */
+		if (prop->length < 4)
+			continue;
+
+		/* read phandle value */
+		phandle = be32_to_cpup(prop->value);
+		if (phandle == OF_PHANDLE_ILLEGAL)	/* unresolved */
+			continue;
+
+		/* adjust */
+		*(uint32_t *)prop->value = cpu_to_be32(node->phandle);
+	}
+
+	/* now do the children recursively */
+	for_each_child_of_node(node, child)
+		__of_adjust_tree_phandles(child, phandle_delta);
+}
+
+static int __of_adjust_phandle_ref(struct device_node *node, struct property *rprop, int value, bool is_delta)
+{
+	phandle phandle;
+	struct device_node *refnode;
+	struct property *sprop;
+	char *propval, *propcur, *propend, *nodestr, *propstr, *s;
+	int offset, propcurlen;
+	int err = 0;
+
+	/* make a copy */
+	propval = kmalloc(rprop->length, GFP_KERNEL);
+	if (!propval) {
+		pr_err("%s: Could not copy value of '%s'\n",
+				__func__, rprop->name);
+		return -ENOMEM;
+	}
+	memcpy(propval, rprop->value, rprop->length);
+
+	propend = propval + rprop->length;
+	for (propcur = propval; propcur < propend; propcur += propcurlen + 1) {
+		propcurlen = strlen(propcur);
+
+		nodestr = propcur;
+		s = strchr(propcur, ':');
+		if (!s) {
+			pr_err("%s: Illegal symbol entry '%s' (1)\n",
+				__func__, propcur);
+			err = -EINVAL;
+			goto err_fail;
+		}
+		*s++ = '\0';
+
+		propstr = s;
+		s = strchr(s, ':');
+		if (!s) {
+			pr_err("%s: Illegal symbol entry '%s' (2)\n",
+				__func__, (char *)rprop->value);
+			err = -EINVAL;
+			goto err_fail;
+		}
+
+		*s++ = '\0';
+		err = kstrtoint(s, 10, &offset);
+		if (err != 0) {
+			pr_err("%s: Could get offset '%s'\n",
+				__func__, (char *)rprop->value);
+			goto err_fail;
+		}
+
+		/* look into the resolve node for the full path */
+		refnode = __of_find_node_by_full_name(node, nodestr);
+		if (!refnode) {
+			pr_warn("%s: Could not find refnode '%s'\n",
+				__func__, (char *)rprop->value);
+			continue;
+		}
+
+		/* now find the property */
+		for_each_property_of_node(refnode, sprop) {
+			if (of_prop_cmp(sprop->name, propstr) == 0)
+				break;
+		}
+
+		if (!sprop) {
+			pr_err("%s: Could not find property '%s'\n",
+				__func__, (char *)rprop->value);
+			err = -ENOENT;
+			goto err_fail;
+		}
+
+		phandle = is_delta ? be32_to_cpup(sprop->value + offset) + value : value;
+		*(__be32 *)(sprop->value + offset) = cpu_to_be32(phandle);
+	}
+
+err_fail:
+	kfree(propval);
+	return err;
+}
+
+/*
+ * Adjust the local phandle references by the given phandle delta.
+ * Assumes the existances of a __local_fixups__ node at the root
+ * of the tree. Does not take any devtree locks so make sure you
+ * call this on a tree which is at the detached state.
+ */
+static int __of_adjust_tree_phandle_references(struct device_node *node,
+		int phandle_delta)
+{
+	struct device_node *child;
+	struct property *rprop;
+	int err;
+
+	/* locate the symbols & fixups nodes on resolve */
+	for_each_child_of_node(node, child)
+		if (of_node_cmp(child->name, "__local_fixups__") == 0)
+			break;
+
+	/* no local fixups */
+	if (!child)
+		return 0;
+
+	/* find the local fixups property */
+	for_each_property_of_node(child, rprop) {
+		/* skip properties added automatically */
+		if (of_prop_cmp(rprop->name, "name") == 0)
+			continue;
+
+		err = __of_adjust_phandle_ref(node, rprop, phandle_delta, true);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * of_resolve	- Resolve the given node against the live tree.
+ *
+ * @resolve:	Node to resolve
+ *
+ * Perform dynamic Device Tree resolution against the live tree
+ * to the given node to resolve. This depends on the live tree
+ * having a __symbols__ node, and the resolve node the __fixups__ &
+ * __local_fixups__ nodes (if needed).
+ * The result of the operation is a resolve node that it's contents
+ * are fit to be inserted or operate upon the live tree.
+ * Returns 0 on success or a negative error value on error.
+ */
+int of_resolve_phandles(struct device_node *resolve)
+{
+	struct device_node *child, *refnode;
+	struct device_node *root_sym, *resolve_sym, *resolve_fix;
+	struct property *rprop;
+	const char *refpath;
+	phandle phandle, phandle_delta;
+	int err;
+
+	/* the resolve node must exist, and be detached */
+	if (!resolve || !of_node_check_flag(resolve, OF_DETACHED))
+		return -EINVAL;
+
+	/* first we need to adjust the phandles */
+	phandle_delta = of_get_tree_max_phandle() + 1;
+	__of_adjust_tree_phandles(resolve, phandle_delta);
+	err = __of_adjust_tree_phandle_references(resolve, phandle_delta);
+	if (err != 0)
+		return err;
+
+	root_sym = NULL;
+	resolve_sym = NULL;
+	resolve_fix = NULL;
+
+	/* this may fail (if no fixups are required) */
+	root_sym = of_find_node_by_path("/__symbols__");
+
+	/* locate the symbols & fixups nodes on resolve */
+	for_each_child_of_node(resolve, child) {
+
+		if (!resolve_sym &&
+				of_node_cmp(child->name, "__symbols__") == 0)
+			resolve_sym = child;
+
+		if (!resolve_fix &&
+				of_node_cmp(child->name, "__fixups__") == 0)
+			resolve_fix = child;
+
+		/* both found, don't bother anymore */
+		if (resolve_sym && resolve_fix)
+			break;
+	}
+
+	/* we do allow for the case where no fixups are needed */
+	if (!resolve_fix) {
+		err = 0;	/* no error */
+		goto out;
+	}
+
+	/* we need to fixup, but no root symbols... */
+	if (!root_sym) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	for_each_property_of_node(resolve_fix, rprop) {
+
+		/* skip properties added automatically */
+		if (of_prop_cmp(rprop->name, "name") == 0)
+			continue;
+
+		err = of_property_read_string(root_sym,
+				rprop->name, &refpath);
+		if (err != 0) {
+			pr_err("%s: Could not find symbol '%s'\n",
+					__func__, rprop->name);
+			goto out;
+		}
+
+		refnode = of_find_node_by_path(refpath);
+		if (!refnode) {
+			pr_err("%s: Could not find node by path '%s'\n",
+					__func__, refpath);
+			err = -ENOENT;
+			goto out;
+		}
+
+		phandle = refnode->phandle;
+		of_node_put(refnode);
+
+		pr_debug("%s: %s phandle is 0x%08x\n",
+				__func__, rprop->name, phandle);
+
+		err = __of_adjust_phandle_ref(resolve, rprop, phandle, false);
+		if (err)
+			break;
+	}
+
+out:
+	/* NULL is handled by of_node_put as NOP */
+	of_node_put(root_sym);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(of_resolve_phandles);
diff --git a/include/linux/of.h b/include/linux/of.h
index 6c4363b8ddc3..6545e7aec7bb 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -863,4 +863,7 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 }
 #endif
 
+/* CONFIG_OF_RESOLVE api */
+extern int of_resolve_phandles(struct device_node *tree);
+
 #endif /* _LINUX_OF_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
