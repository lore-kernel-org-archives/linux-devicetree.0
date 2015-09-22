From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/9] NFC: nfcmrvl: allow low level drivers to configure head/tail room
Date: Tue, 22 Sep 2015 16:26:09 +0200
Message-ID: <1442931974-31526-5-git-send-email-cuissard@marvell.com>
References: <1442931974-31526-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442931974-31526-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Low-level drivers may need to add some data before and/or after NCI packet.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/nfc/nfcmrvl/main.c            | 6 +++---
 drivers/nfc/nfcmrvl/uart.c            | 2 ++
 include/linux/platform_data/nfcmrvl.h | 3 +++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6fb23cc..bd8db3d 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -104,7 +104,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 {
 	struct nfcmrvl_private *priv;
 	int rc;
-	int headroom = 0;
+	int headroom = pdata->phy_headroom;
 	u32 protocols;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
@@ -127,7 +127,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 	}
 
 	if (priv->config.hci_muxed)
-		headroom = NFCMRVL_HCI_EVENT_HEADER_SIZE;
+		headroom += NFCMRVL_HCI_EVENT_HEADER_SIZE;
 
 	protocols = NFC_PROTO_JEWEL_MASK
 		| NFC_PROTO_MIFARE_MASK
@@ -138,7 +138,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 		| NFC_PROTO_NFC_DEP_MASK;
 
 	priv->ndev = nci_allocate_device(&nfcmrvl_nci_ops, protocols,
-					 headroom, 0);
+					 headroom, priv->config.phy_tailroom);
 	if (!priv->ndev) {
 		nfc_err(dev, "nci_allocate_device failed\n");
 		rc = -ENOMEM;
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 8355824..b851334 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -138,6 +138,8 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 		pdata = &config;
 	}
 
+	pdata->phy_headroom = pdata->phy_tailroom = 0;
+
 	priv = nfcmrvl_nci_register_dev(nu, &uart_ops, nu->tty->dev, pdata);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
diff --git a/include/linux/platform_data/nfcmrvl.h b/include/linux/platform_data/nfcmrvl.h
index ac91707..6f6ba27 100644
--- a/include/linux/platform_data/nfcmrvl.h
+++ b/include/linux/platform_data/nfcmrvl.h
@@ -26,6 +26,9 @@ struct nfcmrvl_platform_data {
 	unsigned int reset_n_io;
 	/* Tell if transport is muxed in HCI one */
 	unsigned int hci_muxed;
+	/* Tell generic driver that the PHY requires some headroom space */
+	unsigned int phy_headroom;
+	unsigned int phy_tailroom;
 
 	/*
 	 * UART specific
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
