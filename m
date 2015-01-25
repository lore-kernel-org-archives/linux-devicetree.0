From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/13] NFC: st21nfca: Fix some skb memory leaks
Date: Sun, 25 Jan 2015 23:33:28 +0100
Message-ID: <1422225211-27510-11-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix some memory leaks after some nfc_hci_get_param calls.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 0667272..7cb7ce4 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -261,8 +261,9 @@ static int st21nfca_hci_ready(struct nfc_hci_dev *hdev)
 	if (r < 0)
 		return r;
 
-	if (skb->data[0] == 0) {
-		kfree_skb(skb);
+	param = skb->data[0];
+	kfree_skb(skb);
+	if (param == 0) {
 		param = 1;
 
 		r = nfc_hci_set_param(hdev, ST21NFCA_DEVICE_MGNT_GATE,
@@ -404,9 +405,12 @@ static int st21nfca_hci_start_poll(struct nfc_hci_dev *hdev,
 			r = nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
 					      ST21NFCA_RF_CARD_F_DATARATE,
 					      param, 1);
-			if (r < 0)
+			if (r < 0) {
+				kfree_skb(datarate_skb);
 				return r;
+			}
 		}
+		kfree_skb(datarate_skb);
 
 		/*
 		 * Configure sens_res
@@ -660,15 +664,15 @@ static int st21nfca_hci_complete_target_discovered(struct nfc_hci_dev *hdev,
 						struct nfc_target *target)
 {
 	int r;
-	struct sk_buff *nfcid2_skb = NULL, *nfcid1_skb;
+	struct sk_buff *nfcid_skb = NULL;
 
 	if (gate == ST21NFCA_RF_READER_F_GATE) {
 		r = nfc_hci_get_param(hdev, ST21NFCA_RF_READER_F_GATE,
-				ST21NFCA_RF_READER_F_NFCID2, &nfcid2_skb);
+				ST21NFCA_RF_READER_F_NFCID2, &nfcid_skb);
 		if (r < 0)
 			goto exit;
 
-		if (nfcid2_skb->len > NFC_SENSF_RES_MAXSIZE) {
+		if (nfcid_skb->len > NFC_SENSF_RES_MAXSIZE) {
 			r = -EPROTO;
 			goto exit;
 		}
@@ -680,11 +684,11 @@ static int st21nfca_hci_complete_target_discovered(struct nfc_hci_dev *hdev,
 		 * - After the reception of SEL_RES with NFCIP-1 compliant bit
 		 * set for type A frame NFCID1 will be updated
 		 */
-		if (nfcid2_skb->len > 0) {
+		if (nfcid_skb->len > 0) {
 			/* P2P in type F */
-			memcpy(target->sensf_res, nfcid2_skb->data,
-				nfcid2_skb->len);
-			target->sensf_res_len = nfcid2_skb->len;
+			memcpy(target->sensf_res, nfcid_skb->data,
+				nfcid_skb->len);
+			target->sensf_res_len = nfcid_skb->len;
 			/* NFC Forum Digital Protocol Table 44 */
 			if (target->sensf_res[0] == 0x01 &&
 			    target->sensf_res[1] == 0xfe)
@@ -694,27 +698,28 @@ static int st21nfca_hci_complete_target_discovered(struct nfc_hci_dev *hdev,
 				target->supported_protocols =
 							NFC_PROTO_FELICA_MASK;
 		} else {
+			kfree_skb(nfcid_skb);
 			/* P2P in type A */
 			r = nfc_hci_get_param(hdev, ST21NFCA_RF_READER_F_GATE,
 					ST21NFCA_RF_READER_F_NFCID1,
-					&nfcid1_skb);
+					&nfcid_skb);
 			if (r < 0)
 				goto exit;
 
-			if (nfcid1_skb->len > NFC_NFCID1_MAXSIZE) {
+			if (nfcid_skb->len > NFC_NFCID1_MAXSIZE) {
 				r = -EPROTO;
 				goto exit;
 			}
-			memcpy(target->sensf_res, nfcid1_skb->data,
-				nfcid1_skb->len);
-			target->sensf_res_len = nfcid1_skb->len;
+			memcpy(target->sensf_res, nfcid_skb->data,
+				nfcid_skb->len);
+			target->sensf_res_len = nfcid_skb->len;
 			target->supported_protocols = NFC_PROTO_NFC_DEP_MASK;
 		}
 		target->hci_reader_gate = ST21NFCA_RF_READER_F_GATE;
 	}
 	r = 1;
 exit:
-	kfree_skb(nfcid2_skb);
+	kfree_skb(nfcid_skb);
 	return r;
 }
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
