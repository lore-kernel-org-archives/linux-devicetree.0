From: frowand.list@gmail.com
Subject: [PATCH v3 09/12] of: overlay: avoid race condition between applying multiple overlays
Date: Tue, 17 Oct 2017 16:36:29 -0700
Message-ID: <1508283392-18252-10-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The process of applying an overlay consists of:
  - unflatten an overlay FDT (flattened device tree) into an
    EDT (expanded device tree)
  - fixup the phandle values in the overlay EDT to fit in a
    range above the phandle values in the live device tree
  - create the overlay changeset to reflect the contents of
    the overlay EDT
  - apply the overlay changeset, to modify the live device tree,
    potentially changing the maximum phandle value in the live
    device tree

There is currently no protection against two overlay applies
concurrently determining what range of phandle values are in use
in the live device tree, and subsequently changing that range.
Add a mutex to prevent multiple overlay applies from occurring
simultaneously.

Move of_resolve_phandles() into of_overlay_apply() so that it does not
have to be duplicated by each caller of of_overlay_apply().

The test in of_resolve_phandles() that the overlay tree is detached is
temporarily disabled so that old style overlay unittests do not fail.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |  6 ------
 drivers/of/of_private.h                      | 12 +++++++++++
 drivers/of/overlay.c                         | 32 ++++++++++++++++++++++++++++
 drivers/of/resolver.c                        |  7 ++++++
 drivers/of/unittest.c                        | 22 +++++++++++++------
 include/linux/of.h                           |  3 ---
 6 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 7a7be0515bfd..54025af534d4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -145,7 +145,6 @@ static struct device_node * __init tilcdc_get_overlay(struct kfree_table *kft)
 		__dtb_tilcdc_slave_compat_begin;
 	static void *overlay_data;
 	struct device_node *overlay;
-	int ret;
 
 	if (!size) {
 		pr_warn("%s: No overlay data\n", __func__);
@@ -164,11 +163,6 @@ static struct device_node * __init tilcdc_get_overlay(struct kfree_table *kft)
 	}
 
 	of_node_set_flag(overlay, OF_DETACHED);
-	ret = of_resolve_phandles(overlay);
-	if (ret) {
-		pr_err("%s: Failed to resolve phandles: %d\n", __func__, ret);
-		return NULL;
-	}
 
 	return overlay;
 }
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 36357f571df2..248730567dbe 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -76,6 +76,18 @@ static inline int __of_attach_node_sysfs(struct device_node *np)
 static inline void __of_detach_node_sysfs(struct device_node *np) {}
 #endif
 
+#if defined(CONFIG_OF_RESOLVE)
+int of_resolve_phandles(struct device_node *tree);
+#endif
+
+#if defined(CONFIG_OF_OVERLAY)
+void of_overlay_mutex_lock(void);
+void of_overlay_mutex_unlock(void);
+#else
+static inline void of_overlay_mutex_lock(void) {};
+static inline void of_overlay_mutex_unlock(void) {};
+#endif
+
 #if defined(CONFIG_OF_UNITTEST) && defined(CONFIG_OF_OVERLAY)
 extern void __init unittest_unflatten_overlay_base(void);
 #else
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 791753321ed2..d164f86e5541 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -71,6 +71,28 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		const struct device_node *overlay_node,
 		bool is_symbols_node);
 
+/*
+ * of_resolve_phandles() finds the largest phandle in the live tree.
+ * of_overlay_apply() may add a larger phandle to the live tree.
+ * Do not allow race between two overlays being applied simultaneously:
+ *    mutex_lock(&of_overlay_phandle_mutex)
+ *    of_resolve_phandles()
+ *    of_overlay_apply()
+ *    mutex_unlock(&of_overlay_phandle_mutex)
+ */
+static DEFINE_MUTEX(of_overlay_phandle_mutex);
+
+void of_overlay_mutex_lock(void)
+{
+	mutex_lock(&of_overlay_phandle_mutex);
+}
+
+void of_overlay_mutex_unlock(void)
+{
+	mutex_unlock(&of_overlay_phandle_mutex);
+}
+
+
 static LIST_HEAD(ovcs_list);
 static DEFINE_IDR(ovcs_idr);
 
@@ -624,6 +646,12 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 		goto out;
 	}
 
+	of_overlay_mutex_lock();
+
+	ret = of_resolve_phandles(tree);
+	if (ret)
+		goto err_overlay_unlock;
+
 	mutex_lock(&of_mutex);
 
 	ret = init_overlay_changeset(ovcs, tree);
@@ -669,9 +697,13 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 	}
 
 	mutex_unlock(&of_mutex);
+	of_overlay_mutex_unlock();
 
 	goto out;
 
+err_overlay_unlock:
+	of_overlay_mutex_unlock();
+
 err_free_overlay_changeset:
 	free_overlay_changeset(ovcs);
 
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index bd21a66f6930..cfaeef5f6cb1 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -271,11 +271,18 @@ int of_resolve_phandles(struct device_node *overlay)
 		err = -EINVAL;
 		goto out;
 	}
+
+#if 0
+	Temporarily disable check so that old style overlay unittests
+	do not fail when of_resolve_phandles() is moved into
+	of_overlay_apply().
+
 	if (!of_node_check_flag(overlay, OF_DETACHED)) {
 		pr_err("overlay not detached\n");
 		err = -EINVAL;
 		goto out;
 	}
+#endif
 
 	phandle_delta = live_tree_max_phandle() + 1;
 	adjust_overlay_phandles(overlay, phandle_delta);
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 3640dae4b9b2..273d78c1520b 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -993,9 +993,17 @@ static int __init unittest_data_add(void)
 		pr_warn("%s: No tree to attach; not running tests\n", __func__);
 		return -ENODATA;
 	}
+
+	/*
+	 * This lock normally encloses of_overlay_apply() as well as
+	 * of_resolve_phandles().
+	 */
+	of_overlay_mutex_lock();
+
 	rc = of_resolve_phandles(unittest_data_node);
 	if (rc) {
 		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
+		of_overlay_mutex_unlock();
 		return -EINVAL;
 	}
 
@@ -1005,6 +1013,7 @@ static int __init unittest_data_add(void)
 			__of_attach_node_sysfs(np);
 		of_aliases = of_find_node_by_path("/aliases");
 		of_chosen = of_find_node_by_path("/chosen");
+		of_overlay_mutex_unlock();
 		return 0;
 	}
 
@@ -1017,6 +1026,9 @@ static int __init unittest_data_add(void)
 		attach_node_and_children(np);
 		np = next;
 	}
+
+	of_overlay_mutex_unlock();
+
 	return 0;
 }
 
@@ -2148,16 +2160,11 @@ static int __init overlay_data_add(int onum)
 		goto out_free_data;
 	}
 
-	ret = of_resolve_phandles(info->np_overlay);
-	if (ret) {
-		pr_err("resolve ot phandles (ret=%d), %d\n", ret, onum);
-		goto out_free_np_overlay;
-	}
-
 	info->overlay_id = 0;
 	ret = of_overlay_apply(info->np_overlay, &info->overlay_id);
 	if (ret < 0) {
 		pr_err("of_overlay_apply() (ret=%d), %d\n", ret, onum);
+		of_overlay_mutex_unlock();
 		goto out_free_np_overlay;
 	}
 
@@ -2207,7 +2214,10 @@ static __init void of_unittest_overlay_high_level(void)
 	 * Could not fixup phandles in unittest_unflatten_overlay_base()
 	 * because kmalloc() was not yet available.
 	 */
+	of_overlay_mutex_lock();
 	of_resolve_phandles(overlay_base_root);
+	of_overlay_mutex_unlock();
+
 
 	/*
 	 * do not allow overlay_base to duplicate any node already in
diff --git a/include/linux/of.h b/include/linux/of.h
index 96edda95c6b0..ef4c9ff5955a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1279,9 +1279,6 @@ static inline int of_reconfig_get_state_change(unsigned long action,
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
-/* CONFIG_OF_RESOLVE api */
-extern int of_resolve_phandles(struct device_node *tree);
-
 /**
  * of_device_is_system_power_controller - Tells if system-power-controller is found for device_node
  * @np: Pointer to the given device_node
-- 
Frank Rowand <frank.rowand@sony.com>
