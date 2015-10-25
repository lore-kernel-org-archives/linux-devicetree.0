From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v2 27/35] nfc: st21nfca: Fix host_list verification after secure element activation
Date: Sun, 25 Oct 2015 22:54:42 +0100
Message-ID: <1445810090-18403-28-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A secure element can be activated in different order. The host_list is
updated keeping a fixed order: <terminal_host_id><uicc_id><ese_id>.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfca/se.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index 6aa4e34..8e05d73 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -100,7 +100,7 @@ static int st21nfca_hci_control_se(struct nfc_hci_dev *hdev, u32 se_idx,
 				u8 state)
 {
 	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
-	int r;
+	int r, i;
 	struct sk_buff *sk_host_list;
 	u8 se_event, host_id;
 
@@ -148,7 +148,10 @@ static int st21nfca_hci_control_se(struct nfc_hci_dev *hdev, u32 se_idx,
 	if (r < 0)
 		return r;
 
-	host_id = sk_host_list->data[sk_host_list->len - 1];
+	for (i = 0; i < sk_host_list->len &&
+		sk_host_list->data[i] != se_idx; i++)
+		;
+	host_id = sk_host_list->data[i];
 	kfree_skb(sk_host_list);
 
 	if (state == ST21NFCA_SE_MODE_ON && host_id == se_idx)
-- 
2.1.4
