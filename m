From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 6/9 v2] usb: usb251xb: Add USB2517 LED settings
Date: Sat, 16 Sep 2017 13:42:17 +0300
Message-ID: <20170916104220.3742-7-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170916104220.3742-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

USB2517 supports two LED modes: USB mode (default) and speed indication
mode. The last one can be switched on by corresponding dts property.
Since USB251xb hubs doesn't support LEDs settings, we need to ignore
this setting.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt         |  1 +
 drivers/usb/misc/usb251xb.c                                | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 1682d4087..3d84626d3 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -37,6 +37,7 @@ Optional properties :
 	an invalid value is given, the default is used instead.
  - compound-device : indicate the hub is part of a compound device
  - port-mapping-mode : enable port mapping mode
+ - speed-led-mode : led speed indiation mode selection (usb2517 only)
  - string-support : enable string descriptor support (required for manufacturer,
 	product and serial string configuration)
  - non-removable-ports : Should specify the ports which have a non-removable
diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 0834729d1..51cc53ddc 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -49,7 +49,7 @@
 #define USB251XB_ADDR_CONFIG_DATA_2	0x07
 #define USB251XB_DEF_CONFIG_DATA_2	0x20
 #define USB251XB_ADDR_CONFIG_DATA_3	0x08
-#define USB251XB_DEF_CONFIG_DATA_3	0x02
+#define USB251XB_DEF_CONFIG_DATA_3	0x00
 
 #define USB251XB_ADDR_NON_REMOVABLE_DEVICES	0x09
 #define USB251XB_DEF_NON_REMOVABLE_DEVICES	0x00
@@ -164,6 +164,7 @@ struct usb251xb {
 struct usb251xb_data {
 	u16 product_id;
 	u8 port_cnt;
+	bool led_support;
 	bool bat_support;
 	char product_str[USB251XB_STRING_BUFSIZE / 2]; /* ASCII string */
 };
@@ -171,6 +172,7 @@ struct usb251xb_data {
 static const struct usb251xb_data usb2512b_data = {
 	.product_id = 0x2512,
 	.port_cnt = 2,
+	.led_support = false,
 	.bat_support = true,
 	.product_str = "USB2512B",
 };
@@ -178,6 +180,7 @@ static const struct usb251xb_data usb2512b_data = {
 static const struct usb251xb_data usb2512bi_data = {
 	.product_id = 0x2512,
 	.port_cnt = 2,
+	.led_support = false,
 	.bat_support = true,
 	.product_str = "USB2512Bi",
 };
@@ -185,6 +188,7 @@ static const struct usb251xb_data usb2512bi_data = {
 static const struct usb251xb_data usb2513b_data = {
 	.product_id = 0x2513,
 	.port_cnt = 3,
+	.led_support = false,
 	.bat_support = true,
 	.product_str = "USB2513B",
 };
@@ -192,6 +196,7 @@ static const struct usb251xb_data usb2513b_data = {
 static const struct usb251xb_data usb2513bi_data = {
 	.product_id = 0x2513,
 	.port_cnt = 3,
+	.led_support = false,
 	.bat_support = true,
 	.product_str = "USB2513Bi",
 };
@@ -199,6 +204,7 @@ static const struct usb251xb_data usb2513bi_data = {
 static const struct usb251xb_data usb2514b_data = {
 	.product_id = 0x2514,
 	.port_cnt = 4,
+	.led_support = false,
 	.bat_support = true,
 	.product_str = "USB2514B",
 };
@@ -206,6 +212,7 @@ static const struct usb251xb_data usb2514b_data = {
 static const struct usb251xb_data usb2514bi_data = {
 	.product_id = 0x2514,
 	.port_cnt = 4,
+	.led_support = false,
 	.bat_support = true,
 	.product_str = "USB2514Bi",
 };
@@ -213,6 +220,7 @@ static const struct usb251xb_data usb2514bi_data = {
 static const struct usb251xb_data usb2517_data = {
 	.product_id = 0x2517,
 	.port_cnt = 7,
+	.led_support = true,
 	.bat_support = false,
 	.product_str = "USB2517",
 };
@@ -220,6 +228,7 @@ static const struct usb251xb_data usb2517_data = {
 static const struct usb251xb_data usb2517i_data = {
 	.product_id = 0x2517,
 	.port_cnt = 7,
+	.led_support = true,
 	.bat_support = false,
 	.product_str = "USB2517i",
 };
@@ -443,6 +452,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	if (of_get_property(np, "port-mapping-mode", NULL))
 		hub->conf_data3 |= BIT(3);
 
+	if (data->led_support && of_get_property(np, "speed-led-mode", NULL))
+		hub->conf_data3 |= BIT(1);
+
 	if (of_get_property(np, "string-support", NULL))
 		hub->conf_data3 |= BIT(0);
 
-- 
2.12.0
