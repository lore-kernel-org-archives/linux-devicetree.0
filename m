From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 04/17] nfc: nci: Add nci init ops for early device initialization
Date: Sat,  6 Jun 2015 13:16:40 +0200
Message-ID: <1433589413-19680-5-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some device may need to execute some proprietary commands in order to
"wake-up"; Before the nci state initialization.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index c49688c..886854a 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -73,6 +73,7 @@ struct nci_prop_ops {
 };
 
 struct nci_ops {
+	int   (*init)(struct nci_dev *ndev);
 	int   (*open)(struct nci_dev *ndev);
 	int   (*close)(struct nci_dev *ndev);
 	int   (*send)(struct nci_dev *ndev, struct sk_buff *skb);
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index b900e6a..12213c8 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -344,8 +344,14 @@ static int nci_open_device(struct nci_dev *ndev)
 
 	set_bit(NCI_INIT, &ndev->flags);
 
-	rc = __nci_request(ndev, nci_reset_req, 0,
-			   msecs_to_jiffies(NCI_RESET_TIMEOUT));
+	if (ndev->ops->init) {
+		rc = ndev->ops->init(ndev);
+	}
+
+	if (!rc) {
+		rc = __nci_request(ndev, nci_reset_req, 0,
+				   msecs_to_jiffies(NCI_RESET_TIMEOUT));
+	}
 
 	if (!rc && ndev->ops->setup) {
 		rc = ndev->ops->setup(ndev);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
