From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 05/10 v3] usb: usb251xb: Add 5,6,7 ports boost settings
Date: Sun, 22 Oct 2017 23:38:07 +0300
Message-ID: <20171022203812.9379-6-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

USB electrical signaling drive strength boost bit is also supported
by USB2517 hub. Since it got three addition ports, the designers
needed to add one more register for initialization. It turned out
to be formerly reserved 0xF7. As before we just initialize it with
default zeros.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/usb/misc/usb251xb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index a05bd2e1e..0f309943f 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -94,8 +94,10 @@
 
 #define USB251XB_ADDR_BOOST_UP	0xF6
 #define USB251XB_DEF_BOOST_UP	0x00
-#define USB251XB_ADDR_BOOST_X	0xF8
-#define USB251XB_DEF_BOOST_X	0x00
+#define USB251XB_ADDR_BOOST_57	0xF7
+#define USB251XB_DEF_BOOST_57	0x00
+#define USB251XB_ADDR_BOOST_14	0xF8
+#define USB251XB_DEF_BOOST_14	0x00
 
 #define USB251XB_ADDR_PORT_SWAP	0xFA
 #define USB251XB_DEF_PORT_SWAP	0x00
@@ -149,7 +151,8 @@ struct usb251xb {
 	char serial[USB251XB_STRING_BUFSIZE];
 	u8  bat_charge_en;
 	u8  boost_up;
-	u8  boost_x;
+	u8  boost_57;
+	u8  boost_14;
 	u8  port_swap;
 	u8  port_map12;
 	u8  port_map34;
@@ -280,7 +283,8 @@ static int usb251xb_connect(struct usb251xb *hub)
 	       USB251XB_STRING_BUFSIZE);
 	i2c_wb[USB251XB_ADDR_BATTERY_CHARGING_ENABLE] = hub->bat_charge_en;
 	i2c_wb[USB251XB_ADDR_BOOST_UP]          = hub->boost_up;
-	i2c_wb[USB251XB_ADDR_BOOST_X]           = hub->boost_x;
+	i2c_wb[USB251XB_ADDR_BOOST_57]          = hub->boost_57;
+	i2c_wb[USB251XB_ADDR_BOOST_14]          = hub->boost_14;
 	i2c_wb[USB251XB_ADDR_PORT_SWAP]         = hub->port_swap;
 	i2c_wb[USB251XB_ADDR_PORT_MAP_12]       = hub->port_map12;
 	i2c_wb[USB251XB_ADDR_PORT_MAP_34]       = hub->port_map34;
@@ -520,7 +524,8 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
 	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_up = USB251XB_DEF_BOOST_UP;
-	hub->boost_x = USB251XB_DEF_BOOST_X;
+	hub->boost_57 = USB251XB_DEF_BOOST_57;
+	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
 	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
-- 
2.12.0
