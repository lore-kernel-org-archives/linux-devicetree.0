Return-Path: <SRS0=LEhR=PY=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 2/2] usb: usb251xb: add usb data lane port swap feature
Date: Wed, 16 Jan 2019 15:20:37 +0100
Message-Id: <20190116142037.10086-2-m.felsch@pengutronix.de>
In-Reply-To: <20190116142037.10086-1-m.felsch@pengutronix.de>
References: <20190116142037.10086-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: richard.leitner@skidata.com, robh@kernel.org, fancer.lancer@gmail.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, kernel@pengutronix.de, gregkh@linuxfoundation.org
List-ID: <devicetree@vger.kernel.org>

The HW can swap the USB differential-pair (D+/D-) for each port
separately. So the USB signals can be re-aligned with a misplaced
USB connector on the PCB.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
---
Changes:
v3:
 - fix comment
v2:
 - rename property s/sw-dx-lanes-ports/swap-dx-lanes
 - add comment for future users

 drivers/usb/misc/usb251xb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index a6efb9a72939..4d72b7d1d383 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -337,10 +337,12 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	struct device *dev = hub->dev;
 	struct device_node *np = dev->of_node;
 	int len, err, i;
-	u32 property_u32 = 0;
+	u32 port, property_u32 = 0;
 	const u32 *cproperty_u32;
 	const char *cproperty_char;
 	char str[USB251XB_STRING_BUFSIZE / 2];
+	struct property *prop;
+	const __be32 *p;
 
 	if (!np) {
 		dev_err(dev, "failed to get ofdata\n");
@@ -539,6 +541,16 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	/*
+	 * The datasheet documents the register as 'Port Swap' but in real the
+	 * register controls the USB DP/DM signal swapping for each port.
+	 */
+	hub->port_swap = USB251XB_DEF_PORT_SWAP;
+	of_property_for_each_u32(np, "swap-dx-lanes", prop, p, port) {
+		if ((port >= 0) && (port <= data->port_cnt))
+			hub->port_swap |= BIT(port);
+	}
+
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
@@ -546,7 +558,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	hub->boost_up = USB251XB_DEF_BOOST_UP;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
-	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
 	hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
 	hub->port_map56 = USB251XB_DEF_PORT_MAP_56;
-- 
2.20.1
