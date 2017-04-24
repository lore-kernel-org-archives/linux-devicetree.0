From: frowand.list@gmail.com
Subject: [PATCH 1/3] of: overlay_adjust_phandles() - do not modify const field
Date: Sun, 23 Apr 2017 22:20:02 -0700
Message-ID: <1493011204-27635-2-git-send-email-frowand.list@gmail.com>
References: <1493011204-27635-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493011204-27635-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

When adjusting overlay phandles to apply to the live device tree, can
not modify the property value because it is type const.

This is to resolve the issue found by Stephen Boyd [1] when he changed
the type of struct property.value from void * to const void *.  As
a result of the type change, the overlay code had compile errors
where the resolver updates phandle values.

  [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/base.c       |  4 ++--
 drivers/of/dynamic.c    | 28 +++++++++++++++++++++------
 drivers/of/of_private.h |  3 +++
 drivers/of/resolver.c   | 51 ++++++++++++++++++++++++++++++-------------------
 4 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d7c4629a3a2d..b41650fd0fcf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -220,8 +220,8 @@ void __init of_core_init(void)
 		proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
 }
 
-static struct property *__of_find_property(const struct device_node *np,
-					   const char *name, int *lenp)
+struct property *__of_find_property(const struct device_node *np,
+				    const char *name, int *lenp)
 {
 	struct property *pp;
 
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 888fdbc09992..44963b4e7235 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -354,17 +354,17 @@ void of_node_release(struct kobject *kobj)
 }
 
 /**
- * __of_prop_dup - Copy a property dynamically.
+ * __of_prop_alloc - Create a property dynamically.
  * @prop:	Property to copy
  * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
  *
- * Copy a property by dynamically allocating the memory of both the
+ * Create a property by dynamically allocating the memory of both the
  * property structure and the property name & contents. The property's
  * flags have the OF_DYNAMIC bit set so that we can differentiate between
  * dynamically allocated properties and not.
  * Returns the newly allocated property or NULL on out of memory error.
  */
-struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
+struct property *__of_prop_alloc(char *name, void *value, int len, gfp_t allocflags)
 {
 	struct property *new;
 
@@ -378,9 +378,9 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
 	 * of zero bytes. We do this to work around the use
 	 * of of_get_property() calls on boolean values.
 	 */
-	new->name = kstrdup(prop->name, allocflags);
-	new->value = kmemdup(prop->value, prop->length, allocflags);
-	new->length = prop->length;
+	new->name = kstrdup(name, allocflags);
+	new->value = kmemdup(value, len, allocflags);
+	new->length = len;
 	if (!new->name || !new->value)
 		goto err_free;
 
@@ -397,6 +397,22 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
 }
 
 /**
+ * __of_prop_dup - Copy a property dynamically.
+ * @prop:	Property to copy
+ * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
+ *
+ * Copy a property by dynamically allocating the memory of both the
+ * property structure and the property name & contents. The property's
+ * flags have the OF_DYNAMIC bit set so that we can differentiate between
+ * dynamically allocated properties and not.
+ * Returns the newly allocated property or NULL on out of memory error.
+ */
+struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
+{
+	return __of_prop_alloc(prop->name, prop->value, prop->length, allocflags);
+}
+
+/**
  * __of_node_dup() - Duplicate or create an empty device node dynamically.
  * @fmt: Format string (plus vargs) for new full name of the device node
  *
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 18bbb4517e25..554394c96569 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -62,6 +62,7 @@ static inline int of_property_notify(int action, struct device_node *np,
  * without taking node references, so you either have to
  * own the devtree lock or work on detached trees only.
  */
+struct property *__of_prop_alloc(char *name, void *value, int len, gfp_t allocflags);
 struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
 __printf(2, 3) struct device_node *__of_node_dup(const struct device_node *np, const char *fmt, ...);
 
@@ -70,6 +71,8 @@ extern const void *__of_get_property(const struct device_node *np,
 extern int __of_add_property(struct device_node *np, struct property *prop);
 extern int __of_add_property_sysfs(struct device_node *np,
 		struct property *prop);
+extern struct property *__of_find_property(const struct device_node *np,
+					   const char *name, int *lenp);
 extern int __of_remove_property(struct device_node *np, struct property *prop);
 extern void __of_remove_property_sysfs(struct device_node *np,
 		struct property *prop);
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 7ae9863cb0a4..a2d5b8f0b7bf 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -20,6 +20,8 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 
+#include "of_private.h"
+
 /* illegal phandle value (set when unresolved) */
 #define OF_PHANDLE_ILLEGAL	0xdeadbeef
 
@@ -67,36 +69,43 @@ static phandle live_tree_max_phandle(void)
 	return phandle;
 }
 
-static void adjust_overlay_phandles(struct device_node *overlay,
+static int adjust_overlay_phandles(struct device_node *overlay,
 		int phandle_delta)
 {
 	struct device_node *child;
+	struct property *newprop;
 	struct property *prop;
 	phandle phandle;
+	int ret;
 
-	/* adjust node's phandle in node */
-	if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL)
-		overlay->phandle += phandle_delta;
-
-	/* copy adjusted phandle into *phandle properties */
-	for_each_property_of_node(overlay, prop) {
+	if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL) {
 
-		if (of_prop_cmp(prop->name, "phandle") &&
-		    of_prop_cmp(prop->name, "linux,phandle"))
-			continue;
-
-		if (prop->length < 4)
-			continue;
+		overlay->phandle += phandle_delta;
 
-		phandle = be32_to_cpup(prop->value);
-		if (phandle == OF_PHANDLE_ILLEGAL)
-			continue;
+		phandle = cpu_to_be32(overlay->phandle);
+
+		prop = __of_find_property(overlay, "phandle", NULL);
+		newprop = __of_prop_alloc(prop->name, &phandle, sizeof(phandle),
+					  GFP_KERNEL);
+		if (!newprop)
+			return -ENOMEM;
+		__of_update_property(overlay, newprop, &prop);
+
+		prop = __of_find_property(overlay, "linux,phandle", NULL);
+		newprop = __of_prop_alloc(prop->name, &phandle, sizeof(phandle),
+					  GFP_KERNEL);
+		if (!newprop)
+			return -ENOMEM;
+		__of_update_property(overlay, newprop, &prop);
+	}
 
-		*(uint32_t *)prop->value = cpu_to_be32(overlay->phandle);
+	for_each_child_of_node(overlay, child) {
+		ret = adjust_overlay_phandles(child, phandle_delta);
+		if (ret)
+			return ret;
 	}
 
-	for_each_child_of_node(overlay, child)
-		adjust_overlay_phandles(child, phandle_delta);
+	return 0;
 }
 
 static int update_usages_of_a_phandle_reference(struct device_node *overlay,
@@ -306,7 +315,9 @@ int of_resolve_phandles(struct device_node *overlay)
 	}
 
 	phandle_delta = live_tree_max_phandle() + 1;
-	adjust_overlay_phandles(overlay, phandle_delta);
+	err = adjust_overlay_phandles(overlay, phandle_delta);
+	if (err)
+		goto out;
 
 	for_each_child_of_node(overlay, local_fixups)
 		if (!of_node_cmp(local_fixups->name, "__local_fixups__"))
-- 
Frank Rowand <frank.rowand@sony.com>
