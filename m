From: frowand.list@gmail.com
Subject: [PATCH 09/12] of: overlay: avoid race condition between applying multiple overlays
Date: Mon,  2 Oct 2017 20:53:43 -0700
Message-ID: <1507002826-16393-10-git-send-email-frowand.list@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
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

Ignoring 2 checkpatch warnings: Prefer using '"%s...", __func__'
so that the WARN() string will be more easily grepped.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |  7 +++++++
 drivers/of/overlay.c                         | 22 ++++++++++++++++++++++
 drivers/of/unittest.c                        | 21 +++++++++++++++++++++
 include/linux/of.h                           | 19 +++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 7a7be0515bfd..c99f7924b1c6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -221,6 +221,11 @@ static void __init tilcdc_convert_slave_node(void)
 		goto out;
 	}
 
+	/*
+	 * protect from of_resolve_phandles() through of_overlay_apply()
+	 */
+	of_overlay_mutex_lock();
+
 	overlay = tilcdc_get_overlay(&kft);
 	if (!overlay)
 		goto out;
@@ -256,6 +261,8 @@ static void __init tilcdc_convert_slave_node(void)
 		pr_info("%s: ti,tilcdc,slave node successfully converted\n",
 			__func__);
 out:
+	of_overlay_mutex_unlock();
+
 	kfree_table_free(&kft);
 	of_node_put(i2c);
 	of_node_put(slave);
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index a0d3222febdc..4ed372af6ce7 100644
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
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index db2f170186de..f4c8aff21320 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -994,9 +994,17 @@ static int __init unittest_data_add(void)
 		return -ENODATA;
 	}
 	of_node_set_flag(unittest_data_node, OF_DETACHED);
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
 
@@ -1006,6 +1014,7 @@ static int __init unittest_data_add(void)
 			__of_attach_node_sysfs(np);
 		of_aliases = of_find_node_by_path("/aliases");
 		of_chosen = of_find_node_by_path("/chosen");
+		of_overlay_mutex_unlock();
 		return 0;
 	}
 
@@ -1018,6 +1027,9 @@ static int __init unittest_data_add(void)
 		attach_node_and_children(np);
 		np = next;
 	}
+
+	of_overlay_mutex_unlock();
+
 	return 0;
 }
 
@@ -2150,9 +2162,12 @@ static int __init overlay_data_add(int onum)
 	}
 	of_node_set_flag(info->np_overlay, OF_DETACHED);
 
+	of_overlay_mutex_lock();
+
 	ret = of_resolve_phandles(info->np_overlay);
 	if (ret) {
 		pr_err("resolve ot phandles (ret=%d), %d\n", ret, onum);
+		of_overlay_mutex_unlock();
 		goto out_free_np_overlay;
 	}
 
@@ -2160,9 +2175,12 @@ static int __init overlay_data_add(int onum)
 	ret = of_overlay_apply(info->np_overlay, &info->overlay_id);
 	if (ret < 0) {
 		pr_err("of_overlay_apply() (ret=%d), %d\n", ret, onum);
+		of_overlay_mutex_unlock();
 		goto out_free_np_overlay;
 	}
 
+	of_overlay_mutex_unlock();
+
 	pr_debug("__dtb_overlay_begin applied, overlay id %d\n", ret);
 
 	goto out;
@@ -2209,7 +2227,10 @@ static __init void of_unittest_overlay_high_level(void)
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
index 49e5f24fb390..eb60eddf83c2 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1306,6 +1306,9 @@ struct of_overlay_notify_data {
 #ifdef CONFIG_OF_OVERLAY
 
 /* ID based overlays; the API for external users */
+void of_overlay_mutex_lock(void);
+void of_overlay_mutex_unlock(void);
+
 int of_overlay_apply(struct device_node *tree, int *ovcs_id);
 int of_overlay_remove(int *ovcs_id);
 int of_overlay_remove_all(void);
@@ -1315,6 +1318,22 @@ struct of_overlay_notify_data {
 
 #else
 
+static inline void of_overlay_mutex_lock(void)
+{
+#ifndef CONFIG_OF_RESOLVE
+	/* avoid warning in unittest.c */
+	WARN(1, "of_overlay_mutex_lock() ifdef'ed out\n");
+#endif
+}
+
+static inline void of_overlay_mutex_unlock(void)
+{
+#ifndef CONFIG_OF_RESOLVE
+	/* avoid warning in unittest.c */
+	WARN(1, "of_overlay_mutex_unlock() ifdef'ed out\n");
+#endif
+}
+
 static inline int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 {
 	return -ENOTSUPP;
-- 
Frank Rowand <frank.rowand@sony.com>
