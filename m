From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 07/14] NFC: nci: Add nci_core_conn_close handler command/response
Date: Tue, 27 Jan 2015 01:28:17 +0100
Message-ID: <1422318504-10039-8-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add nci_core_conn_close handler according to NFC Forum NCI specification.
It is necessary for example for secure element handling.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci.h      |  5 +++++
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         | 14 ++++++++++++++
 net/nfc/nci/rsp.c          | 13 +++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index b8ff50c..deac78b 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -260,6 +260,9 @@ struct nci_core_conn_create_cmd {
 	__u8	number_destination_params;
 	struct core_conn_create_dest_spec_params params;
 } __packed;
+
+#define NCI_OP_CORE_CONN_CLOSE_CMD	nci_opcode_pack(NCI_GID_CORE, 0x05)
+
 #define NCI_OP_RF_DISCOVER_MAP_CMD	nci_opcode_pack(NCI_GID_RF_MGMT, 0x00)
 struct disc_map_config {
 	__u8	rf_protocol;
@@ -352,6 +355,8 @@ struct nci_core_conn_create_rsp {
 	__u8	conn_id;
 } __packed;
 
+#define NCI_OP_CORE_CONN_CLOSE_RSP	nci_opcode_pack(NCI_GID_CORE, 0x05)
+
 #define NCI_OP_RF_DISCOVER_MAP_RSP	nci_opcode_pack(NCI_GID_RF_MGMT, 0x00)
 
 #define NCI_OP_RF_DISCOVER_RSP		nci_opcode_pack(NCI_GID_RF_MGMT, 0x03)
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 21da170..4d1a12e 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -187,6 +187,7 @@ int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
 int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode);
 int nci_core_conn_create(struct nci_dev *ndev,
 			 struct core_conn_create_dest_spec_params *params);
+int nci_core_conn_close(struct nci_dev *ndev, u8 conn_id);
 
 static inline struct sk_buff *nci_skb_alloc(struct nci_dev *ndev,
 					    unsigned int len,
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index cbe6ea3..ed42a71 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -518,6 +518,20 @@ int nci_core_conn_create(struct nci_dev *ndev,
 }
 EXPORT_SYMBOL(nci_core_conn_create);
 
+static void nci_core_conn_close_req(struct nci_dev *ndev, unsigned long opt)
+{
+	__u8 conn_id = opt;
+
+	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CLOSE_CMD, 1, &conn_id);
+}
+
+int nci_core_conn_close(struct nci_dev *ndev, u8 conn_id)
+{
+	return nci_request(ndev, nci_core_conn_close_req, conn_id,
+				msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
+EXPORT_SYMBOL(nci_core_conn_close);
+
 static int nci_set_local_general_bytes(struct nfc_dev *nfc_dev)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index 5b3c66e..662f021 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -245,6 +245,15 @@ exit:
 	nci_req_complete(ndev, status);
 }
 
+static void nci_core_conn_close_rsp_packet(struct nci_dev *ndev,
+					   struct sk_buff *skb)
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
@@ -278,6 +287,10 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		nci_core_conn_create_rsp_packet(ndev, skb);
 		break;
 
+	case NCI_OP_CORE_CONN_CLOSE_RSP:
+		nci_core_conn_close_rsp_packet(ndev, skb);
+		break;
+
 	case NCI_OP_RF_DISCOVER_MAP_RSP:
 		nci_rf_disc_map_rsp_packet(ndev, skb);
 		break;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
