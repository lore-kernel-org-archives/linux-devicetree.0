From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 02/10 v3] usb: usb251xb: Add USB2517i specific struct and IDs
Date: Sun, 22 Oct 2017 23:38:04 +0300
Message-ID: <20171022203812.9379-3-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

There are USB2517 and USB2517i hubs, which have almost the same
registers space as already supported USB251xBi series. The difference
it in DIDs and in a few functions. This patch adds the USB2517/i data
structures to the driver, so it would have different setting depending
on the device discovered on i2c-bus.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/usb/misc/Kconfig    |  4 ++--
 drivers/usb/misc/usb251xb.c | 23 +++++++++++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 37dd1c018..27b9fcbdf 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -247,8 +247,8 @@ config USB_HUB_USB251XB
 	depends on I2C
 	help
 	  This option enables support for configuration via SMBus of the
-	  Microchip USB251xB/xBi USB 2.0 Hub Controller series.
-	  Configuration parameters may be set in devicetree or platform data.
+	  Microchip USB251x/xBi USB 2.0 Hub Controller series. Configuration
+	  parameters may be set in devicetree or platform data.
 	  Say Y or M here if you need to configure such a device via SMBus.
 
 config USB_HSIC_USB3503
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 91f66d68b..22c32ea3f 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -38,6 +38,7 @@
 #define USB251XB_DEF_PRODUCT_ID_12	0x2512 /* USB2512B/12Bi */
 #define USB251XB_DEF_PRODUCT_ID_13	0x2513 /* USB2513B/13Bi */
 #define USB251XB_DEF_PRODUCT_ID_14	0x2514 /* USB2514B/14Bi */
+#define USB251XB_DEF_PRODUCT_ID_17	0x2517 /* USB2517/17i */
 
 #define USB251XB_ADDR_DEVICE_ID_LSB	0x04
 #define USB251XB_ADDR_DEVICE_ID_MSB	0x05
@@ -82,7 +83,7 @@
 
 #define USB251XB_ADDR_PRODUCT_STRING_LEN	0x14
 #define USB251XB_ADDR_PRODUCT_STRING		0x54
-#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi"
+#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi/7i"
 
 #define USB251XB_ADDR_SERIAL_STRING_LEN		0x15
 #define USB251XB_ADDR_SERIAL_STRING		0x92
@@ -186,6 +187,16 @@ static const struct usb251xb_data usb2514bi_data = {
 	.product_str = "USB2514Bi",
 };
 
+static const struct usb251xb_data usb2517_data = {
+	.product_id = 0x2517,
+	.product_str = "USB2517",
+};
+
+static const struct usb251xb_data usb2517i_data = {
+	.product_id = 0x2517,
+	.product_str = "USB2517i",
+};
+
 static void usb251xb_reset(struct usb251xb *hub, int state)
 {
 	if (!gpio_is_valid(hub->gpio_reset))
@@ -511,6 +522,12 @@ static const struct of_device_id usb251xb_of_match[] = {
 		.compatible = "microchip,usb2514bi",
 		.data = &usb2514bi_data,
 	}, {
+		.compatible = "microchip,usb2517",
+		.data = &usb2517_data,
+	}, {
+		.compatible = "microchip,usb2517i",
+		.data = &usb2517i_data,
+	}, {
 		/* sentinel */
 	}
 };
@@ -574,6 +591,8 @@ static const struct i2c_device_id usb251xb_id[] = {
 	{ "usb2513bi", 0 },
 	{ "usb2514b", 0 },
 	{ "usb2514bi", 0 },
+	{ "usb2517", 0 },
+	{ "usb2517i", 0 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, usb251xb_id);
@@ -590,5 +609,5 @@ static struct i2c_driver usb251xb_i2c_driver = {
 module_i2c_driver(usb251xb_i2c_driver);
 
 MODULE_AUTHOR("Richard Leitner <richard.leitner@skidata.com>");
-MODULE_DESCRIPTION("USB251xB/xBi USB 2.0 Hub Controller Driver");
+MODULE_DESCRIPTION("USB251x/xBi USB 2.0 Hub Controller Driver");
 MODULE_LICENSE("GPL");
-- 
2.12.0
