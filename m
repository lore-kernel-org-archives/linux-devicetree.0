From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 06/10] fsi: Match fsi slaves and engines to available dt nodes
Date: Mon, 12 Feb 2018 15:45:45 +1030
Message-ID: <20180212051549.8575-7-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

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

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/Kconfig           |  1 +
 drivers/fsi/fsi-core.c        | 99 +++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master-gpio.c |  4 ++
 drivers/fsi/fsi-master-hub.c  |  4 ++
 4 files changed, 108 insertions(+)

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 513e35173aaa..a326ed663d3c 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -4,6 +4,7 @@
 
 menuconfig FSI
 	tristate "FSI support"
+	depends on OF
 	select CRC4
 	---help---
 	  FSI - the FRU Support Interface - is a simple bus for low-level
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e5dfece248a5..1069cb402bd3 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/fsi.h>
 #include <linux/idr.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
 
@@ -142,6 +143,7 @@ static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
 
+	of_node_put(device->dev.of_node);
 	kfree(device);
 }
 
@@ -334,6 +336,57 @@ extern void fsi_slave_release_range(struct fsi_slave *slave,
 }
 EXPORT_SYMBOL_GPL(fsi_slave_release_range);
 
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
@@ -402,6 +455,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			dev_set_name(&dev->dev, "%02x:%02x:%02x:%02x",
 					slave->master->idx, slave->link,
 					slave->id, i - 2);
+			dev->dev.of_node = fsi_device_find_of_node(dev);
 
 			rc = device_register(&dev->dev);
 			if (rc) {
@@ -558,9 +612,53 @@ static void fsi_slave_release(struct device *dev)
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
@@ -623,6 +721,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	slave->master = master;
 	slave->dev.parent = &master->dev;
+	slave->dev.of_node = fsi_slave_find_of_node(master, link, id);
 	slave->dev.release = fsi_slave_release;
 	slave->link = link;
 	slave->id = id;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index b54c213f3dcb..3f487449a277 100644
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
@@ -593,6 +594,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->dev = &pdev->dev;
 	master->master.dev.parent = master->dev;
+	master->master.dev.of_node = of_node_get(dev_of_node(master->dev));
 
 	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
 	if (IS_ERR(gpio)) {
@@ -664,6 +666,8 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
 	fsi_master_unregister(&master->master);
 
+	of_node_put(master->master.dev.of_node);
+
 	return 0;
 }
 
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 133b9bff1d65..3223a671a0ef 100644
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
2.15.1
