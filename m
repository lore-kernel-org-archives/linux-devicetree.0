From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/10] NFC: hci: Reference every pipe information according to notification
Date: Tue, 27 Jan 2015 01:18:14 +0100
Message-ID: <1422317900-3810-5-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Every time a pipe notification raised, we update the current pipes status
accordingly together in hdev->gate2pipe and hdev->pipes {gate, host}

Also:
- If an error is detected it was so far not reported to the CLF.
- Any HCI command can be received, we need to respond something back to the
CLF.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/hci/core.c | 57 ++++++++++++++++++++++++++++++++++--------------------
 net/nfc/hci/hci.h  |  8 ++++++++
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 25cdceb..a664a67 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -193,51 +193,66 @@ exit:
 void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
 			  struct sk_buff *skb)
 {
-	int r = 0;
 	u8 gate = hdev->pipes[pipe].gate;
-	u8 local_gate, new_pipe;
-	u8 gate_opened = 0x00;
+	u8 status = NFC_HCI_ANY_OK;
+	struct hci_create_pipe_resp *create_info;
+	struct hci_delete_pipe_noti *delete_info;
+	struct hci_all_pipe_cleared_noti *cleared_info;
 
 	pr_debug("from gate %x pipe %x cmd %x\n", gate, pipe, cmd);
 
 	switch (cmd) {
 	case NFC_HCI_ADM_NOTIFY_PIPE_CREATED:
 		if (skb->len != 5) {
-			r = -EPROTO;
-			break;
+			status = NFC_HCI_ANY_E_NOK;
+			goto exit;
 		}
+		create_info = (struct hci_create_pipe_resp *)skb->data;
 
-		local_gate = skb->data[3];
-		new_pipe = skb->data[4];
-		nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
-				       NFC_HCI_ANY_OK, NULL, 0, NULL, NULL, 0);
-
-		/* save the new created pipe and bind with local gate,
+		/* Save the new created pipe and bind with local gate,
 		 * the description for skb->data[3] is destination gate id
 		 * but since we received this cmd from host controller, we
 		 * are the destination and it is our local gate
 		 */
-		hdev->gate2pipe[local_gate] = new_pipe;
+		hdev->gate2pipe[create_info->dest_gate] = create_info->pipe;
+		hdev->pipes[create_info->pipe].gate = create_info->dest_gate;
+		hdev->pipes[create_info->pipe].dest_host =
+							create_info->src_host;
 		break;
 	case NFC_HCI_ANY_OPEN_PIPE:
-		/* if the pipe is already created, we allow remote host to
-		 * open it
-		 */
-		if (gate != 0xff)
-			nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
-				NFC_HCI_ANY_OK, &gate_opened, 1, NULL, NULL, 0);
+		if (gate == NFC_HCI_INVALID_GATE) {
+			status = NFC_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		break;
+	case NFC_HCI_ADM_NOTIFY_PIPE_DELETED:
+		if (skb->len != 1) {
+			status = NFC_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		delete_info = (struct hci_delete_pipe_noti *)skb->data;
+
+		hdev->pipes[delete_info->pipe].gate = NFC_HCI_INVALID_GATE;
+		hdev->pipes[delete_info->pipe].dest_host = NFC_HCI_INVALID_HOST;
 		break;
 	case NFC_HCI_ADM_NOTIFY_ALL_PIPE_CLEARED:
-		nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
-					NFC_HCI_ANY_OK, NULL, 0, NULL, NULL, 0);
+		if (skb->len != 1) {
+			status = NFC_HCI_ANY_E_NOK;
+			goto exit;
+		}
+		cleared_info = (struct hci_all_pipe_cleared_noti *)skb->data;
 
+		nfc_hci_reset_pipes_per_host(hdev, cleared_info->host);
 		break;
 	default:
 		pr_info("Discarded unknown cmd %x to gate %x\n", cmd, gate);
-		r = -EINVAL;
 		break;
 	}
 
+exit:
+	nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
+			       status, NULL, 0, NULL, NULL, 0);
+
 	kfree_skb(skb);
 }
 
diff --git a/net/nfc/hci/hci.h b/net/nfc/hci/hci.h
index c3d2e2c..c1278bd 100644
--- a/net/nfc/hci/hci.h
+++ b/net/nfc/hci/hci.h
@@ -65,6 +65,14 @@ struct hci_create_pipe_resp {
 	u8 pipe;
 } __packed;
 
+struct hci_delete_pipe_noti {
+	u8 pipe;
+} __packed;
+
+struct hci_all_pipe_cleared_noti {
+	u8 host;
+} __packed;
+
 #define NFC_HCI_FRAGMENT	0x7f
 
 #define HCP_HEADER(type, instr) ((((type) & 0x03) << 6) | ((instr) & 0x3f))
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
