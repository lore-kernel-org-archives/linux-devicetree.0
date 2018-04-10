Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: gadget: udc: renesas_usb3: add devm_of_platform_populate()
Date: Tue, 10 Apr 2018 21:13:54 +0900
Message-Id: <1523362434-17808-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523362434-17808-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523362434-17808-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds devm_of_platform_populate() calling to populate
the rcar-usb3-role-switch driver.

For now, this renesas_usb3 driver doesn't use any APIs of
the usb role switch framework because the usb_role_switch_get()
API depends on the device_connection framework and this framework
is not good match on device tree environment. However, the select
USB_ROLE_SWITCH needs to enable the rcar-usb3-role-switch driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/Kconfig        | 1 +
 drivers/usb/gadget/udc/renesas_usb3.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 0875d38..7e4a5dd 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -193,6 +193,7 @@ config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on EXTCON && HAS_DMA
+	select USB_ROLE_SWITCH
 	help
 	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
 	   that supports super, high, and full speed USB 3.0 data transfers.
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 59e1485..fd593b2 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2639,6 +2639,12 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_add_udc;
 
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		goto err_dev_create;
+
+	/* TODO: Get role switch and use usb_role_switch_{set,get}_role APIs */
+
 	if (of_property_read_bool(pdev->dev.of_node, "renesas,no-id"))
 		usb3->ignore_id = true;
 
-- 
1.9.1
