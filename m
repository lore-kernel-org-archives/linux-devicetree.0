From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] Removes OF_SELFTEST dependency on OF_DYNAMIC config symbol
Date: Sat, 13 Sep 2014 05:35:08 -0700
Message-ID: <1410611708-9369-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is used to remove the selftests dependency on
OF_DYNAMIC config flag. Now, it selectively builds only
 the functions required by the selftests.

Tested with and without OF_DYNAMIC enabled.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/Kconfig    |   1 -
 drivers/of/selftest.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 5160c4e..1fe3805 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -10,7 +10,6 @@ menu "Device Tree and Open Firmware support"
 config OF_SELFTEST
 	bool "Device Tree Runtime self tests"
 	depends on OF_IRQ && OF_EARLY_FLATTREE
-	select OF_DYNAMIC
 	help
 	  This option builds in test cases for the device tree infrastructure
 	  that are executed once at boot time, and the results dumped to the
diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index a737cb5..4b2704e 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -600,6 +600,116 @@ static void __init of_selftest_platform_populate(void)
 	}
 }
 
+#if !defined(CONFIG_OF_DYNAMIC)
+/**
+ * of_attach_node() - Plug a device node into the tree and global list.
+ */
+int of_attach_node(struct device_node *np)
+{
+	unsigned long flags;
+	const __be32 *phandle;
+	int sz;
+
+	mutex_lock(&of_mutex);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	np->name = __of_get_property(np, "name", NULL) ? : "<NULL>";
+	np->type = __of_get_property(np, "device_type", NULL) ? : "<NULL>";
+
+	phandle = __of_get_property(np, "phandle", &sz);
+	if (!phandle)
+		phandle = __of_get_property(np, "linux,phandle", &sz);
+	np->phandle = (phandle && (sz >= 4)) ? be32_to_cpup(phandle) : 0;
+
+	np->child = NULL;
+	np->sibling = np->parent->child;
+	np->allnext = np->parent->allnext;
+	np->parent->allnext = np;
+	np->parent->child = np;
+	of_node_clear_flag(np, OF_DETACHED);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	__of_attach_node_sysfs(np);
+	mutex_unlock(&of_mutex);
+
+	return 0;
+}
+
+void __of_detach_node_sysfs(struct device_node *np)
+{
+	struct property *pp;
+
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return;
+
+	BUG_ON(!of_node_is_initialized(np));
+	if (!of_kset)
+		return;
+
+	/* only remove properties if on sysfs */
+	if (of_node_is_attached(np)) {
+		for_each_property_of_node(np, pp)
+			sysfs_remove_bin_file(&np->kobj, &pp->attr);
+		kobject_del(&np->kobj);
+	}
+
+	/* finally remove the kobj_init ref */
+	of_node_put(np);
+}
+
+/**
+ * of_detach_node() - "Unplug" a node from the device tree.
+ *
+ * The caller must hold a reference to the node.  The memory associated with
+ * the node is not freed until its refcount goes to zero.
+ */
+int of_detach_node(struct device_node *np)
+{
+	unsigned long flags;
+	int rc = 0;
+	struct device_node *parent;
+
+	mutex_lock(&of_mutex);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+
+	if (!WARN_ON(of_node_check_flag(np, OF_DETACHED))) {
+		parent = np->parent;
+		if (!WARN_ON(!parent)) {
+			if (of_allnodes == np)
+				of_allnodes = np->allnext;
+			else {
+				struct device_node *prev;
+
+				for (prev = of_allnodes;
+					prev->allnext != np;
+					prev = prev->allnext)
+					;
+				prev->allnext = np->allnext;
+			}
+
+			if (parent->child == np)
+				parent->child = np->sibling;
+			else {
+				struct device_node *prevsib;
+
+				for (prevsib = np->parent->child;
+					prevsib->sibling != np;
+					prevsib = prevsib->sibling)
+						;
+				prevsib->sibling = np->sibling;
+			}
+
+			of_node_set_flag(np, OF_DETACHED);
+		}
+	}
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	__of_detach_node_sysfs(np);
+	mutex_unlock(&of_mutex);
+
+	return rc;
+}
+#endif
+
 /**
  *	update_node_properties - adds the properties
  *	of np into dup node (present in live tree) and
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
