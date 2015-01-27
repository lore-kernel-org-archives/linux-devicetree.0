From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 02/14] NFC: nci: Make nci_request available for nfc driver
Date: Tue, 27 Jan 2015 01:28:12 +0100
Message-ID: <1422318504-10039-3-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

NFC drivers may need to send raw data over NCI. Make this function
available in the NCI core framework.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nci_core.h | 3 +++
 net/nfc/nci/core.c         | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 25c0a70..395f804 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -217,6 +217,9 @@ int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb);
 void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 				__u8 conn_id, int err);
 void nci_clear_target_list(struct nci_dev *ndev);
+int nci_request(struct nci_dev *ndev,
+			void (*req)(struct nci_dev *ndev, unsigned long opt),
+			unsigned long opt, __u32 timeout);
 
 /* ----- NCI requests ----- */
 #define NCI_REQ_DONE		0
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 92b42e2..b3ec63e 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -109,10 +109,9 @@ static int __nci_request(struct nci_dev *ndev,
 	return rc;
 }
 
-static inline int nci_request(struct nci_dev *ndev,
-			      void (*req)(struct nci_dev *ndev,
-					  unsigned long opt),
-			      unsigned long opt, __u32 timeout)
+inline int nci_request(struct nci_dev *ndev,
+		void (*req)(struct nci_dev *ndev, unsigned long opt),
+		unsigned long opt, __u32 timeout)
 {
 	int rc;
 
@@ -126,6 +125,7 @@ static inline int nci_request(struct nci_dev *ndev,
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(nci_request);
 
 static void nci_reset_req(struct nci_dev *ndev, unsigned long opt)
 {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
