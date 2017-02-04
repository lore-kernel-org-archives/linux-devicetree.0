From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: patch "usb: ulpi: Support device discovery via DT" added to usb-testing
Date: Sat, 04 Feb 2017 09:14:47 +0100
Message-ID: <148619608721932@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    usb: ulpi: Support device discovery via DT

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the usb-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


>From ef6a7bcfb01c9c8df172ad06fb547216ca788711 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Wed, 28 Dec 2016 14:56:49 -0800
Subject: usb: ulpi: Support device discovery via DT

The qcom HSIC ULPI phy doesn't have any bits set in the vendor or
product ID registers. This makes it impossible to make a ULPI
driver match against the ID registers. Add support to discover
the ULPI phys via DT help alleviate this problem. In the DT case,
we'll look for a ULPI bus node underneath the device registering
the ULPI viewport (or the parent of that device to support
chipidea's device layout) and then match up the phy node
underneath that with the ULPI device that's created.

The side benefit of this is that we can use standard properties
in the phy node like clks, regulators, gpios, etc. because we
don't have firmware like ACPI to turn these things on for us. And
we can use the DT phy binding to point our phy consumer to the
phy provider.

The ULPI bus code supports native enumeration by reading the
vendor ID and product ID registers at device creation time, but
we can't be certain that those register reads will succeed if the
phy is not powered up. To avoid any problems with reading the ID
registers before the phy is powered we fallback to DT matching
when the ID reads fail.

If the ULPI spec had some generic power sequencing for these
registers we could put that into the ULPI bus layer and power up
the device before reading the ID registers. Unfortunately this
doesn't exist and the power sequence is usually device specific.
By having the device matched up with DT we can avoid this
problem.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Acked-by: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ulpi.txt | 20 +++++++
 drivers/usb/common/ulpi.c                      | 79 ++++++++++++++++++++++++--
 2 files changed, 93 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ulpi.txt

diff --git a/Documentation/devicetree/bindings/usb/ulpi.txt b/Documentation/devicetree/bindings/usb/ulpi.txt
new file mode 100644
index 000000000000..ca179dc4bd50
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ulpi.txt
@@ -0,0 +1,20 @@
+ULPI bus binding
+----------------
+
+Phys that are behind a ULPI connection can be described with the following
+binding. The host controller shall have a "ulpi" named node as a child, and
+that node shall have one enabled node underneath it representing the ulpi
+device on the bus.
+
+EXAMPLE
+-------
+
+usb {
+	compatible = "vendor,usb-controller";
+
+	ulpi {
+		phy {
+			compatible = "vendor,phy";
+		};
+	};
+};
diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index 8b317702d761..c9480d77810c 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -16,6 +16,9 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/clk/clk-conf.h>
 
 /* -------------------------------------------------------------------------- */
 
@@ -39,6 +42,10 @@ static int ulpi_match(struct device *dev, struct device_driver *driver)
 	struct ulpi *ulpi = to_ulpi_dev(dev);
 	const struct ulpi_device_id *id;
 
+	/* Some ULPI devices don't have a vendor id so rely on OF match */
+	if (ulpi->id.vendor == 0)
+		return of_driver_match_device(dev, driver);
+
 	for (id = drv->id_table; id->vendor; id++)
 		if (id->vendor == ulpi->id.vendor &&
 		    id->product == ulpi->id.product)
@@ -50,6 +57,11 @@ static int ulpi_match(struct device *dev, struct device_driver *driver)
 static int ulpi_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct ulpi *ulpi = to_ulpi_dev(dev);
+	int ret;
+
+	ret = of_device_uevent_modalias(dev, env);
+	if (ret != -ENODEV)
+		return ret;
 
 	if (add_uevent_var(env, "MODALIAS=ulpi:v%04xp%04x",
 			   ulpi->id.vendor, ulpi->id.product))
@@ -60,6 +72,11 @@ static int ulpi_uevent(struct device *dev, struct kobj_uevent_env *env)
 static int ulpi_probe(struct device *dev)
 {
 	struct ulpi_driver *drv = to_ulpi_driver(dev->driver);
+	int ret;
+
+	ret = of_clk_set_defaults(dev->of_node, false);
+	if (ret < 0)
+		return ret;
 
 	return drv->probe(to_ulpi_dev(dev));
 }
@@ -87,8 +104,13 @@ static struct bus_type ulpi_bus = {
 static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
+	int len;
 	struct ulpi *ulpi = to_ulpi_dev(dev);
 
+	len = of_device_get_modalias(dev, buf, PAGE_SIZE - 1);
+	if (len != -ENODEV)
+		return len;
+
 	return sprintf(buf, "ulpi:v%04xp%04x\n",
 		       ulpi->id.vendor, ulpi->id.product);
 }
@@ -153,23 +175,45 @@ EXPORT_SYMBOL_GPL(ulpi_unregister_driver);
 
 /* -------------------------------------------------------------------------- */
 
-static int ulpi_register(struct device *dev, struct ulpi *ulpi)
+static int ulpi_of_register(struct ulpi *ulpi)
 {
-	int ret;
+	struct device_node *np = NULL, *child;
+	struct device *parent;
+
+	/* Find a ulpi bus underneath the parent or the grandparent */
+	parent = ulpi->dev.parent;
+	if (parent->of_node)
+		np = of_find_node_by_name(parent->of_node, "ulpi");
+	else if (parent->parent && parent->parent->of_node)
+		np = of_find_node_by_name(parent->parent->of_node, "ulpi");
+	if (!np)
+		return 0;
+
+	child = of_get_next_available_child(np, NULL);
+	of_node_put(np);
+	if (!child)
+		return -EINVAL;
 
-	ulpi->dev.parent = dev; /* needed early for ops */
+	ulpi->dev.of_node = child;
+
+	return 0;
+}
+
+static int ulpi_read_id(struct ulpi *ulpi)
+{
+	int ret;
 
 	/* Test the interface */
 	ret = ulpi_write(ulpi, ULPI_SCRATCH, 0xaa);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	ret = ulpi_read(ulpi, ULPI_SCRATCH);
 	if (ret < 0)
 		return ret;
 
 	if (ret != 0xaa)
-		return -ENODEV;
+		goto err;
 
 	ulpi->id.vendor = ulpi_read(ulpi, ULPI_VENDOR_ID_LOW);
 	ulpi->id.vendor |= ulpi_read(ulpi, ULPI_VENDOR_ID_HIGH) << 8;
@@ -177,13 +221,35 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
 	ulpi->id.product = ulpi_read(ulpi, ULPI_PRODUCT_ID_LOW);
 	ulpi->id.product |= ulpi_read(ulpi, ULPI_PRODUCT_ID_HIGH) << 8;
 
+	/* Some ULPI devices don't have a vendor id so rely on OF match */
+	if (ulpi->id.vendor == 0)
+		goto err;
+
+	request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.product);
+	return 0;
+err:
+	of_device_request_module(&ulpi->dev);
+	return 0;
+}
+
+static int ulpi_register(struct device *dev, struct ulpi *ulpi)
+{
+	int ret;
+
+	ulpi->dev.parent = dev; /* needed early for ops */
 	ulpi->dev.bus = &ulpi_bus;
 	ulpi->dev.type = &ulpi_dev_type;
 	dev_set_name(&ulpi->dev, "%s.ulpi", dev_name(dev));
 
 	ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));
 
-	request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.product);
+	ret = ulpi_of_register(ulpi);
+	if (ret)
+		return ret;
+
+	ret = ulpi_read_id(ulpi);
+	if (ret)
+		return ret;
 
 	ret = device_register(&ulpi->dev);
 	if (ret)
@@ -234,6 +300,7 @@ EXPORT_SYMBOL_GPL(ulpi_register_interface);
  */
 void ulpi_unregister_interface(struct ulpi *ulpi)
 {
+	of_node_put(ulpi->dev.of_node);
 	device_unregister(&ulpi->dev);
 }
 EXPORT_SYMBOL_GPL(ulpi_unregister_interface);
-- 
2.11.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
