From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH v2 3/4] extcon: usb-gpio: make debounce value configurable in
 devicetree
Date: Wed, 01 Apr 2015 09:23:24 +0200
Message-ID: <1427873005-24024-4-git-send-email-r.baldyga@samsung.com>
References: <1427873005-24024-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427873005-24024-1-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds devicetree property for setting debounce value. It allows
to set debounce time shorter or longer depending on the needs of given
platform.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
---
 drivers/extcon/extcon-usb-gpio.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index c842715..439ca99 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -114,6 +114,7 @@ static int usb_extcon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct usb_extcon_info *info;
+	u32 debounce;
 	int ret;
 
 	if (!np)
@@ -124,6 +125,11 @@ static int usb_extcon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	info->dev = dev;
+
+	ret = of_property_read_u32(np, "debounce", &debounce);
+	if (ret < 0)
+		debounce = USB_GPIO_DEBOUNCE_MS;
+
 	info->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
 	info->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus");
 
@@ -145,16 +151,14 @@ static int usb_extcon_probe(struct platform_device *pdev)
 	}
 
 	if (info->id_gpiod)
-		ret = gpiod_set_debounce(info->id_gpiod,
-			USB_GPIO_DEBOUNCE_MS * 1000);
+		ret = gpiod_set_debounce(info->id_gpiod, debounce * 1000);
 	if (!ret && info->vbus_gpiod) {
-		ret = gpiod_set_debounce(info->vbus_gpiod,
-			USB_GPIO_DEBOUNCE_MS * 1000);
+		ret = gpiod_set_debounce(info->vbus_gpiod, debounce * 1000);
 		if (ret < 0 && info->id_gpiod)
 			gpiod_set_debounce(info->vbus_gpiod, 0);
 	}
 	if (ret < 0)
-		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
+		info->debounce_jiffies = msecs_to_jiffies(debounce);
 
 	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
 
-- 
1.9.1
