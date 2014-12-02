From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/13] NFC: nci: Add management for NCI state for machine rf_deactivate_ntf
Date: Tue,  2 Dec 2014 21:27:48 +0100
Message-ID: <1417552078-9269-4-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A notification for rf deaction can be IDLE_MODE, SLEEP_MODE, SLEEP_AF_MODE
and DISCOVERY. According to each type and the NCI state machine is
different (see figure 10 RF Communication State Machine in NCI specification)

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/ntf.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index ccc3606..17ee28a 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -680,11 +680,21 @@ static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
 		nci_data_exchange_complete(ndev, NULL, -EIO);
 
-	nci_clear_target_list(ndev);
-	if (ntf->type == NCI_DEACTIVATE_TYPE_DISCOVERY)
-		atomic_set(&ndev->state, NCI_DISCOVERY);
-	else
+	switch (ntf->type) {
+	case NCI_DEACTIVATE_TYPE_IDLE_MODE:
+		nci_clear_target_list(ndev);
 		atomic_set(&ndev->state, NCI_IDLE);
+		break;
+	case NCI_DEACTIVATE_TYPE_SLEEP_MODE:
+	case NCI_DEACTIVATE_TYPE_SLEEP_AF_MODE:
+		atomic_set(&ndev->state, NCI_W4_HOST_SELECT);
+		break;
+	case NCI_DEACTIVATE_TYPE_DISCOVERY:
+		nci_clear_target_list(ndev);
+		atomic_set(&ndev->state, NCI_DISCOVERY);
+		break;
+	}
+
 	nci_req_complete(ndev, NCI_STATUS_OK);
 }
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
