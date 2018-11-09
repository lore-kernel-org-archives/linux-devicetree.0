From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V4 2/5] usb: core: Add ability to skip phy exit on suspend and init on resume
Date: Fri,  9 Nov 2018 09:01:57 -0500
Message-ID: <1541772120-40394-3-git-send-email-alcooperx@gmail.com>
References: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@li>
List-Id: devicetree@vger.kernel.org

Add the ability to skip calling the PHY's exit routine on suspend
and the PHY's init routine on resume. This is to handle a USB PHY
that should have it's power_off function called on suspend but cannot
have it's exit function called because on exit it will disable the
PHY to the point where all USB clocks are stopped and register
accesses to the Host Controllers using the PHY will be disabled
and the host drivers will crash.

This is enabled with the HCD flag "phy_supplies_usb_clock" which
can be set from any HCD driver or with the device tree property
"phy-supplies-usb-clock".

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/core/hcd.c  |  8 ++++----
 drivers/usb/core/phy.c  | 28 ++++++++++++++++++++--------
 drivers/usb/core/phy.h  |  9 ++++++---
 include/linux/usb/hcd.h |  6 ++++++
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 487025d31d44..5ebc82a69403 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2249,7 +2249,7 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
 		hcd->state = HC_STATE_SUSPENDED;
 
 		if (!PMSG_IS_AUTO(msg))
-			usb_phy_roothub_suspend(hcd->self.sysdev,
+			usb_phy_roothub_suspend(hcd,
 						hcd->phy_roothub);
 
 		/* Did we race with a root-hub wakeup event? */
@@ -2290,7 +2290,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 	}
 
 	if (!PMSG_IS_AUTO(msg)) {
-		status = usb_phy_roothub_resume(hcd->self.sysdev,
+		status = usb_phy_roothub_resume(hcd,
 						hcd->phy_roothub);
 		if (status)
 			return status;
@@ -2333,7 +2333,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		}
 	} else {
 		hcd->state = old_state;
-		usb_phy_roothub_suspend(hcd->self.sysdev, hcd->phy_roothub);
+		usb_phy_roothub_suspend(hcd, hcd->phy_roothub);
 		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
 				"resume", status);
 		if (status != -ESHUTDOWN)
@@ -2730,7 +2730,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	struct usb_device *rhdev;
 
 	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
-		hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
+		hcd->phy_roothub = usb_phy_roothub_alloc(hcd);
 		if (IS_ERR(hcd->phy_roothub))
 			return PTR_ERR(hcd->phy_roothub);
 
diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 38b2c776c4b4..8bfbacb52a7b 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -46,10 +46,11 @@ static int usb_phy_roothub_add_phy(struct device *dev, int index,
 	return 0;
 }
 
-struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
+struct usb_phy_roothub *usb_phy_roothub_alloc(struct usb_hcd *hcd)
 {
 	struct usb_phy_roothub *phy_roothub;
 	int i, num_phys, err;
+	struct device *dev = hcd->self.sysdev;
 
 	if (!IS_ENABLED(CONFIG_GENERIC_PHY))
 		return NULL;
@@ -59,6 +60,9 @@ struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
 	if (num_phys <= 0)
 		return NULL;
 
+	if (device_property_read_bool(dev, "phy-supplies-usb-clock"))
+		hcd->phy_supplies_usb_clock = 1;
+
 	phy_roothub = devm_kzalloc(dev, sizeof(*phy_roothub), GFP_KERNEL);
 	if (!phy_roothub)
 		return ERR_PTR(-ENOMEM);
@@ -162,26 +166,33 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
 
-int usb_phy_roothub_suspend(struct device *controller_dev,
+int usb_phy_roothub_suspend(struct usb_hcd *hcd,
 			    struct usb_phy_roothub *phy_roothub)
 {
+	struct device *controller_dev = hcd->self.sysdev;
+
 	usb_phy_roothub_power_off(phy_roothub);
 
-	/* keep the PHYs initialized so the device can wake up the system */
-	if (device_may_wakeup(controller_dev))
+	/*
+	 * keep the PHYs initialized so the device can wake up the system
+	 * or if needed to keep the USB clocks enabled.
+	 */
+	if (device_may_wakeup(controller_dev) || hcd->phy_supplies_usb_clock)
 		return 0;
 
 	return usb_phy_roothub_exit(phy_roothub);
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_suspend);
 
-int usb_phy_roothub_resume(struct device *controller_dev,
+int usb_phy_roothub_resume(struct usb_hcd *hcd,
 			   struct usb_phy_roothub *phy_roothub)
 {
+	struct device *controller_dev = hcd->self.sysdev;
 	int err;
 
-	/* if the device can't wake up the system _exit was called */
-	if (!device_may_wakeup(controller_dev)) {
+	/* if _exit was called on suspend */
+	if (!device_may_wakeup(controller_dev) &&
+	    !hcd->phy_supplies_usb_clock) {
 		err = usb_phy_roothub_init(phy_roothub);
 		if (err)
 			return err;
@@ -190,7 +201,8 @@ int usb_phy_roothub_resume(struct device *controller_dev,
 	err = usb_phy_roothub_power_on(phy_roothub);
 
 	/* undo _init if _power_on failed */
-	if (err && !device_may_wakeup(controller_dev))
+	if (err && !device_may_wakeup(controller_dev)
+	    && !hcd->phy_supplies_usb_clock)
 		usb_phy_roothub_exit(phy_roothub);
 
 	return err;
diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index 88a3c037e9df..34293e11a917 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -5,13 +5,16 @@
  * Copyright (C) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  */
 
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
 #ifndef __USB_CORE_PHY_H_
 #define __USB_CORE_PHY_H_
 
 struct device;
 struct usb_phy_roothub;
 
-struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);
+struct usb_phy_roothub *usb_phy_roothub_alloc(struct usb_hcd *hcd);
 
 int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub);
 int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
@@ -19,9 +22,9 @@
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
 void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
 
-int usb_phy_roothub_suspend(struct device *controller_dev,
+int usb_phy_roothub_suspend(struct usb_hcd *hcd,
 			    struct usb_phy_roothub *phy_roothub);
-int usb_phy_roothub_resume(struct device *controller_dev,
+int usb_phy_roothub_resume(struct usb_hcd *hcd,
 			   struct usb_phy_roothub *phy_roothub);
 
 #endif /* __USB_CORE_PHY_H_ */
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 97e2ddec18b1..7c42cf0f6835 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -157,6 +157,12 @@ struct usb_hcd {
 	 */
 	unsigned		skip_phy_initialization:1;
 
+	/*
+	 * Some phys supply the USB controller clocks and should not
+	 * have exit called on suspend.
+	 */
+	unsigned		phy_supplies_usb_clock:1;
+
 	/* The next flag is a stopgap, to be removed when all the HCDs
 	 * support the new root-hub polling mechanism. */
 	unsigned		uses_new_polling:1;
-- 
1.9.0.138.g2de3478
