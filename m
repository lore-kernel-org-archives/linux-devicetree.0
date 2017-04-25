From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3 1/4] of: remove *phandle properties from expanded device tree
Date: Tue, 25 Apr 2017 01:47:26 -0700
Message-ID: <1493110049-30165-2-git-send-email-frowand.list@gmail.com>
References: <1493110049-30165-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493110049-30165-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Remove "phandle", "linux,phandle", and "ibm,phandle" properties from
the internal device tree.  The phandle will still be in the struct
device_node phandle field.

This is to resolve the issue found by Stephen Boyd [1] when he changed
the type of struct property.value from void * to const void *.  As
a result of the type change, the overlay code had compile errors
where the resolver updates phandle values.

  [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html

- Add sysfs infrastructure to report np->phandle, as if it was a property.
- Do not create "phandle" "ibm,phandle", and "linux,phandle" properties
  in the expanded device tree.
- Remove phandle properties in of_attach_node(), for nodes dynamically
  attached to the live tree.  Add the phandle sysfs entry for these nodes.
- When creating an overlay changeset, duplicate the node phandle in
  __of_node_dup().
- Remove no longer needed checks to exclude "phandle" and "linux,phandle"
  properties in several locations.
- A side effect of these changes is that the obsolete "linux,phandle" and
  "ibm,phandle" properties will no longer appear in /proc/device-tree (they
  will appear as "phandle").

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/base.c       | 48 ++++++++++++++++++++++++++++++++++++++++---
 drivers/of/dynamic.c    | 54 +++++++++++++++++++++++++++++++++++++------------
 drivers/of/fdt.c        | 40 +++++++++++++++++++++---------------
 drivers/of/of_private.h |  1 +
 drivers/of/overlay.c    |  4 +---
 drivers/of/resolver.c   | 23 +--------------------
 include/linux/of.h      |  1 +
 7 files changed, 114 insertions(+), 57 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d7c4629a3a2d..41473b1e2445 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -116,6 +116,19 @@ static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
 	return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
 }
 
+static ssize_t of_node_phandle_read(struct file *filp, struct kobject *kobj,
+				struct bin_attribute *bin_attr, char *buf,
+				loff_t offset, size_t count)
+{
+	phandle phandle;
+	struct device_node *np;
+
+	np = container_of(bin_attr, struct device_node, attr_phandle);
+	phandle = cpu_to_be32(np->phandle);
+	return memory_read_from_buffer(buf, count, &offset, &phandle,
+				       sizeof(phandle));
+}
+
 /* always return newly allocated name, caller must free after use */
 static const char *safe_name(struct kobject *kobj, const char *orig_name)
 {
@@ -164,6 +177,35 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	return rc;
 }
 
+/*
+ * In the imported device tree (fdt), phandle is a property.  In the
+ * internal data structure it is instead stored in the struct device_node.
+ * Make phandle visible in sysfs as if it was a property.
+ */
+int __of_add_phandle_sysfs(struct device_node *np)
+{
+	int rc;
+
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return 0;
+
+	if (!of_kset || !of_node_is_attached(np))
+		return 0;
+
+	if (!np->phandle || np->phandle == 0xffffffff)
+		return 0;
+
+	sysfs_bin_attr_init(&pp->attr);
+	np->attr_phandle.attr.name = "phandle";
+	np->attr_phandle.attr.mode = 0444;
+	np->attr_phandle.size = sizeof(np->phandle);
+	np->attr_phandle.read = of_node_phandle_read;
+
+	rc = sysfs_create_bin_file(&np->kobj, &np->attr_phandle);
+	WARN(rc, "error adding attribute phandle to node %s\n", np->full_name);
+	return rc;
+}
+
 int __of_attach_node_sysfs(struct device_node *np)
 {
 	const char *name;
@@ -193,6 +235,8 @@ int __of_attach_node_sysfs(struct device_node *np)
 	if (rc)
 		return rc;
 
+	__of_add_phandle_sysfs(np);
+
 	for_each_property_of_node(np, pp)
 		__of_add_property_sysfs(np, pp);
 
@@ -2097,9 +2141,7 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 		int id, len;
 
 		/* Skip those we do not want to proceed */
-		if (!strcmp(pp->name, "name") ||
-		    !strcmp(pp->name, "phandle") ||
-		    !strcmp(pp->name, "linux,phandle"))
+		if (!strcmp(pp->name, "name"))
 			continue;
 
 		np = of_find_node_by_path(pp->value);
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 888fdbc09992..59545b8fbf46 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -218,19 +218,6 @@ int of_property_notify(int action, struct device_node *np,
 
 void __of_attach_node(struct device_node *np)
 {
-	const __be32 *phandle;
-	int sz;
-
-	np->name = __of_get_property(np, "name", NULL) ? : "<NULL>";
-	np->type = __of_get_property(np, "device_type", NULL) ? : "<NULL>";
-
-	phandle = __of_get_property(np, "phandle", &sz);
-	if (!phandle)
-		phandle = __of_get_property(np, "linux,phandle", &sz);
-	if (IS_ENABLED(CONFIG_PPC_PSERIES) && !phandle)
-		phandle = __of_get_property(np, "ibm,phandle", &sz);
-	np->phandle = (phandle && (sz >= 4)) ? be32_to_cpup(phandle) : 0;
-
 	np->child = NULL;
 	np->sibling = np->parent->child;
 	np->parent->child = np;
@@ -243,11 +230,47 @@ void __of_attach_node(struct device_node *np)
 int of_attach_node(struct device_node *np)
 {
 	struct of_reconfig_data rd;
+	struct property *prev;
+	struct property *prop;
+	struct property *save_next;
 	unsigned long flags;
+	const __be32 *phandle;
+	int sz;
 
 	memset(&rd, 0, sizeof(rd));
 	rd.dn = np;
 
+	np->name = __of_get_property(np, "name", NULL) ? : "<NULL>";
+	np->type = __of_get_property(np, "device_type", NULL) ? : "<NULL>";
+
+	phandle = __of_get_property(np, "phandle", &sz);
+	if (!phandle)
+		phandle = __of_get_property(np, "linux,phandle", &sz);
+	if (IS_ENABLED(CONFIG_PPC_PSERIES) && !phandle)
+		phandle = __of_get_property(np, "ibm,phandle", &sz);
+	np->phandle = (phandle && (sz >= 4)) ? be32_to_cpup(phandle) : 0;
+
+	/* remove phandle properties from node */
+	prev = NULL;
+	for (prop = np->properties; prop != NULL; ) {
+		save_next = prop->next;
+		if (!strcmp(prop->name, "phandle") ||
+		    !strcmp(prop->name, "ibm,phandle") ||
+		    !strcmp(prop->name, "linux,phandle")) {
+			if (prev)
+				prev->next = prop->next;
+			else
+				np->properties = prop->next;
+			prop->next = np->deadprops;
+			np->deadprops = prop;
+		} else {
+			prev = prop;
+		}
+		prop = save_next;
+	}
+
+	__of_add_phandle_sysfs(np);
+
 	mutex_lock(&of_mutex);
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	__of_attach_node(np);
@@ -429,6 +452,7 @@ struct device_node *__of_node_dup(const struct device_node *np, const char *fmt,
 	/* Iterate over and duplicate all properties */
 	if (np) {
 		struct property *pp, *new_pp;
+		node->phandle = np->phandle;
 		for_each_property_of_node(np, pp) {
 			new_pp = __of_prop_dup(pp, GFP_KERNEL);
 			if (!new_pp)
@@ -441,6 +465,10 @@ struct device_node *__of_node_dup(const struct device_node *np, const char *fmt,
 			}
 		}
 	}
+
+	node->name = __of_get_property(node, "name", NULL) ? : "<NULL>";
+	node->type = __of_get_property(node, "device_type", NULL) ? : "<NULL>";
+
 	return node;
 
  err_prop:
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index e5ce4b59e162..270f31b0c259 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -181,6 +181,8 @@ static void populate_properties(const void *blob,
 		const __be32 *val;
 		const char *pname;
 		u32 sz;
+		int prop_is_phandle = 0;
+		int prop_is_ibm_phandle = 0;
 
 		val = fdt_getprop_by_offset(blob, cur, &pname, &sz);
 		if (!val) {
@@ -196,11 +198,6 @@ static void populate_properties(const void *blob,
 		if (!strcmp(pname, "name"))
 			has_name = true;
 
-		pp = unflatten_dt_alloc(mem, sizeof(struct property),
-					__alignof__(struct property));
-		if (dryrun)
-			continue;
-
 		/* We accept flattened tree phandles either in
 		 * ePAPR-style "phandle" properties, or the
 		 * legacy "linux,phandle" properties.  If both
@@ -208,23 +205,34 @@ static void populate_properties(const void *blob,
 		 * will get weird. Don't do that.
 		 */
 		if (!strcmp(pname, "phandle") ||
-		    !strcmp(pname, "linux,phandle")) {
-			if (!np->phandle)
-				np->phandle = be32_to_cpup(val);
-		}
+		    !strcmp(pname, "linux,phandle"))
+			prop_is_phandle = 1;
 
 		/* And we process the "ibm,phandle" property
 		 * used in pSeries dynamic device tree
 		 * stuff
 		 */
-		if (!strcmp(pname, "ibm,phandle"))
-			np->phandle = be32_to_cpup(val);
+		if (!strcmp(pname, "ibm,phandle")) {
+			prop_is_phandle = 1;
+			prop_is_ibm_phandle = 1;
+		}
+
+		if (!prop_is_phandle)
+			pp = unflatten_dt_alloc(mem, sizeof(struct property),
+						__alignof__(struct property));
 
-		pp->name   = (char *)pname;
-		pp->length = sz;
-		pp->value  = (__be32 *)val;
-		*pprev     = pp;
-		pprev      = &pp->next;
+		if (dryrun)
+			continue;
+
+		if (!prop_is_phandle) {
+			pp->name   = (char *)pname;
+			pp->length = sz;
+			pp->value  = (__be32 *)val;
+			*pprev     = pp;
+			pprev      = &pp->next;
+		} else if (prop_is_ibm_phandle || !np->phandle) {
+			np->phandle = be32_to_cpup(val);
+		}
 	}
 
 	/* With version 0x10 we may not have the name property,
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 18bbb4517e25..33f11a5384f3 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -47,6 +47,7 @@ extern int of_property_notify(int action, struct device_node *np,
 extern void of_node_release(struct kobject *kobj);
 extern int __of_changeset_apply(struct of_changeset *ocs);
 extern int __of_changeset_revert(struct of_changeset *ocs);
+extern int __of_add_phandle_sysfs(struct device_node *np);
 #else /* CONFIG_OF_DYNAMIC */
 static inline int of_property_notify(int action, struct device_node *np,
 				     struct property *prop, struct property *old_prop)
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 7827786718d8..ca0b85f5deb1 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -101,9 +101,7 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 	tprop = of_find_property(target, prop->name, NULL);
 
 	/* special properties are not meant to be updated (silent NOP) */
-	if (of_prop_cmp(prop->name, "name") == 0 ||
-	    of_prop_cmp(prop->name, "phandle") == 0 ||
-	    of_prop_cmp(prop->name, "linux,phandle") == 0)
+	if (!of_prop_cmp(prop->name, "name"))
 		return 0;
 
 	propn = __of_prop_dup(prop, GFP_KERNEL);
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 7ae9863cb0a4..624cbaeae0a4 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -71,30 +71,11 @@ static void adjust_overlay_phandles(struct device_node *overlay,
 		int phandle_delta)
 {
 	struct device_node *child;
-	struct property *prop;
-	phandle phandle;
 
 	/* adjust node's phandle in node */
 	if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL)
 		overlay->phandle += phandle_delta;
 
-	/* copy adjusted phandle into *phandle properties */
-	for_each_property_of_node(overlay, prop) {
-
-		if (of_prop_cmp(prop->name, "phandle") &&
-		    of_prop_cmp(prop->name, "linux,phandle"))
-			continue;
-
-		if (prop->length < 4)
-			continue;
-
-		phandle = be32_to_cpup(prop->value);
-		if (phandle == OF_PHANDLE_ILLEGAL)
-			continue;
-
-		*(uint32_t *)prop->value = cpu_to_be32(overlay->phandle);
-	}
-
 	for_each_child_of_node(overlay, child)
 		adjust_overlay_phandles(child, phandle_delta);
 }
@@ -197,9 +178,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 	for_each_property_of_node(local_fixups, prop_fix) {
 
 		/* skip properties added automatically */
-		if (!of_prop_cmp(prop_fix->name, "name") ||
-		    !of_prop_cmp(prop_fix->name, "phandle") ||
-		    !of_prop_cmp(prop_fix->name, "linux,phandle"))
+		if (!of_prop_cmp(prop_fix->name, "name"))
 			continue;
 
 		if ((prop_fix->length % 4) != 0 || prop_fix->length == 0)
diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323de0f3..4e86e05853f3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -61,6 +61,7 @@ struct device_node {
 	struct	kobject kobj;
 	unsigned long _flags;
 	void	*data;
+	struct bin_attribute attr_phandle;
 #if defined(CONFIG_SPARC)
 	const char *path_component_name;
 	unsigned int unique_id;
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
