From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 06/14] NFC: nci: Add nci_core_conn_create handler command/response
Date: Tue, 27 Jan 2015 01:28:16 +0100
Message-ID: <1422318504-10039-7-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add nci_core_conn_create handler according to NFC Forum NCI specification.
It is necessary for example for secure element handling.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci.h      | 25 +++++++++++++++++++++++++
 include/net/nfc/nci_core.h |  2 ++
 net/nfc/nci/core.c         | 24 ++++++++++++++++++++++++
 net/nfc/nci/rsp.c          | 31 +++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index 230f227..b8ff50c 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -243,6 +243,23 @@ struct nci_core_set_config_cmd {
 	struct	set_config_param param; /* support 1 param per cmd is enough */
 } __packed;
 
+#define NCI_OP_CORE_CONN_CREATE_CMD	nci_opcode_pack(NCI_GID_CORE, 0x04)
+struct dest_spec_params {
+	__u8	id;
+	__u8	protocol;
+} __packed;
+
+struct core_conn_create_dest_spec_params {
+	__u8	type;
+	__u8	length;
+	struct dest_spec_params value;
+} __packed;
+
+struct nci_core_conn_create_cmd {
+	__u8	destination_type;
+	__u8	number_destination_params;
+	struct core_conn_create_dest_spec_params params;
+} __packed;
 #define NCI_OP_RF_DISCOVER_MAP_CMD	nci_opcode_pack(NCI_GID_RF_MGMT, 0x00)
 struct disc_map_config {
 	__u8	rf_protocol;
@@ -327,6 +344,14 @@ struct nci_core_set_config_rsp {
 	__u8	params_id[0];	/* variable size array */
 } __packed;
 
+#define NCI_OP_CORE_CONN_CREATE_RSP	nci_opcode_pack(NCI_GID_CORE, 0x04)
+struct nci_core_conn_create_rsp {
+	__u8	status;
+	__u8	max_ctrl_pkt_payload_len;
+	__u8    credits;
+	__u8	conn_id;
+} __packed;
+
 #define NCI_OP_RF_DISCOVER_MAP_RSP	nci_opcode_pack(NCI_GID_RF_MGMT, 0x00)
 
 #define NCI_OP_RF_DISCOVER_RSP		nci_opcode_pack(NCI_GID_RF_MGMT, 0x03)
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 46bdf86..21da170 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -185,6 +185,8 @@ int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val);
 
 int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
 int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode);
+int nci_core_conn_create(struct nci_dev *ndev,
+			 struct core_conn_create_dest_spec_params *params);
 
 static inline struct sk_buff *nci_skb_alloc(struct nci_dev *ndev,
 					    unsigned int len,
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 0de7d90..cbe6ea3 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -494,6 +494,30 @@ int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode)
 }
 EXPORT_SYMBOL(nci_nfcee_mode_set);
 
+static void nci_core_conn_create_req(struct nci_dev *ndev, unsigned long opt)
+{
+	struct nci_core_conn_create_cmd cmd;
+	struct core_conn_create_dest_spec_params *params =
+				(struct core_conn_create_dest_spec_params *)opt;
+
+	cmd.destination_type = NCI_DESTINATION_NFCEE;
+	cmd.number_destination_params = 1;
+	memcpy(&cmd.params.type, params,
+	       sizeof(struct core_conn_create_dest_spec_params));
+	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CREATE_CMD,
+		     sizeof(struct nci_core_conn_create_cmd), &cmd);
+}
+
+int nci_core_conn_create(struct nci_dev *ndev,
+			 struct core_conn_create_dest_spec_params *params)
+{
+	ndev->cur_id = params->value.id;
+	return nci_request(ndev, nci_core_conn_create_req,
+			(unsigned long)params,
+			msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
+EXPORT_SYMBOL(nci_core_conn_create);
+
 static int nci_set_local_general_bytes(struct nfc_dev *nfc_dev)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index cb358cd..5b3c66e 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -218,6 +218,33 @@ static void nci_nfcee_mode_set_rsp_packet(struct nci_dev *ndev,
 	nci_req_complete(ndev, status);
 }
 
+static void nci_core_conn_create_rsp_packet(struct nci_dev *ndev,
+					    struct sk_buff *skb)
+{
+	__u8 status = skb->data[0];
+	struct nci_conn_info *conn_info;
+	struct nci_core_conn_create_rsp *rsp;
+
+	pr_debug("status 0x%x\n", status);
+
+	if (status == NCI_STATUS_OK) {
+		rsp = (struct nci_core_conn_create_rsp *)skb->data;
+		conn_info = ndev->conn_info_by_id[ndev->cur_id];
+		if (!conn_info) {
+			status = NCI_STATUS_REJECTED;
+			goto exit;
+		}
+
+		conn_info->conn_id = rsp->conn_id;
+		ndev->conn_info_by_conn_id[conn_info->conn_id] = conn_info;
+		conn_info->max_pkt_payload_len = rsp->max_ctrl_pkt_payload_len;
+		atomic_set(&conn_info->credits_cnt, rsp->credits);
+	}
+
+exit:
+	nci_req_complete(ndev, status);
+}
+
 void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 rsp_opcode = nci_opcode(skb->data);
@@ -247,6 +274,10 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		nci_core_set_config_rsp_packet(ndev, skb);
 		break;
 
+	case NCI_OP_CORE_CONN_CREATE_RSP:
+		nci_core_conn_create_rsp_packet(ndev, skb);
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
