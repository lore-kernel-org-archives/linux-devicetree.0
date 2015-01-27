From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 03/14] NFC: nci: Add NCI NFCEE constant
Date: Tue, 27 Jan 2015 01:28:13 +0100
Message-ID: <1422318504-10039-4-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add NFCEE NCI constant for:
- NFCEE Interface/Protocols
- Destination type
- Destination-specific parameters type
- NFCEE Discovery Action

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index e7257a4..6d99e8f 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -62,6 +62,25 @@
 #define NCI_STATUS_NFCEE_PROTOCOL_ERROR				0xc2
 #define NCI_STATUS_NFCEE_TIMEOUT_ERROR				0xc3
 
+/* NFCEE Interface/Protocols */
+#define NCI_NFCEE_INTERFACE_APDU           0x00
+#define NCI_NFCEE_INTERFACE_HCI_ACCESS     0x01
+#define NCI_NFCEE_INTERFACE_TYPE3_CMD_SET  0x02
+#define NCI_NFCEE_INTERFACE_TRANSPARENT        0x03
+
+/* Destination type */
+#define NCI_DESTINATION_NFCC_LOOPBACK      0x01
+#define NCI_DESTINATION_REMOTE_NFC_ENDPOINT    0x02
+#define NCI_DESTINATION_NFCEE              0x03
+
+/* Destination-specific parameters type */
+#define NCI_DESTINATION_SPECIFIC_PARAM_RF_TYPE     0x00
+#define NCI_DESTINATION_SPECIFIC_PARAM_NFCEE_TYPE  0x01
+
+/* NFCEE Discovery Action */
+#define NCI_NFCEE_DISCOVERY_ACTION_DISABLE			0x00
+#define NCI_NFCEE_DISCOVERY_ACTION_ENABLE			0x01
+
 /* NCI RF Technology and Mode */
 #define NCI_NFC_A_PASSIVE_POLL_MODE				0x00
 #define NCI_NFC_B_PASSIVE_POLL_MODE				0x01
@@ -260,6 +279,11 @@ struct nci_rf_deactivate_cmd {
 	__u8	type;
 } __packed;
 
+#define NCI_OP_NFCEE_DISCOVER_CMD nci_opcode_pack(NCI_GID_NFCEE_MGMT, 0x00)
+struct nci_nfcee_discover_cmd {
+	__u8	discovery_action;
+} __packed;
+
 /* ----------------------- */
 /* ---- NCI Responses ---- */
 /* ----------------------- */
@@ -303,6 +327,12 @@ struct nci_core_set_config_rsp {
 
 #define NCI_OP_RF_DEACTIVATE_RSP	nci_opcode_pack(NCI_GID_RF_MGMT, 0x06)
 
+#define NCI_OP_NFCEE_DISCOVER_RSP nci_opcode_pack(NCI_GID_NFCEE_MGMT, 0x00)
+struct nci_nfcee_discover_rsp {
+	__u8	status;
+	__u8	num_nfcee;
+} __packed;
+
 /* --------------------------- */
 /* ---- NCI Notifications ---- */
 /* --------------------------- */
@@ -430,4 +460,22 @@ struct nci_rf_deactivate_ntf {
 	__u8	reason;
 } __packed;
 
+#define NCI_OP_NFCEE_DISCOVER_NTF nci_opcode_pack(NCI_GID_NFCEE_MGMT, 0x00)
+struct nci_nfcee_supported_protocol {
+	__u8	num_protocol;
+	__u8	supported_protocol[0];
+} __packed;
+
+struct nci_nfcee_information_tlv {
+	__u8	num_tlv;
+	__u8	information_tlv[0];
+} __packed;
+
+struct nci_nfcee_discover_ntf {
+	__u8	nfcee_id;
+	__u8	nfcee_status;
+	struct nci_nfcee_supported_protocol supported_protocols;
+	struct nci_nfcee_information_tlv	information_tlv;
+} __packed;
+
 #endif /* __NCI_H */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
