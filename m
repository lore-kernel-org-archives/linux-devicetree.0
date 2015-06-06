From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 02/17] nfc: nci: Add few fixes to handle proprietary response and notification
Date: Sat,  6 Jun 2015 13:16:38 +0200
Message-ID: <1433589413-19680-3-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixing:
- some few logic errors in conditions
- memory leak

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h |  6 ++++--
 net/nfc/nci/core.c         | 12 ++++++------
 net/nfc/nci/ntf.c          |  9 ++++++---
 net/nfc/nci/rsp.c          |  9 ++++++---
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 8e948f0..c49688c 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -330,8 +330,10 @@ static inline void *nci_get_drvdata(struct nci_dev *ndev)
 
 void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb);
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb);
-int nci_prop_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb);
-int nci_prop_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb);
+int nci_prop_rsp_packet(struct nci_dev *ndev, __u16 opcode,
+			struct sk_buff *skb);
+int nci_prop_ntf_packet(struct nci_dev *ndev, __u16 opcode,
+			struct sk_buff *skb);
 void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload);
 int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb);
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 31ac86b..56d57c9 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1193,25 +1193,25 @@ static struct nci_prop_ops *prop_cmd_lookup(struct nci_dev *ndev,
 	return NULL;
 }
 
-int nci_prop_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
+int nci_prop_rsp_packet(struct nci_dev *ndev, __u16 rsp_opcode,
+			struct sk_buff *skb)
 {
-	__u16 rsp_opcode = nci_opcode(skb->data);
 	struct nci_prop_ops *prop_op;
 
 	prop_op = prop_cmd_lookup(ndev, rsp_opcode);
-	if (!prop_op || prop_op->rsp)
+	if (!prop_op || !prop_op->rsp)
 		return -ENOTSUPP;
 
 	return prop_op->rsp(ndev, skb);
 }
 
-int nci_prop_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
+int nci_prop_ntf_packet(struct nci_dev *ndev, __u16 ntf_opcode,
+			struct sk_buff *skb)
 {
-	__u16 ntf_opcode = nci_opcode(skb->data);
 	struct nci_prop_ops *prop_op;
 
 	prop_op = prop_cmd_lookup(ndev, ntf_opcode);
-	if (!prop_op || prop_op->ntf)
+	if (!prop_op || !prop_op->ntf)
 		return -ENOTSUPP;
 
 	return prop_op->ntf(ndev, skb);
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 5ae8c29..5d1c2e3 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -758,13 +758,15 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	/* strip the nci control header */
 	skb_pull(skb, NCI_CTRL_HDR_SIZE);
 
-	if (nci_opcode_gid(ntf_opcode) == NCI_GID_PROPRIETARY)
-		if (nci_prop_ntf_packet(ndev, skb)) {
+	if (nci_opcode_gid(ntf_opcode) == NCI_GID_PROPRIETARY) {
+		if (nci_prop_ntf_packet(ndev, ntf_opcode, skb)) {
 			pr_err("unsupported ntf opcode 0x%x\n",
 			       ntf_opcode);
-			return;
 		}
 
+		goto end;
+	}
+
 	switch (ntf_opcode) {
 	case NCI_OP_CORE_CONN_CREDITS_NTF:
 		nci_core_conn_credits_ntf_packet(ndev, skb);
@@ -803,5 +805,6 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		break;
 	}
 
+end:
 	kfree_skb(skb);
 }
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index d6e7991..408bd8f 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -296,13 +296,15 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	/* strip the nci control header */
 	skb_pull(skb, NCI_CTRL_HDR_SIZE);
 
-	if (nci_opcode_gid(rsp_opcode) == NCI_GID_PROPRIETARY)
-		if (nci_prop_rsp_packet(ndev, skb)) {
+	if (nci_opcode_gid(rsp_opcode) == NCI_GID_PROPRIETARY) {
+		if (nci_prop_rsp_packet(ndev, rsp_opcode, skb) == -ENOTSUPP) {
 			pr_err("unsupported rsp opcode 0x%x\n",
 			       rsp_opcode);
-			return;
 		}
 
+		goto end;
+	}
+
 	switch (rsp_opcode) {
 	case NCI_OP_CORE_RESET_RSP:
 		nci_core_reset_rsp_packet(ndev, skb);
@@ -353,6 +355,7 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		break;
 	}
 
+end:
 	kfree_skb(skb);
 
 	/* trigger the next cmd */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
