From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/22] usb: phy: am335x-control: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:52 +0200
Message-ID: <20160606083204.19760-11-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This driver uses bus_find_device() to go through every platform device
and match using the driver and device tree node. It's more efficient to
use driver_find_device() to iterate over all devices associated with a
particular driver, in which case the matching is reduced to the device
tree node and can be done using the common implementation.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-am335x-control.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/phy/phy-am335x-control.c b/drivers/usb/phy/phy-am335x-control.c
index 42a1afe36a90..1ac16f649154 100644
--- a/drivers/usb/phy/phy-am335x-control.c
+++ b/drivers/usb/phy/phy-am335x-control.c
@@ -2,6 +2,7 @@
 #include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/usb/otg.h>
@@ -117,12 +118,6 @@ static const struct of_device_id omap_control_usb_id_table[] = {
 MODULE_DEVICE_TABLE(of, omap_control_usb_id_table);
 
 static struct platform_driver am335x_control_driver;
-static int match(struct device *dev, void *data)
-{
-	struct device_node *node = (struct device_node *)data;
-	return dev->of_node == node &&
-		dev->driver == &am335x_control_driver.driver;
-}
 
 struct phy_control *am335x_get_phy_control(struct device *dev)
 {
@@ -133,7 +128,8 @@ struct phy_control *am335x_get_phy_control(struct device *dev)
 	if (!node)
 		return NULL;
 
-	dev = bus_find_device(&platform_bus_type, NULL, node, match);
+	dev = driver_find_device(&am335x_control_driver.driver, NULL, node,
+				 of_device_match);
 	if (!dev)
 		return NULL;
 
-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
