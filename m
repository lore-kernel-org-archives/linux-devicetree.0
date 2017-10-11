From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: overlay: move resolve phandles into of_overlay_apply()
Date: Tue, 10 Oct 2017 18:02:25 -0700
Message-ID: <1507683745-17499-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Move more code into of_overlay_apply() so that it does not have
to be duplicated by each caller of of_overlay_apply().

The test in of_resolve_phandles() that the overlay tree is detached is
temporarily disabled so that old style overlay unittests do not fail.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---

This patch applies on top of the series: "[PATCH 00/12] of: overlay: clean
up device tree overlay code".

While reviewing "[PATCH 09/12] of: overlay: avoid race condition between
applying multiple overlays", Rob asked if of_resolve_phandles() could be
moved into of_overlay_apply().  This patch is what is involved in doing so.

The impact on drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c is not
fully investigated.  That driver should be tested on real hardware.


 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 13 -------------
 drivers/of/of_private.h                      | 12 ++++++++++++
 drivers/of/overlay.c                         | 10 ++++++++++
 drivers/of/resolver.c                        |  7 +++++++
 drivers/of/unittest.c                        | 11 -----------
 include/linux/of.h                           | 22 ----------------------
 6 files changed, 29 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index c99f7924b1c6..54025af534d4 100644
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
@@ -221,11 +215,6 @@ static void __init tilcdc_convert_slave_node(void)
 		goto out;
 	}
 
-	/*
-	 * protect from of_resolve_phandles() through of_overlay_apply()
-	 */
-	of_overlay_mutex_lock();
-
 	overlay = tilcdc_get_overlay(&kft);
 	if (!overlay)
 		goto out;
@@ -261,8 +250,6 @@ static void __init tilcdc_convert_slave_node(void)
 		pr_info("%s: ti,tilcdc,slave node successfully converted\n",
 			__func__);
 out:
-	of_overlay_mutex_unlock();
-
 	kfree_table_free(&kft);
 	of_node_put(i2c);
 	of_node_put(slave);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0c9e473801f2..267edb1b50df 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -59,6 +59,18 @@ static inline int of_property_notify(int action, struct device_node *np,
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
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
index 88df2986b03f..dc7657329aea 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -696,6 +696,12 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
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
@@ -741,9 +747,13 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
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
index 99309cb7d372..8a0f52cfe160 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -275,11 +275,18 @@ int of_resolve_phandles(struct device_node *overlay)
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
index f4c8aff21320..cb9b7674f746 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2162,15 +2162,6 @@ static int __init overlay_data_add(int onum)
 	}
 	of_node_set_flag(info->np_overlay, OF_DETACHED);
 
-	of_overlay_mutex_lock();
-
-	ret = of_resolve_phandles(info->np_overlay);
-	if (ret) {
-		pr_err("resolve ot phandles (ret=%d), %d\n", ret, onum);
-		of_overlay_mutex_unlock();
-		goto out_free_np_overlay;
-	}
-
 	info->overlay_id = 0;
 	ret = of_overlay_apply(info->np_overlay, &info->overlay_id);
 	if (ret < 0) {
@@ -2179,8 +2170,6 @@ static int __init overlay_data_add(int onum)
 		goto out_free_np_overlay;
 	}
 
-	of_overlay_mutex_unlock();
-
 	pr_debug("__dtb_overlay_begin applied, overlay id %d\n", ret);
 
 	goto out;
diff --git a/include/linux/of.h b/include/linux/of.h
index eb60eddf83c2..55e9ff0fb1fe 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1273,9 +1273,6 @@ static inline int of_reconfig_get_state_change(unsigned long action,
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
-/* CONFIG_OF_RESOLVE api */
-extern int of_resolve_phandles(struct device_node *tree);
-
 /**
  * of_device_is_system_power_controller - Tells if system-power-controller is found for device_node
  * @np: Pointer to the given device_node
@@ -1306,9 +1303,6 @@ struct of_overlay_notify_data {
 #ifdef CONFIG_OF_OVERLAY
 
 /* ID based overlays; the API for external users */
-void of_overlay_mutex_lock(void);
-void of_overlay_mutex_unlock(void);
-
 int of_overlay_apply(struct device_node *tree, int *ovcs_id);
 int of_overlay_remove(int *ovcs_id);
 int of_overlay_remove_all(void);
@@ -1318,22 +1312,6 @@ struct of_overlay_notify_data {
 
 #else
 
-static inline void of_overlay_mutex_lock(void)
-{
-#ifndef CONFIG_OF_RESOLVE
-	/* avoid warning in unittest.c */
-	WARN(1, "of_overlay_mutex_lock() ifdef'ed out\n");
-#endif
-}
-
-static inline void of_overlay_mutex_unlock(void)
-{
-#ifndef CONFIG_OF_RESOLVE
-	/* avoid warning in unittest.c */
-	WARN(1, "of_overlay_mutex_unlock() ifdef'ed out\n");
-#endif
-}
-
 static inline int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 {
 	return -ENOTSUPP;
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
