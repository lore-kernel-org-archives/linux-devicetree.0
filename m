From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] usb: gadget: udc: renesas_usb3: add support for generic phy
Date: Fri, 29 Sep 2017 20:45:01 +0900
Message-ID: <1506685501-24988-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for generic phy as an optional. If you want
to use a generic phy (e.g. phy-rcar-gen3-usb3 driver) on this driver,
you have to do "insmod phy-rcar-gen3-usb3.ko" first for now.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/usb/renesas_usb3.txt       |  4 ++++
 drivers/usb/gadget/udc/renesas_usb3.c              | 26 ++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index e280258..87a45e2 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -15,6 +15,10 @@ Required properties:
   - interrupts: Interrupt specifier for the USB3.0 Peripheral
   - clocks: clock phandle and specifier pair
 
+Optional properties:
+  - phys: phandle + phy specifier pair
+  - phy-names: must be "usb"
+
 Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
 		compatible = "renesas,r8a7795-usb3-peri",
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index d55a06b..3ea4e91 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1,7 +1,7 @@
 /*
  * Renesas USB3.0 Peripheral driver (USB gadget)
  *
- * Copyright (C) 2015  Renesas Electronics Corporation
+ * Copyright (C) 2015-2017  Renesas Electronics Corporation
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/sizes.h>
@@ -334,6 +335,7 @@ struct renesas_usb3 {
 	struct usb_gadget_driver *driver;
 	struct extcon_dev *extcon;
 	struct work_struct extcon_work;
+	struct phy *phy;
 
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
@@ -2228,6 +2230,9 @@ static int renesas_usb3_start(struct usb_gadget *gadget,
 	/* hook up the driver */
 	usb3->driver = driver;
 
+	if (usb3->phy)
+		phy_init(usb3->phy);
+
 	pm_runtime_get_sync(usb3_to_dev(usb3));
 
 	renesas_usb3_init_controller(usb3);
@@ -2244,6 +2249,9 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 	usb3->driver = NULL;
 	renesas_usb3_stop_controller(usb3);
 
+	if (usb3->phy)
+		phy_exit(usb3->phy);
+
 	pm_runtime_put(usb3_to_dev(usb3));
 
 	return 0;
@@ -2392,6 +2400,8 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
+	if (usb3->phy)
+		phy_put(usb3->phy);
 	pm_runtime_disable(usb3_to_dev(usb3));
 
 	return 0;
@@ -2623,11 +2633,19 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
+	/*
+	 * This is an optional. So, if this driver cannot get a phy,
+	 * this driver will not handle a phy anymore.
+	 */
+	usb3->phy = devm_phy_get(&pdev->dev, "usb");
+	if (IS_ERR(usb3->phy))
+		usb3->phy = NULL;
+
 	usb3->workaround_for_vbus = priv->workaround_for_vbus;
 
 	renesas_usb3_debugfs_init(usb3, &pdev->dev);
 
-	dev_info(&pdev->dev, "probed\n");
+	dev_info(&pdev->dev, "probed%s\n", usb3->phy ? " with phy" : "");
 	pm_runtime_enable(usb3_to_dev(usb3));
 
 	return 0;
@@ -2654,6 +2672,8 @@ static int renesas_usb3_suspend(struct device *dev)
 		return 0;
 
 	renesas_usb3_stop_controller(usb3);
+	if (usb3->phy)
+		phy_exit(usb3->phy);
 	pm_runtime_put(dev);
 
 	return 0;
@@ -2667,6 +2687,8 @@ static int renesas_usb3_resume(struct device *dev)
 	if (!usb3->driver)
 		return 0;
 
+	if (usb3->phy)
+		phy_init(usb3->phy);
 	pm_runtime_get_sync(dev);
 	renesas_usb3_init_controller(usb3);
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
