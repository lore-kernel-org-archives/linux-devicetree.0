From: Rob Herring <robh@kernel.org>
Subject: [PATCH 6/6] of: make kobject and bin_attribute support configurable
Date: Thu,  5 Oct 2017 14:44:22 -0500
Message-ID: <20171005194422.26224-7-robh@kernel.org>
References: <20171005194422.26224-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Having device_nodes be kobjects is only needed if sysfs or OF_DYNAMIC is
enabled. Otherwise, having a kobject in struct device_node is
unnecessary bloat in minimal kernel configurations.

Likewise, bin_attribute is only needed in struct property when sysfs is
enabled, so we can make it configurable too.

Cc: Nicolas Pitre <nico@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/Kconfig      |   4 ++
 drivers/of/Makefile     |   1 +
 drivers/of/base.c       | 130 --------------------------------------
 drivers/of/dynamic.c    |  22 -------
 drivers/of/kobj.c       | 164 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/of/of_private.h |  23 +++++++
 include/linux/of.h      |  22 +++----
 7 files changed, 202 insertions(+), 164 deletions(-)
 create mode 100644 drivers/of/kobj.c

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index ba7b034b2b91..ad9a9578f9c4 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -46,10 +46,14 @@ config OF_EARLY_FLATTREE
 config OF_PROMTREE
 	bool
 
+config OF_KOBJ
+	def_bool SYSFS
+
 # Hardly any platforms need this.  It is safe to select, but only do so if you
 # need it.
 config OF_DYNAMIC
 	bool "Support for dynamic device trees" if OF_UNITTEST
+	select OF_KOBJ
 	help
 	  On some platforms, the device tree can be manipulated at runtime.
 	  While this option is selected automatically on such platforms, you
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 97dc01c81438..83d61a7c5e82 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -1,4 +1,5 @@
 obj-y = base.o device.o platform.o property.o
+obj-$(CONFIG_OF_KOBJ) += kobj.o
 obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
 obj-$(CONFIG_OF_FLATTREE) += fdt.o
 obj-$(CONFIG_OF_EARLY_FLATTREE) += fdt_address.o
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9e9bd17121fb..b98f3adffbb0 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -95,105 +95,6 @@ int __weak of_node_to_nid(struct device_node *np)
 }
 #endif
 
-#ifndef CONFIG_OF_DYNAMIC
-static void of_node_release(struct kobject *kobj)
-{
-	/* Without CONFIG_OF_DYNAMIC, no nodes gets freed */
-}
-#endif /* CONFIG_OF_DYNAMIC */
-
-struct kobj_type of_node_ktype = {
-	.release = of_node_release,
-};
-
-static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *bin_attr, char *buf,
-				loff_t offset, size_t count)
-{
-	struct property *pp = container_of(bin_attr, struct property, attr);
-	return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
-}
-
-/* always return newly allocated name, caller must free after use */
-static const char *safe_name(struct kobject *kobj, const char *orig_name)
-{
-	const char *name = orig_name;
-	struct kernfs_node *kn;
-	int i = 0;
-
-	/* don't be a hero. After 16 tries give up */
-	while (i < 16 && (kn = sysfs_get_dirent(kobj->sd, name))) {
-		sysfs_put(kn);
-		if (name != orig_name)
-			kfree(name);
-		name = kasprintf(GFP_KERNEL, "%s#%i", orig_name, ++i);
-	}
-
-	if (name == orig_name) {
-		name = kstrdup(orig_name, GFP_KERNEL);
-	} else {
-		pr_warn("Duplicate name in %s, renamed to \"%s\"\n",
-			kobject_name(kobj), name);
-	}
-	return name;
-}
-
-int __of_add_property_sysfs(struct device_node *np, struct property *pp)
-{
-	int rc;
-
-	/* Important: Don't leak passwords */
-	bool secure = strncmp(pp->name, "security-", 9) == 0;
-
-	if (!IS_ENABLED(CONFIG_SYSFS))
-		return 0;
-
-	if (!of_kset || !of_node_is_attached(np))
-		return 0;
-
-	sysfs_bin_attr_init(&pp->attr);
-	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
-	pp->attr.attr.mode = secure ? 0400 : 0444;
-	pp->attr.size = secure ? 0 : pp->length;
-	pp->attr.read = of_node_property_read;
-
-	rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
-	WARN(rc, "error adding attribute %s to node %pOF\n", pp->name, np);
-	return rc;
-}
-
-int __of_attach_node_sysfs(struct device_node *np)
-{
-	const char *name;
-	struct kobject *parent;
-	struct property *pp;
-	int rc;
-
-	if (!of_kset)
-		return 0;
-
-	np->kobj.kset = of_kset;
-	if (!np->parent) {
-		/* Nodes without parents are new top level trees */
-		name = safe_name(&of_kset->kobj, "base");
-		parent = NULL;
-	} else {
-		name = safe_name(&np->parent->kobj, kbasename(np->full_name));
-		parent = &np->parent->kobj;
-	}
-	if (!name)
-		return -ENOMEM;
-	rc = kobject_add(&np->kobj, parent, "%s", name);
-	kfree(name);
-	if (rc)
-		return rc;
-
-	for_each_property_of_node(np, pp)
-		__of_add_property_sysfs(np, pp);
-
-	return 0;
-}
-
 void __init of_core_init(void)
 {
 	struct device_node *np;
@@ -1501,22 +1402,6 @@ int __of_remove_property(struct device_node *np, struct property *prop)
 	return 0;
 }
 
-void __of_sysfs_remove_bin_file(struct device_node *np, struct property *prop)
-{
-	sysfs_remove_bin_file(&np->kobj, &prop->attr);
-	kfree(prop->attr.attr.name);
-}
-
-void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
-{
-	if (!IS_ENABLED(CONFIG_SYSFS))
-		return;
-
-	/* at early boot, bail here and defer setup to of_init() */
-	if (of_kset && of_node_is_attached(np))
-		__of_sysfs_remove_bin_file(np, prop);
-}
-
 /**
  * of_remove_property - Remove a property from a node.
  *
@@ -1576,21 +1461,6 @@ int __of_update_property(struct device_node *np, struct property *newprop,
 	return 0;
 }
 
-void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
-		struct property *oldprop)
-{
-	if (!IS_ENABLED(CONFIG_SYSFS))
-		return;
-
-	/* At early boot, bail out and defer setup to of_init() */
-	if (!of_kset)
-		return;
-
-	if (oldprop)
-		__of_sysfs_remove_bin_file(np, oldprop);
-	__of_add_property_sysfs(np, newprop);
-}
-
 /*
  * of_update_property - Update a property in a node, if the property does
  * not exist, add it.
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 9d6ba18c529f..39e8cf731764 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -48,28 +48,6 @@ void of_node_put(struct device_node *node)
 }
 EXPORT_SYMBOL(of_node_put);
 
-void __of_detach_node_sysfs(struct device_node *np)
-{
-	struct property *pp;
-
-	if (!IS_ENABLED(CONFIG_SYSFS))
-		return;
-
-	BUG_ON(!of_node_is_initialized(np));
-	if (!of_kset)
-		return;
-
-	/* only remove properties if on sysfs */
-	if (of_node_is_attached(np)) {
-		for_each_property_of_node(np, pp)
-			__of_sysfs_remove_bin_file(np, pp);
-		kobject_del(&np->kobj);
-	}
-
-	/* finally remove the kobj_init ref */
-	of_node_put(np);
-}
-
 static BLOCKING_NOTIFIER_HEAD(of_reconfig_chain);
 
 int of_reconfig_notifier_register(struct notifier_block *nb)
diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
new file mode 100644
index 000000000000..250fc7bb550f
--- /dev/null
+++ b/drivers/of/kobj.c
@@ -0,0 +1,164 @@
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#include "of_private.h"
+
+/* true when node is initialized */
+static int of_node_is_initialized(struct device_node *node)
+{
+	return node && node->kobj.state_initialized;
+}
+
+/* true when node is attached (i.e. present on sysfs) */
+int of_node_is_attached(struct device_node *node)
+{
+	return node && node->kobj.state_in_sysfs;
+}
+
+
+#ifndef CONFIG_OF_DYNAMIC
+static void of_node_release(struct kobject *kobj)
+{
+	/* Without CONFIG_OF_DYNAMIC, no nodes gets freed */
+}
+#endif /* CONFIG_OF_DYNAMIC */
+
+struct kobj_type of_node_ktype = {
+	.release = of_node_release,
+};
+
+static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
+				struct bin_attribute *bin_attr, char *buf,
+				loff_t offset, size_t count)
+{
+	struct property *pp = container_of(bin_attr, struct property, attr);
+	return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
+}
+
+/* always return newly allocated name, caller must free after use */
+static const char *safe_name(struct kobject *kobj, const char *orig_name)
+{
+	const char *name = orig_name;
+	struct kernfs_node *kn;
+	int i = 0;
+
+	/* don't be a hero. After 16 tries give up */
+	while (i < 16 && (kn = sysfs_get_dirent(kobj->sd, name))) {
+		sysfs_put(kn);
+		if (name != orig_name)
+			kfree(name);
+		name = kasprintf(GFP_KERNEL, "%s#%i", orig_name, ++i);
+	}
+
+	if (name == orig_name) {
+		name = kstrdup(orig_name, GFP_KERNEL);
+	} else {
+		pr_warn("Duplicate name in %s, renamed to \"%s\"\n",
+			kobject_name(kobj), name);
+	}
+	return name;
+}
+
+int __of_add_property_sysfs(struct device_node *np, struct property *pp)
+{
+	int rc;
+
+	/* Important: Don't leak passwords */
+	bool secure = strncmp(pp->name, "security-", 9) == 0;
+
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return 0;
+
+	if (!of_kset || !of_node_is_attached(np))
+		return 0;
+
+	sysfs_bin_attr_init(&pp->attr);
+	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
+	pp->attr.attr.mode = secure ? 0400 : 0444;
+	pp->attr.size = secure ? 0 : pp->length;
+	pp->attr.read = of_node_property_read;
+
+	rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
+	WARN(rc, "error adding attribute %s to node %pOF\n", pp->name, np);
+	return rc;
+}
+
+void __of_sysfs_remove_bin_file(struct device_node *np, struct property *prop)
+{
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return;
+
+	sysfs_remove_bin_file(&np->kobj, &prop->attr);
+	kfree(prop->attr.attr.name);
+}
+
+void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
+{
+	/* at early boot, bail here and defer setup to of_init() */
+	if (of_kset && of_node_is_attached(np))
+		__of_sysfs_remove_bin_file(np, prop);
+}
+
+void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
+		struct property *oldprop)
+{
+	/* At early boot, bail out and defer setup to of_init() */
+	if (!of_kset)
+		return;
+
+	if (oldprop)
+		__of_sysfs_remove_bin_file(np, oldprop);
+	__of_add_property_sysfs(np, newprop);
+}
+
+int __of_attach_node_sysfs(struct device_node *np)
+{
+	const char *name;
+	struct kobject *parent;
+	struct property *pp;
+	int rc;
+
+	if (!of_kset)
+		return 0;
+
+	np->kobj.kset = of_kset;
+	if (!np->parent) {
+		/* Nodes without parents are new top level trees */
+		name = safe_name(&of_kset->kobj, "base");
+		parent = NULL;
+	} else {
+		name = safe_name(&np->parent->kobj, kbasename(np->full_name));
+		parent = &np->parent->kobj;
+	}
+	if (!name)
+		return -ENOMEM;
+	rc = kobject_add(&np->kobj, parent, "%s", name);
+	kfree(name);
+	if (rc)
+		return rc;
+
+	for_each_property_of_node(np, pp)
+		__of_add_property_sysfs(np, pp);
+
+	return 0;
+}
+
+void __of_detach_node_sysfs(struct device_node *np)
+{
+	struct property *pp;
+
+	BUG_ON(!of_node_is_initialized(np));
+	if (!of_kset)
+		return;
+
+	/* only remove properties if on sysfs */
+	if (of_node_is_attached(np)) {
+		for_each_property_of_node(np, pp)
+			__of_sysfs_remove_bin_file(np, pp);
+		kobject_del(&np->kobj);
+	}
+
+	/* finally remove the kobj_init ref */
+	of_node_put(np);
+}
+
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index cc86a974f35f..43df14f0cbce 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -49,6 +49,29 @@ static inline int of_property_notify(int action, struct device_node *np,
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
+#if defined(CONFIG_OF_KOBJ)
+int of_node_is_attached(struct device_node *node);
+int __of_add_property_sysfs(struct device_node *np, struct property *pp);
+void __of_remove_property_sysfs(struct device_node *np, struct property *prop);
+void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
+		struct property *oldprop);
+int __of_attach_node_sysfs(struct device_node *np);
+void __of_detach_node_sysfs(struct device_node *np);
+#else
+static inline int __of_add_property_sysfs(struct device_node *np, struct property *pp)
+{
+	return 0;
+}
+static inline void __of_remove_property_sysfs(struct device_node *np, struct property *prop) {}
+static inline void __of_update_property_sysfs(struct device_node *np,
+		struct property *newprop, struct property *oldprop) {}
+static inline int __of_attach_node_sysfs(struct device_node *np)
+{
+	return 0;
+}
+static inline void __of_detach_node_sysfs(struct device_node *np) {}
+#endif
+
 #if defined(CONFIG_OF_UNITTEST) && defined(CONFIG_OF_OVERLAY)
 extern void __init unittest_unflatten_overlay_base(void);
 #else
diff --git a/include/linux/of.h b/include/linux/of.h
index 2d685e769409..7b0f17be7830 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -43,7 +43,9 @@ struct property {
 #if defined(CONFIG_OF_PROMTREE)
 	unsigned int unique_id;
 #endif
+#if defined(CONFIG_OF_KOBJ)
 	struct bin_attribute attr;
+#endif
 };
 
 #if defined(CONFIG_SPARC)
@@ -62,7 +64,9 @@ struct device_node {
 	struct	device_node *parent;
 	struct	device_node *child;
 	struct	device_node *sibling;
+#if defined(CONFIG_OF_KOBJ)
 	struct	kobject kobj;
+#endif
 	unsigned long _flags;
 	void	*data;
 #if defined(CONFIG_SPARC)
@@ -107,23 +111,17 @@ extern struct kobj_type of_node_ktype;
 extern const struct fwnode_operations of_fwnode_ops;
 static inline void of_node_init(struct device_node *node)
 {
+#if defined(CONFIG_OF_KOBJ)
 	kobject_init(&node->kobj, &of_node_ktype);
+#endif
 	node->fwnode.ops = &of_fwnode_ops;
 }
 
+#if defined(CONFIG_OF_KOBJ)
 #define of_node_kobj(n) (&(n)->kobj)
-
-/* true when node is initialized */
-static inline int of_node_is_initialized(struct device_node *node)
-{
-	return node && node->kobj.state_initialized;
-}
-
-/* true when node is attached (i.e. present on sysfs) */
-static inline int of_node_is_attached(struct device_node *node)
-{
-	return node && node->kobj.state_in_sysfs;
-}
+#else
+#define of_node_kobj(n) NULL
+#endif
 
 #ifdef CONFIG_OF_DYNAMIC
 extern struct device_node *of_node_get(struct device_node *node);
-- 
2.11.0
