From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2] of: platform: Create dummy routines for !CONFIG_OF_ADDRESS
Date: Sat, 28 Oct 2017 15:56:46 +0530
Message-ID: <2d798213e4fefc074a66ccb7ab2fc243ee2b1e1a.1509186356.git.viresh.kumar@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Few routines don't have their dummy counterparts which results in build
failures where these routines are used without CONFIG_OF_ADDRESS
enabled.

Fix those by defining the dummy versions.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
V2:
- Rebased again latest rc and resolved conflicts.
- No comments received on V1.

 include/linux/of_platform.h | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index fb908e598348..8a561e08bc9e 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -52,11 +52,6 @@ struct of_dev_auxdata {
 	  .platform_data = _pdata }
 
 extern const struct of_device_id of_default_bus_match_table[];
-
-/* Platform drivers register/unregister */
-extern struct platform_device *of_device_alloc(struct device_node *np,
-					 const char *bus_id,
-					 struct device *parent);
 #ifdef CONFIG_OF
 extern struct platform_device *of_find_device_by_node(struct device_node *np);
 #else
@@ -66,6 +61,12 @@ static inline struct platform_device *of_find_device_by_node(struct device_node
 }
 #endif
 
+#ifdef CONFIG_OF_ADDRESS
+/* Platform drivers register/unregister */
+extern struct platform_device *of_device_alloc(struct device_node *np,
+					 const char *bus_id,
+					 struct device *parent);
+
 /* Platform devices and busses creation */
 extern struct platform_device *of_platform_device_create(struct device_node *np,
 						   const char *bus_id,
@@ -75,7 +76,6 @@ extern int of_platform_device_destroy(struct device *dev, void *data);
 extern int of_platform_bus_probe(struct device_node *root,
 				 const struct of_device_id *matches,
 				 struct device *parent);
-#ifdef CONFIG_OF_ADDRESS
 extern int of_platform_populate(struct device_node *root,
 				const struct of_device_id *matches,
 				const struct of_dev_auxdata *lookup,
@@ -89,6 +89,33 @@ extern int devm_of_platform_populate(struct device *dev);
 
 extern void devm_of_platform_depopulate(struct device *dev);
 #else
+static inline struct platform_device *
+of_device_alloc(struct device_node *np, const char *bus_id,
+		struct device *parent)
+{
+	return NULL;
+}
+
+/* Platform devices and busses creation */
+static inline struct platform_device *
+of_platform_device_create(struct device_node *np, const char *bus_id,
+			  struct device *parent)
+{
+	return NULL;
+}
+
+static inline int of_platform_device_destroy(struct device *dev, void *data)
+{
+	return -ENODEV;
+}
+
+static inline int of_platform_bus_probe(struct device_node *root,
+					const struct of_device_id *matches,
+					struct device *parent)
+{
+	return -ENODEV;
+}
+
 static inline int of_platform_populate(struct device_node *root,
 					const struct of_device_id *matches,
 					const struct of_dev_auxdata *lookup,
-- 
2.15.0.rc1.236.g92ea95045093

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
