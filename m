From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 07/10 v3] usb: usb251xb: Add USB2517 LED settings
Date: Sun, 22 Oct 2017 23:38:09 +0300
Message-ID: <20171022203812.9379-8-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

USB2517 supports two LED modes: USB mode and speed (default) indication
mode. The last one can be switched on by corresponding dts property.
Since USB251xb hubs doesn't support LEDs settings, we need to ignore
this setting.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/usb/misc/usb251xb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index e6ccea57a..80df778e0 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
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
 
+	if (data->led_support && of_get_property(np, "led-usb-mode", NULL))
+		hub->conf_data3 &= ~BIT(1);
+
 	if (of_get_property(np, "string-support", NULL))
 		hub->conf_data3 |= BIT(0);
 
-- 
2.12.0
