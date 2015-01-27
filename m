From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 05/14] NFC: nci: Add nci_nfcee_mode_set handler command/response
Date: Tue, 27 Jan 2015 01:28:15 +0100
Message-ID: <1422318504-10039-6-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add nci_nfcee_mode_set handler according to NFC Forum NCI specification.
It is necessary for example for secure element handling.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci.h      |  9 +++++++++
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         | 21 +++++++++++++++++++++
 net/nfc/nci/rsp.c          | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index 6d99e8f..230f227 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -284,6 +284,14 @@ struct nci_nfcee_discover_cmd {
 	__u8	discovery_action;
 } __packed;
 
+#define NCI_OP_NFCEE_MODE_SET_CMD nci_opcode_pack(NCI_GID_NFCEE_MGMT, 0x01)
+#define NCI_NFCEE_DISABLE	0x00
+#define NCI_NFCEE_ENABLE	0x01
+struct nci_nfcee_mode_set_cmd {
+	__u8	nfcee_id;
+	__u8	nfcee_mode;
+} __packed;
+
 /* ----------------------- */
 /* ---- NCI Responses ---- */
 /* ----------------------- */
@@ -333,6 +341,7 @@ struct nci_nfcee_discover_rsp {
 	__u8	num_nfcee;
 } __packed;
 
+#define NCI_OP_NFCEE_MODE_SET_RSP nci_opcode_pack(NCI_GID_NFCEE_MGMT, 0x01)
 /* --------------------------- */
 /* ---- NCI Notifications ---- */
 /* --------------------------- */
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 3df7cd6..46bdf86 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -184,6 +184,7 @@ int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val);
 
 int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
+int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode);
 
 static inline struct sk_buff *nci_skb_alloc(struct nci_dev *ndev,
 					    unsigned int len,
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index bd968d5..0de7d90 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -473,6 +473,27 @@ int nci_nfcee_discover(struct nci_dev *ndev, u8 action)
 }
 EXPORT_SYMBOL(nci_nfcee_discover);
 
+static void nci_nfcee_mode_set_req(struct nci_dev *ndev, unsigned long opt)
+{
+	struct nci_nfcee_mode_set_cmd *cmd =
+					(struct nci_nfcee_mode_set_cmd *)opt;
+
+	nci_send_cmd(ndev, NCI_OP_NFCEE_MODE_SET_CMD,
+		     sizeof(struct nci_nfcee_mode_set_cmd), cmd);
+}
+
+int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode)
+{
+	struct nci_nfcee_mode_set_cmd cmd;
+
+	cmd.nfcee_id = nfcee_id;
+	cmd.nfcee_mode = nfcee_mode;
+
+	return nci_request(ndev, nci_nfcee_mode_set_req, (unsigned long)&cmd,
+			   msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
+EXPORT_SYMBOL(nci_nfcee_mode_set);
+
 static int nci_set_local_general_bytes(struct nfc_dev *nfc_dev)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index a93133b..cb358cd 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -209,6 +209,15 @@ static void nci_nfcee_discover_rsp_packet(struct nci_dev *ndev,
 		nci_req_complete(ndev, discover_rsp->status);
 }
 
+static void nci_nfcee_mode_set_rsp_packet(struct nci_dev *ndev,
+					  struct sk_buff *skb)
+{
+	__u8 status = skb->data[0];
+
+	pr_debug("status 0x%x\n", status);
+	nci_req_complete(ndev, status);
+}
+
 void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 rsp_opcode = nci_opcode(skb->data);
@@ -258,6 +267,10 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		nci_nfcee_discover_rsp_packet(ndev, skb);
 		break;
 
+	case NCI_OP_NFCEE_MODE_SET_RSP:
+		nci_nfcee_mode_set_rsp_packet(ndev, skb);
+		break;
+
 	default:
 		pr_err("unknown rsp opcode 0x%x\n", rsp_opcode);
 		break;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
