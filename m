From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 11/14] nfc: st21nfcb: Add support for nci set mode proprietary command
Date: Fri,  1 May 2015 22:19:34 +0200
Message-ID: <1430511577-19678-12-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The set mode proprietary command allows to enable or disable NFC
putting the CLF into low power consumption state (down to
4uA).

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/st21nfcb.c | 103 +++++++++++++++++++++++++++++++++++++++-
 drivers/nfc/st21nfcb/st21nfcb.h |   1 +
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index 7a51bf0..defc056 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -20,6 +20,8 @@
 #include <linux/nfc.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
 
 #include "st21nfcb.h"
 #include "st21nfcb_se.h"
@@ -27,6 +29,82 @@
 #define DRIVER_DESC "NCI NFC driver for ST21NFCB"
 
 #define ST21NFCB_NCI1_X_PROPRIETARY_ISO15693 0x83
+#define ST21NFCB_SET_NFC_MODE		0x02
+
+#define NCI_OP_PROP_CMD nci_opcode_pack(NCI_GID_PROPRIETARY, 0x01)
+#define NCI_OP_PROP_RSP nci_opcode_pack(NCI_GID_PROPRIETARY, 0x01)
+
+struct nci_mode_set_cmd {
+	u8 cmd_type;
+	u8 mode;
+} __packed;
+
+struct nci_mode_set_rsp {
+	u8 status;
+} __packed;
+
+static int st21nfcb_nci_prop_request(struct nci_dev *ndev,
+				     void (*req)(struct nci_dev *ndev,
+						 unsigned long opt),
+				     unsigned long opt, __u32 timeout)
+{
+	int r = 0;
+	long completion_r;
+
+	ndev->req_status = NCI_REQ_PEND;
+
+	reinit_completion(&ndev->req_completion);
+	req(ndev, opt);
+	completion_r =
+		wait_for_completion_interruptible_timeout(&ndev->req_completion,
+							  timeout);
+
+	pr_debug("wait_for_completion return %ld\n", completion_r);
+
+	if (completion_r > 0) {
+		switch (ndev->req_status) {
+		case NCI_REQ_DONE:
+			r = nci_to_errno(ndev->req_result);
+			break;
+
+		case NCI_REQ_CANCELED:
+			r = -ndev->req_result;
+			break;
+
+		default:
+			r = -ETIMEDOUT;
+			break;
+		}
+	} else {
+		pr_err("wait_for_completion_interruptible_timeout failed %ld\n",
+		       completion_r);
+
+		r = ((completion_r == 0) ? (-ETIMEDOUT) : (completion_r));
+	}
+
+	ndev->req_status = ndev->req_result = 0;
+	return r;
+}
+
+static void st21nfcb_nci_set_mode_req(struct nci_dev *ndev, unsigned long opt)
+{
+	struct nci_mode_set_cmd cmd;
+	__u8 mode = opt;
+
+	cmd.cmd_type  = ST21NFCB_SET_NFC_MODE;
+	cmd.mode = mode;
+
+	nci_send_cmd(ndev, NCI_OP_PROP_CMD,
+		     sizeof(struct nci_mode_set_cmd), &cmd);
+}
+
+int st21nfcb_nci_set_mode(struct nci_dev *ndev, u8 mode)
+{
+	atomic_set(&ndev->cmd_cnt, 1);
+	set_bit(NCI_INIT, &ndev->flags);
+	return st21nfcb_nci_prop_request(ndev, st21nfcb_nci_set_mode_req,
+				mode, msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
 
 static int st21nfcb_nci_open(struct nci_dev *ndev)
 {
@@ -47,11 +125,13 @@ static int st21nfcb_nci_close(struct nci_dev *ndev)
 {
 	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
 
-	if (!test_and_clear_bit(ST21NFCB_NCI_RUNNING, &info->flags))
+	if (!test_bit(ST21NFCB_NCI_RUNNING, &info->flags))
 		return 0;
 
 	ndlc_close(info->ndlc);
 
+	clear_bit(ST21NFCB_NCI_RUNNING, &info->flags);
+
 	return 0;
 }
 
@@ -74,6 +154,26 @@ static __u32 st21nfcb_nci_get_rfprotocol(struct nci_dev *ndev,
 		NFC_PROTO_ISO15693_MASK : 0;
 }
 
+static void nci_core_prop_rsp_packet(struct nci_dev *ndev,
+				     struct sk_buff *skb)
+{
+	__u8 status = skb->data[0];
+
+	nci_req_complete(ndev, status);
+}
+
+static int st21nfcb_nci_rsp_packet(struct nci_dev *ndev, __u16 rsp_opcode,
+				   struct sk_buff *skb)
+{
+	switch (rsp_opcode) {
+	case NCI_OP_PROP_RSP:
+		nci_core_prop_rsp_packet(ndev, skb);
+		return 0;
+	default:
+		return -EPROTO;
+	}
+}
+
 static struct nci_ops st21nfcb_nci_ops = {
 	.open = st21nfcb_nci_open,
 	.close = st21nfcb_nci_close,
@@ -86,6 +186,7 @@ static struct nci_ops st21nfcb_nci_ops = {
 	.hci_load_session = st21nfcb_hci_load_session,
 	.hci_event_received = st21nfcb_hci_event_received,
 	.hci_cmd_received = st21nfcb_hci_cmd_received,
+	.prop_rsp_packet = st21nfcb_nci_rsp_packet,
 };
 
 int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
diff --git a/drivers/nfc/st21nfcb/st21nfcb.h b/drivers/nfc/st21nfcb/st21nfcb.h
index 5ef8a58..e3cfc0c 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.h
+++ b/drivers/nfc/st21nfcb/st21nfcb.h
@@ -34,5 +34,6 @@ struct st21nfcb_nci_info {
 void st21nfcb_nci_remove(struct nci_dev *ndev);
 int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
 		int phy_tailroom);
+int st21nfcb_nci_set_mode(struct nci_dev *ndev, u8 mode);
 
 #endif /* __LOCAL_ST21NFCB_H_ */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
