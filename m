From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 02/13] NFC: nci: Add status byte management in case of error.
Date: Tue,  2 Dec 2014 21:27:47 +0100
Message-ID: <1417552078-9269-3-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The nci status byte was ignored. In case of tag reading for example,
if the tag is removed from the antenna there is no way for the upper
layers (aka: stack) to get inform about such event.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/data.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 91f5d55..a2de2a8 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -185,11 +185,16 @@ exit:
 
 static void nci_add_rx_data_frag(struct nci_dev *ndev,
 				 struct sk_buff *skb,
-				 __u8 pbf)
+				 __u8 pbf, __u8 status)
 {
 	int reassembly_len;
 	int err = 0;
 
+	if (status) {
+		err = status;
+		goto exit;
+	}
+
 	if (ndev->rx_data_reassembly) {
 		reassembly_len = ndev->rx_data_reassembly->len;
 
@@ -241,6 +246,7 @@ exit:
 void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u8 pbf = nci_pbf(skb->data);
+	__u8 status = 0;
 
 	pr_debug("len %d\n", skb->len);
 
@@ -258,8 +264,9 @@ void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	    ndev->target_active_prot == NFC_PROTO_ISO15693) {
 		/* frame I/F => remove the status byte */
 		pr_debug("frame I/F => remove the status byte\n");
+		status = skb->data[skb->len - 1];
 		skb_trim(skb, (skb->len - 1));
 	}
 
-	nci_add_rx_data_frag(ndev, skb, pbf);
+	nci_add_rx_data_frag(ndev, skb, pbf, nci_to_errno(status));
 }
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
