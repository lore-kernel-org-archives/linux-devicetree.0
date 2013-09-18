From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/2] of: move definition of of_find_next_cache_node into common code.
Date: Wed, 18 Sep 2013 11:53:05 +0100
Message-ID: <1379501585-12532-3-git-send-email-Sudeep.KarkadaNagesha@arm.com>
References: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>

Since the definition of_find_next_cache_node is architecture independent,
the existing definition in powerpc can be moved to driver/of/base.c

Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>
---
 arch/powerpc/include/asm/prom.h |  3 ---
 arch/powerpc/kernel/prom.c      | 31 -------------------------------
 drivers/of/base.c               | 31 +++++++++++++++++++++++++++++++
 include/linux/of.h              |  2 ++
 4 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 7d0c7f3..bf09e5a 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -44,9 +44,6 @@ void of_parse_dma_window(struct device_node *dn, const __be32 *dma_window,
 
 extern void kdump_move_device_tree(void);
 
-/* cache lookup */
-struct device_node *of_find_next_cache_node(struct device_node *np);
-
 #ifdef CONFIG_NUMA
 extern int of_node_to_nid(struct device_node *device);
 #else
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 09be275..4432fd8 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -761,37 +761,6 @@ void __init early_init_devtree(void *params)
  *******/
 
 /**
- *	of_find_next_cache_node - Find a node's subsidiary cache
- *	@np:	node of type "cpu" or "cache"
- *
- *	Returns a node pointer with refcount incremented, use
- *	of_node_put() on it when done.  Caller should hold a reference
- *	to np.
- */
-struct device_node *of_find_next_cache_node(struct device_node *np)
-{
-	struct device_node *child;
-	const phandle *handle;
-
-	handle = of_get_property(np, "l2-cache", NULL);
-	if (!handle)
-		handle = of_get_property(np, "next-level-cache", NULL);
-
-	if (handle)
-		return of_find_node_by_phandle(be32_to_cpup(handle));
-
-	/* OF on pmac has nodes instead of properties named "l2-cache"
-	 * beneath CPU nodes.
-	 */
-	if (!strcmp(np->type, "cpu"))
-		for_each_child_of_node(np, child)
-			if (!strcmp(child->type, "cache"))
-				return child;
-
-	return NULL;
-}
-
-/**
  * of_get_ibm_chip_id - Returns the IBM "chip-id" of a device
  * @np: device node of the device
  *
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 865d3f6..b2cee3d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1884,3 +1884,34 @@ int of_device_is_stdout_path(struct device_node *dn)
 	return of_stdout == dn;
 }
 EXPORT_SYMBOL_GPL(of_device_is_stdout_path);
+
+/**
+ *	of_find_next_cache_node - Find a node's subsidiary cache
+ *	@np:	node of type "cpu" or "cache"
+ *
+ *	Returns a node pointer with refcount incremented, use
+ *	of_node_put() on it when done.  Caller should hold a reference
+ *	to np.
+ */
+struct device_node *of_find_next_cache_node(const struct device_node *np)
+{
+	struct device_node *child;
+	const phandle *handle;
+
+	handle = of_get_property(np, "l2-cache", NULL);
+	if (!handle)
+		handle = of_get_property(np, "next-level-cache", NULL);
+
+	if (handle)
+		return of_find_node_by_phandle(be32_to_cpup(handle));
+
+	/* OF on pmac has nodes instead of properties named "l2-cache"
+	 * beneath CPU nodes.
+	 */
+	if (!strcmp(np->type, "cpu"))
+		for_each_child_of_node(np, child)
+			if (!strcmp(child->type, "cache"))
+				return child;
+
+	return NULL;
+}
diff --git a/include/linux/of.h b/include/linux/of.h
index f95aee3..c08c07e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -226,6 +226,8 @@ static inline int of_get_child_count(const struct device_node *np)
 	return num;
 }
 
+/* cache lookup */
+extern struct device_node *of_find_next_cache_node(const struct device_node *);
 extern struct device_node *of_find_node_with_property(
 	struct device_node *from, const char *prop_name);
 #define for_each_node_with_property(dn, prop_name) \
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
