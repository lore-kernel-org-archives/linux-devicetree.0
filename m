From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 20/35] nfc: st21nfca: Change st21nfca_gates offset when looking for a pipe in the table
Date: Mon, 26 Oct 2015 07:50:00 +0100
Message-ID: <1445842215-28403-21-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

It is useless to start from index 0 when looking for a gate because only
dynamic pipes are retrieved with ST21NFCA_DM_GETINFO(ST21NFCA_DM_GETINFO_PIPE_LIST).

The first dynamic pipe is present at index 3.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index b4451f8..814d8ff4 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -85,12 +85,13 @@ static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
 
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
@@ -183,7 +184,7 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 			continue;
 		}
 
-		for (j = 0; (j < ARRAY_SIZE(st21nfca_gates)) &&
+		for (j = 3; (j < ARRAY_SIZE(st21nfca_gates)) &&
 			(st21nfca_gates[j].gate != info->dst_gate_id) ; j++)
 			;
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
