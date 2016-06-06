From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/22] net: cpsw-phy-sel: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:47 +0200
Message-ID: <20160606083204.19760-6-thierry.reding@gmail.com>
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
 drivers/net/ethernet/ti/cpsw-phy-sel.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw-phy-sel.c b/drivers/net/ethernet/ti/cpsw-phy-sel.c
index c3e85acfdc70..bb0de7744681 100644
--- a/drivers/net/ethernet/ti/cpsw-phy-sel.c
+++ b/drivers/net/ethernet/ti/cpsw-phy-sel.c
@@ -143,12 +143,6 @@ static void cpsw_gmii_sel_dra7xx(struct cpsw_phy_sel_priv *priv,
 }
 
 static struct platform_driver cpsw_phy_sel_driver;
-static int match(struct device *dev, void *data)
-{
-	struct device_node *node = (struct device_node *)data;
-	return dev->of_node == node &&
-		dev->driver == &cpsw_phy_sel_driver.driver;
-}
 
 void cpsw_phy_sel(struct device *dev, phy_interface_t phy_mode, int slave)
 {
@@ -161,7 +155,8 @@ void cpsw_phy_sel(struct device *dev, phy_interface_t phy_mode, int slave)
 		return;
 	}
 
-	dev = bus_find_device(&platform_bus_type, NULL, node, match);
+	dev = driver_find_device(&cpsw_phy_sel_driver.driver, NULL, node,
+				 of_device_match);
 	priv = dev_get_drvdata(dev);
 
 	priv->cpsw_phy_sel(priv, phy_mode, slave);
-- 
2.8.3
