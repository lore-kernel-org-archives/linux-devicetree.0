From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 16/17] nfc: st21nfcb: Configure CLF with nci proprietary command during init/deinit stage
Date: Sat,  6 Jun 2015 13:16:52 +0200
Message-ID: <1433589413-19680-17-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to prevent any NFC feature when NFC is disable and to save power,
(down to 4uA) put the CLF in hibernate mode with RF deactivated.
Add the equivalent to enable the NFC feature when initiating st21nfcb
driver.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/ndlc.c     | 12 +++++++++++-
 drivers/nfc/st21nfcb/st21nfcb.c | 12 ++++++++++++
 drivers/nfc/st21nfcb/st21nfcb.h |  6 ++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index 3ee22b4..c1e053a 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -66,9 +66,19 @@ EXPORT_SYMBOL(ndlc_open);
 
 void ndlc_close(struct llt_ndlc *ndlc)
 {
+	struct nci_mode_set_cmd cmd;
+
+	cmd.cmd_type = ST_NCI_SET_NFC_MODE;
+	cmd.mode = 0;
+
 	/* toggle reset pin */
-	ndlc->ops->disable(ndlc->phy_id);
+	ndlc->ops->enable(ndlc->phy_id);
+
+	nci_prop_cmd(ndlc->ndev, ST21NFCB_NCI_CORE_PROP,
+		     sizeof(struct nci_mode_set_cmd), (__u8 *)&cmd);
+
 	ndlc->powered = 0;
+	ndlc->ops->disable(ndlc->phy_id);
 }
 EXPORT_SYMBOL(ndlc_close);
 
diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index 50ad6d0..ac66e4d 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -30,6 +30,17 @@
 
 #define ST21NFCB_NCI1_X_PROPRIETARY_ISO15693 0x83
 
+static int st21nfcb_nci_init(struct nci_dev *ndev)
+{
+	struct nci_mode_set_cmd cmd;
+
+	cmd.cmd_type = ST_NCI_SET_NFC_MODE;
+	cmd.mode = 1;
+
+	return nci_prop_cmd(ndev, ST_NCI_CORE_PROP,
+			sizeof(struct nci_mode_set_cmd), (__u8 *)&cmd);
+}
+
 static int st21nfcb_nci_open(struct nci_dev *ndev)
 {
 	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
@@ -96,6 +107,7 @@ static struct nci_prop_ops st21nfcb_nci_prop_ops[] = {
 };
 
 static struct nci_ops st21nfcb_nci_ops = {
+	.init = st21nfcb_nci_init,
 	.open = st21nfcb_nci_open,
 	.close = st21nfcb_nci_close,
 	.send = st21nfcb_nci_send,
diff --git a/drivers/nfc/st21nfcb/st21nfcb.h b/drivers/nfc/st21nfcb/st21nfcb.h
index 7c12d9d..7106363 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.h
+++ b/drivers/nfc/st21nfcb/st21nfcb.h
@@ -26,6 +26,12 @@
 #define ST21NFCB_NCI_RUNNING			1
 
 #define ST21NFCB_NCI_CORE_PROP                0x01
+#define ST21NFCB_NCI_SET_NFC_MODE             0x02
+
+struct nci_mode_set_cmd {
+	u8 cmd_type;
+	u8 mode;
+} __packed;
 
 struct nci_mode_set_rsp {
 	u8 status;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
