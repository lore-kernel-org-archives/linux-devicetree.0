From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: restructure for_each macros to fix compile warnings
Date: Mon,  3 Feb 2014 17:17:04 -0600
Message-ID: <1391469424-5245-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Commit 00b2c76a6a "include/linux/of.h: make for_each_child_of_node()
reference its args when CONFIG_OF=n" fixed warnings for unused
variables, but introduced variable "used uninitialized" warnings.
Simply initializing the variables would result in "set but not used"
warnings with W=1.

Fix both types of warnings by making all the for_each macros
unconditional and rely on the dummy static inline functions to
initialize and reference any variables.

Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 include/linux/of.h | 153 +++++++++++++++++++++++++++++------------------------
 1 file changed, 84 insertions(+), 69 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 70c64ba..435cb99 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -169,35 +169,15 @@ static inline const char *of_node_full_name(const struct device_node *np)
 
 extern struct device_node *of_find_node_by_name(struct device_node *from,
 	const char *name);
-#define for_each_node_by_name(dn, name) \
-	for (dn = of_find_node_by_name(NULL, name); dn; \
-	     dn = of_find_node_by_name(dn, name))
 extern struct device_node *of_find_node_by_type(struct device_node *from,
 	const char *type);
-#define for_each_node_by_type(dn, type) \
-	for (dn = of_find_node_by_type(NULL, type); dn; \
-	     dn = of_find_node_by_type(dn, type))
 extern struct device_node *of_find_compatible_node(struct device_node *from,
 	const char *type, const char *compat);
-#define for_each_compatible_node(dn, type, compatible) \
-	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
-	     dn = of_find_compatible_node(dn, type, compatible))
 extern struct device_node *of_find_matching_node_and_match(
 	struct device_node *from,
 	const struct of_device_id *matches,
 	const struct of_device_id **match);
-static inline struct device_node *of_find_matching_node(
-	struct device_node *from,
-	const struct of_device_id *matches)
-{
-	return of_find_matching_node_and_match(from, matches, NULL);
-}
-#define for_each_matching_node(dn, matches) \
-	for (dn = of_find_matching_node(NULL, matches); dn; \
-	     dn = of_find_matching_node(dn, matches))
-#define for_each_matching_node_and_match(dn, matches, match) \
-	for (dn = of_find_matching_node_and_match(NULL, matches, match); \
-	     dn; dn = of_find_matching_node_and_match(dn, matches, match))
+
 extern struct device_node *of_find_node_by_path(const char *path);
 extern struct device_node *of_find_node_by_phandle(phandle handle);
 extern struct device_node *of_get_parent(const struct device_node *node);
@@ -209,43 +189,11 @@ extern struct device_node *of_get_next_available_child(
 
 extern struct device_node *of_get_child_by_name(const struct device_node *node,
 					const char *name);
-#define for_each_child_of_node(parent, child) \
-	for (child = of_get_next_child(parent, NULL); child != NULL; \
-	     child = of_get_next_child(parent, child))
-
-#define for_each_available_child_of_node(parent, child) \
-	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
-	     child = of_get_next_available_child(parent, child))
-
-static inline int of_get_child_count(const struct device_node *np)
-{
-	struct device_node *child;
-	int num = 0;
-
-	for_each_child_of_node(np, child)
-		num++;
-
-	return num;
-}
-
-static inline int of_get_available_child_count(const struct device_node *np)
-{
-	struct device_node *child;
-	int num = 0;
-
-	for_each_available_child_of_node(np, child)
-		num++;
-
-	return num;
-}
 
 /* cache lookup */
 extern struct device_node *of_find_next_cache_node(const struct device_node *);
 extern struct device_node *of_find_node_with_property(
 	struct device_node *from, const char *prop_name);
-#define for_each_node_with_property(dn, prop_name) \
-	for (dn = of_find_node_with_property(NULL, prop_name); dn; \
-	     dn = of_find_node_with_property(dn, prop_name))
 
 extern struct property *of_find_property(const struct device_node *np,
 					 const char *name,
@@ -367,42 +315,53 @@ static inline struct device_node *of_find_node_by_name(struct device_node *from,
 	return NULL;
 }
 
-static inline struct device_node *of_get_parent(const struct device_node *node)
+static inline struct device_node *of_find_node_by_type(struct device_node *from,
+	const char *type)
 {
 	return NULL;
 }
 
-static inline bool of_have_populated_dt(void)
+static inline struct device_node *of_find_matching_node_and_match(
+	struct device_node *from,
+	const struct of_device_id *matches,
+	const struct of_device_id **match)
 {
-	return false;
+	return NULL;
 }
 
-/* Kill an unused variable warning on a device_node pointer */
-static inline void __of_use_dn(const struct device_node *np)
+static inline struct device_node *of_get_parent(const struct device_node *node)
 {
+	return NULL;
 }
 
-#define for_each_child_of_node(parent, child) \
-	while (__of_use_dn(parent), __of_use_dn(child), 0)
+static inline struct device_node *of_get_next_child(
+	const struct device_node *node, struct device_node *prev)
+{
+	return NULL;
+}
 
-#define for_each_available_child_of_node(parent, child) \
-	while (0)
+static inline struct device_node *of_get_next_available_child(
+	const struct device_node *node, struct device_node *prev)
+{
+	return NULL;
+}
 
-static inline struct device_node *of_get_child_by_name(
-					const struct device_node *node,
-					const char *name)
+static inline struct device_node *of_find_node_with_property(
+	struct device_node *from, const char *prop_name)
 {
 	return NULL;
 }
 
-static inline int of_get_child_count(const struct device_node *np)
+static inline bool of_have_populated_dt(void)
 {
-	return 0;
+	return false;
 }
 
-static inline int of_get_available_child_count(const struct device_node *np)
+static inline struct device_node *of_get_child_by_name(
+					const struct device_node *node,
+					const char *name)
 {
-	return 0;
+	return NULL;
 }
 
 static inline int of_device_is_compatible(const struct device_node *device,
@@ -569,6 +528,13 @@ extern int of_node_to_nid(struct device_node *np);
 static inline int of_node_to_nid(struct device_node *device) { return 0; }
 #endif
 
+static inline struct device_node *of_find_matching_node(
+	struct device_node *from,
+	const struct of_device_id *matches)
+{
+	return of_find_matching_node_and_match(from, matches, NULL);
+}
+
 /**
  * of_property_read_bool - Findfrom a property
  * @np:		device node from which the property value is to be read.
@@ -618,6 +584,55 @@ static inline int of_property_read_u32(const struct device_node *np,
 		s;						\
 		s = of_prop_next_string(prop, s))
 
+#define for_each_node_by_name(dn, name) \
+	for (dn = of_find_node_by_name(NULL, name); dn; \
+	     dn = of_find_node_by_name(dn, name))
+#define for_each_node_by_type(dn, type) \
+	for (dn = of_find_node_by_type(NULL, type); dn; \
+	     dn = of_find_node_by_type(dn, type))
+#define for_each_compatible_node(dn, type, compatible) \
+	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
+	     dn = of_find_compatible_node(dn, type, compatible))
+#define for_each_matching_node(dn, matches) \
+	for (dn = of_find_matching_node(NULL, matches); dn; \
+	     dn = of_find_matching_node(dn, matches))
+#define for_each_matching_node_and_match(dn, matches, match) \
+	for (dn = of_find_matching_node_and_match(NULL, matches, match); \
+	     dn; dn = of_find_matching_node_and_match(dn, matches, match))
+
+#define for_each_child_of_node(parent, child) \
+	for (child = of_get_next_child(parent, NULL); child != NULL; \
+	     child = of_get_next_child(parent, child))
+#define for_each_available_child_of_node(parent, child) \
+	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
+	     child = of_get_next_available_child(parent, child))
+
+#define for_each_node_with_property(dn, prop_name) \
+	for (dn = of_find_node_with_property(NULL, prop_name); dn; \
+	     dn = of_find_node_with_property(dn, prop_name))
+
+static inline int of_get_child_count(const struct device_node *np)
+{
+	struct device_node *child;
+	int num = 0;
+
+	for_each_child_of_node(np, child)
+		num++;
+
+	return num;
+}
+
+static inline int of_get_available_child_count(const struct device_node *np)
+{
+	struct device_node *child;
+	int num = 0;
+
+	for_each_available_child_of_node(np, child)
+		num++;
+
+	return num;
+}
+
 #if defined(CONFIG_PROC_FS) && defined(CONFIG_PROC_DEVICETREE)
 extern void proc_device_tree_add_node(struct device_node *, struct proc_dir_entry *);
 extern void proc_device_tree_add_prop(struct proc_dir_entry *pde, struct property *prop);
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
