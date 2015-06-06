From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 01/17] nci: Handle proprietary response and notifications
Date: Sat,  6 Jun 2015 13:16:37 +0200
Message-ID: <1433589413-19680-2-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allow for drivers to explicitly define handlers for each
proprietary notifications and responses they expect to support.

Reviewed-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 include/net/nfc/nci_core.h | 12 +++++++++++
 net/nfc/nci/core.c         | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 net/nfc/nci/ntf.c          |  7 +++++++
 net/nfc/nci/rsp.c          |  7 +++++++
 4 files changed, 78 insertions(+)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index d4dcc71..8e948f0 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -66,6 +66,12 @@ enum nci_state {
 
 struct nci_dev;
 
+struct nci_prop_ops {
+	__u16 opcode;
+	int (*rsp)(struct nci_dev *dev, struct sk_buff *skb);
+	int (*ntf)(struct nci_dev *dev, struct sk_buff *skb);
+};
+
 struct nci_ops {
 	int   (*open)(struct nci_dev *ndev);
 	int   (*close)(struct nci_dev *ndev);
@@ -84,12 +90,16 @@ struct nci_ops {
 				    struct sk_buff *skb);
 	void  (*hci_cmd_received)(struct nci_dev *ndev, u8 pipe, u8 cmd,
 				  struct sk_buff *skb);
+
+	struct nci_prop_ops *prop_ops;
+	size_t n_prop_ops;
 };
 
 #define NCI_MAX_SUPPORTED_RF_INTERFACES		4
 #define NCI_MAX_DISCOVERED_TARGETS		10
 #define NCI_MAX_NUM_NFCEE   255
 #define NCI_MAX_CONN_ID		7
+#define NCI_MAX_PROPRIETARY_CMD 64
 
 struct nci_conn_info {
 	struct list_head list;
@@ -320,6 +330,8 @@ static inline void *nci_get_drvdata(struct nci_dev *ndev)
 
 void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb);
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb);
+int nci_prop_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb);
+int nci_prop_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb);
 void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload);
 int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb);
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 49ff321..31ac86b 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -28,6 +28,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": %s: " fmt, __func__
 
 #include <linux/module.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <linux/completion.h>
@@ -961,6 +962,14 @@ struct nci_dev *nci_allocate_device(struct nci_ops *ops,
 		return NULL;
 
 	ndev->ops = ops;
+
+	if (ops->n_prop_ops > NCI_MAX_PROPRIETARY_CMD) {
+		pr_err("Too many proprietary commands: %zd\n",
+		       ops->n_prop_ops);
+		ops->prop_ops = NULL;
+		ops->n_prop_ops = 0;
+	}
+
 	ndev->tx_headroom = tx_headroom;
 	ndev->tx_tailroom = tx_tailroom;
 	init_completion(&ndev->req_completion);
@@ -1165,6 +1174,49 @@ int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload)
 	return 0;
 }
 
+/* Proprietary commands API */
+static struct nci_prop_ops *prop_cmd_lookup(struct nci_dev *ndev,
+					    __u16 opcode)
+{
+	size_t i;
+	struct nci_prop_ops *prop_op;
+
+	if (!ndev->ops->prop_ops || !ndev->ops->n_prop_ops)
+		return NULL;
+
+	for (i = 0; i < ndev->ops->n_prop_ops; i++) {
+		prop_op = &ndev->ops->prop_ops[i];
+		if (prop_op->opcode == opcode)
+			return prop_op;
+	}
+
+	return NULL;
+}
+
+int nci_prop_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	__u16 rsp_opcode = nci_opcode(skb->data);
+	struct nci_prop_ops *prop_op;
+
+	prop_op = prop_cmd_lookup(ndev, rsp_opcode);
+	if (!prop_op || prop_op->rsp)
+		return -ENOTSUPP;
+
+	return prop_op->rsp(ndev, skb);
+}
+
+int nci_prop_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	__u16 ntf_opcode = nci_opcode(skb->data);
+	struct nci_prop_ops *prop_op;
+
+	prop_op = prop_cmd_lookup(ndev, ntf_opcode);
+	if (!prop_op || prop_op->ntf)
+		return -ENOTSUPP;
+
+	return prop_op->ntf(ndev, skb);
+}
+
 /* ---- NCI TX Data worker thread ---- */
 
 static void nci_tx_work(struct work_struct *work)
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 3218071..5ae8c29 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -758,6 +758,13 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	/* strip the nci control header */
 	skb_pull(skb, NCI_CTRL_HDR_SIZE);
 
+	if (nci_opcode_gid(ntf_opcode) == NCI_GID_PROPRIETARY)
+		if (nci_prop_ntf_packet(ndev, skb)) {
+			pr_err("unsupported ntf opcode 0x%x\n",
+			       ntf_opcode);
+			return;
+		}
+
 	switch (ntf_opcode) {
 	case NCI_OP_CORE_CONN_CREDITS_NTF:
 		nci_core_conn_credits_ntf_packet(ndev, skb);
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index 02486bc..d6e7991 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -296,6 +296,13 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	/* strip the nci control header */
 	skb_pull(skb, NCI_CTRL_HDR_SIZE);
 
+	if (nci_opcode_gid(rsp_opcode) == NCI_GID_PROPRIETARY)
+		if (nci_prop_rsp_packet(ndev, skb)) {
+			pr_err("unsupported rsp opcode 0x%x\n",
+			       rsp_opcode);
+			return;
+		}
+
 	switch (rsp_opcode) {
 	case NCI_OP_CORE_RESET_RSP:
 		nci_core_reset_rsp_packet(ndev, skb);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
