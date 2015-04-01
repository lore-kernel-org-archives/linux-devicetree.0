From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH v2 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Wed, 01 Apr 2015 09:23:23 +0200
Message-ID: <1427873005-24024-3-git-send-email-r.baldyga@samsung.com>
References: <1427873005-24024-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427873005-24024-1-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds VBUS pin detection support to extcon-usb-gpio driver.
It allows to use this driver with boards which have both VBUS and ID
pins, or only one of them.

Following table of states presents relationship between this signals
and detected cable type:

 State              |    ID   |   VBUS
----------------------------------------
 [1] USB            |    H    |    H
 [2] none           |    H    |    L
 [3] USB & USB-HOST |    L    |    H
 [4] USB-HOST       |    L    |    L

In case we have only one of these signals:
- VBUS only - we want to distinguish between [1] and [2], so ID is always 1.
- ID only - we want to distinguish between [1] and [4], so VBUS = ID.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
---
 drivers/extcon/extcon-usb-gpio.c | 171 +++++++++++++++++++++++++++------------
 1 file changed, 119 insertions(+), 52 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index f6aa99d..c842715 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -32,7 +32,9 @@ struct usb_extcon_info {
 	struct extcon_dev *edev;
 
 	struct gpio_desc *id_gpiod;
+	struct gpio_desc *vbus_gpiod;
 	int id_irq;
+	int vbus_irq;
 
 	unsigned long debounce_jiffies;
 	struct delayed_work wq_detcable;
@@ -52,40 +54,49 @@ static const char *usb_extcon_cable[] = {
 	NULL,
 };
 
+/*
+ * "USB" = VBUS and "USB-HOST" = !ID, so we have:
+ *
+ *  State              |    ID   |   VBUS
+ * ----------------------------------------
+ *  [1] USB            |    H    |    H
+ *  [2] none           |    H    |    L
+ *  [3] USB & USB-HOST |    L    |    H
+ *  [4] USB-HOST       |    L    |    L
+ *
+ * In case we have only one of these signals:
+ * - VBUS only - we want to distinguish between [1] and [2], so ID is always 1.
+ * - ID only - we want to distinguish between [1] and [4], so VBUS = ID.
+ */
+
 static void usb_extcon_detect_cable(struct work_struct *work)
 {
 	int id;
+	int vbus;
 	struct usb_extcon_info *info = container_of(to_delayed_work(work),
 						    struct usb_extcon_info,
 						    wq_detcable);
 
-	/* check ID and update cable state */
-	id = gpiod_get_value_cansleep(info->id_gpiod);
-	if (id) {
-		/*
-		 * ID = 1 means USB HOST cable detached.
-		 * As we don't have event for USB peripheral cable attached,
-		 * we simulate USB peripheral attach here.
-		 */
-		extcon_set_cable_state(info->edev,
-				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
-				       false);
-		extcon_set_cable_state(info->edev,
-				       usb_extcon_cable[EXTCON_CABLE_USB],
-				       true);
-	} else {
-		/*
-		 * ID = 0 means USB HOST cable attached.
-		 * As we don't have event for USB peripheral cable detached,
-		 * we simulate USB peripheral detach here.
-		 */
+	/* check ID and VBUS and update cable state */
+
+	id = info->id_gpiod ?
+		gpiod_get_value_cansleep(info->id_gpiod) : 1;
+
+	vbus = info->vbus_gpiod ?
+		gpiod_get_value_cansleep(info->vbus_gpiod) : id;
+
+	/* at first we clean states which are no longer active */
+	if (id)
 		extcon_set_cable_state(info->edev,
-				       usb_extcon_cable[EXTCON_CABLE_USB],
-				       false);
+			usb_extcon_cable[EXTCON_CABLE_USB_HOST], false);
+	if (!vbus)
 		extcon_set_cable_state(info->edev,
-				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
-				       true);
-	}
+			usb_extcon_cable[EXTCON_CABLE_USB], false);
+
+	extcon_set_cable_state(info->edev,
+		usb_extcon_cable[EXTCON_CABLE_USB_HOST], !id);
+	extcon_set_cable_state(info->edev,
+		usb_extcon_cable[EXTCON_CABLE_USB], vbus);
 }
 
 static irqreturn_t usb_irq_handler(int irq, void *dev_id)
@@ -113,10 +124,12 @@ static int usb_extcon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	info->dev = dev;
-	info->id_gpiod = devm_gpiod_get(&pdev->dev, "id");
-	if (IS_ERR(info->id_gpiod)) {
-		dev_err(dev, "failed to get ID GPIO\n");
-		return PTR_ERR(info->id_gpiod);
+	info->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
+	info->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus");
+
+	if (!info->id_gpiod && !info->vbus_gpiod) {
+		dev_err(dev, "failed to get gpios\n");
+		return -ENODEV;
 	}
 
 	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
@@ -131,27 +144,51 @@ static int usb_extcon_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = gpiod_set_debounce(info->id_gpiod,
-				 USB_GPIO_DEBOUNCE_MS * 1000);
+	if (info->id_gpiod)
+		ret = gpiod_set_debounce(info->id_gpiod,
+			USB_GPIO_DEBOUNCE_MS * 1000);
+	if (!ret && info->vbus_gpiod) {
+		ret = gpiod_set_debounce(info->vbus_gpiod,
+			USB_GPIO_DEBOUNCE_MS * 1000);
+		if (ret < 0 && info->id_gpiod)
+			gpiod_set_debounce(info->vbus_gpiod, 0);
+	}
 	if (ret < 0)
 		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
 
 	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
 
-	info->id_irq = gpiod_to_irq(info->id_gpiod);
-	if (info->id_irq < 0) {
-		dev_err(dev, "failed to get ID IRQ\n");
-		return info->id_irq;
+	if (info->id_gpiod) {
+		info->id_irq = gpiod_to_irq(info->id_gpiod);
+		if (info->id_irq < 0) {
+			dev_err(dev, "failed to get ID IRQ\n");
+			return info->id_irq;
+		}
+		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
+				usb_irq_handler,
+				IRQF_TRIGGER_RISING |
+				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				pdev->name, info);
+		if (ret < 0) {
+			dev_err(dev, "failed to request handler for ID IRQ\n");
+			return ret;
+		}
 	}
-
-	ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
-					usb_irq_handler,
-					IRQF_TRIGGER_RISING |
-					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					pdev->name, info);
-	if (ret < 0) {
-		dev_err(dev, "failed to request handler for ID IRQ\n");
-		return ret;
+	if (info->vbus_gpiod) {
+		info->vbus_irq = gpiod_to_irq(info->vbus_gpiod);
+		if (info->vbus_irq < 0) {
+			dev_err(dev, "failed to get VBUS IRQ\n");
+			return info->vbus_irq;
+		}
+		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
+				usb_irq_handler,
+				IRQF_TRIGGER_RISING |
+				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				pdev->name, info);
+		if (ret < 0) {
+			dev_err(dev, "failed to request handler for VBUS IRQ\n");
+			return ret;
+		}
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -179,9 +216,16 @@ static int usb_extcon_suspend(struct device *dev)
 	int ret = 0;
 
 	if (device_may_wakeup(dev)) {
-		ret = enable_irq_wake(info->id_irq);
-		if (ret)
-			return ret;
+		if (info->id_gpiod) {
+			ret = enable_irq_wake(info->id_irq);
+			if (ret)
+				return ret;
+		}
+		if (info->vbus_gpiod) {
+			ret = enable_irq_wake(info->vbus_irq);
+			if (ret)
+				goto err;
+		}
 	}
 
 	/*
@@ -189,8 +233,16 @@ static int usb_extcon_suspend(struct device *dev)
 	 * as GPIOs used behind I2C subsystem might not be
 	 * accessible until resume completes. So disable IRQ.
 	 */
-	disable_irq(info->id_irq);
+	if (info->id_gpiod)
+		disable_irq(info->id_irq);
+	if (info->vbus_gpiod)
+		disable_irq(info->vbus_irq);
+
+	return ret;
 
+err:
+	if (info->id_gpiod)
+		disable_irq_wake(info->id_irq);
 	return ret;
 }
 
@@ -200,13 +252,28 @@ static int usb_extcon_resume(struct device *dev)
 	int ret = 0;
 
 	if (device_may_wakeup(dev)) {
-		ret = disable_irq_wake(info->id_irq);
-		if (ret)
-			return ret;
+		if (info->id_gpiod) {
+			ret = disable_irq_wake(info->id_irq);
+			if (ret)
+				return ret;
+		}
+		if (info->vbus_gpiod) {
+			ret = disable_irq_wake(info->vbus_irq);
+			if (ret)
+				goto err;
+		}
 	}
 
-	enable_irq(info->id_irq);
+	if (info->id_gpiod)
+		enable_irq(info->id_irq);
+	if (info->vbus_gpiod)
+		enable_irq(info->vbus_irq);
+
+	return ret;
 
+err:
+	if (info->id_gpiod)
+		enable_irq_wake(info->id_irq);
 	return ret;
 }
 #endif
-- 
1.9.1
