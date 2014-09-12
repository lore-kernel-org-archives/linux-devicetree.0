From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/11] NFC: st21nfca: Fix potential skb leaks in NFC-DEP code
Date: Fri, 12 Sep 2014 21:49:32 +0200
Message-ID: <1410551381-7565-3-git-send-email-christophe-h.ricard@st.com>
References: <1410551381-7565-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410551381-7565-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

After a unsuccessful call to nfc_hci_send_event the skb was not
freed and might lead to memory leak.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca_dep.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca_dep.c b/drivers/nfc/st21nfca/st21nfca_dep.c
index 03dacc6..bf3132b 100644
--- a/drivers/nfc/st21nfca/st21nfca_dep.c
+++ b/drivers/nfc/st21nfca/st21nfca_dep.c
@@ -185,8 +185,10 @@ static int st21nfca_tm_send_atr_res(struct nfc_hci_dev *hdev,
 
 	info->dep_info.curr_nfc_dep_pni = 0;
 
-	return nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
+	r = nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
 				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
+	kfree_skb(skb);
+	return r;
 }
 
 static int st21nfca_tm_recv_atr_req(struct nfc_hci_dev *hdev,
@@ -254,6 +256,8 @@ static int st21nfca_tm_send_psl_res(struct nfc_hci_dev *hdev,
 
 	r = nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
 				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
+	if (r < 0)
+		goto error;
 
 	/*
 	 * ST21NFCA only support P2P passive.
@@ -269,8 +273,11 @@ static int st21nfca_tm_send_psl_res(struct nfc_hci_dev *hdev,
 	}
 
 	/* Send an event to change bitrate change event to card f */
-	return nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
+	r = nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
 			ST21NFCA_EVT_CARD_F_BITRATE, bitrate, 2);
+error:
+	kfree_skb(skb);
+	return r;
 }
 
 static int st21nfca_tm_recv_psl_req(struct nfc_hci_dev *hdev,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
