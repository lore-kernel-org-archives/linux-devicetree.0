From: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH v2 4/4] nfc: pn532_uart: Make use of pn532 autopoll
Date: Thu, 18 Oct 2018 16:42:44 +0200
Message-ID: <20181018144251.30028-4-poeschel@lemonage.de>
References: <20181018144251.30028-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181018144251.30028-1-poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "GitAuthor: Lars Poeschel" <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>, "open list:NFC SUBSYSTEM" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This switches the pn532 UART phy driver from manually polling to the new
autopoll mechanism.

Signed-off-by: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
---
 drivers/nfc/pn533/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index 8fd71c8953ca..a95ca01745ca 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -207,7 +207,7 @@ static int pn532_uart_probe(struct serdev_device *serdev)
 		goto err_free;
 
 	pn532->serdev = serdev;
-	priv = pn533_register_device(PN533_DEVICE_PN532,
+	priv = pn533_register_device(PN533_DEVICE_PN532_AUTOPOLL,
 				     PN533_NO_TYPE_B_PROTOCOLS,
 				     PN533_PROTO_REQ_ACK_RESP,
 				     pn532, &uart_phy_ops, NULL,
-- 
2.19.1
