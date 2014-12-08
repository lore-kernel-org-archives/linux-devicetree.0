From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 07/34] NFC: hci: Change nfc_hci_send_response gate parameter to pipe
Date: Mon,  8 Dec 2014 22:08:12 +0100
Message-ID: <1418072919-10535-8-git-send-email-christophe-h.ricard@st.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418072919-10535-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We are usually sending a response to a command received from a known pipe.
Keep this information as is.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/hci.h | 2 +-
 net/nfc/hci/command.c | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index c1c644b..6f11ca2 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -260,7 +260,7 @@ int nfc_hci_send_cmd(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
 int nfc_hci_send_cmd_async(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
 			   const u8 *param, size_t param_len,
 			   data_exchange_cb_t cb, void *cb_context);
-int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 gate, u8 response,
+int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 pipe, u8 response,
 			  const u8 *param, size_t param_len);
 int nfc_hci_send_event(struct nfc_hci_dev *hdev, u8 gate, u8 event,
 		       const u8 *param, size_t param_len);
diff --git a/net/nfc/hci/command.c b/net/nfc/hci/command.c
index 9acf586..e061dc6 100644
--- a/net/nfc/hci/command.c
+++ b/net/nfc/hci/command.c
@@ -116,16 +116,11 @@ int nfc_hci_send_event(struct nfc_hci_dev *hdev, u8 gate, u8 event,
 }
 EXPORT_SYMBOL(nfc_hci_send_event);
 
-int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 gate, u8 response,
+int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 pipe, u8 response,
 			  const u8 *param, size_t param_len)
 {
-	u8 pipe;
-
 	pr_debug("\n");
 
-	pipe = hdev->gate2pipe[gate];
-	if (pipe == NFC_HCI_INVALID_PIPE)
-		return -EADDRNOTAVAIL;
 
 	return nfc_hci_hcp_message_tx(hdev, pipe, NFC_HCI_HCP_RESPONSE,
 				      response, param, param_len, NULL, NULL,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
