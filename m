From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC 2/3] of: Replace custom linked list with list_head
Date: Thu,  5 Jun 2014 16:43:40 +0100
Message-ID: <1401983021-13829-3-git-send-email-grant.likely@linaro.org>
References: <1401983021-13829-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401983021-13829-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device tree data structure uses a custom linked list implementation
which is baroque and prone to bugs. Replace the allnodes list with a
list_head and the common list_head accessor functions.

At the same time, move the private for_each_of_allnodes() macro into
drivers/of/base.c. It must not be used outside of the core code because
the macro doesn't take into account device tree locking.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-vexpress/v2m.c        |   2 +-
 drivers/of/base.c                   | 126 +++++++++++++++++++-----------------
 drivers/of/fdt.c                    |  27 ++++----
 drivers/of/pdt.c                    |  26 +++-----
 drivers/pci/hotplug/rpadlpar_core.c |   2 +-
 include/linux/of.h                  |   9 ++-
 include/linux/of_fdt.h              |   3 +-
 include/linux/of_pdt.h              |   3 +-
 8 files changed, 96 insertions(+), 102 deletions(-)

diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index 4f8b8cb17ff5..57151ba5edee 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -412,7 +412,7 @@ void __init v2m_dt_init_early(void)
 	vexpress_sysreg_of_early_init();
 
 	/* Confirm board type against DT property, if available */
-	if (of_property_read_u32(of_allnodes, "arm,hbi", &dt_hbi) == 0) {
+	if (of_property_read_u32(of_root, "arm,hbi", &dt_hbi) == 0) {
 		u32 hbi = vexpress_get_hbi(VEXPRESS_SITE_MASTER);
 
 		if (WARN_ON(dt_hbi != hbi))
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 567e6e1b7921..6c0bd86b802f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -31,14 +31,22 @@
 
 LIST_HEAD(aliases_lookup);
 
-struct device_node *of_allnodes;
+LIST_HEAD(of_allnodes);
 EXPORT_SYMBOL(of_allnodes);
-struct device_node *of_chosen;
-struct device_node *of_aliases;
+struct device_node *of_root = NULL;
+struct device_node *of_chosen = NULL;
+struct device_node *of_aliases = NULL;
 static struct device_node *of_stdout;
 
 static struct kset *of_kset;
 
+#define of_allnodes_prepare(dn) \
+	list_prepare_entry(dn, &of_allnodes, allnext)
+#define for_each_of_allnodes(dn) \
+	list_for_each_entry(dn, &of_allnodes, allnext)
+#define for_each_of_allnodes_continue(dn) \
+	list_for_each_entry_continue(dn, &of_allnodes, allnext)
+
 /*
  * Used to protect the of_aliases; but also overloaded to hold off addition of
  * nodes to sysfs
@@ -299,7 +307,7 @@ static int __init of_init(void)
 	mutex_unlock(&of_aliases_mutex);
 
 	/* Symlink in /proc as required by userspace ABI */
-	if (of_allnodes)
+	if (of_root)
 		proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
 
 	return 0;
@@ -348,18 +356,18 @@ EXPORT_SYMBOL(of_find_property);
  * Returns a node pointer with refcount incremented, use
  * of_node_put() on it when done.
  */
-struct device_node *of_find_all_nodes(struct device_node *prev)
+struct device_node *of_find_all_nodes(struct device_node *np)
 {
-	struct device_node *np;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = prev ? prev->allnext : of_allnodes;
-	for (; np != NULL; np = np->allnext)
-		if (of_node_get(np))
-			break;
-	of_node_put(prev);
+	of_node_put(np);
+	np = list_next_entry(of_allnodes_prepare(np), allnext);
+	if (&np->allnext == &of_allnodes)
+		np = NULL;
+	of_node_get(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
 	return np;
 }
 EXPORT_SYMBOL(of_find_all_nodes);
@@ -831,7 +839,7 @@ struct device_node *of_find_node_by_path(const char *path)
 	unsigned long flags;
 
 	if (strcmp(path, "/") == 0)
-		return of_node_get(of_allnodes);
+		return of_node_get(of_root);
 
 	/* The path could begin with an alias */
 	if (*path != '/') {
@@ -856,7 +864,7 @@ struct device_node *of_find_node_by_path(const char *path)
 	/* Step down the tree matching path components */
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	if (!np)
-		np = of_node_get(of_allnodes);
+		np = of_node_get(of_root);
 	while (np && *path == '/') {
 		path++; /* Increment past '/' delimiter */
 		np = __of_find_node_by_path(np, path);
@@ -881,16 +889,18 @@ EXPORT_SYMBOL(of_find_node_by_path);
 struct device_node *of_find_node_by_name(struct device_node *from,
 	const char *name)
 {
-	struct device_node *np;
+	struct device_node *np = NULL;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = from ? from->allnext : of_allnodes;
-	for (; np; np = np->allnext)
-		if (np->name && (of_node_cmp(np->name, name) == 0)
-		    && of_node_get(np))
-			break;
 	of_node_put(from);
+	from = of_allnodes_prepare(from);
+	for_each_of_allnodes_continue(from) {
+		if (from->name && (of_node_cmp(from->name, name) == 0)) {
+			np = of_node_get(from);
+			break;
+		}
+	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
@@ -911,16 +921,18 @@ EXPORT_SYMBOL(of_find_node_by_name);
 struct device_node *of_find_node_by_type(struct device_node *from,
 	const char *type)
 {
-	struct device_node *np;
+	struct device_node *np = NULL;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = from ? from->allnext : of_allnodes;
-	for (; np; np = np->allnext)
-		if (np->type && (of_node_cmp(np->type, type) == 0)
-		    && of_node_get(np))
-			break;
 	of_node_put(from);
+	from = of_allnodes_prepare(from);
+	for_each_of_allnodes_continue(from) {
+		if (from->type && (of_node_cmp(from->type, type) == 0)) {
+			np = of_node_get(from);
+			break;
+		}
+	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
@@ -943,18 +955,20 @@ EXPORT_SYMBOL(of_find_node_by_type);
 struct device_node *of_find_compatible_node(struct device_node *from,
 	const char *type, const char *compatible)
 {
-	struct device_node *np;
+	struct device_node *np = NULL;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = from ? from->allnext : of_allnodes;
-	for (; np; np = np->allnext) {
-		if (__of_device_is_compatible(np, compatible, type, NULL) &&
-		    of_node_get(np))
+	of_node_put(from);
+	from = of_allnodes_prepare(from);
+	for_each_of_allnodes_continue(from) {
+		if (__of_device_is_compatible(from, compatible, type, NULL)) {
+			np = of_node_get(from);
 			break;
+		}
 	}
-	of_node_put(from);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
 	return np;
 }
 EXPORT_SYMBOL(of_find_compatible_node);
@@ -974,22 +988,22 @@ EXPORT_SYMBOL(of_find_compatible_node);
 struct device_node *of_find_node_with_property(struct device_node *from,
 	const char *prop_name)
 {
-	struct device_node *np;
+	struct device_node *np = NULL;
 	struct property *pp;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = from ? from->allnext : of_allnodes;
-	for (; np; np = np->allnext) {
-		for (pp = np->properties; pp; pp = pp->next) {
+	of_node_put(from);
+	from = of_allnodes_prepare(from);
+	for_each_of_allnodes_continue(from) {
+		for (pp = from->properties; pp; pp = pp->next) {
 			if (of_prop_cmp(pp->name, prop_name) == 0) {
-				of_node_get(np);
+				np = of_node_get(from);
 				goto out;
 			}
 		}
 	}
-out:
-	of_node_put(from);
+ out:
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
@@ -1054,7 +1068,7 @@ struct device_node *of_find_matching_node_and_match(struct device_node *from,
 					const struct of_device_id *matches,
 					const struct of_device_id **match)
 {
-	struct device_node *np;
+	struct device_node *np = NULL;
 	const struct of_device_id *m;
 	unsigned long flags;
 
@@ -1062,16 +1076,16 @@ struct device_node *of_find_matching_node_and_match(struct device_node *from,
 		*match = NULL;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = from ? from->allnext : of_allnodes;
-	for (; np; np = np->allnext) {
-		m = __of_match_node(matches, np);
-		if (m && of_node_get(np)) {
+	of_node_put(from);
+	from = of_allnodes_prepare(from);
+	for_each_of_allnodes_continue(from) {
+		if ((m = __of_match_node(matches, from))) {
+			np = of_node_get(from);
 			if (match)
 				*match = m;
 			break;
 		}
 	}
-	of_node_put(from);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
@@ -1113,14 +1127,16 @@ EXPORT_SYMBOL_GPL(of_modalias_node);
  */
 struct device_node *of_find_node_by_phandle(phandle handle)
 {
-	struct device_node *np;
+	struct device_node *tmp, *np = NULL;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	for (np = of_allnodes; np; np = np->allnext)
-		if (np->phandle == handle)
+	for_each_of_allnodes(tmp) {
+		if (tmp->phandle == handle) {
+			np = of_node_get(tmp);
 			break;
-	of_node_get(np);
+		}
+	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
@@ -1959,10 +1975,9 @@ int of_attach_node(struct device_node *np)
 		return rc;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
+	list_add_tail(&np->allnext, &of_allnodes);
 	np->sibling = np->parent->child;
-	np->allnext = of_allnodes;
 	np->parent->child = np;
-	of_allnodes = np;
 	of_node_clear_flag(np, OF_DETACHED);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
@@ -2000,16 +2015,7 @@ int of_detach_node(struct device_node *np)
 		return rc;
 	}
 
-	if (of_allnodes == np)
-		of_allnodes = np->allnext;
-	else {
-		struct device_node *prev;
-		for (prev = of_allnodes;
-		     prev->allnext != np;
-		     prev = prev->allnext)
-			;
-		prev->allnext = np->allnext;
-	}
+	list_del(&np->allnext);
 
 	if (parent->child == np)
 		parent->child = np->sibling;
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 17be90f5445f..6876ac3d4b30 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -96,14 +96,14 @@ static void *unflatten_dt_alloc(void **mem, unsigned long size,
  * @mem: Memory chunk to use for allocating device nodes and properties
  * @p: pointer to node in flat tree
  * @dad: Parent struct device_node
- * @allnextpp: pointer to ->allnext from last allocated device_node
+ * @allnext: list of ->allnext from this tree
  * @fpsize: Size of the node path up at the current depth.
  */
 static void * unflatten_dt_node(void *blob,
 				void *mem,
 				int *poffset,
 				struct device_node *dad,
-				struct device_node ***allnextpp,
+				struct list_head *allnext,
 				unsigned long fpsize)
 {
 	const __be32 *p;
@@ -151,7 +151,7 @@ static void * unflatten_dt_node(void *blob,
 
 	np = unflatten_dt_alloc(&mem, sizeof(struct device_node) + allocl,
 				__alignof__(struct device_node));
-	if (allnextpp) {
+	if (allnext) {
 		char *fn;
 		of_node_init(np);
 		np->full_name = fn = ((char *)np) + sizeof(*np);
@@ -173,8 +173,7 @@ static void * unflatten_dt_node(void *blob,
 		memcpy(fn, pathp, l);
 
 		prev_pp = &np->properties;
-		**allnextpp = np;
-		*allnextpp = &np->allnext;
+		list_add_tail(&np->allnext, allnext);
 		if (dad != NULL) {
 			np->parent = dad;
 			/* we temporarily use the next field as `last_child'*/
@@ -205,7 +204,7 @@ static void * unflatten_dt_node(void *blob,
 			has_name = 1;
 		pp = unflatten_dt_alloc(&mem, sizeof(struct property),
 					__alignof__(struct property));
-		if (allnextpp) {
+		if (allnext) {
 			/* We accept flattened tree phandles either in
 			 * ePAPR-style "phandle" properties, or the
 			 * legacy "linux,phandle" properties.  If both
@@ -247,7 +246,7 @@ static void * unflatten_dt_node(void *blob,
 		sz = (pa - ps) + 1;
 		pp = unflatten_dt_alloc(&mem, sizeof(struct property) + sz,
 					__alignof__(struct property));
-		if (allnextpp) {
+		if (allnext) {
 			pp->name = "name";
 			pp->length = sz;
 			pp->value = pp + 1;
@@ -259,7 +258,7 @@ static void * unflatten_dt_node(void *blob,
 				(char *)pp->value);
 		}
 	}
-	if (allnextpp) {
+	if (allnext) {
 		*prev_pp = NULL;
 		np->name = of_get_property(np, "name", NULL);
 		np->type = of_get_property(np, "device_type", NULL);
@@ -275,7 +274,7 @@ static void * unflatten_dt_node(void *blob,
 	if (depth < 0)
 		depth = 0;
 	while (*poffset > 0 && depth > old_depth)
-		mem = unflatten_dt_node(blob, mem, poffset, np, allnextpp,
+		mem = unflatten_dt_node(blob, mem, poffset, np, allnext,
 					fpsize);
 
 	if (*poffset < 0 && *poffset != -FDT_ERR_NOTFOUND)
@@ -297,13 +296,12 @@ static void * unflatten_dt_node(void *blob,
  * for the resulting tree
  */
 static void __unflatten_device_tree(void *blob,
-			     struct device_node **mynodes,
+			     struct list_head *allnext,
 			     void * (*dt_alloc)(u64 size, u64 align))
 {
 	unsigned long size;
 	int start;
 	void *mem;
-	struct device_node **allnextp = mynodes;
 
 	pr_debug(" -> unflatten_device_tree()\n");
 
@@ -339,11 +337,10 @@ static void __unflatten_device_tree(void *blob,
 
 	/* Second pass, do actual unflattening */
 	start = 0;
-	unflatten_dt_node(blob, mem, &start, NULL, &allnextp, 0);
+	unflatten_dt_node(blob, mem, &start, NULL, allnext, 0);
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
-	*allnextp = NULL;
 
 	pr_debug(" <- unflatten_device_tree()\n");
 }
@@ -361,8 +358,7 @@ static void *kernel_tree_alloc(u64 size, u64 align)
  * pointers of the nodes so the normal device-tree walking functions
  * can be used.
  */
-void of_fdt_unflatten_tree(unsigned long *blob,
-			struct device_node **mynodes)
+void of_fdt_unflatten_tree(unsigned long *blob, struct list_head *mynodes)
 {
 	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
 }
@@ -904,6 +900,7 @@ void __init unflatten_device_tree(void)
 {
 	__unflatten_device_tree(initial_boot_params, &of_allnodes,
 				early_init_dt_alloc_memory_arch);
+	of_root = list_first_entry_or_null(&of_allnodes, struct device_node, allnext);
 
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index 36b4035881b0..38dd814870b4 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -25,8 +25,7 @@
 
 static struct of_pdt_ops *of_pdt_prom_ops __initdata;
 
-void __initdata (*of_pdt_build_more)(struct device_node *dp,
-		struct device_node ***nextp);
+void __initdata (*of_pdt_build_more)(struct device_node *dp);
 
 #if defined(CONFIG_SPARC)
 unsigned int of_pdt_unique_id __initdata;
@@ -192,8 +191,7 @@ static struct device_node * __init of_pdt_create_node(phandle node,
 }
 
 static struct device_node * __init of_pdt_build_tree(struct device_node *parent,
-						   phandle node,
-						   struct device_node ***nextp)
+						   phandle node)
 {
 	struct device_node *ret = NULL, *prev_sibling = NULL;
 	struct device_node *dp;
@@ -210,16 +208,15 @@ static struct device_node * __init of_pdt_build_tree(struct device_node *parent,
 			ret = dp;
 		prev_sibling = dp;
 
-		*(*nextp) = dp;
-		*nextp = &dp->allnext;
+		list_add_tail(&of_allnodes, &np->allnext);
 
 		dp->full_name = of_pdt_build_full_name(dp);
 
 		dp->child = of_pdt_build_tree(dp,
-				of_pdt_prom_ops->getchild(node), nextp);
+				of_pdt_prom_ops->getchild(node));
 
 		if (of_pdt_build_more)
-			of_pdt_build_more(dp, nextp);
+			of_pdt_build_more(dp);
 
 		node = of_pdt_prom_ops->getsibling(node);
 	}
@@ -234,20 +231,17 @@ static void * __init kernel_tree_alloc(u64 size, u64 align)
 
 void __init of_pdt_build_devicetree(phandle root_node, struct of_pdt_ops *ops)
 {
-	struct device_node **nextp;
-
 	BUG_ON(!ops);
 	of_pdt_prom_ops = ops;
 
-	of_allnodes = of_pdt_create_node(root_node, NULL);
+	of_root = of_pdt_create_node(root_node, NULL);
 #if defined(CONFIG_SPARC)
-	of_allnodes->path_component_name = "";
+	of_root->path_component_name = "";
 #endif
-	of_allnodes->full_name = "/";
+	of_root->full_name = "/";
 
-	nextp = &of_allnodes->allnext;
-	of_allnodes->child = of_pdt_build_tree(of_allnodes,
-			of_pdt_prom_ops->getchild(of_allnodes->phandle), &nextp);
+	list_add_tail(&of_allnodes, &of_root->allnext);
+	of_root->child = of_pdt_build_tree(of_root, of_pdt_prom_ops->getchild(of_root->phandle));
 
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(kernel_tree_alloc);
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index 4fcdeedda31b..e25e4d1ec241 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -68,7 +68,7 @@ static struct device_node *find_php_slot_pci_node(char *drc_name,
 	char *type;
 	int rc;
 
-	while ((np = of_find_node_by_name(np, "pci"))) {
+	for_each_node_by_name(np, "pci") {
 		rc = rpaphp_get_drc_props(np, NULL, &name, &type, NULL);
 		if (rc == 0)
 			if (!strcmp(drc_name, name) && !strcmp(drc_type, type))
diff --git a/include/linux/of.h b/include/linux/of.h
index 3bad8d106e0e..e082db3c284f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -56,7 +56,7 @@ struct device_node {
 	struct	device_node *child;
 	struct	device_node *sibling;
 	struct	device_node *next;	/* next device of same type */
-	struct	device_node *allnext;	/* next in list of all nodes */
+	struct	list_head allnext;
 	struct	kobject kobj;
 	unsigned long _flags;
 	void	*data;
@@ -110,14 +110,15 @@ static inline void of_node_put(struct device_node *node) { }
 #ifdef CONFIG_OF
 
 /* Pointer for first entry in chain of all nodes. */
-extern struct device_node *of_allnodes;
+extern struct list_head of_allnodes;
+extern struct device_node *of_root;
 extern struct device_node *of_chosen;
 extern struct device_node *of_aliases;
 extern raw_spinlock_t devtree_lock;
 
 static inline bool of_have_populated_dt(void)
 {
-	return of_allnodes != NULL;
+	return !list_empty(&of_allnodes);
 }
 
 static inline bool of_node_is_root(const struct device_node *node)
@@ -208,8 +209,6 @@ static inline const char *of_node_full_name(const struct device_node *np)
 	return np ? np->full_name : "<no-node>";
 }
 
-#define for_each_of_allnodes(dn) \
-	for (dn = of_allnodes; dn; dn = dn->allnext)
 extern struct device_node *of_find_node_by_name(struct device_node *from,
 	const char *name);
 extern struct device_node *of_find_node_by_type(struct device_node *from,
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 5c0ab057eecf..efa7615a1ce9 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -35,8 +35,7 @@ extern int of_fdt_is_compatible(const void *blob,
 				const char *compat);
 extern int of_fdt_match(const void *blob, unsigned long node,
 			const char *const *compat);
-extern void of_fdt_unflatten_tree(unsigned long *blob,
-			       struct device_node **mynodes);
+extern void of_fdt_unflatten_tree(unsigned long *blob, struct list_head *mynodes);
 
 /* TBD: Temporary export of fdt globals - remove when code fully merged */
 extern int __initdata dt_root_addr_cells;
diff --git a/include/linux/of_pdt.h b/include/linux/of_pdt.h
index c65a18a0cfdf..7e09244bb679 100644
--- a/include/linux/of_pdt.h
+++ b/include/linux/of_pdt.h
@@ -39,7 +39,6 @@ extern void *prom_early_alloc(unsigned long size);
 /* for building the device tree */
 extern void of_pdt_build_devicetree(phandle root_node, struct of_pdt_ops *ops);
 
-extern void (*of_pdt_build_more)(struct device_node *dp,
-		struct device_node ***nextp);
+extern void (*of_pdt_build_more)(struct device_node *dp);
 
 #endif /* _LINUX_OF_PDT_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
