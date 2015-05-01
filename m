From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 05/14] nfc: nci: Move close ops call in nci_close_device
Date: Fri,  1 May 2015 22:19:28 +0200
Message-ID: <1430511577-19678-6-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

When closing the device some data (proprietary commands) might be sent.
The core state machine needs to be set for correct command execution.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 49ff321..6b4f450 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -407,6 +407,11 @@ static int nci_close_device(struct nci_dev *ndev)
 	set_bit(NCI_INIT, &ndev->flags);
 	__nci_request(ndev, nci_reset_req, 0,
 		      msecs_to_jiffies(NCI_RESET_TIMEOUT));
+
+	/* After this point our queues are empty
+	 * and no works are scheduled. */
+	ndev->ops->close(ndev);
+
 	clear_bit(NCI_INIT, &ndev->flags);
 
 	del_timer_sync(&ndev->cmd_timer);
@@ -414,10 +419,6 @@ static int nci_close_device(struct nci_dev *ndev)
 	/* Flush cmd wq */
 	flush_workqueue(ndev->cmd_wq);
 
-	/* After this point our queues are empty
-	 * and no works are scheduled. */
-	ndev->ops->close(ndev);
-
 	/* Clear flags */
 	ndev->flags = 0;
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
