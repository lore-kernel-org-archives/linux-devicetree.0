From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v3 05/35] nfc: nci: Fix incorrect data chaining when sending data
Date: Mon, 26 Oct 2015 07:49:45 +0100
Message-ID: <1445842215-28403-6-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When sending HCI data over NCI, cmd information should be present only on
the first packet. Each packet shall be specifically allocated and sent to
the NCI layer.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 net/nfc/nci/hci.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index 609f922..bc6b9d5 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -146,18 +146,18 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 pipe,
 	if (!conn_info)
 		return -EPROTO;
 
-	skb = nci_skb_alloc(ndev, 2 + conn_info->max_pkt_payload_len +
+	i = 0;
+	skb = nci_skb_alloc(ndev, conn_info->max_pkt_payload_len +
 			    NCI_DATA_HDR_SIZE, GFP_KERNEL);
 	if (!skb)
 		return -ENOMEM;
 
-	skb_reserve(skb, 2 + NCI_DATA_HDR_SIZE);
+	skb_reserve(skb, NCI_DATA_HDR_SIZE + 2);
 	*skb_push(skb, 1) = data_type;
 
-	i = 0;
-	len = conn_info->max_pkt_payload_len;
-
 	do {
+		len = conn_info->max_pkt_payload_len;
+
 		/* If last packet add NCI_HFP_NO_CHAINING */
 		if (i + conn_info->max_pkt_payload_len -
 		    (skb->len + 1) >= data_len) {
@@ -177,9 +177,14 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 pipe,
 			return r;
 
 		i += len;
+
 		if (i < data_len) {
-			skb_trim(skb, 0);
-			skb_pull(skb, len);
+			skb = nci_skb_alloc(ndev, conn_info->max_pkt_payload_len +
+					    NCI_DATA_HDR_SIZE, GFP_KERNEL);
+			if (!skb)
+				return -ENOMEM;
+
+			skb_reserve(skb, NCI_DATA_HDR_SIZE + 1);
 		}
 	} while (i < data_len);
 
-- 
2.1.4
