From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 10/35] nfc: nci: add capability to create pipe on specific gate in nci_hci_connect_gate
Date: Sun, 25 Oct 2015 22:54:25 +0100
Message-ID: <1445810090-18403-11-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some gates might be interesting to have their pipes created.
Add in nci_hci_connect_gate a call to nci_hci_create_pipe for every gate
different than NCI_HCI_LINK_MGMT_GATE or NCI_HCI_ADMIN_GATE.

In case of an error when opening a pipe, like in hci layer, delete the pipe
if it was created.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/hci.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index a937bc6..1d6aa5d 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -79,6 +79,8 @@ struct nci_hcp_packet {
 #define NCI_EVT_HOT_PLUG           0x03
 
 #define NCI_HCI_ADMIN_PARAM_SESSION_IDENTITY       0x01
+#define NCI_HCI_ADM_CREATE_PIPE			0x10
+#define NCI_HCI_ADM_DELETE_PIPE			0x11
 
 /* HCP headers */
 #define NCI_HCI_HCP_PACKET_HEADER_LEN      1
@@ -520,6 +522,42 @@ int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 }
 EXPORT_SYMBOL(nci_hci_open_pipe);
 
+static u8 nci_hci_create_pipe(struct nci_dev *ndev, u8 dest_host,
+			      u8 dest_gate, int *result)
+{
+	u8 pipe;
+	struct sk_buff *skb;
+	struct nci_hci_create_pipe_params params;
+	struct nci_hci_create_pipe_resp *resp;
+
+	pr_debug("gate=%d\n", dest_gate);
+
+	params.src_gate = NCI_HCI_ADMIN_GATE;
+	params.dest_host = dest_host;
+	params.dest_gate = dest_gate;
+
+	*result = nci_hci_send_cmd(ndev, NCI_HCI_ADMIN_GATE, NCI_HCI_ADM_CREATE_PIPE,
+				   (u8 *)&params, sizeof(params), &skb);
+	if (*result < 0)
+		return NCI_HCI_INVALID_PIPE;
+
+	resp = (struct nci_hci_create_pipe_resp *)skb->data;
+	pipe = resp->pipe;
+	kfree_skb(skb);
+
+	pr_debug("pipe created=%d\n", pipe);
+
+	return pipe;
+}
+
+static int nci_hci_delete_pipe(struct nci_dev *ndev, u8 pipe)
+{
+	pr_debug("\n");
+
+	return nci_hci_send_cmd(ndev, NCI_HCI_ADMIN_GATE,
+				NCI_HCI_ADM_DELETE_PIPE, &pipe, 1, NULL);
+}
+
 int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      const u8 *param, size_t param_len)
 {
@@ -611,6 +649,7 @@ EXPORT_SYMBOL(nci_hci_get_param);
 int nci_hci_connect_gate(struct nci_dev *ndev,
 			 u8 dest_host, u8 dest_gate, u8 pipe)
 {
+	bool pipe_created = false;
 	int r;
 
 	if (pipe == NCI_HCI_DO_NOT_OPEN_PIPE)
@@ -629,12 +668,26 @@ int nci_hci_connect_gate(struct nci_dev *ndev,
 	case NCI_HCI_ADMIN_GATE:
 		pipe = NCI_HCI_ADMIN_PIPE;
 	break;
+	default:
+		pipe = nci_hci_create_pipe(ndev, dest_host, dest_gate, &r);
+		if (pipe < 0)
+			return r;
+		pipe_created = true;
+		break;
 	}
 
 open_pipe:
 	r = nci_hci_open_pipe(ndev, pipe);
-	if (r < 0)
+	if (r < 0) {
+		if (pipe_created) {
+			if (nci_hci_delete_pipe(ndev, pipe) < 0) {
+				/* TODO: Cannot clean by deleting pipe...
+				 * -> inconsistent state
+				 */
+			}
+		}
 		return r;
+	}
 
 	ndev->hci_dev->pipes[pipe].gate = dest_gate;
 	ndev->hci_dev->pipes[pipe].host = dest_host;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
