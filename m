From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] NFC: st21nfca: Add ISO15693 Reader/Writer support
Date: Tue, 13 May 2014 22:03:42 +0200
Message-ID: <1400011422-10999-5-git-send-email-christophe-h.ricard@st.com>
References: <1400011422-10999-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400011422-10999-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for ISO/IEC 15693 RF technology and Type 5 tags.
ISO15963 is using proprietary gate 12.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 73 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index d9ee3d0..51e0f00b 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -33,6 +33,7 @@
 #define ST21NFCA_RF_READER_CMD_PRESENCE_CHECK	0x30
 
 #define ST21NFCA_RF_READER_ISO15693_GATE	0x12
+#define ST21NFCA_RF_READER_ISO15693_INVENTORY 0x01
 
 /*
  * Reader gate for communication with contact-less cards using Type A
@@ -70,6 +71,7 @@ static struct nfc_hci_gate st21nfca_gates[] = {
 	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
 	{ST21NFCA_RF_READER_F_GATE, NFC_HCI_INVALID_PIPE},
 	{ST21NFCA_RF_READER_14443_3_A_GATE, NFC_HCI_INVALID_PIPE},
+	{ST21NFCA_RF_READER_ISO15693_GATE, NFC_HCI_INVALID_PIPE},
 };
 
 struct st21nfca_pipe_info {
@@ -421,6 +423,34 @@ exit:
 	return r;
 }
 
+static int st21nfca_get_iso15693_inventory(struct nfc_hci_dev *hdev,
+					   struct nfc_target *target)
+{
+	int r;
+	struct sk_buff *inventory_skb = NULL;
+
+	r = nfc_hci_get_param(hdev, ST21NFCA_RF_READER_ISO15693_GATE,
+			      ST21NFCA_RF_READER_ISO15693_INVENTORY,
+			      &inventory_skb);
+	if (r < 0)
+		goto exit;
+
+	skb_pull(inventory_skb, 2);
+
+	if (inventory_skb->len == 0 ||
+	    inventory_skb->len > NFC_ISO15693_UID_MAXSIZE) {
+		r = -EPROTO;
+		goto exit;
+	}
+
+	memcpy(target->iso15693_uid, inventory_skb->data, inventory_skb->len);
+	target->iso15693_dsfid	= inventory_skb->data[1];
+	target->is_iso15693 = 1;
+exit:
+	kfree_skb(inventory_skb);
+	return r;
+}
+
 static int st21nfca_hci_target_from_gate(struct nfc_hci_dev *hdev, u8 gate,
 					 struct nfc_target *target)
 {
@@ -462,6 +492,12 @@ static int st21nfca_hci_target_from_gate(struct nfc_hci_dev *hdev, u8 gate,
 		}
 
 		break;
+	case ST21NFCA_RF_READER_ISO15693_GATE:
+		target->supported_protocols = NFC_PROTO_ISO15693_MASK;
+		r = st21nfca_get_iso15693_inventory(hdev, target);
+		if (r < 0)
+			return r;
+		break;
 	default:
 		return -EPROTO;
 	}
@@ -469,6 +505,25 @@ static int st21nfca_hci_target_from_gate(struct nfc_hci_dev *hdev, u8 gate,
 	return 0;
 }
 
+#define ST21NFCA_CB_TYPE_READER_ISO15693 1
+static void st21nfca_hci_data_exchange_cb(void *context, struct sk_buff *skb,
+					  int err)
+{
+	struct st21nfca_hci_info *info = context;
+
+	switch (info->async_cb_type) {
+	case ST21NFCA_CB_TYPE_READER_ISO15693:
+		if (err == 0)
+			skb_trim(skb, skb->len - 1);
+		info->async_cb(info->async_cb_context, skb, err);
+		break;
+	default:
+		if (err == 0)
+			kfree_skb(skb);
+		break;
+	}
+}
+
 /*
  * Returns:
  * <= 0: driver handled the data exchange
@@ -479,6 +534,8 @@ static int st21nfca_hci_im_transceive(struct nfc_hci_dev *hdev,
 				      struct sk_buff *skb,
 				      data_exchange_cb_t cb, void *cb_context)
 {
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
 	pr_info(DRIVER_DESC ": %s for gate=%d len=%d\n", __func__,
 		target->hci_reader_gate, skb->len);
 
@@ -494,6 +551,19 @@ static int st21nfca_hci_im_transceive(struct nfc_hci_dev *hdev,
 		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
 					      ST21NFCA_WR_XCHG_DATA, skb->data,
 					      skb->len, cb, cb_context);
+	case ST21NFCA_RF_READER_ISO15693_GATE:
+		info->async_cb_type = ST21NFCA_CB_TYPE_READER_ISO15693;
+		info->async_cb = cb;
+		info->async_cb_context = cb_context;
+
+		*skb_push(skb, 1) = 0x17;
+
+		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
+					      ST21NFCA_WR_XCHG_DATA, skb->data,
+					      skb->len,
+					      st21nfca_hci_data_exchange_cb,
+					      info);
+		break;
 	default:
 		return 1;
 	}
@@ -577,7 +647,8 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 	    NFC_PROTO_MIFARE_MASK |
 	    NFC_PROTO_FELICA_MASK |
 	    NFC_PROTO_ISO14443_MASK |
-	    NFC_PROTO_ISO14443_B_MASK;
+	    NFC_PROTO_ISO14443_B_MASK |
+	    NFC_PROTO_ISO15693_MASK;
 
 	set_bit(NFC_HCI_QUIRK_SHORT_CLEAR, &quirks);
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
