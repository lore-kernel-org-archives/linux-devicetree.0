From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 05/17] nfc: nci: Add nci_prop_cmd allowing to send proprietary nci cmd
Date: Sat,  6 Jun 2015 13:16:41 +0200
Message-ID: <1433589413-19680-6-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Handle allowing to send proprietary nci commands anywhere in the nci
state machine.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h |  2 ++
 net/nfc/nci/core.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 886854a..98f18a2 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -275,6 +275,8 @@ int nci_request(struct nci_dev *ndev,
 		void (*req)(struct nci_dev *ndev,
 			    unsigned long opt),
 		unsigned long opt, __u32 timeout);
+int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, __u8 *payload);
+
 int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val);
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 12213c8..19caec8 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -324,6 +324,32 @@ static void nci_rf_deactivate_req(struct nci_dev *ndev, unsigned long opt)
 		     sizeof(struct nci_rf_deactivate_cmd), &cmd);
 }
 
+struct nci_prop_cmd_param {
+	__u16 opcode;
+	size_t len;
+	__u8 *payload;
+};
+
+static void nci_prop_cmd_req(struct nci_dev *ndev, unsigned long opt)
+{
+	struct nci_prop_cmd_param *param = (struct nci_prop_cmd_param *)opt;
+
+	nci_send_cmd(ndev, param->opcode, param->len, param->payload);
+}
+
+int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, __u8 *payload)
+{
+	struct nci_prop_cmd_param param;
+
+	param.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY, oid);
+	param.len = len;
+	param.payload = payload;
+
+	return __nci_request(ndev, nci_prop_cmd_req, (unsigned long)&param,
+			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
+EXPORT_SYMBOL(nci_prop_cmd);
+
 static int nci_open_device(struct nci_dev *ndev)
 {
 	int rc = 0;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
