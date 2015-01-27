From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 11/14] NFC: nci: Add support RF_NFCEE_ACTION_NTF
Date: Tue, 27 Jan 2015 01:28:21 +0100
Message-ID: <1422318504-10039-12-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

RF NFCEE Action is the mechanism used to indicate that an action involving one of the NFCEEs
in the device has occurred that may be of interest to the DH.

This may happen for example when doing an RF Transaction with a payment reader.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci.h |  8 ++++++++
 net/nfc/nci/ntf.c     | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index deac78b..6c1beb2 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -499,6 +499,14 @@ struct nci_rf_deactivate_ntf {
 	__u8	reason;
 } __packed;
 
+#define NCI_OP_RF_NFCEE_ACTION_NTF	nci_opcode_pack(NCI_GID_RF_MGMT, 0x09)
+struct nci_rf_nfcee_action_ntf {
+	__u8 nfcee_id;
+	__u8 trigger;
+	__u8 supported_data_length;
+	__u8 supported_data[0];
+} __packed;
+
 #define NCI_OP_NFCEE_DISCOVER_NTF nci_opcode_pack(NCI_GID_NFCEE_MGMT, 0x00)
 struct nci_nfcee_supported_protocol {
 	__u8	num_protocol;
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 5af0564..83ba1f8 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -736,6 +736,12 @@ exit:
 	nci_req_complete(ndev, status);
 }
 
+static void nci_nfcee_action_ntf_packet(struct nci_dev *ndev,
+					struct sk_buff *skb)
+{
+	pr_debug("\n");
+}
+
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 ntf_opcode = nci_opcode(skb->data);
@@ -777,6 +783,11 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	case NCI_OP_NFCEE_DISCOVER_NTF:
 		nci_nfcee_discover_ntf_packet(ndev, skb);
 		break;
+
+	case NCI_OP_RF_NFCEE_ACTION_NTF:
+		nci_nfcee_action_ntf_packet(ndev, skb);
+		break;
+
 	default:
 		pr_err("unknown ntf opcode 0x%x\n", ntf_opcode);
 		break;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
