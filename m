From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 04/14] NFC: nci: Add nci_nfcee_discover handler command/response/notification
Date: Tue, 27 Jan 2015 01:28:14 +0100
Message-ID: <1422318504-10039-5-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add nci_nfcee_discover handler according to NFC Forum NCI specification.
It is necessary for example for secure element handling.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h |  4 ++++
 net/nfc/nci/core.c         | 17 +++++++++++++++++
 net/nfc/nci/ntf.c          | 29 +++++++++++++++++++++++++++++
 net/nfc/nci/rsp.c          | 21 +++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 395f804..3df7cd6 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -99,6 +99,8 @@ struct nci_conn_info {
 	struct sk_buff *rx_skb;
 };
 
+#define NCI_INVALID_CONN_ID 0x80
+
 /* NCI Core structures */
 struct nci_dev {
 	struct nfc_dev		*nfc_dev;
@@ -181,6 +183,8 @@ void nci_unregister_device(struct nci_dev *ndev);
 int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val);
 
+int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
+
 static inline struct sk_buff *nci_skb_alloc(struct nci_dev *ndev,
 					    unsigned int len,
 					    gfp_t how)
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index b3ec63e..bd968d5 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -456,6 +456,23 @@ int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val)
 }
 EXPORT_SYMBOL(nci_set_config);
 
+static void nci_nfcee_discover_req(struct nci_dev *ndev, unsigned long opt)
+{
+	struct nci_nfcee_discover_cmd cmd;
+	__u8 action = opt;
+
+	cmd.discovery_action = action;
+
+	nci_send_cmd(ndev, NCI_OP_NFCEE_DISCOVER_CMD, 1, &cmd);
+}
+
+int nci_nfcee_discover(struct nci_dev *ndev, u8 action)
+{
+	return nci_request(ndev, nci_nfcee_discover_req, action,
+				msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
+EXPORT_SYMBOL(nci_nfcee_discover);
+
 static int nci_set_local_general_bytes(struct nfc_dev *nfc_dev)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 8c73462..5af0564 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -710,6 +710,32 @@ static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
 	nci_req_complete(ndev, NCI_STATUS_OK);
 }
 
+static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
+					  struct sk_buff *skb)
+{
+	u8 status = NCI_STATUS_OK;
+	struct nci_conn_info    *conn_info;
+	struct nci_nfcee_discover_ntf   *nfcee_ntf =
+				(struct nci_nfcee_discover_ntf *)skb->data;
+
+	pr_debug("\n");
+
+	conn_info = devm_kzalloc(&ndev->nfc_dev->dev,
+				 sizeof(struct nci_conn_info), GFP_KERNEL);
+	if (!conn_info) {
+		status = NCI_STATUS_REJECTED;
+		goto exit;
+	}
+
+	conn_info->id = nfcee_ntf->nfcee_id;
+	conn_info->conn_id = NCI_INVALID_CONN_ID;
+
+	ndev->conn_info_by_id[conn_info->id] = conn_info;
+
+exit:
+	nci_req_complete(ndev, status);
+}
+
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 ntf_opcode = nci_opcode(skb->data);
@@ -748,6 +774,9 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		nci_rf_deactivate_ntf_packet(ndev, skb);
 		break;
 
+	case NCI_OP_NFCEE_DISCOVER_NTF:
+		nci_nfcee_discover_ntf_packet(ndev, skb);
+		break;
 	default:
 		pr_err("unknown ntf opcode 0x%x\n", ntf_opcode);
 		break;
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index ff8721e..a93133b 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -192,6 +192,23 @@ static void nci_rf_deactivate_rsp_packet(struct nci_dev *ndev,
 	}
 }
 
+static void nci_nfcee_discover_rsp_packet(struct nci_dev *ndev,
+					  struct sk_buff *skb)
+{
+	struct nci_nfcee_discover_rsp *discover_rsp;
+
+	if (skb->len != 2) {
+		nci_req_complete(ndev, NCI_STATUS_NFCEE_PROTOCOL_ERROR);
+		return;
+	}
+
+	discover_rsp = (struct nci_nfcee_discover_rsp *)skb->data;
+
+	if (discover_rsp->status != NCI_STATUS_OK ||
+	    discover_rsp->num_nfcee == 0)
+		nci_req_complete(ndev, discover_rsp->status);
+}
+
 void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 rsp_opcode = nci_opcode(skb->data);
@@ -237,6 +254,10 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		nci_rf_deactivate_rsp_packet(ndev, skb);
 		break;
 
+	case NCI_OP_NFCEE_DISCOVER_RSP:
+		nci_nfcee_discover_rsp_packet(ndev, skb);
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
