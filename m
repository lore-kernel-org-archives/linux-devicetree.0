From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Sun,  2 Nov 2014 19:11:49 +0100
Message-ID: <1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414951910-16075-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to prepare device-tree conversion, port gpio_vbus to use
gpio_desc.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 drivers/usb/phy/phy-gpio-vbus-usb.c | 105 +++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index f4b14bd..d302ab2 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -10,6 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -40,6 +41,8 @@ struct gpio_vbus_data {
 	struct delayed_work	work;
 	int			vbus;
 	int			irq;
+	struct gpio_desc	*gpiod_vbus;
+	struct gpio_desc	*gpiod_pullup;
 };
 
 
@@ -86,28 +89,21 @@ static void set_vbus_draw(struct gpio_vbus_data *gpio_vbus, unsigned mA)
 	gpio_vbus->mA = mA;
 }
 
-static int is_vbus_powered(struct gpio_vbus_mach_info *pdata)
+static int is_vbus_powered(struct gpio_vbus_data *gpio_vbus)
 {
-	int vbus;
-
-	vbus = gpio_get_value(pdata->gpio_vbus);
-	if (pdata->gpio_vbus_inverted)
-		vbus = !vbus;
-
-	return vbus;
+	return gpiod_get_value(gpio_vbus->gpiod_vbus);
 }
 
 static void gpio_vbus_work(struct work_struct *work)
 {
 	struct gpio_vbus_data *gpio_vbus =
 		container_of(work, struct gpio_vbus_data, work.work);
-	struct gpio_vbus_mach_info *pdata = dev_get_platdata(gpio_vbus->dev);
-	int gpio, status, vbus;
+	int status, vbus;
 
 	if (!gpio_vbus->phy.otg->gadget)
 		return;
 
-	vbus = is_vbus_powered(pdata);
+	vbus = is_vbus_powered(gpio_vbus);
 	if ((vbus ^ gpio_vbus->vbus) == 0)
 		return;
 	gpio_vbus->vbus = vbus;
@@ -117,8 +113,6 @@ static void gpio_vbus_work(struct work_struct *work)
 	 * isp1301_omap::b_peripheral() does and enable the pullup here... although
 	 * that may complicate usb_gadget_{,dis}connect() support.
 	 */
-	gpio = pdata->gpio_pullup;
-
 	if (vbus) {
 		status = USB_EVENT_VBUS;
 		gpio_vbus->phy.state = OTG_STATE_B_PERIPHERAL;
@@ -129,15 +123,15 @@ static void gpio_vbus_work(struct work_struct *work)
 		set_vbus_draw(gpio_vbus, 100);
 
 		/* optionally enable D+ pullup */
-		if (gpio_is_valid(gpio))
-			gpio_set_value(gpio, !pdata->gpio_pullup_inverted);
+		if (gpio_vbus->gpiod_pullup)
+			gpiod_set_value(gpio_vbus->gpiod_pullup, 1);
 
 		atomic_notifier_call_chain(&gpio_vbus->phy.notifier,
 					   status, gpio_vbus->phy.otg->gadget);
 	} else {
 		/* optionally disable D+ pullup */
-		if (gpio_is_valid(gpio))
-			gpio_set_value(gpio, pdata->gpio_pullup_inverted);
+		if (gpio_vbus->gpiod_pullup)
+			gpiod_set_value(gpio_vbus->gpiod_pullup, 0);
 
 		set_vbus_draw(gpio_vbus, 0);
 
@@ -155,12 +149,11 @@ static void gpio_vbus_work(struct work_struct *work)
 static irqreturn_t gpio_vbus_irq(int irq, void *data)
 {
 	struct platform_device *pdev = data;
-	struct gpio_vbus_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 	struct usb_otg *otg = gpio_vbus->phy.otg;
 
 	dev_dbg(&pdev->dev, "VBUS %s (gadget: %s)\n",
-		is_vbus_powered(pdata) ? "supplied" : "inactive",
+		is_vbus_powered(gpio_vbus) ? "supplied" : "inactive",
 		otg->gadget ? otg->gadget->name : "none");
 
 	if (otg->gadget)
@@ -176,22 +169,18 @@ static int gpio_vbus_set_peripheral(struct usb_otg *otg,
 					struct usb_gadget *gadget)
 {
 	struct gpio_vbus_data *gpio_vbus;
-	struct gpio_vbus_mach_info *pdata;
 	struct platform_device *pdev;
-	int gpio;
 
 	gpio_vbus = container_of(otg->phy, struct gpio_vbus_data, phy);
 	pdev = to_platform_device(gpio_vbus->dev);
-	pdata = dev_get_platdata(gpio_vbus->dev);
-	gpio = pdata->gpio_pullup;
 
 	if (!gadget) {
 		dev_dbg(&pdev->dev, "unregistering gadget '%s'\n",
 			otg->gadget->name);
 
 		/* optionally disable D+ pullup */
-		if (gpio_is_valid(gpio))
-			gpio_set_value(gpio, pdata->gpio_pullup_inverted);
+		if (gpio_vbus->gpiod_pullup)
+			gpiod_set_value(gpio_vbus->gpiod_pullup, 0);
 
 		set_vbus_draw(gpio_vbus, 0);
 
@@ -246,12 +235,29 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 	struct gpio_vbus_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_vbus_data *gpio_vbus;
 	struct resource *res;
-	int err, gpio, irq;
-	unsigned long irqflags;
-
-	if (!pdata || !gpio_is_valid(pdata->gpio_vbus))
+	struct gpio_desc *gpiod = NULL;
+	int err, gpio, irq, wakeup = 0;
+	unsigned long irqflags, gpio_flags;
+
+	if (pdata) {
+		gpio = pdata->gpio_vbus;
+		gpio_flags = pdata->gpio_vbus_inverted ? GPIOF_ACTIVE_LOW : 0;
+		if (gpio_is_valid(gpio)) {
+			err = devm_gpio_request_one(&pdev->dev, gpio,
+						    gpio_flags,
+						    "vbus_detect");
+			if (err) {
+				dev_err(&pdev->dev, "can't request vbus gpio %d, err: %d\n",
+					gpio, err);
+				return err;
+			}
+		}
+		gpiod = gpio_to_desc(gpio);
+		wakeup = pdata->wakeup;
+	}
+	if (!gpiod)
 		return -EINVAL;
-	gpio = pdata->gpio_vbus;
+	gpiod_direction_input(gpiod);
 
 	gpio_vbus = devm_kzalloc(&pdev->dev, sizeof(struct gpio_vbus_data),
 				 GFP_KERNEL);
@@ -274,37 +280,38 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 	gpio_vbus->phy.otg->phy = &gpio_vbus->phy;
 	gpio_vbus->phy.otg->set_peripheral = gpio_vbus_set_peripheral;
 
-	err = devm_gpio_request(&pdev->dev, gpio, "vbus_detect");
-	if (err) {
-		dev_err(&pdev->dev, "can't request vbus gpio %d, err: %d\n",
-			gpio, err);
-		return err;
-	}
-	gpio_direction_input(gpio);
-
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res) {
 		irq = res->start;
 		irqflags = (res->flags & IRQF_TRIGGER_MASK) | IRQF_SHARED;
 	} else {
-		irq = gpio_to_irq(gpio);
+		irq = gpiod_to_irq(gpiod);
 		irqflags = VBUS_IRQ_FLAGS;
 	}
 
+	gpio_vbus->gpiod_vbus = gpiod;
 	gpio_vbus->irq = irq;
 
 	/* if data line pullup is in use, initialize it to "not pulling up" */
-	gpio = pdata->gpio_pullup;
-	if (gpio_is_valid(gpio)) {
-		err = devm_gpio_request(&pdev->dev, gpio, "udc_pullup");
-		if (err) {
-			dev_err(&pdev->dev,
-				"can't request pullup gpio %d, err: %d\n",
-				gpio, err);
-			return err;
+	if (pdata) {
+		gpio = pdata->gpio_pullup;
+		gpio_flags = pdata->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
+		if (gpio_is_valid(gpio)) {
+			err = devm_gpio_request_one(&pdev->dev, gpio,
+						    gpio_flags,
+						    "udc_pullup");
+			if (err) {
+				dev_err(&pdev->dev,
+					"can't request pullup gpio %d, err: %d\n",
+					gpio, err);
+				return err;
+			}
+			gpiod = gpio_to_desc(gpio);
+			gpiod_direction_output(gpiod, 0);
 		}
-		gpio_direction_output(gpio, pdata->gpio_pullup_inverted);
 	}
+	if (!IS_ERR(gpiod))
+		gpio_vbus->gpiod_pullup = gpiod;
 
 	err = devm_request_irq(&pdev->dev, irq, gpio_vbus_irq, irqflags,
 			       "vbus_detect", pdev);
@@ -331,7 +338,7 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	device_init_wakeup(&pdev->dev, pdata->wakeup);
+	device_init_wakeup(&pdev->dev, wakeup);
 
 	return 0;
 }
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
