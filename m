From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] of: platform: Create dummy routines for !CONFIG_OF_ADDRESS
Date: Fri,  4 Aug 2017 11:39:19 +0530
Message-ID: <cb52d4dd44d18371efc8c1d6d2d3795ebb29d841.1501826940.git.viresh.kumar@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Few routines don't have their dummy counterparts which results in build
failures where these routines are used without CONFIG_OF_ADDRESS
enabled.

Fix those by defining the dummy versions.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/of_platform.h | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index e0d1946270f3..e8d93a5e3ddd 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -52,12 +52,13 @@ struct of_dev_auxdata {
 	  .platform_data = _pdata }
 
 extern const struct of_device_id of_default_bus_match_table[];
+extern struct platform_device *of_find_device_by_node(struct device_node *np);
 
+#ifdef CONFIG_OF_ADDRESS
 /* Platform drivers register/unregister */
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
 					 struct device *parent);
-extern struct platform_device *of_find_device_by_node(struct device_node *np);
 
 /* Platform devices and busses creation */
 extern struct platform_device *of_platform_device_create(struct device_node *np,
@@ -68,7 +69,6 @@ extern int of_platform_device_destroy(struct device *dev, void *data);
 extern int of_platform_bus_probe(struct device_node *root,
 				 const struct of_device_id *matches,
 				 struct device *parent);
-#ifdef CONFIG_OF_ADDRESS
 extern int of_platform_populate(struct device_node *root,
 				const struct of_device_id *matches,
 				const struct of_dev_auxdata *lookup,
@@ -82,6 +82,33 @@ extern int devm_of_platform_populate(struct device *dev);
 
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
2.13.0.71.gd7076ec9c9cb
