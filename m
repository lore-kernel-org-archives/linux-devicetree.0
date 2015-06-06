From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 11/17] nfc: st21nfcb: Add support for nci proprietary commands
Date: Sat,  6 Jun 2015 13:16:47 +0200
Message-ID: <1433589413-19680-12-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On st21nfcb, nci proprietary commands are available to run specific chip
operation (for example: power management)

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/st21nfcb.c | 21 +++++++++++++++++++++
 drivers/nfc/st21nfcb/st21nfcb.h |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index 12699fa..50ad6d0 100644
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
@@ -76,6 +78,23 @@ static __u32 st21nfcb_nci_get_rfprotocol(struct nci_dev *ndev,
 		NFC_PROTO_ISO15693_MASK : 0;
 }
 
+static int st21nfcb_nci_prop_rsp_packet(struct nci_dev *ndev,
+					struct sk_buff *skb)
+{
+	__u8 status = skb->data[0];
+
+	nci_req_complete(ndev, status);
+	return 0;
+}
+
+static struct nci_prop_ops st21nfcb_nci_prop_ops[] = {
+	{
+		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
+					  ST21NFCB_NCI_CORE_PROP),
+		.rsp = st21nfcb_nci_prop_rsp_packet,
+	},
+};
+
 static struct nci_ops st21nfcb_nci_ops = {
 	.open = st21nfcb_nci_open,
 	.close = st21nfcb_nci_close,
@@ -88,6 +107,8 @@ static struct nci_ops st21nfcb_nci_ops = {
 	.hci_load_session = st21nfcb_hci_load_session,
 	.hci_event_received = st21nfcb_hci_event_received,
 	.hci_cmd_received = st21nfcb_hci_cmd_received,
+	.prop_ops = st21nfcb_nci_prop_ops,
+	.n_prop_ops = ARRAY_SIZE(st21nfcb_nci_prop_ops),
 };
 
 int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
diff --git a/drivers/nfc/st21nfcb/st21nfcb.h b/drivers/nfc/st21nfcb/st21nfcb.h
index 5ef8a58..7c12d9d 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.h
+++ b/drivers/nfc/st21nfcb/st21nfcb.h
@@ -25,6 +25,12 @@
 /* Define private flags: */
 #define ST21NFCB_NCI_RUNNING			1
 
+#define ST21NFCB_NCI_CORE_PROP                0x01
+
+struct nci_mode_set_rsp {
+	u8 status;
+} __packed;
+
 struct st21nfcb_nci_info {
 	struct llt_ndlc *ndlc;
 	unsigned long flags;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
