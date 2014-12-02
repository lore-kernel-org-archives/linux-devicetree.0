From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/13] NFC: hci: Add specific hci macro to not create a pipe
Date: Tue,  2 Dec 2014 21:27:52 +0100
Message-ID: <1417552078-9269-8-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some pipe are only created by other host (different than the Terminal Host).
The pipe values will for example be notified by NFC_HCI_ADM_NOTIFY_PIPE_CREATED.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/hci.h | 1 +
 net/nfc/hci/command.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index 50bc66f..14bd0e1 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -64,6 +64,7 @@ struct nfc_hci_ops {
 
 /* Pipes */
 #define NFC_HCI_INVALID_PIPE	0x80
+#define NFC_HCI_DO_NOT_CREATE_PIPE	0x81
 #define NFC_HCI_LINK_MGMT_PIPE	0x00
 #define NFC_HCI_ADMIN_PIPE	0x01
 
diff --git a/net/nfc/hci/command.c b/net/nfc/hci/command.c
index 677d24b..91df487 100644
--- a/net/nfc/hci/command.c
+++ b/net/nfc/hci/command.c
@@ -345,6 +345,9 @@ int nfc_hci_connect_gate(struct nfc_hci_dev *hdev, u8 dest_host, u8 dest_gate,
 
 	pr_debug("\n");
 
+	if (hdev->gate2pipe[dest_gate] == NFC_HCI_DO_NOT_CREATE_PIPE)
+		return 0;
+
 	if (hdev->gate2pipe[dest_gate] != NFC_HCI_INVALID_PIPE)
 		return -EADDRINUSE;
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
