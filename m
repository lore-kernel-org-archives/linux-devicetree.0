From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] of/platform: add function to populate default bus
Date: Sun,  2 Aug 2015 19:44:43 +0200
Message-ID: <1438537483-26414-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When a default bus like the simple-bus should be used someone had to
call of_platform_populate() with the default match table. This match
table was not exported, so it is impossible for code build as a module
to use this. Instead of exporting of_default_bus_match_table, add a new
function which uses this default match table and populates the bus.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/of/platform.c       | 9 +++++++++
 include/linux/of_platform.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index ddf8e42..918f01f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -456,6 +456,15 @@ int of_platform_populate(struct device_node *root,
 }
 EXPORT_SYMBOL_GPL(of_platform_populate);
 
+int of_platform_default_populate(struct device_node *root,
+				 const struct of_dev_auxdata *lookup,
+				 struct device *parent)
+{
+	return of_platform_populate(root, of_default_bus_match_table, lookup,
+				    parent);
+}
+EXPORT_SYMBOL_GPL(of_platform_default_populate);
+
 static int of_platform_device_destroy(struct device *dev, void *data)
 {
 	/* Do not touch devices not populated from the device tree */
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 611a691..956a100 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -72,6 +72,9 @@ extern int of_platform_populate(struct device_node *root,
 				const struct of_device_id *matches,
 				const struct of_dev_auxdata *lookup,
 				struct device *parent);
+extern int of_platform_default_populate(struct device_node *root,
+					const struct of_dev_auxdata *lookup,
+					struct device *parent);
 extern void of_platform_depopulate(struct device *parent);
 #else
 static inline int of_platform_populate(struct device_node *root,
@@ -81,6 +84,12 @@ static inline int of_platform_populate(struct device_node *root,
 {
 	return -ENODEV;
 }
+static inline int of_platform_default_populate(struct device_node *root,
+					       const struct of_dev_auxdata *lookup,
+					       struct device *parent)
+{
+	return -ENODEV;
+}
 static inline void of_platform_depopulate(struct device *parent) { }
 #endif
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
