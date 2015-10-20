From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/30] nfc: nci: add nci_hci_clear_all_pipes functions
Date: Tue, 20 Oct 2015 23:47:56 +0200
Message-ID: <1445377701-8353-6-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

nci_hci_clear_all_pipes might be use full in some cases for example after
a firmware update.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/hci.c          | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index d0d0f1e..b2f2e04 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -305,6 +305,7 @@ int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      const u8 *param, size_t param_len);
 int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      struct sk_buff **skb);
+int nci_hci_clear_all_pipes(struct nci_dev *ndev);
 int nci_hci_dev_session_init(struct nci_dev *ndev);
 
 static inline struct sk_buff *nci_skb_alloc(struct nci_dev *ndev,
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index abe0200..e7148cf 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -70,6 +70,7 @@ struct nci_hcp_packet {
 #define NCI_HCI_ANY_SET_PARAMETER  0x01
 #define NCI_HCI_ANY_GET_PARAMETER  0x02
 #define NCI_HCI_ANY_CLOSE_PIPE     0x04
+#define NCI_HCI_ADM_CLEAR_ALL_PIPE 0x14
 
 #define NCI_HFP_NO_CHAINING        0x80
 
@@ -265,6 +266,20 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 }
 EXPORT_SYMBOL(nci_hci_send_cmd);
 
+int nci_hci_clear_all_pipes(struct nci_dev *ndev)
+{
+	int r;
+
+	r = nci_hci_send_cmd(ndev, NCI_HCI_ADMIN_GATE,
+			NCI_HCI_ADM_CLEAR_ALL_PIPE, NULL, 0, NULL);
+	if (r < 0)
+		return r;
+
+	nci_hci_reset_pipes(ndev->hci_dev);
+	return r;
+}
+EXPORT_SYMBOL(nci_hci_clear_all_pipes);
+
 static void nci_hci_event_received(struct nci_dev *ndev, u8 pipe,
 				   u8 event, struct sk_buff *skb)
 {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
