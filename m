From: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Subject: [RFC PATCH] net: phy: Added device tree binding for dev-addr and dev-addr code check-up and usage
Date: Tue, 20 Mar 2018 08:46:15 -0500
Message-ID: <20180320134615.17817-1-vicentiu.galanopulo@nxp.com>
Reply-To: vicentiu.galanopulo@nxp.com
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org
Cc: madalin.bucur@nxp.com, alexandru.marginean@nxp.com
List-Id: devicetree@vger.kernel.org

Reason for this patch is that the Inphi PHY
has a vendor specific address space for accessing
the C45 MDIO registers - starting from 0x1e.

A new function has been added, get_phy_c45_dev_addr,
which loops through all the PHY device nodes under
a MDIO bus node and looks for the <dev-addr> property. If
it's not set/found, the get_phy_c45_devs_in_pkg,
will be called with the value 0 as dev_addr parameter,
else it will be called with the dev-addr property
value from the device tree.

As a plus to this patch, num_ids in get_phy_c45_ids,
has the value 8 (ARRAY_SIZE(c45_ids->device_ids)), but
the u32 *devs can store 32 devices in the bitfield. If
a device is stored in *devs, in bits 32 to 9, it
will not be found. This is the reason for changing in phy.h,
the size of device_ids array.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
---
 Documentation/devicetree/bindings/net/phy.txt |  6 ++
 drivers/net/phy/phy_device.c                  | 80 ++++++++++++++++++++++++++-
 include/linux/phy.h                           |  2 +-
 3 files changed, 84 insertions(+), 4 deletions(-)

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
index b285323..35b9a2b 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -442,6 +442,52 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 }
 
 /**
+ * get_phy_c45_dev_addr - reads the C45 PHY device register address
+ * from the  PHY device tree node
+ * @bus: the target MII bus
+ * @addr: PHY address on the MII bus
+ * @dev_addr: where to store the device address of the C45 PHY.
+ *
+ * Description: reads the PHY device address in @dev_addr
+ * from PHY at @addr on @bus.
+ *
+ * Returns: 0 on success, -EIO and -ENODEV on failure.
+ */
+static int get_phy_c45_dev_addr(struct mii_bus *bus,
+				int addr, int *dev_addr)
+{
+	struct device_node *child;
+	u32 reg_addr;
+	int ret;
+
+	if (!bus->dev.of_node)
+		return -ENODEV;
+
+	for_each_available_child_of_node(bus->dev.of_node, child) {
+		ret = of_property_read_u32(child, "reg", &reg_addr);
+		if (ret < 0) {
+			dev_err(&bus->dev, "%s has invalid PHY address\n",
+				child->full_name);
+			*dev_addr = 0;
+			return -EINVAL;
+		}
+
+		/* match the device address with the device tree address */
+		if (reg_addr == addr) {
+			ret = of_property_read_u32(child, "dev-addr", dev_addr);
+			if (ret < 0) {
+				dev_warn(&bus->dev, "No PHY device address defined for %s\n",
+					 child->full_name);
+				*dev_addr = 0;
+			}
+			break;
+		}
+	}
+
+	return 0;
+}
+
+/**
  * get_phy_c45_ids - reads the specified addr for its 802.3-c45 IDs.
  * @bus: the target MII bus
  * @addr: PHY address on the MII bus
@@ -458,6 +504,9 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr, u32 *phy_id,
 			   struct phy_c45_device_ids *c45_ids) {
 	int phy_reg;
 	int i, reg_addr;
+	int dev_addr = 0;
+	int ret;
+	int dev_reg_addr;
 	const int num_ids = ARRAY_SIZE(c45_ids->device_ids);
 	u32 *devs = &c45_ids->devices_in_package;
 
@@ -475,9 +524,27 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr, u32 *phy_id,
 			 *  10G PHYs have zero Devices In package,
 			 *  e.g. Cortina CS4315/CS4340 PHY.
 			 */
-			phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, devs);
+
+			/*  Check if the device address
+			 *  is set in the device tree
+			 */
+			ret = get_phy_c45_dev_addr(bus, addr, &dev_addr);
+			/*  Exit only when MDIO querying fails
+			 *  or <reg> property is not set in the
+			 *  PHY device tree node.
+			 */
+			if (ret < 0)
+				return -EIO;
+
+			/*  If the device tree property (dev-addr)
+			 *  is not set, the default value for
+			 *  dev_addr is 0.
+			 */
+			phy_reg = get_phy_c45_devs_in_pkg(bus, addr,
+							  dev_addr, devs);
 			if (phy_reg < 0)
 				return -EIO;
+
 			/* no device there, let's get out of here */
 			if ((*devs & 0x1fffffff) == 0x1fffffff) {
 				*phy_id = 0xffffffff;
@@ -493,13 +560,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr, u32 *phy_id,
 		if (!(c45_ids->devices_in_package & (1 << i)))
 			continue;
 
-		reg_addr = MII_ADDR_C45 | i << 16 | MII_PHYSID1;
+		/*  If dev-addr is set in the device tree,
+		 *  use that property value for querying
+		 *  the PHY device ID.
+		 */
+
+		dev_reg_addr = (!!dev_addr ? dev_addr : i) << 16;
+		reg_addr = MII_ADDR_C45 | dev_reg_addr | MII_PHYSID1;
 		phy_reg = mdiobus_read(bus, addr, reg_addr);
 		if (phy_reg < 0)
 			return -EIO;
 		c45_ids->device_ids[i] = (phy_reg & 0xffff) << 16;
 
-		reg_addr = MII_ADDR_C45 | i << 16 | MII_PHYSID2;
+		dev_reg_addr = (!!dev_addr ? dev_addr : i) << 16;
+		reg_addr = MII_ADDR_C45 | dev_reg_addr | MII_PHYSID2;
 		phy_reg = mdiobus_read(bus, addr, reg_addr);
 		if (phy_reg < 0)
 			return -EIO;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5a9b175..c3b3633 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -360,7 +360,7 @@ enum phy_state {
  */
 struct phy_c45_device_ids {
 	u32 devices_in_package;
-	u32 device_ids[8];
+	u32 device_ids[32];
 };
 
 /* phy_device: An instance of a PHY
-- 
2.7.4
