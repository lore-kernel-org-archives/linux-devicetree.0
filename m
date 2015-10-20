From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/30] nfc: nci: extract pipe value using NCI_HCP_MSG_GET_PIPE
Date: Tue, 20 Oct 2015 23:47:55 +0200
Message-ID: <1445377701-8353-5-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When receiving data in nci_hci_msg_rx_work, extract pipe value using
NCI_HCP_MSG_GET_PIPE macro.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/hci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index 73afb47..abe0200 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -400,7 +400,7 @@ static void nci_hci_msg_rx_work(struct work_struct *work)
 	u8 pipe, type, instruction;
 
 	while ((skb = skb_dequeue(&hdev->msg_rx_queue)) != NULL) {
-		pipe = skb->data[0];
+		pipe = NCI_HCP_MSG_GET_PIPE(skb->data[0]);
 		skb_pull(skb, NCI_HCI_HCP_PACKET_HEADER_LEN);
 		message = (struct nci_hcp_message *)skb->data;
 		type = NCI_HCP_MSG_GET_TYPE(message->header);
@@ -437,7 +437,7 @@ void nci_hci_data_received_cb(void *context,
 
 	/* it's the last fragment. Does it need re-aggregation? */
 	if (skb_queue_len(&ndev->hci_dev->rx_hcp_frags)) {
-		pipe = packet->header & NCI_HCI_FRAGMENT;
+		pipe = NCI_HCP_MSG_GET_PIPE(packet->header);
 		skb_queue_tail(&ndev->hci_dev->rx_hcp_frags, skb);
 
 		msg_len = 0;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
