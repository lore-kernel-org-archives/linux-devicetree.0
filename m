From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/10 v3] usb: usb251xb: Add USB251x specific port count setting
Date: Sun, 22 Oct 2017 23:38:05 +0300
Message-ID: <20171022203812.9379-4-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

USB251xb as well as USB2517 datasheet states, that all these
hubs differ by number of ports declared as the last digit in the
model name. So USB2512 got two ports, USB2513 - three, and so on.
Such setting must be reflected in the device specific data
structure and corresponding dts property should be checked whether
it doesn't get out of available ports.

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/misc/usb251xb.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 22c32ea3f..9586da7eb 100644
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
 
@@ -422,8 +431,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->non_rem_dev |= BIT(port);
+			else
+				dev_warn(dev, "NRD port %u doesn't exist\n",
+					port);
 		}
 	}
 
@@ -433,8 +445,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->port_disable_sp |= BIT(port);
+			else
+				dev_warn(dev, "PDS port %u doesn't exist\n",
+					port);
 		}
 	}
 
@@ -444,8 +459,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		for (i = 0; i < len / sizeof(u32); i++) {
 			u32 port = be32_to_cpu(cproperty_u32[i]);
 
-			if ((port >= 1) && (port <= 4))
+			if ((port >= 1) && (port <= data->port_cnt))
 				hub->port_disable_bp |= BIT(port);
+			else
+				dev_warn(dev, "PDB port %u doesn't exist\n",
+					port);
 		}
 	}
 
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
