From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH v3 5/5] nfc: pn532_uart: Make use of pn532 autopoll
Date: Thu, 25 Oct 2018 15:29:36 +0200
Message-ID: <20181025132937.24405-5-poeschel@lemonage.de>
References: <20181025132937.24405-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025132937.24405-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, "GitAuthor: Lars Poeschel" <poeschel@lemonage.de>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This switches the pn532 UART phy driver from manually polling to the new
autopoll mechanism.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
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
