From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH RFC v2 2/2] fsi: Match fsi slaves & engines to available device tree nodes
Date: Tue, 16 May 2017 12:51:25 +0800
Message-ID: <1494910285-20856-3-git-send-email-jk@ozlabs.org>
References: <1494910285-20856-1-git-send-email-jk@ozlabs.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494910285-20856-1-git-send-email-jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This change populates device tree nodes for scanned FSI slaves and
engines. If the master populates ->of_node of the FSI master device,
we'll look for matching slaves, and under those slaves we'll look for
matching engines.

This means that FSI drivers will have their ->of_node pointer populated
if there's a corresponding DT node, which they can use for further
device discover.

Presence of device tree nodes is optional, and only required for
fsi device drivers that need extra properties, or subordinate devices,
to be enumerated.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
---
 drivers/fsi/fsi-core.c        | 99 +++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master-gpio.c |  4 ++
 drivers/fsi/fsi-master-hub.c  |  4 ++
 3 files changed, 107 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e5bba91..8324627 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/fsi.h>
 #include <linux/idr.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 
 #include "fsi-master.h"
@@ -126,6 +127,7 @@ static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
 
+	of_node_put(device->dev.of_node);
 	kfree(device);
 }
 
@@ -314,6 +316,57 @@ extern void fsi_slave_release_range(struct fsi_slave *slave,
 {
 }
 
+static bool fsi_device_node_matches(struct device *dev, struct device_node *np,
+		uint32_t addr, uint32_t size)
+{
+	unsigned int len, na, ns;
+	const __be32 *prop;
+	uint32_t psize;
+
+	na = of_n_addr_cells(np);
+	ns = of_n_size_cells(np);
+
+	if (na != 1 || ns != 1)
+		return false;
+
+	prop = of_get_property(np, "reg", &len);
+	if (!prop || len != 8)
+		return false;
+
+	if (of_read_number(prop, 1) != addr)
+		return false;
+
+	psize = of_read_number(prop + 1, 1);
+	if (psize != size) {
+		dev_warn(dev,
+			"node %s matches probed address, but not size (got 0x%x, expected 0x%x)",
+			of_node_full_name(np), psize, size);
+	}
+
+	return true;
+}
+
+/* Find a matching node for the slave engine at @address, using @size bytes
+ * of space. Returns NULL if not found, or a matching node with refcount
+ * already incremented.
+ */
+static struct device_node *fsi_device_find_of_node(struct fsi_device *dev)
+{
+	struct device_node *parent, *np;
+
+	parent = dev_of_node(&dev->slave->dev);
+	if (!parent)
+		return NULL;
+
+	for_each_child_of_node(parent, np) {
+		if (fsi_device_node_matches(&dev->dev, np,
+					dev->addr, dev->size))
+			return np;
+	}
+
+	return NULL;
+}
+
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
@@ -382,6 +435,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			dev_set_name(&dev->dev, "%02x:%02x:%02x:%02x",
 					slave->master->idx, slave->link,
 					slave->id, i - 2);
+			dev->dev.of_node = fsi_device_find_of_node(dev);
 
 			rc = device_register(&dev->dev);
 			if (rc) {
@@ -577,9 +631,53 @@ static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
 
+	of_node_put(dev->of_node);
 	kfree(slave);
 }
 
+static bool fsi_slave_node_matches(struct device_node *np,
+		int link, uint8_t id)
+{
+	unsigned int len, na, ns;
+	const __be32 *prop;
+
+	na = of_n_addr_cells(np);
+	ns = of_n_size_cells(np);
+
+	/* Ensure we have the correct format for addresses and sizes in
+	 * reg properties
+	 */
+	if (na != 2 || ns != 0)
+		return false;
+
+	prop = of_get_property(np, "reg", &len);
+	if (!prop || len != 8)
+		return false;
+
+	return (of_read_number(prop, 1) == link) &&
+		(of_read_number(prop + 1, 1) == id);
+}
+
+/* Find a matching node for the slave at (link, id). Returns NULL if none
+ * found, or a matching node with refcount already incremented.
+ */
+static struct device_node *fsi_slave_find_of_node(struct fsi_master *master,
+		int link, uint8_t id)
+{
+	struct device_node *parent, *np;
+
+	parent = dev_of_node(&master->dev);
+	if (!parent)
+		return NULL;
+
+	for_each_child_of_node(parent, np) {
+		if (fsi_slave_node_matches(np, link, id))
+			return np;
+	}
+
+	return NULL;
+}
+
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
 	uint32_t chip_id, llmode;
@@ -642,6 +740,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	slave->master = master;
 	slave->dev.parent = &master->dev;
+	slave->dev.of_node = fsi_slave_find_of_node(master, link, id);
 	slave->dev.release = fsi_slave_release;
 	slave->link = link;
 	slave->id = id;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 67b2d77..b349d5e 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -9,6 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -533,6 +534,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->dev = &pdev->dev;
 	master->master.dev.parent = master->dev;
+	master->master.dev.of_node = of_node_get(dev_of_node(master->dev));
 	master->master.dev.release = fsi_master_gpio_release;
 
 	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
@@ -602,6 +604,8 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
 	fsi_master_unregister(&master->master);
 
+	of_node_put(master->master.dev.of_node);
+
 	return 0;
 }
 
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 133b9bf..3223a67 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 
 #include "fsi-master.h"
@@ -274,6 +275,7 @@ static int hub_master_probe(struct device *dev)
 
 	hub->master.dev.parent = dev;
 	hub->master.dev.release = hub_master_release;
+	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
 
 	hub->master.n_links = links;
 	hub->master.read = hub_master_read;
@@ -302,6 +304,8 @@ static int hub_master_remove(struct device *dev)
 
 	fsi_master_unregister(&hub->master);
 	fsi_slave_release_range(hub->upstream->slave, hub->addr, hub->size);
+	of_node_put(hub->master.dev.of_node);
+
 	return 0;
 }
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
