From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: [PATCH v2 2/2] extcon: add optional debounce-timeout-ms attribute
Date: Thu, 19 Oct 2017 08:56:00 +0530
Message-ID: <1508383560-15567-2-git-send-email-raveendra.padasalagi@broadcom.com>
References: <1508383560-15567-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508383560-15567-1-git-send-email-raveendra.padasalagi@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add changes to capture optional dt attribute "debounce-timeout-ms"
provided in extcon node and used the same value if provided otherwise
default value of 20ms is used for id and vbus gpios debounce time.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Srinath Mannam <srinath.mannam@broadcom.com>
---

Changes in v2:
 Rename gpio_debounce_timeout_ms to debounce_usecs

 drivers/extcon/extcon-usb-gpio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index 9c925b0..76ef1da 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -41,6 +41,7 @@ struct usb_extcon_info {
 
 	unsigned long debounce_jiffies;
 	struct delayed_work wq_detcable;
+	unsigned int debounce_usecs;
 };
 
 static const unsigned int usb_extcon_cable[] = {
@@ -133,6 +134,11 @@ static int usb_extcon_probe(struct platform_device *pdev)
 	if (IS_ERR(info->vbus_gpiod))
 		return PTR_ERR(info->vbus_gpiod);
 
+	ret = of_property_read_u32(np, "input-debounce",
+			     &info->debounce_usecs);
+	if (ret)
+		info->debounce_usecs = USB_GPIO_DEBOUNCE_MS;
+
 	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
 	if (IS_ERR(info->edev)) {
 		dev_err(dev, "failed to allocate extcon device\n");
@@ -147,13 +153,13 @@ static int usb_extcon_probe(struct platform_device *pdev)
 
 	if (info->id_gpiod)
 		ret = gpiod_set_debounce(info->id_gpiod,
-					 USB_GPIO_DEBOUNCE_MS * 1000);
+					 info->debounce_usecs * 1000);
 	if (!ret && info->vbus_gpiod)
 		ret = gpiod_set_debounce(info->vbus_gpiod,
-					 USB_GPIO_DEBOUNCE_MS * 1000);
+					 info->debounce_usecs * 1000);
 
 	if (ret < 0)
-		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
+		info->debounce_jiffies = msecs_to_jiffies(info->debounce_usecs);
 
 	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
 
-- 
1.9.1
