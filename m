From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/2] extcon: usb-gpio: Add the GPIO level trigger support
Date: Mon, 20 Mar 2017 15:59:42 +0800
Message-ID: <99c5c7c3a67768a0715e3b89b80430b75ad25a0f.1489995966.git.baolin.wang@linaro.org>
References: <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
In-Reply-To: <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
References: <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com, cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: broonie@kernel.org, baolin.wang@linaro.org, linaro-kernel@lists.linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

GPIOs may need level trigger to detect VBUS/ID on some platforms, thus
we should add GPIO level trigger to support this situation.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/extcon/extcon-usb-gpio.c |   81 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index a5e1882..cc89e25 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -39,6 +39,8 @@ struct usb_extcon_info {
 	struct gpio_desc *vbus_gpiod;
 	int id_irq;
 	int vbus_irq;
+	int level_trigger;
+	int trigger_irq;
 
 	unsigned long debounce_jiffies;
 	struct delayed_work wq_detcable;
@@ -70,6 +72,7 @@ struct usb_extcon_info {
 static void usb_extcon_detect_cable(struct work_struct *work)
 {
 	int id, vbus;
+	unsigned int trigger;
 	struct usb_extcon_info *info = container_of(to_delayed_work(work),
 						    struct usb_extcon_info,
 						    wq_detcable);
@@ -80,6 +83,53 @@ static void usb_extcon_detect_cable(struct work_struct *work)
 	vbus = info->vbus_gpiod ?
 		gpiod_get_value_cansleep(info->vbus_gpiod) : id;
 
+	if (info->level_trigger) {
+		if (info->trigger_irq == info->id_irq && info->id_gpiod) {
+			trigger = irqd_get_trigger_type(
+					irq_get_irq_data(info->id_irq));
+
+			/* Ignore incorrect ID trigger */
+			if (((trigger & IRQF_TRIGGER_LOW) && (id > 0)) ||
+			    ((trigger & IRQF_TRIGGER_HIGH) && (id == 0))) {
+				enable_irq(info->id_irq);
+				return;
+			}
+
+			if (id) {
+				trigger &= ~IRQF_TRIGGER_HIGH;
+				trigger |= IRQF_TRIGGER_LOW;
+			} else {
+				trigger &= ~IRQF_TRIGGER_LOW;
+				trigger |= IRQF_TRIGGER_HIGH;
+			}
+
+			irq_set_irq_type(info->id_irq, trigger);
+			enable_irq(info->id_irq);
+		} else if (info->trigger_irq == info->vbus_irq &&
+			   info->vbus_gpiod) {
+			trigger = irqd_get_trigger_type(
+					irq_get_irq_data(info->vbus_irq));
+
+			/* Ignore incorrect VBUS trigger */
+			if (((trigger & IRQF_TRIGGER_LOW) && (vbus > 0)) ||
+			    ((trigger & IRQF_TRIGGER_HIGH) && (vbus == 0))) {
+				enable_irq(info->vbus_irq);
+				return;
+			}
+
+			if (vbus) {
+				trigger &= ~IRQF_TRIGGER_HIGH;
+				trigger |= IRQF_TRIGGER_LOW;
+			} else {
+				trigger &= ~IRQF_TRIGGER_LOW;
+				trigger |= IRQF_TRIGGER_HIGH;
+			}
+
+			irq_set_irq_type(info->vbus_irq, trigger);
+			enable_irq(info->vbus_irq);
+		}
+	}
+
 	/* at first we clean states which are no longer active */
 	if (id)
 		extcon_set_state_sync(info->edev, EXTCON_USB_HOST, false);
@@ -98,6 +148,11 @@ static irqreturn_t usb_irq_handler(int irq, void *dev_id)
 {
 	struct usb_extcon_info *info = dev_id;
 
+	if (info->level_trigger) {
+		info->trigger_irq = irq;
+		disable_irq_nosync(irq);
+	}
+
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			   info->debounce_jiffies);
 
@@ -109,7 +164,9 @@ static int usb_extcon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct usb_extcon_info *info;
+	unsigned long id_irqflags, vbus_irqflags;
 	int ret;
+	int id_active_low, vbus_active_low;
 
 	if (!np && !ACPI_HANDLE(dev))
 		return -EINVAL;
@@ -134,6 +191,14 @@ static int usb_extcon_probe(struct platform_device *pdev)
 	if (IS_ERR(info->vbus_gpiod))
 		return PTR_ERR(info->vbus_gpiod);
 
+	info->level_trigger = of_property_read_bool(np,
+					"extcon-gpio,level-trigger");
+	info->trigger_irq = -1;
+	id_active_low = info->id_gpiod ?
+		gpiod_is_active_low(info->id_gpiod) : 0;
+	vbus_active_low = info->vbus_gpiod ?
+		gpiod_is_active_low(info->vbus_gpiod) : 0;
+
 	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
 	if (IS_ERR(info->edev)) {
 		dev_err(dev, "failed to allocate extcon device\n");
@@ -158,6 +223,16 @@ static int usb_extcon_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
 
+	if (info->level_trigger) {
+		id_irqflags = id_active_low ?
+			IRQF_TRIGGER_HIGH : IRQF_TRIGGER_LOW;
+		vbus_irqflags = vbus_active_low ?
+			IRQF_TRIGGER_LOW : IRQF_TRIGGER_HIGH;
+	} else {
+		id_irqflags = vbus_irqflags = IRQF_TRIGGER_RISING |
+			IRQF_TRIGGER_FALLING;
+	}
+
 	if (info->id_gpiod) {
 		info->id_irq = gpiod_to_irq(info->id_gpiod);
 		if (info->id_irq < 0) {
@@ -167,8 +242,7 @@ static int usb_extcon_probe(struct platform_device *pdev)
 
 		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
 						usb_irq_handler,
-						IRQF_TRIGGER_RISING |
-						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						id_irqflags | IRQF_ONESHOT,
 						pdev->name, info);
 		if (ret < 0) {
 			dev_err(dev, "failed to request handler for ID IRQ\n");
@@ -185,8 +259,7 @@ static int usb_extcon_probe(struct platform_device *pdev)
 
 		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
 						usb_irq_handler,
-						IRQF_TRIGGER_RISING |
-						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						vbus_irqflags | IRQF_ONESHOT,
 						pdev->name, info);
 		if (ret < 0) {
 			dev_err(dev, "failed to request handler for VBUS IRQ\n");
-- 
1.7.9.5
