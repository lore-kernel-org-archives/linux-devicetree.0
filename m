From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 09/22] of: mdio: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:51 +0200
Message-ID: <20160606083204.19760-10-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation rather than the MDIO-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/of_mdio.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index e051e1b57609..5d7d95900f44 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -16,6 +16,7 @@
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
@@ -265,12 +266,6 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 }
 EXPORT_SYMBOL(of_mdiobus_register);
 
-/* Helper function for of_phy_find_device */
-static int of_phy_match(struct device *dev, void *phy_np)
-{
-	return dev->of_node == phy_np;
-}
-
 /**
  * of_phy_find_device - Give a PHY node, find the phy_device
  * @phy_np: Pointer to the phy's device tree node
@@ -286,7 +281,7 @@ struct phy_device *of_phy_find_device(struct device_node *phy_np)
 	if (!phy_np)
 		return NULL;
 
-	d = bus_find_device(&mdio_bus_type, NULL, phy_np, of_phy_match);
+	d = bus_find_device(&mdio_bus_type, NULL, phy_np, of_device_match);
 	if (d) {
 		mdiodev = to_mdio_device(d);
 		if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY)
-- 
2.8.3
