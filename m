From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 4/9] NFC: nfcmrvl: configure head/tail room values per low level drivers
Date: Fri, 23 Oct 2015 14:23:01 +0200
Message-ID: <1445602986-3254-5-git-send-email-cuissard@marvell.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445602986-3254-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Low-level drivers may need to add some data before and/or after NCI packet.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/nfc/nfcmrvl/main.c    | 13 +++++++++----
 drivers/nfc/nfcmrvl/nfcmrvl.h |  3 ++-
 drivers/nfc/nfcmrvl/uart.c    |  4 ++--
 drivers/nfc/nfcmrvl/usb.c     |  3 +--
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6fb23cc..a24a7ca 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -97,14 +97,16 @@ static struct nci_ops nfcmrvl_nci_ops = {
 	.fw_download = nfcmrvl_nci_fw_download,
 };
 
-struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
+struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
+				void *drv_data,
 				struct nfcmrvl_if_ops *ops,
 				struct device *dev,
 				struct nfcmrvl_platform_data *pdata)
 {
 	struct nfcmrvl_private *priv;
 	int rc;
-	int headroom = 0;
+	int headroom;
+	int tailroom;
 	u32 protocols;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
@@ -114,6 +116,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 	priv->drv_data = drv_data;
 	priv->if_ops = ops;
 	priv->dev = dev;
+	priv->phy = phy;
 
 	memcpy(&priv->config, pdata, sizeof(*pdata));
 
@@ -126,8 +129,10 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 			nfc_err(dev, "failed to request reset_n io\n");
 	}
 
+	headroom = tailroom = 0;
+
 	if (priv->config.hci_muxed)
-		headroom = NFCMRVL_HCI_EVENT_HEADER_SIZE;
+		headroom += NFCMRVL_HCI_EVENT_HEADER_SIZE;
 
 	protocols = NFC_PROTO_JEWEL_MASK
 		| NFC_PROTO_MIFARE_MASK
@@ -138,7 +143,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 		| NFC_PROTO_NFC_DEP_MASK;
 
 	priv->ndev = nci_allocate_device(&nfcmrvl_nci_ops, protocols,
-					 headroom, 0);
+					 headroom, tailroom);
 	if (!priv->ndev) {
 		nfc_err(dev, "nci_allocate_device failed\n");
 		rc = -ENOMEM;
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 1b30f04..f82678b 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -100,7 +100,8 @@ struct nfcmrvl_if_ops {
 
 void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv);
 int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb);
-struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
+struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
+				void *drv_data,
 				struct nfcmrvl_if_ops *ops,
 				struct device *dev,
 				struct nfcmrvl_platform_data *pdata);
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 8355824..4dccee2 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -138,11 +138,11 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 		pdata = &config;
 	}
 
-	priv = nfcmrvl_nci_register_dev(nu, &uart_ops, nu->tty->dev, pdata);
+	priv = nfcmrvl_nci_register_dev(NFCMRVL_PHY_UART, nu, &uart_ops,
+					nu->tty->dev, pdata);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
-	priv->phy = NFCMRVL_PHY_UART;
 	priv->support_fw_dnld = true;
 
 	nu->drv_data = priv;
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index b276174..585a0f2 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -340,13 +340,12 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 	init_usb_anchor(&drv_data->bulk_anchor);
 	init_usb_anchor(&drv_data->deferred);
 
-	priv = nfcmrvl_nci_register_dev(drv_data, &usb_ops,
+	priv = nfcmrvl_nci_register_dev(NFCMRVL_PHY_USB, drv_data, &usb_ops,
 					&drv_data->udev->dev, &config);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
 	drv_data->priv = priv;
-	drv_data->priv->phy = NFCMRVL_PHY_USB;
 	drv_data->priv->support_fw_dnld = false;
 
 	priv->dev = &drv_data->udev->dev;
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
