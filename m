From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/11] NFC: nci: Add support for proprietary RF Protocols
Date: Fri, 12 Sep 2014 21:49:37 +0200
Message-ID: <1410551381-7565-8-git-send-email-christophe-h.ricard@st.com>
References: <1410551381-7565-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410551381-7565-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In NFC Forum NCI specification, some RF Protocol values are
reserved for proprietary use (from 0x80 to 0xfe).
Some CLF vendor may need to use one value within this range
for specific technology.
Furthermore, some CLF may not becompliant with NFC Froum NCI
specification 2.0 and therefore will not support RF Protocol
value 0x06 for PROTOCOL_T5T as mention in a draft specification
and in a recent push.

Adding get_rf_protocol handle to the nci_ops structure will
help to set the correct technology to target.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/st21nfcb.c | 10 ++++++++++
 include/net/nfc/nci_core.h      |  9 +++++----
 net/nfc/nci/ntf.c               |  9 ++++++++-
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index 90d3715..e72dae8 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -25,6 +25,8 @@
 
 #define DRIVER_DESC "NCI NFC driver for ST21NFCB"
 
+#define ST21NFCB_NCI1_X_PROPRIETARY_ISO15693 0x83
+
 static int st21nfcb_nci_open(struct nci_dev *ndev)
 {
 	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
@@ -64,10 +66,18 @@ static int st21nfcb_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 	return ndlc_send(info->ndlc, skb);
 }
 
+static __u32 st21nfcb_nci_get_rfprotocol(struct nci_dev *ndev,
+					 __u8 rf_protocol)
+{
+	return rf_protocol == ST21NFCB_NCI1_X_PROPRIETARY_ISO15693 ?
+		NFC_PROTO_ISO15693_MASK : 0;
+}
+
 static struct nci_ops st21nfcb_nci_ops = {
 	.open = st21nfcb_nci_open,
 	.close = st21nfcb_nci_close,
 	.send = st21nfcb_nci_send,
+	.get_rfprotocol = st21nfcb_nci_get_rfprotocol,
 };
 
 int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 1f9a0f5..75d10e6 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -64,10 +64,11 @@ enum nci_state {
 struct nci_dev;
 
 struct nci_ops {
-	int (*open)(struct nci_dev *ndev);
-	int (*close)(struct nci_dev *ndev);
-	int (*send)(struct nci_dev *ndev, struct sk_buff *skb);
-	int (*setup)(struct nci_dev *ndev);
+	int   (*open)(struct nci_dev *ndev);
+	int   (*close)(struct nci_dev *ndev);
+	int   (*send)(struct nci_dev *ndev, struct sk_buff *skb);
+	int   (*setup)(struct nci_dev *ndev);
+	__u32 (*get_rfprotocol)(struct nci_dev *ndev, __u8 rf_protocol);
 };
 
 #define NCI_MAX_SUPPORTED_RF_INTERFACES		4
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 25e44ce..205b35f6 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -167,6 +167,13 @@ static __u8 *nci_extract_rf_params_nfcv_passive_poll(struct nci_dev *ndev,
 	return data;
 }
 
+__u32 nci_get_prop_rf_protocol(struct nci_dev *ndev, __u8 rf_protocol)
+{
+	if (ndev->ops->get_rfprotocol)
+		return ndev->ops->get_rfprotocol(ndev, rf_protocol);
+	return 0;
+}
+
 static int nci_add_new_protocol(struct nci_dev *ndev,
 				struct nfc_target *target,
 				__u8 rf_protocol,
@@ -195,7 +202,7 @@ static int nci_add_new_protocol(struct nci_dev *ndev,
 	else if (rf_protocol == NCI_RF_PROTOCOL_T5T)
 		protocol = NFC_PROTO_ISO15693_MASK;
 	else
-		protocol = 0;
+		protocol = nci_get_prop_rf_protocol(ndev, rf_protocol);
 
 	if (!(protocol & ndev->poll_prots)) {
 		pr_err("the target found does not have the desired protocol\n");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
