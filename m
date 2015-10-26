From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v3 07/35] nfc: nci: extract pipe value using NCI_HCP_MSG_GET_PIPE
Date: Mon, 26 Oct 2015 07:49:47 +0100
Message-ID: <1445842215-28403-8-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When receiving data in nci_hci_msg_rx_work, extract pipe value using
NCI_HCP_MSG_GET_PIPE macro.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
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
