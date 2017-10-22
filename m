From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 04/10 v3] usb: usb251xb: Add 5,6,7 ports mapping def setting
Date: Sun, 22 Oct 2017 23:38:06 +0300
Message-ID: <20171022203812.9379-5-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

USB2517 got three additionl downstream ports, which can
as well be mapped to another logical ports. USB251xb driver
currently doesn't fully support such setting configuration
from dts file. This patch doesn't change this, but adds
usb2517 spcific ports default liner mapping.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/usb/misc/usb251xb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 9586da7eb..a05bd2e1e 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -103,7 +103,11 @@
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
@@ -149,6 +153,8 @@ struct usb251xb {
 	u8  port_swap;
 	u8  port_map12;
 	u8  port_map34;
+	u8  port_map56;
+	u8  port_map7;
 	u8  status;
 };
 
@@ -278,6 +284,8 @@ static int usb251xb_connect(struct usb251xb *hub)
 	i2c_wb[USB251XB_ADDR_PORT_SWAP]         = hub->port_swap;
 	i2c_wb[USB251XB_ADDR_PORT_MAP_12]       = hub->port_map12;
 	i2c_wb[USB251XB_ADDR_PORT_MAP_34]       = hub->port_map34;
+	i2c_wb[USB251XB_ADDR_PORT_MAP_56]       = hub->port_map56;
+	i2c_wb[USB251XB_ADDR_PORT_MAP_7]        = hub->port_map7;
 	i2c_wb[USB251XB_ADDR_STATUS_COMMAND] = USB251XB_STATUS_COMMAND_ATTACH;
 
 	usb251xb_reset(hub, 1);
@@ -516,6 +524,8 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
 	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
+	hub->port_map56 = USB251XB_DEF_PORT_MAP_56;
+	hub->port_map7  = USB251XB_DEF_PORT_MAP_7;
 
 	return 0;
 }
-- 
2.12.0
