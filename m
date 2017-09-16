From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/9 v2] usb: usb251xb: Add 5,6,7 ports boost settings
Date: Sat, 16 Sep 2017 13:42:15 +0300
Message-ID: <20170916104220.3742-5-fancer.lancer@gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170916104220.3742-1-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

USB electrical signaling drive strength boost bit is also supported
by USB2517 hub. Since it got three addition ports, the designers
needed to add one more register for initialization. It turned out
to be formerly reserved 0xF7. As before we just initialize it with
default zeros.

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/misc/usb251xb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 3de0de93b..44fa7d084 100644
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
@@ -517,7 +521,8 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
