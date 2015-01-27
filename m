From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/10] NFC: hci: Change nfc_hci_send_response gate parameter to pipe
Date: Tue, 27 Jan 2015 01:18:13 +0100
Message-ID: <1422317900-3810-4-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We are usually sending a response to a command received from a known pipe.
As this needs changing nfc_hci_send_response prototype changes not inline
with other function, we go with nfc_hci_hcp_message_tx directly.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/hci.h |  2 --
 net/nfc/hci/command.c | 17 -----------------
 net/nfc/hci/core.c    | 11 +++++++----
 3 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index 5570f4a..1d1fd2b 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -260,8 +260,6 @@ int nfc_hci_send_cmd(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
 int nfc_hci_send_cmd_async(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
 			   const u8 *param, size_t param_len,
 			   data_exchange_cb_t cb, void *cb_context);
-int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 gate, u8 response,
-			  const u8 *param, size_t param_len);
 int nfc_hci_send_event(struct nfc_hci_dev *hdev, u8 gate, u8 event,
 		       const u8 *param, size_t param_len);
 int nfc_hci_target_discovered(struct nfc_hci_dev *hdev, u8 gate);
diff --git a/net/nfc/hci/command.c b/net/nfc/hci/command.c
index 9acf586..844673c 100644
--- a/net/nfc/hci/command.c
+++ b/net/nfc/hci/command.c
@@ -116,23 +116,6 @@ int nfc_hci_send_event(struct nfc_hci_dev *hdev, u8 gate, u8 event,
 }
 EXPORT_SYMBOL(nfc_hci_send_event);
 
-int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 gate, u8 response,
-			  const u8 *param, size_t param_len)
-{
-	u8 pipe;
-
-	pr_debug("\n");
-
-	pipe = hdev->gate2pipe[gate];
-	if (pipe == NFC_HCI_INVALID_PIPE)
-		return -EADDRNOTAVAIL;
-
-	return nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
-				      response, param, param_len, NULL, NULL,
-				      0);
-}
-EXPORT_SYMBOL(nfc_hci_send_response);
-
 /*
  * Execute an hci command sent to gate.
  * skb will contain response data if success. skb can be NULL if you are not
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 8f8abfe..25cdceb 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -209,7 +209,8 @@ void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
 
 		local_gate = skb->data[3];
 		new_pipe = skb->data[4];
-		nfc_hci_send_response(hdev, gate, NFC_HCI_ANY_OK, NULL, 0);
+		nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
+				       NFC_HCI_ANY_OK, NULL, 0, NULL, NULL, 0);
 
 		/* save the new created pipe and bind with local gate,
 		 * the description for skb->data[3] is destination gate id
@@ -223,11 +224,13 @@ void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
 		 * open it
 		 */
 		if (gate != 0xff)
-			nfc_hci_send_response(hdev, gate, NFC_HCI_ANY_OK,
-					      &gate_opened, 1);
+			nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
+				NFC_HCI_ANY_OK, &gate_opened, 1, NULL, NULL, 0);
 		break;
 	case NFC_HCI_ADM_NOTIFY_ALL_PIPE_CLEARED:
-		nfc_hci_send_response(hdev, gate, NFC_HCI_ANY_OK, NULL, 0);
+		nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
+					NFC_HCI_ANY_OK, NULL, 0, NULL, NULL, 0);
+
 		break;
 	default:
 		pr_info("Discarded unknown cmd %x to gate %x\n", cmd, gate);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
