From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 13/14] NFC: st21nfcb: Add support for HCI event transaction
Date: Tue, 27 Jan 2015 01:28:23 +0100
Message-ID: <1422318504-10039-14-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The event transaction notifies the Device Host that an action is required
to manage a specific Secure Element application.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/st21nfcb_se.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/st21nfcb_se.c b/drivers/nfc/st21nfcb/st21nfcb_se.c
index cf65368..6868043 100644
--- a/drivers/nfc/st21nfcb/st21nfcb_se.c
+++ b/drivers/nfc/st21nfcb/st21nfcb_se.c
@@ -287,14 +287,35 @@ static int st21nfcb_hci_connectivity_event_received(struct st21nfcb_hci_dev *hde
 						    struct sk_buff *skb)
 {
 	int r = 0;
+	struct device *dev = &hdev->ndev->nfc_dev->dev;
+	struct nfc_evt_transaction *transaction;
 
 	pr_debug("connectivity gate event: %x\n", event);
 
 	switch (event) {
 	case ST21NFCB_EVT_CONNECTIVITY:
+
 	break;
 	case ST21NFCB_EVT_TRANSACTION:
-	break;
+		if (skb->len < NFC_MIN_AID_LENGTH + 2 &&
+		    skb->data[0] != NFC_EVT_TRANSACTION_AID_TAG)
+			return -EPROTO;
+
+		transaction = (struct nfc_evt_transaction *)devm_kzalloc(dev,
+					    skb->len - 2, GFP_KERNEL);
+
+		transaction->aid_len = skb->data[1];
+		memcpy(transaction->aid, &skb->data[2], skb->data[1]);
+
+		if (skb->data[transaction->aid_len + 2] !=
+		    NFC_EVT_TRANSACTION_PARAMS_TAG)
+			return -EPROTO;
+
+		transaction->params_len = skb->data[transaction->aid_len + 3];
+		memcpy(transaction->params, skb->data +
+		       transaction->aid_len + 4, transaction->params_len);
+
+		r = nfc_se_transaction(hdev->ndev->nfc_dev, host, transaction);
 	default:
 		return 1;
 	}
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
