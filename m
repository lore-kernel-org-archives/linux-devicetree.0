From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v2] dt: Add id to AUXDATA structure
Date: Fri, 15 Jul 2011 10:36:32 -0700
Message-ID: <20110715173622.7560.78002.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the ability to set the device id in the AUXDATA structure for
those few device drivers that just have to have a statically defined device id.
---

 drivers/of/device.c         |    4 ++--
 drivers/of/platform.c       |   10 +++++++---
 include/linux/of_device.h   |    8 +++++++-
 include/linux/of_platform.h |    7 ++++++-
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 62b4b32..5445f79 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -47,14 +47,14 @@ void of_dev_put(struct platform_device *dev)
 }
 EXPORT_SYMBOL(of_dev_put);
 
-int of_device_add(struct platform_device *ofdev)
+int of_device_add_id(struct platform_device *ofdev, int id)
 {
 	BUG_ON(ofdev->dev.of_node == NULL);
 
 	/* name and id have to be set so that the platform bus doesn't get
 	 * confused on matching */
 	ofdev->name = dev_name(&ofdev->dev);
-	ofdev->id = -1;
+	ofdev->id = id;
 
 	/* device_add will assume that this device is on the same node as
 	 * the parent. If there is no parent defined, set the node
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index c177345..e511fc7 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -190,6 +190,7 @@ EXPORT_SYMBOL(of_device_alloc);
 struct platform_device *of_platform_device_create_pdata(
 					struct device_node *np,
 					const char *bus_id,
+					int id,
 					void *platform_data,
 					struct device *parent)
 {
@@ -214,7 +215,7 @@ struct platform_device *of_platform_device_create_pdata(
 	 * to do such, possibly using a device notifier
 	 */
 
-	if (of_device_add(dev) != 0) {
+	if (of_device_add_id(dev, id) != 0) {
 		platform_device_put(dev);
 		return NULL;
 	}
@@ -235,7 +236,7 @@ struct platform_device *of_platform_device_create(struct device_node *np,
 					    const char *bus_id,
 					    struct device *parent)
 {
-	return of_platform_device_create_pdata(np, bus_id, NULL, parent);
+	return of_platform_device_create_pdata(np, bus_id, -1, NULL, parent);
 }
 EXPORT_SYMBOL(of_platform_device_create);
 
@@ -565,6 +566,7 @@ static int of_platform_bus_create(struct device_node *bus,
 	struct platform_device *dev;
 	const char *bus_id = NULL;
 	void *platform_data = NULL;
+	int id = -1;
 	int rc = 0;
 
 	/* Make sure it has a compatible property */
@@ -585,6 +587,7 @@ static int of_platform_bus_create(struct device_node *bus,
 	auxdata = of_dev_lookup(lookup, bus);
 	if (auxdata) {
 		bus_id = auxdata->name;
+		id = auxdata->id;
 		platform_data = auxdata->platform_data;
 	}
 
@@ -593,7 +596,8 @@ static int of_platform_bus_create(struct device_node *bus,
 		return 0;
 	}
 
-	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
+	dev = of_platform_device_create_pdata(bus, bus_id, id, platform_data, parent);
+
 	if (!dev || !of_match_node(matches, bus))
 		return 0;
 
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index ae56384..74b944b 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -27,7 +27,13 @@ static inline int of_driver_match_device(struct device *dev,
 extern struct platform_device *of_dev_get(struct platform_device *dev);
 extern void of_dev_put(struct platform_device *dev);
 
-extern int of_device_add(struct platform_device *pdev);
+extern int of_device_add_id(struct platform_device *pdev, int id);
+
+static inline int of_device_add(struct platform_device *pdev)
+{
+	return of_device_add_id(pdev, -1);
+}
+
 extern int of_device_register(struct platform_device *ofdev);
 extern void of_device_unregister(struct platform_device *ofdev);
 
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 40ce814..252246c 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -45,13 +45,18 @@ struct of_dev_auxdata {
 	char *compatible;
 	resource_size_t phys_addr;
 	char *name;
+	int id;
 	void *platform_data;
 };
 
 /* Macro to simplify populating a lookup table */
 #define OF_DEV_AUXDATA(_compat,_phys,_name,_pdata) \
 	{ .compatible = _compat, .phys_addr = _phys, .name = _name, \
-	  .platform_data = _pdata }
+	  .id = -1, .platform_data = _pdata }
+
+#define OF_DEV_AUXDATA_ID(_compat,_phys,_name,_id,_pdata) \
+	{ .compatible = _compat, .phys_addr = _phys, .name = _name, \
+	  .id = _id, .platform_data = _pdata }
 
 /**
  * of_platform_driver - Legacy of-aware driver for platform devices.
