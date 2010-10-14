From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/device: Rework to use common platform_device_alloc() for
	allocating devices
Date: Wed, 13 Oct 2010 21:59:00 -0600
Message-ID: <20101014035900.9218.54675.stgit@localhost6.localdomain6>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current code allocates and manages platform_devices created from
the device tree manually.  It also uses an unsafe shortcut for
allocating the platform_device and the resource table at the same
time. (which I added in the last rework; sorry).

This patch refactors the code to use platform_device_alloc() for
allocating new devices.  This reduces the amount of custom code
implemented by of_platform, eliminates the unsafe alloc trick, and has
the side benefit of letting the platform_bus code manage freeing the
device data and resources when the device is freed.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/powerpc/kernel/ibmebus.c |   11 ++++-------
 drivers/base/platform.c       |    1 +
 drivers/of/device.c           |   27 +++++++--------------------
 drivers/of/platform.c         |   24 +++++++++++++-----------
 include/linux/of_device.h     |   13 +++++++------
 5 files changed, 32 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/kernel/ibmebus.c b/arch/powerpc/kernel/ibmebus.c
index 9b626cf..f62efdf 100644
--- a/arch/powerpc/kernel/ibmebus.c
+++ b/arch/powerpc/kernel/ibmebus.c
@@ -162,13 +162,10 @@ static int ibmebus_create_device(struct device_node *dn)
 	dev->dev.bus = &ibmebus_bus_type;
 	dev->dev.archdata.dma_ops = &ibmebus_dma_ops;
 
-	ret = of_device_register(dev);
-	if (ret) {
-		of_device_free(dev);
-		return ret;
-	}
-
-	return 0;
+	ret = of_device_add(dev);
+	if (ret)
+		platform_device_put(dev);
+	return ret;
 }
 
 static int ibmebus_create_devices(const struct of_device_id *matches)
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index c6c933f..2fff59c 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -147,6 +147,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	of_device_node_put(&pa->pdev.dev);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.resource);
 	kfree(pa);
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 92de0eb..45d8653 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -81,29 +81,10 @@ struct device_attribute of_platform_device_attrs[] = {
 	__ATTR_NULL
 };
 
-/**
- * of_release_dev - free an of device structure when all users of it are finished.
- * @dev: device that's been disconnected
- *
- * Will be called only by the device core when all users of this of device are
- * done.
- */
-void of_release_dev(struct device *dev)
-{
-	struct platform_device *ofdev;
-
-	ofdev = to_platform_device(dev);
-	of_node_put(ofdev->dev.of_node);
-	kfree(ofdev);
-}
-EXPORT_SYMBOL(of_release_dev);
-
-int of_device_register(struct platform_device *ofdev)
+int of_device_add(struct platform_device *ofdev)
 {
 	BUG_ON(ofdev->dev.of_node == NULL);
 
-	device_initialize(&ofdev->dev);
-
 	/* name and id have to be set so that the platform bus doesn't get
 	 * confused on matching */
 	ofdev->name = dev_name(&ofdev->dev);
@@ -117,6 +98,12 @@ int of_device_register(struct platform_device *ofdev)
 
 	return device_add(&ofdev->dev);
 }
+
+int of_device_register(struct platform_device *pdev)
+{
+	device_initialize(&pdev->dev);
+	return of_device_add(pdev);
+}
 EXPORT_SYMBOL(of_device_register);
 
 void of_device_unregister(struct platform_device *ofdev)
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 30726c8..5b4a07f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -587,20 +587,23 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	int rc, i, num_reg = 0, num_irq;
 	struct resource *res, temp_res;
 
-	/* First count how many resources are needed */
+	dev = platform_device_alloc("", -1);
+	if (!dev)
+		return NULL;
+
+	/* count the io and irq resources */
 	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
 		num_reg++;
 	num_irq = of_irq_count(np);
 
-	/* Allocate memory for both the struct device and the resource table */
-	dev = kzalloc(sizeof(*dev) + (sizeof(*res) * (num_reg + num_irq)),
-		      GFP_KERNEL);
-	if (!dev)
-		return NULL;
-	res = (struct resource *) &dev[1];
-
 	/* Populate the resource table */
 	if (num_irq || num_reg) {
+		res = kzalloc(sizeof(*res) * (num_irq + num_reg), GFP_KERNEL);
+		if (!res) {
+			platform_device_put(dev);
+			return NULL;
+		}
+
 		dev->num_resources = num_reg + num_irq;
 		dev->resource = res;
 		for (i = 0; i < num_reg; i++, res++) {
@@ -615,7 +618,6 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	dev->dev.dma_mask = &dev->archdata.dma_mask;
 #endif
 	dev->dev.parent = parent;
-	dev->dev.release = of_release_dev;
 
 	if (bus_id)
 		dev_set_name(&dev->dev, "%s", bus_id);
@@ -653,8 +655,8 @@ struct platform_device *of_platform_device_create(struct device_node *np,
 	 * to do such, possibly using a device notifier
 	 */
 
-	if (of_device_register(dev) != 0) {
-		of_device_free(dev);
+	if (of_device_add(dev) != 0) {
+		platform_device_put(dev);
 		return NULL;
 	}
 
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 835f85e..975d347 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -27,20 +27,19 @@ static inline int of_driver_match_device(const struct device *dev,
 extern struct platform_device *of_dev_get(struct platform_device *dev);
 extern void of_dev_put(struct platform_device *dev);
 
+extern int of_device_add(struct platform_device *pdev);
 extern int of_device_register(struct platform_device *ofdev);
 extern void of_device_unregister(struct platform_device *ofdev);
-extern void of_release_dev(struct device *dev);
-
-static inline void of_device_free(struct platform_device *dev)
-{
-	of_release_dev(&dev->dev);
-}
 
 extern ssize_t of_device_get_modalias(struct device *dev,
 					char *str, ssize_t len);
 
 extern int of_device_uevent(struct device *dev, struct kobj_uevent_env *env);
 
+static inline void of_device_node_put(struct device *dev)
+{
+	of_node_put(dev->of_node);
+}
 
 #else /* CONFIG_OF_DEVICE */
 
@@ -56,6 +55,8 @@ static inline int of_device_uevent(struct device *dev,
 	return -ENODEV;
 }
 
+static inline void of_device_node_put(struct device *dev) { }
+
 #endif /* CONFIG_OF_DEVICE */
 
 #endif /* _LINUX_OF_DEVICE_H */
