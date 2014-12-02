From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/13] NFC: nci: Add support for different NCI_DEACTIVATE_TYPE
Date: Tue,  2 Dec 2014 21:27:49 +0100
Message-ID: <1417552078-9269-5-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

nci_rf_deactivate_req only support NCI_DEACTIVATE_TYPE_IDLE_MODE.
In some situation, it might be necessary to be able to support other
NCI_DEACTIVATE_TYPE such as NCI_DEACTIVATE_TYPE_SLEEP_MODE in order for
example to reactivate the selected target.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 552b13b..51feb5e 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -299,7 +299,7 @@ static void nci_rf_deactivate_req(struct nci_dev *ndev, unsigned long opt)
 {
 	struct nci_rf_deactivate_cmd cmd;
 
-	cmd.type = NCI_DEACTIVATE_TYPE_IDLE_MODE;
+	cmd.type = opt;
 
 	nci_send_cmd(ndev, NCI_OP_RF_DEACTIVATE_CMD,
 		     sizeof(struct nci_rf_deactivate_cmd), &cmd);
@@ -527,7 +527,8 @@ static int nci_start_poll(struct nfc_dev *nfc_dev,
 	    (atomic_read(&ndev->state) == NCI_POLL_ACTIVE)) {
 		pr_debug("target active or w4 select, implicitly deactivate\n");
 
-		rc = nci_request(ndev, nci_rf_deactivate_req, 0,
+		rc = nci_request(ndev, nci_rf_deactivate_req,
+				 NCI_DEACTIVATE_TYPE_IDLE_MODE,
 				 msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 		if (rc)
 			return -EBUSY;
@@ -568,7 +569,7 @@ static void nci_stop_poll(struct nfc_dev *nfc_dev)
 		return;
 	}
 
-	nci_request(ndev, nci_rf_deactivate_req, 0,
+	nci_request(ndev, nci_rf_deactivate_req, NCI_DEACTIVATE_TYPE_IDLE_MODE,
 		    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 }
 
@@ -653,7 +654,8 @@ static void nci_deactivate_target(struct nfc_dev *nfc_dev,
 	ndev->target_active_prot = 0;
 
 	if (atomic_read(&ndev->state) == NCI_POLL_ACTIVE) {
-		nci_request(ndev, nci_rf_deactivate_req, 0,
+		nci_request(ndev, nci_rf_deactivate_req,
+			    NCI_DEACTIVATE_TYPE_SLEEP_MODE,
 			    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 	}
 }
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
