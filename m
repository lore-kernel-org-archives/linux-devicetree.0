From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v7 usb-next 3/4] usb: core: hcd: integrate the PHY roothub wrapper
Date: Mon, 23 Oct 2017 23:57:17 +0200
Message-ID: <20171023215718.3446-4-martin.blumenstingl@googlemail.com>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171023215718.3446-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This integrates the PHY roothub wrapper into the core hcd
infrastructure. Multiple PHYs which are part of the roothub devicetree
node (which is a sub-node of the sysdev's node) are now managed
(= powered on/off when needed), by the new usb_phy_roothub code.

One example where this is required is the Amlogic GXL and GXM SoCs:
They are using a dwc3 USB controller with up to three ports enabled on
the internal roothub. Using only the top-level "phy" properties does not
work here since one can only specify one "usb2-phy" and one "usb3-phy",
while actually at least two "usb2-phy" have to be specified.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
---
 drivers/usb/core/hcd.c  | 26 ++++++++++++++++++++++++++
 include/linux/usb/hcd.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 67aa3d039b9b..6ee97222cdad 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -50,6 +50,7 @@
 #include <linux/usb/otg.h>
 
 #include "usb.h"
+#include "phy.h"
 
 
 /*-------------------------------------------------------------------------*/
@@ -2271,6 +2272,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
 		usb_set_device_state(rhdev, USB_STATE_SUSPENDED);
 		hcd->state = HC_STATE_SUSPENDED;
 
+		usb_phy_roothub_power_off(hcd->phy_roothub);
+
 		/* Did we race with a root-hub wakeup event? */
 		if (rhdev->do_remote_wakeup) {
 			char	buffer[6];
@@ -2307,6 +2310,11 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		dev_dbg(&rhdev->dev, "skipped %s of dead bus\n", "resume");
 		return 0;
 	}
+
+	status = usb_phy_roothub_power_on(hcd->phy_roothub);
+	if (status)
+		return status;
+
 	if (!hcd->driver->bus_resume)
 		return -ENOENT;
 	if (HCD_RH_RUNNING(hcd))
@@ -2344,6 +2352,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		}
 	} else {
 		hcd->state = old_state;
+		usb_phy_roothub_power_off(hcd->phy_roothub);
 		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
 				"resume", status);
 		if (status != -ESHUTDOWN)
@@ -2780,6 +2789,16 @@ int usb_add_hcd(struct usb_hcd *hcd,
 		}
 	}
 
+	hcd->phy_roothub = usb_phy_roothub_init(hcd->self.sysdev);
+	if (IS_ERR(hcd->phy_roothub)) {
+		retval = PTR_ERR(hcd->phy_roothub);
+		goto err_phy_roothub_init;
+	}
+
+	retval = usb_phy_roothub_power_on(hcd->phy_roothub);
+	if (retval)
+		goto err_usb_phy_roothub_power_on;
+
 	dev_info(hcd->self.controller, "%s\n", hcd->product_desc);
 
 	/* Keep old behaviour if authorized_default is not in [0, 1]. */
@@ -2944,6 +2963,10 @@ int usb_add_hcd(struct usb_hcd *hcd,
 err_register_bus:
 	hcd_buffer_destroy(hcd);
 err_create_buf:
+	usb_phy_roothub_power_off(hcd->phy_roothub);
+err_usb_phy_roothub_power_on:
+	usb_phy_roothub_exit(hcd->phy_roothub);
+err_phy_roothub_init:
 	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
 		phy_power_off(hcd->phy);
 		phy_exit(hcd->phy);
@@ -3028,6 +3051,9 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	usb_deregister_bus(&hcd->self);
 	hcd_buffer_destroy(hcd);
 
+	usb_phy_roothub_power_off(hcd->phy_roothub);
+	usb_phy_roothub_exit(hcd->phy_roothub);
+
 	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
 		phy_power_off(hcd->phy);
 		phy_exit(hcd->phy);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index a1f03ebfde47..6915b2afc209 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -103,6 +103,7 @@ struct usb_hcd {
 	 */
 	struct usb_phy		*usb_phy;
 	struct phy		*phy;
+	struct usb_phy_roothub	*phy_roothub;
 
 	/* Flags that need to be manipulated atomically because they can
 	 * change while the host controller is running.  Always use
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
