From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v3 14/35] nfc: st21nfca: Open NFC_HCI_LINK_MGMT_PIPE
Date: Mon, 26 Oct 2015 07:49:54 +0100
Message-ID: <1445842215-28403-15-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

NFC_HCI_LINK_MGMT_PIPE was never open in nfc_hci_load_session.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfca/core.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 67d1c27..819a94a 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -203,22 +203,13 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 	}
 
 	/*
-	 * 3 gates have a well known pipe ID.
-	 * They will never appear in the pipe list
+	 * 3 gates have a well known pipe ID. Only NFC_HCI_LINK_MGMT_GATE
+	 * is not yet open at this stage.
 	 */
-	if (skb_pipe_list->len + 3 < ARRAY_SIZE(st21nfca_gates)) {
-		for (i = skb_pipe_list->len + 3;
-				i < ARRAY_SIZE(st21nfca_gates) - 2; i++) {
-			r = nfc_hci_connect_gate(hdev,
-					NFC_HCI_HOST_CONTROLLER_ID,
-					st21nfca_gates[i].gate,
-					st21nfca_gates[i].pipe);
-			if (r < 0)
-				goto free_list;
-		}
-	}
+	r = nfc_hci_connect_gate(hdev, NFC_HCI_HOST_CONTROLLER_ID,
+				 NFC_HCI_LINK_MGMT_GATE,
+				 NFC_HCI_LINK_MGMT_PIPE);
 
-free_list:
 	kfree_skb(skb_pipe_list);
 	return r;
 }
-- 
2.1.4
