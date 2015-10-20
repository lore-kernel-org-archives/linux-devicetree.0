From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 17/30] nfc: st21nfca: Change st21nfca_gates offset when looking for a pipe in the table
Date: Tue, 20 Oct 2015 23:48:08 +0200
Message-ID: <1445377701-8353-18-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It is useless to start from index 0 when looking for a gate because only
dynamic pipes are retrieved with ST21NFCA_DM_GETINFO(ST21NFCA_DM_GETINFO_PIPE_LIST).

The first dynamic pipe is present at index 3.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfca/st21nfca.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index fb0c0ac..0e84ce6 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -87,12 +87,13 @@ static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
 
 static struct nfc_hci_gate st21nfca_gates[] = {
 	{NFC_HCI_ADMIN_GATE, NFC_HCI_ADMIN_PIPE},
+	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_LINK_MGMT_PIPE},
+	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
+
 	{NFC_HCI_LOOPBACK_GATE, NFC_HCI_INVALID_PIPE},
 	{NFC_HCI_ID_MGMT_GATE, NFC_HCI_INVALID_PIPE},
-	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_LINK_MGMT_PIPE},
 	{NFC_HCI_RF_READER_B_GATE, NFC_HCI_INVALID_PIPE},
 	{NFC_HCI_RF_READER_A_GATE, NFC_HCI_INVALID_PIPE},
-	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
 	{ST21NFCA_RF_READER_F_GATE, NFC_HCI_INVALID_PIPE},
 	{ST21NFCA_RF_READER_14443_3_A_GATE, NFC_HCI_INVALID_PIPE},
 	{ST21NFCA_RF_READER_ISO15693_GATE, NFC_HCI_INVALID_PIPE},
@@ -185,7 +186,7 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 			continue;
 		}
 
-		for (j = 0; (j < ARRAY_SIZE(st21nfca_gates)) &&
+		for (j = 3; (j < ARRAY_SIZE(st21nfca_gates)) &&
 			(st21nfca_gates[j].gate != info->dst_gate_id) ; j++)
 			;
 
-- 
2.1.4
