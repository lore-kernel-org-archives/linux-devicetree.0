From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] NFC: st21nfca: Improve load_session in order to create pipe when it does not exists
Date: Tue, 13 May 2014 22:03:41 +0200
Message-ID: <1400011422-10999-4-git-send-email-christophe-h.ricard@st.com>
References: <1400011422-10999-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400011422-10999-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

In case anybody uses previous patchset with the CLF, add a check to make sure
missing pipe are created.
st21nfca returns its pipe list in the creation order (most recent latest).

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 201a3ea..d9ee3d0 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -61,10 +61,10 @@
 static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
 
 static struct nfc_hci_gate st21nfca_gates[] = {
-	{NFC_HCI_ADMIN_GATE, NFC_HCI_INVALID_PIPE},
+	{NFC_HCI_ADMIN_GATE, NFC_HCI_ADMIN_PIPE},
 	{NFC_HCI_LOOPBACK_GATE, NFC_HCI_INVALID_PIPE},
 	{NFC_HCI_ID_MGMT_GATE, NFC_HCI_INVALID_PIPE},
-	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_INVALID_PIPE},
+	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_LINK_MGMT_PIPE},
 	{NFC_HCI_RF_READER_B_GATE, NFC_HCI_INVALID_PIPE},
 	{NFC_HCI_RF_READER_A_GATE, NFC_HCI_INVALID_PIPE},
 	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
@@ -170,6 +170,23 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 				st21nfca_gates[j].pipe;
 		}
 	}
+
+	/*
+	 * 3 gates have a well known pipe ID.
+	 * They will never appear in the pipe list
+	 */
+	if (skb_pipe_list->len + 3 < ARRAY_SIZE(st21nfca_gates)) {
+		for (i = skb_pipe_list->len + 3;
+				i < ARRAY_SIZE(st21nfca_gates); i++) {
+			r = nfc_hci_connect_gate(hdev,
+					NFC_HCI_HOST_CONTROLLER_ID,
+					st21nfca_gates[i].gate,
+					st21nfca_gates[i].pipe);
+			if (r < 0)
+				goto free_info;
+		}
+	}
+
 	memcpy(hdev->init_data.gates, st21nfca_gates, sizeof(st21nfca_gates));
 free_info:
 	kfree_skb(skb_pipe_info);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
