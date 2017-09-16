From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 1/9 v2] usb: usb251xb: Add USB2517i specific struct and IDs
Date: Sat, 16 Sep 2017 13:42:12 +0300
Message-ID: <20170916104220.3742-2-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170916104220.3742-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

There are USB2517 and USB2517i hubs, which have almost the same
registers space as already supported USB251xbi series. The difference
it in DIDs and in few functions. This patch adds the USB2517/i data
structures to the driver, so it would have different setting depending
on the device discovered on i2c-bus.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt  |  3 ++-
 drivers/usb/misc/usb251xb.c                         | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 3957d4eda..1682d4087 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -6,7 +6,8 @@ Hi-Speed Controller.
 Required properties :
  - compatible : Should be "microchip,usb251xb" or one of the specific types:
 	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
-	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
+	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
+	"microchip,usb2517", "microchip,usb2517i"
  - reset-gpios : Should specify the gpio for hub reset
  - reg : I2C address on the selected bus (default is <0x2C>)
 
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 91f66d68b..96a8c20ac 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -38,6 +38,7 @@
 #define USB251XB_DEF_PRODUCT_ID_12	0x2512 /* USB2512B/12Bi */
 #define USB251XB_DEF_PRODUCT_ID_13	0x2513 /* USB2513B/13Bi */
 #define USB251XB_DEF_PRODUCT_ID_14	0x2514 /* USB2514B/14Bi */
+#define USB251XB_DEF_PRODUCT_ID_17	0x2517 /* USB2517i */
 
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
-- 
2.12.0
