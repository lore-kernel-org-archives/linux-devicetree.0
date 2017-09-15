From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 1/5] usb: usb251xb: Add USB2517/i hub support
Date: Sat, 16 Sep 2017 02:31:09 +0300
Message-ID: <20170915233113.17855-2-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170915233113.17855-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

USB2517i hubs are very like USB251xb devices series. They have almost
the same configuration registers space except number of ports, led
configurations and lack of battery settings. All these peculiarities
are reflected in this patch.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt |  4 +-
 drivers/usb/misc/usb251xb.c                        | 84 +++++++++++++++++++---
 2 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 3957d4eda..3d84626d3 100644
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
 
@@ -36,6 +37,7 @@ Optional properties :
 	an invalid value is given, the default is used instead.
  - compound-device : indicate the hub is part of a compound device
  - port-mapping-mode : enable port mapping mode
+ - speed-led-mode : led speed indiation mode selection (usb2517 only)
  - string-support : enable string descriptor support (required for manufacturer,
 	product and serial string configuration)
  - non-removable-ports : Should specify the ports which have a non-removable
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 91f66d68b..2ef22758c 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -38,6 +38,7 @@
 #define USB251XB_DEF_PRODUCT_ID_12	0x2512 /* USB2512B/12Bi */
 #define USB251XB_DEF_PRODUCT_ID_13	0x2513 /* USB2513B/13Bi */
 #define USB251XB_DEF_PRODUCT_ID_14	0x2514 /* USB2514B/14Bi */
+#define USB251XB_DEF_PRODUCT_ID_17	0x2517 /* USB2517i */
 
 #define USB251XB_ADDR_DEVICE_ID_LSB	0x04
 #define USB251XB_ADDR_DEVICE_ID_MSB	0x05
@@ -48,7 +49,7 @@
 #define USB251XB_ADDR_CONFIG_DATA_2	0x07
 #define USB251XB_DEF_CONFIG_DATA_2	0x20
 #define USB251XB_ADDR_CONFIG_DATA_3	0x08
-#define USB251XB_DEF_CONFIG_DATA_3	0x02
+#define USB251XB_DEF_CONFIG_DATA_3	0x00
 
 #define USB251XB_ADDR_NON_REMOVABLE_DEVICES	0x09
 #define USB251XB_DEF_NON_REMOVABLE_DEVICES	0x00
@@ -82,7 +83,7 @@
 
 #define USB251XB_ADDR_PRODUCT_STRING_LEN	0x14
 #define USB251XB_ADDR_PRODUCT_STRING		0x54
-#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi"
+#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi/7i"
 
 #define USB251XB_ADDR_SERIAL_STRING_LEN		0x15
 #define USB251XB_ADDR_SERIAL_STRING		0x92
@@ -93,8 +94,10 @@
 
 #define USB251XB_ADDR_BOOST_UP	0xF6
 #define USB251XB_DEF_BOOST_UP	0x00
-#define USB251XB_ADDR_BOOST_X	0xF8
-#define USB251XB_DEF_BOOST_X	0x00
+#define USB251XB_ADDR_BOOST_57	0xF8
+#define USB251XB_DEF_BOOST_57	0x00
+#define USB251XB_ADDR_BOOST_14	0xF8
+#define USB251XB_DEF_BOOST_14	0x00
 
 #define USB251XB_ADDR_PORT_SWAP	0xFA
 #define USB251XB_DEF_PORT_SWAP	0x00
@@ -102,7 +105,11 @@
 #define USB251XB_ADDR_PORT_MAP_12	0xFB
 #define USB251XB_DEF_PORT_MAP_12	0x00
 #define USB251XB_ADDR_PORT_MAP_34	0xFC
-#define USB251XB_DEF_PORT_MAP_34	0x00 /* USB2513B/i & USB2514B/i only */
+#define USB251XB_DEF_PORT_MAP_34	0x00 /* USB251{3B/i,4B/i,7/i} only */
+#define USB251XB_ADDR_PORT_MAP_56	0xFD
+#define USB251XB_DEF_PORT_MAP_56	0x00 /* USB2517/i only */
+#define USB251XB_ADDR_PORT_MAP_7	0xFE
+#define USB251XB_DEF_PORT_MAP_7		0x00 /* USB2517/i only */
 
 #define USB251XB_ADDR_STATUS_COMMAND		0xFF
 #define USB251XB_STATUS_COMMAND_SMBUS_DOWN	0x04
@@ -144,48 +151,88 @@ struct usb251xb {
 	char serial[USB251XB_STRING_BUFSIZE];
 	u8  bat_charge_en;
 	u8  boost_up;
-	u8  boost_x;
+	u8  boost_57;
+	u8  boost_14;
 	u8  port_swap;
 	u8  port_map12;
 	u8  port_map34;
+	u8  port_map56;
+	u8  port_map7;
 	u8  status;
 };
 
 struct usb251xb_data {
 	u16 product_id;
+	u8 port_cnt;
+	bool led_support;
+	bool bat_support;
 	char product_str[USB251XB_STRING_BUFSIZE / 2]; /* ASCII string */
 };
 
 static const struct usb251xb_data usb2512b_data = {
 	.product_id = 0x2512,
+	.port_cnt = 2,
+	.led_support = false,
+	.bat_support = true,
 	.product_str = "USB2512B",
 };
 
 static const struct usb251xb_data usb2512bi_data = {
 	.product_id = 0x2512,
+	.port_cnt = 2,
+	.led_support = false,
+	.bat_support = true,
 	.product_str = "USB2512Bi",
 };
 
 static const struct usb251xb_data usb2513b_data = {
 	.product_id = 0x2513,
+	.port_cnt = 3,
+	.led_support = false,
+	.bat_support = true,
 	.product_str = "USB2513B",
 };
 
 static const struct usb251xb_data usb2513bi_data = {
 	.product_id = 0x2513,
+	.port_cnt = 3,
+	.led_support = false,
+	.bat_support = true,
 	.product_str = "USB2513Bi",
 };
 
 static const struct usb251xb_data usb2514b_data = {
 	.product_id = 0x2514,
+	.port_cnt = 4,
+	.led_support = false,
+	.bat_support = true,
 	.product_str = "USB2514B",
 };
 
 static const struct usb251xb_data usb2514bi_data = {
 	.product_id = 0x2514,
+	.port_cnt = 4,
+	.led_support = false,
+	.bat_support = true,
 	.product_str = "USB2514Bi",
 };
 
+static const struct usb251xb_data usb2517_data = {
+	.product_id = 0x2517,
+	.port_cnt = 7,
+	.led_support = true,
+	.bat_support = false,
+	.product_str = "USB2517",
+};
+
+static const struct usb251xb_data usb2517i_data = {
+	.product_id = 0x2517,
+	.port_cnt = 7,
+	.led_support = true,
+	.bat_support = false,
+	.product_str = "USB2517i",
+};
+
 static void usb251xb_reset(struct usb251xb *hub, int state)
 {
 	if (!gpio_is_valid(hub->gpio_reset))
@@ -254,10 +301,13 @@ static int usb251xb_connect(struct usb251xb *hub)
 	       USB251XB_STRING_BUFSIZE);
 	i2c_wb[USB251XB_ADDR_BATTERY_CHARGING_ENABLE] = hub->bat_charge_en;
 	i2c_wb[USB251XB_ADDR_BOOST_UP]          = hub->boost_up;
-	i2c_wb[USB251XB_ADDR_BOOST_X]           = hub->boost_x;
+	i2c_wb[USB251XB_ADDR_BOOST_57]          = hub->boost_57;
+	i2c_wb[USB251XB_ADDR_BOOST_14]          = hub->boost_14;
 	i2c_wb[USB251XB_ADDR_PORT_SWAP]         = hub->port_swap;
 	i2c_wb[USB251XB_ADDR_PORT_MAP_12]       = hub->port_map12;
 	i2c_wb[USB251XB_ADDR_PORT_MAP_34]       = hub->port_map34;
+	i2c_wb[USB251XB_ADDR_PORT_MAP_56]       = hub->port_map56;
+	i2c_wb[USB251XB_ADDR_PORT_MAP_7]        = hub->port_map7;
 	i2c_wb[USB251XB_ADDR_STATUS_COMMAND] = USB251XB_STATUS_COMMAND_ATTACH;
 
 	usb251xb_reset(hub, 1);
@@ -402,6 +452,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	if (of_get_property(np, "port-mapping-mode", NULL))
 		hub->conf_data3 |= BIT(3);
 
+	if (data->led_support && of_get_property(np, "speed-led-mode", NULL))
+		hub->conf_data3 |= BIT(1);
+
 	if (of_get_property(np, "string-support", NULL))
 		hub->conf_data3 |= BIT(0);
 
@@ -411,8 +464,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->non_rem_dev |= BIT(port);
+			else
+				dev_warn(dev, "port %u doesn't exist\n", port);
 		}
 	}
 
@@ -483,10 +538,13 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
 	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_up = USB251XB_DEF_BOOST_UP;
-	hub->boost_x = USB251XB_DEF_BOOST_X;
+	hub->boost_57 = USB251XB_DEF_BOOST_57;
+	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
 	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
+	hub->port_map56 = USB251XB_DEF_PORT_MAP_56;
+	hub->port_map7  = USB251XB_DEF_PORT_MAP_7;
 
 	return 0;
 }
@@ -511,6 +569,12 @@ static const struct of_device_id usb251xb_of_match[] = {
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
@@ -574,6 +638,8 @@ static const struct i2c_device_id usb251xb_id[] = {
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
