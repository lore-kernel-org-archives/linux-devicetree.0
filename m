From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 22/30] nfc: st-nci: Fix host_list verification after secure element activation
Date: Tue, 20 Oct 2015 23:48:13 +0200
Message-ID: <1445377701-8353-23-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A secure element can be activated in different order. The host_list is
updated keeping a fixed order: <terminal_host_id><uicc_id><ese_id>.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/st-nci_se.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index ee53fc0..8886072 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -419,7 +419,7 @@ static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
 			     u8 state)
 {
 	struct st_nci_info *info = nci_get_drvdata(ndev);
-	int r;
+	int r, i;
 	struct sk_buff *sk_host_list;
 	u8 host_id;
 
@@ -466,7 +466,10 @@ static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
 	if (r != NCI_HCI_ANY_OK)
 		return r;
 
-	host_id = sk_host_list->data[sk_host_list->len - 1];
+	for (i = 0; i < sk_host_list->len &&
+		sk_host_list->data[i] != se_idx; i++)
+		;
+	host_id = sk_host_list->data[i];
 	kfree_skb(sk_host_list);
 	if (state == ST_NCI_SE_MODE_ON && host_id == se_idx)
 		return se_idx;
-- 
2.1.4
