From: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Subject: [RFC PATCH v2] net: phy: Added device tree binding for dev-addr and dev-addr code check-up
Date: Fri, 23 Mar 2018 10:05:22 -0500
Message-ID: <20180323150522.9603-1-vicentiu.galanopulo@nxp.com>
Reply-To: vicentiu.galanopulo@nxp.com
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org
Cc: madalin.bucur@nxp.com, alexandru.marginean@nxp.com
List-Id: devicetree@vger.kernel.org

Reason for this patch is that the Inphi PHY has a
vendor specific address space for accessing the
C45 MDIO registers - starting from 0x1e.

A search of the dev-addr property is done in of_mdiobus_register.
If the property is found in the PHY node,
of_mdiobus_register_static_phy is called. This is a
wrapper function for of_mdiobus_register_phy which finds the
device in package based on dev-addr and fills devices_addrs:
devices_addrs is a new field added to phy_c45_device_ids.
This new field will store the dev-addr property on the same
index where the device in package has been found.
In order to have dev-addr in get_phy_c45_ids(), mdio_c45_ids is
passed from of_mdio.c to phy_device.c as an external variable.
In get_phy_device a copy of the mdio_c45_ids is done over the
local c45_ids (wich are empty). After the copying, the c45_ids
will also contain the static device found from dev-addr.
Having dev-addr stored in devices_addrs, in get_phy_c45_ids(),
when probing the identifiers, dev-addr can be extracted from
devices_addrs and probed if devices_addrs[current_identifier]
is not 0.
This way changing the kernel API is avoided completely.

As a plus to this patch, num_ids in get_phy_c45_ids,
has the value 8 (ARRAY_SIZE(c45_ids->device_ids)),
but the u32 *devs can store 32 devices in the bitfield.
If a device is stored in *devs, in bits 32 to 9, it
will not be found. This is the reason for changing
in phy.h, the size of device_ids array.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
---
 Documentation/devicetree/bindings/net/phy.txt |  6 ++
 drivers/net/phy/phy_device.c                  | 22 +++++-
 drivers/of/of_mdio.c                          | 98 ++++++++++++++++++++++++++-
 include/linux/phy.h                           |  5 +-
 4 files changed, 125 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index d2169a5..82692e2 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -61,6 +61,11 @@ Optional Properties:
 - reset-deassert-us: Delay after the reset was deasserted in microseconds.
   If this property is missing the delay will be skipped.
 
+- dev-addr: If set, it indicates the device address of the PHY to be used
+  when accessing the C45 PHY registers over MDIO. It is used for vendor specific
+  register space addresses that do no conform to standard address for the MDIO
+  registers (e.g. MMD30)
+
 Example:
 
 ethernet-phy@0 {
@@ -72,4 +77,5 @@ ethernet-phy@0 {
 	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	reset-assert-us = <1000>;
 	reset-deassert-us = <2000>;
+	dev-addr = <0x1e>;
 };
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b285323..f5051cf6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -71,6 +71,7 @@ static void phy_mdio_device_remove(struct mdio_device *mdiodev)
 
 static struct phy_driver genphy_driver;
 extern struct phy_driver genphy_10g_driver;
+extern struct phy_c45_device_ids mdio_c45_ids;
 
 static LIST_HEAD(phy_fixup_list);
 static DEFINE_MUTEX(phy_fixup_lock);
@@ -457,7 +458,7 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 static int get_phy_c45_ids(struct mii_bus *bus, int addr, u32 *phy_id,
 			   struct phy_c45_device_ids *c45_ids) {
 	int phy_reg;
-	int i, reg_addr;
+	int i, reg_addr, dev_addr;
 	const int num_ids = ARRAY_SIZE(c45_ids->device_ids);
 	u32 *devs = &c45_ids->devices_in_package;
 
@@ -493,13 +494,23 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr, u32 *phy_id,
 		if (!(c45_ids->devices_in_package & (1 << i)))
 			continue;
 
-		reg_addr = MII_ADDR_C45 | i << 16 | MII_PHYSID1;
+		/* if c45_ids->devices_addrs for the current id is not 0,
+		 * then dev-addr was defined in the device tree node,
+		 * and the PHY as been seen as a valid device, and added,
+		 * in the package. In this case we can use the
+		 * dev-addr(c45_ids->devices_addrs[i]) to do the MDIO
+		 * reading of the PHY ID.
+		 */
+		dev_addr = !!c45_ids->devices_addrs[i] ?
+					c45_ids->devices_addrs[i] : i;
+
+		reg_addr = MII_ADDR_C45 | dev_addr << 16 | MII_PHYSID1;
 		phy_reg = mdiobus_read(bus, addr, reg_addr);
 		if (phy_reg < 0)
 			return -EIO;
 		c45_ids->device_ids[i] = (phy_reg & 0xffff) << 16;
 
-		reg_addr = MII_ADDR_C45 | i << 16 | MII_PHYSID2;
+		reg_addr = MII_ADDR_C45 | dev_addr << 16 | MII_PHYSID2;
 		phy_reg = mdiobus_read(bus, addr, reg_addr);
 		if (phy_reg < 0)
 			return -EIO;
@@ -566,6 +577,11 @@ struct phy_device *get_phy_device(struct mii_bus *bus, int addr, bool is_c45)
 	u32 phy_id = 0;
 	int r;
 
+	/* copy the external mdio_c45_ids (which may contain the id's found
+	 * by serching the device tree dev-addr property) to local c45_ids
+	 */
+	memcpy(&c45_ids, &mdio_c45_ids, sizeof(struct phy_c45_device_ids));
+
 	r = get_phy_id(bus, addr, &phy_id, is_c45, &c45_ids);
 	if (r)
 		return ERR_PTR(r);
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 8c0c927..cbc34f6 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -24,6 +24,8 @@
 
 #define DEFAULT_GPIO_RESET_DELAY	10	/* in microseconds */
 
+struct phy_c45_device_ids mdio_c45_ids = {0};
+
 MODULE_AUTHOR("Grant Likely <grant.likely@secretlab.ca>");
 MODULE_LICENSE("GPL");
 
@@ -190,6 +192,71 @@ static bool of_mdiobus_child_is_phy(struct device_node *child)
 	return false;
 }
 
+static void of_fill_c45ids_devs_addrs(u32 dev_addr)
+{
+	int i;
+	const int num_ids = ARRAY_SIZE(mdio_c45_ids.device_ids);
+
+	/* Search through all Device Identifiers and set
+	 * dev_addr in mdio_c45_ids.devices_addrs,
+	 * if the device bit is set in
+	 * mdio_c45_ids.devices_in_package
+	 */
+	for (i = 1; i < num_ids; i++) {
+		if (!(mdio_c45_ids.devices_in_package & (1 << i)))
+			continue;
+
+		mdio_c45_ids.devices_addrs[i] = dev_addr;
+		break;
+	}
+}
+
+static int of_find_devaddr_in_pkg(struct mii_bus *bus, u32 addr,
+				  u32 dev_addr)
+{
+	u32 *devs = &mdio_c45_ids.devices_in_package;
+	int phy_reg, reg_addr;
+
+	reg_addr = MII_ADDR_C45 | dev_addr << 16 | MDIO_DEVS2;
+	phy_reg = mdiobus_read(bus, addr, reg_addr);
+	if (phy_reg < 0)
+		return -EIO;
+
+	*devs = (phy_reg & 0xffff) << 16;
+
+	reg_addr = MII_ADDR_C45 | dev_addr << 16 | MDIO_DEVS1;
+	phy_reg = mdiobus_read(bus, addr, reg_addr);
+	if (phy_reg < 0)
+		return -EIO;
+
+	*devs |= (phy_reg & 0xffff);
+
+	return 0;
+}
+
+/*
+ * Finds the device in package and populates the mdio_c45_ids
+ * if any device is found at dev_addr address. After this
+ * the PHY is registered
+ */
+static int of_mdiobus_register_static_phy(struct mii_bus *mdio,
+					  struct device_node *child,
+					  u32 addr, u32 dev_addr)
+{
+	int dev_err = 0;
+
+	if (!dev_addr)
+		goto exit_register_phy;
+
+	dev_err = of_find_devaddr_in_pkg(mdio, addr, dev_addr);
+
+	if (!dev_err)
+		of_fill_c45ids_devs_addrs(dev_addr);
+
+exit_register_phy:
+	return of_mdiobus_register_phy(mdio, child, addr);
+}
+
 /**
  * of_mdiobus_register - Register mii_bus and create PHYs from the device tree
  * @mdio: pointer to mii_bus structure
@@ -202,7 +269,10 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 {
 	struct device_node *child;
 	bool scanphys = false;
+	bool dev_addr_found = true;
 	int addr, rc;
+	int dev_addr = 0;
+	int ret;
 
 	/* Do not continue if the node is disabled */
 	if (!of_device_is_available(np))
@@ -226,6 +296,14 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 
 	/* Loop over the child nodes and register a phy_device for each phy */
 	for_each_available_child_of_node(np, child) {
+		/* Check if dev-addr is set in the PHY node */
+		ret = of_property_read_u32(child, "dev-addr", &dev_addr);
+
+		if (ret < 0) {
+			/* either not set or invalid */
+			dev_addr_found = false;
+		}
+
 		addr = of_mdio_parse_addr(&mdio->dev, child);
 		if (addr < 0) {
 			scanphys = true;
@@ -233,7 +311,11 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 		}
 
 		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
+			if (dev_addr_found)
+				rc = of_mdiobus_register_static_phy(mdio, child,
+								    addr, dev_addr);
+			else
+				rc = of_mdiobus_register_phy(mdio, child, addr);
 		else
 			rc = of_mdiobus_register_device(mdio, child, addr);
 
@@ -248,8 +330,16 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 	if (!scanphys)
 		return 0;
 
+	/* reset device found variable */
+	dev_addr_found = true;
+
 	/* auto scan for PHYs with empty reg property */
 	for_each_available_child_of_node(np, child) {
+		/* Check if dev-addr is set in the PHY node,
+		 * for PHYs which don't have reg property set
+		 */
+		ret = of_property_read_u32(child, "dev-addr", &dev_addr);
+
 		/* Skip PHYs with reg property set */
 		if (of_find_property(child, "reg", NULL))
 			continue;
@@ -264,7 +354,11 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 				 child->name, addr);
 
 			if (of_mdiobus_child_is_phy(child)) {
-				rc = of_mdiobus_register_phy(mdio, child, addr);
+				if (dev_addr_found)
+					rc = of_mdiobus_register_static_phy(mdio, child,
+									    addr, dev_addr);
+				else
+					rc = of_mdiobus_register_phy(mdio, child, addr);
 				if (rc && rc != -ENODEV)
 					goto unregister;
 			}
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5a9b175..161ad90 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -357,10 +357,13 @@ enum phy_state {
  * struct phy_c45_device_ids - 802.3-c45 Device Identifiers
  * @devices_in_package: Bit vector of devices present.
  * @device_ids: The device identifer for each present device.
+ * @devices_addrs: The devices addresses from the device tree
+ *		   for each present device.
  */
 struct phy_c45_device_ids {
 	u32 devices_in_package;
-	u32 device_ids[8];
+	u32 device_ids[32];
+	u32 devices_addrs[32];
 };
 
 /* phy_device: An instance of a PHY
-- 
2.7.4
