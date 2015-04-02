From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH v3 1/4] extcon: usb-gpio: register extcon device before IRQ
 registration
Date: Thu, 02 Apr 2015 15:13:02 +0200
Message-ID: <1427980385-21285-2-git-send-email-r.baldyga@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

IRQ handler touches info->edev, so if interrupt occurs before extcon
device initialization it can cause NULL pointer dereference. Doing extcon
initialization before IRQ handler registration fixes this problem.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
Acked-by: Roger Quadros <rogerq@ti.com>
---
 drivers/extcon/extcon-usb-gpio.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index 3f0bad3..f6aa99d 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -119,6 +119,18 @@ static int usb_extcon_probe(struct platform_device *pdev)
 		return PTR_ERR(info->id_gpiod);
 	}
 
+	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
+	if (IS_ERR(info->edev)) {
+		dev_err(dev, "failed to allocate extcon device\n");
+		return -ENOMEM;
+	}
+
+	ret = devm_extcon_dev_register(dev, info->edev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register extcon device\n");
+		return ret;
+	}
+
 	ret = gpiod_set_debounce(info->id_gpiod,
 				 USB_GPIO_DEBOUNCE_MS * 1000);
 	if (ret < 0)
@@ -142,18 +154,6 @@ static int usb_extcon_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
-	if (IS_ERR(info->edev)) {
-		dev_err(dev, "failed to allocate extcon device\n");
-		return -ENOMEM;
-	}
-
-	ret = devm_extcon_dev_register(dev, info->edev);
-	if (ret < 0) {
-		dev_err(dev, "failed to register extcon device\n");
-		return ret;
-	}
-
 	platform_set_drvdata(pdev, info);
 	device_init_wakeup(dev, 1);
 
-- 
1.9.1
