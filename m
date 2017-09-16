From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 2/9 v2] usb: usb251xb: Add USB251x specific port count setting
Date: Sat, 16 Sep 2017 13:42:13 +0300
Message-ID: <20170916104220.3742-3-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170916104220.3742-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

USB251xb as well as USB2517 datasheet states, that all these
hubs differ by number of ports declared as the last digit in the
model name. So USB2512 got two ports, USB2513 - three, and so on.
Such setting must be reflected in the device specific data
structure and corresponding dts property should be checked whether
it doesn't get out of available ports.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/usb/misc/usb251xb.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 96a8c20ac..5cb0e5570 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -154,46 +154,55 @@ struct usb251xb {
 
 struct usb251xb_data {
 	u16 product_id;
+	u8 port_cnt;
 	char product_str[USB251XB_STRING_BUFSIZE / 2]; /* ASCII string */
 };
 
 static const struct usb251xb_data usb2512b_data = {
 	.product_id = 0x2512,
+	.port_cnt = 2,
 	.product_str = "USB2512B",
 };
 
 static const struct usb251xb_data usb2512bi_data = {
 	.product_id = 0x2512,
+	.port_cnt = 2,
 	.product_str = "USB2512Bi",
 };
 
 static const struct usb251xb_data usb2513b_data = {
 	.product_id = 0x2513,
+	.port_cnt = 3,
 	.product_str = "USB2513B",
 };
 
 static const struct usb251xb_data usb2513bi_data = {
 	.product_id = 0x2513,
+	.port_cnt = 3,
 	.product_str = "USB2513Bi",
 };
 
 static const struct usb251xb_data usb2514b_data = {
 	.product_id = 0x2514,
+	.port_cnt = 4,
 	.product_str = "USB2514B",
 };
 
 static const struct usb251xb_data usb2514bi_data = {
 	.product_id = 0x2514,
+	.port_cnt = 4,
 	.product_str = "USB2514Bi",
 };
 
 static const struct usb251xb_data usb2517_data = {
 	.product_id = 0x2517,
+	.port_cnt = 7,
 	.product_str = "USB2517",
 };
 
 static const struct usb251xb_data usb2517i_data = {
 	.product_id = 0x2517,
+	.port_cnt = 7,
 	.product_str = "USB2517i",
 };
 
@@ -422,8 +431,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->non_rem_dev |= BIT(port);
+			else
+				dev_warn(dev, "port %u doesn't exist\n", port);
 		}
 	}
 
@@ -433,8 +444,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->port_disable_sp |= BIT(port);
+			else
+				dev_warn(dev, "port %u doesn't exist\n", port);
 		}
 	}
 
@@ -444,8 +457,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->port_disable_bp |= BIT(port);
+			else
+				dev_warn(dev, "port %u doesn't exist\n", port);
 		}
 	}
 
-- 
2.12.0
