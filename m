From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/10] NFC: hci: Remove nfc_hci_pipe2gate function
Date: Tue, 27 Jan 2015 01:18:18 +0100
Message-ID: <1422317900-3810-9-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

nfc_hci_pipe2gate is now doing double usage with the pipes table field in
the struct nfc_hci_dev. Also it is not used any more.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/hci/hci.h |  2 --
 net/nfc/hci/hcp.c | 11 -----------
 2 files changed, 13 deletions(-)

diff --git a/net/nfc/hci/hci.h b/net/nfc/hci/hci.h
index c1278bd..ab4c8e8 100644
--- a/net/nfc/hci/hci.h
+++ b/net/nfc/hci/hci.h
@@ -85,8 +85,6 @@ int nfc_hci_hcp_message_tx(struct nfc_hci_dev *hdev, u8 pipe,
 			   data_exchange_cb_t cb, void *cb_context,
 			   unsigned long completion_delay);
 
-u8 nfc_hci_pipe2gate(struct nfc_hci_dev *hdev, u8 pipe);
-
 void nfc_hci_hcp_message_rx(struct nfc_hci_dev *hdev, u8 pipe, u8 type,
 			    u8 instruction, struct sk_buff *skb);
 
diff --git a/net/nfc/hci/hcp.c b/net/nfc/hci/hcp.c
index e9de151..1fe725d 100644
--- a/net/nfc/hci/hcp.c
+++ b/net/nfc/hci/hcp.c
@@ -124,17 +124,6 @@ out_skb_err:
 	return err;
 }
 
-u8 nfc_hci_pipe2gate(struct nfc_hci_dev *hdev, u8 pipe)
-{
-	int gate;
-
-	for (gate = 0; gate < NFC_HCI_MAX_GATES; gate++)
-		if (hdev->gate2pipe[gate] == pipe)
-			return gate;
-
-	return 0xff;
-}
-
 /*
  * Receive hcp message for pipe, with type and cmd.
  * skb contains optional message data only.
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
