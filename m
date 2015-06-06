From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 03/17] nfc: nci: Add NCI_RESET return code check before setup
Date: Sat,  6 Jun 2015 13:16:39 +0200
Message-ID: <1433589413-19680-4-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

setup was executed in any case, even if NCI_RESET failed.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 56d57c9..b900e6a 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -347,8 +347,9 @@ static int nci_open_device(struct nci_dev *ndev)
 	rc = __nci_request(ndev, nci_reset_req, 0,
 			   msecs_to_jiffies(NCI_RESET_TIMEOUT));
 
-	if (ndev->ops->setup)
-		ndev->ops->setup(ndev);
+	if (!rc && ndev->ops->setup) {
+		rc = ndev->ops->setup(ndev);
+	}
 
 	if (!rc) {
 		rc = __nci_request(ndev, nci_init_req, 0,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
