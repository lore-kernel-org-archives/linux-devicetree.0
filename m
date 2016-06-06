From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 11/22] usb: phy: isp1301: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:53 +0200
Message-ID: <20160606083204.19760-12-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This driver uses bus_find_device() to go through every platform device
and match using the driver and device tree node. It's more efficient to
use driver_find_device() to iterate over all devices associated with a
particular driver, in which case the matching is reduced to the device
tree node and can be done using the common implementation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/phy/phy-isp1301.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-isp1301.c b/drivers/usb/phy/phy-isp1301.c
index db68156568e6..a5f5dc0b8c18 100644
--- a/drivers/usb/phy/phy-isp1301.c
+++ b/drivers/usb/phy/phy-isp1301.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
+#include <linux/of_device.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/isp1301.h>
 
@@ -138,18 +139,12 @@ static struct i2c_driver isp1301_driver = {
 
 module_i2c_driver(isp1301_driver);
 
-static int match(struct device *dev, void *data)
-{
-	struct device_node *node = (struct device_node *)data;
-	return (dev->of_node == node) &&
-		(dev->driver == &isp1301_driver.driver);
-}
-
 struct i2c_client *isp1301_get_client(struct device_node *node)
 {
 	if (node) { /* reference of ISP1301 I2C node via DT */
-		struct device *dev = bus_find_device(&i2c_bus_type, NULL,
-						     node, match);
+		struct device *dev = driver_find_device(&isp1301_driver.driver,
+							NULL, node,
+							of_device_match);
 		if (!dev)
 			return NULL;
 		return to_i2c_client(dev);
-- 
2.8.3
