From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 09/34] NFC: hci: Add cmd_received handler
Date: Mon,  8 Dec 2014 22:08:14 +0100
Message-ID: <1418072919-10535-10-git-send-email-christophe-h.ricard@st.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418072919-10535-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When a command is received, it is sometime needed to let the CLF driver do
some additional operations. (ex: count remaining pipe notification...)

Make also generic HCI commands available to other NFC drivers

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/hci.h | 8 ++++++++
 net/nfc/hci/core.c    | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
index 6f11ca2..4c998a9 100644
--- a/include/net/nfc/hci.h
+++ b/include/net/nfc/hci.h
@@ -53,6 +53,8 @@ struct nfc_hci_ops {
 			      struct nfc_target *target);
 	int (*event_received)(struct nfc_hci_dev *hdev, u8 pipe, u8 event,
 			      struct sk_buff *skb);
+	void (*cmd_received)(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
+			    struct sk_buff *skb);
 	int (*fw_download)(struct nfc_hci_dev *hdev, const char *firmware_name);
 	int (*discover_se)(struct nfc_hci_dev *dev);
 	int (*enable_se)(struct nfc_hci_dev *dev, u32 se_idx);
@@ -230,6 +232,12 @@ void nfc_hci_reset_pipes_per_host(struct nfc_hci_dev *hdev, u8 host);
 #define NFC_HCI_EVT_POST_DATA			0x02
 #define NFC_HCI_EVT_HOT_PLUG			0x03
 
+/* Generic commands */
+#define NFC_HCI_ANY_SET_PARAMETER	0x01
+#define NFC_HCI_ANY_GET_PARAMETER	0x02
+#define NFC_HCI_ANY_OPEN_PIPE		0x03
+#define NFC_HCI_ANY_CLOSE_PIPE		0x04
+
 /* Reader RF gates events */
 #define NFC_HCI_EVT_READER_REQUESTED	0x10
 #define NFC_HCI_EVT_END_OPERATION	0x11
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 67e7049..bae1b3f 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -249,6 +249,9 @@ void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
 		break;
 	}
 
+	if (hdev->ops->cmd_received)
+		hdev->ops->cmd_received(hdev, pipe, cmd, skb);
+
 exit:
 	nfc_hci_send_response(hdev, pipe, status, NULL, 0);
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
