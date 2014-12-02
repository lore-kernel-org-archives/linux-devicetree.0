From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 13/13] NFC: nci: Fix warning: cast to restricted __le16
Date: Tue,  2 Dec 2014 21:27:58 +0100
Message-ID: <1417552078-9269-14-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixing: net/nfc/nci/ntf.c:106:31: warning: cast to restricted __le16
message when building with make C=1 CF=-D__CHECK_ENDIAN__

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/ntf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 17ee28a..8dee73d 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -103,7 +103,7 @@ static __u8 *nci_extract_rf_params_nfca_passive_poll(struct nci_dev *ndev,
 			struct rf_tech_specific_params_nfca_poll *nfca_poll,
 						     __u8 *data)
 {
-	nfca_poll->sens_res = __le16_to_cpu(*((__u16 *)data));
+	nfca_poll->sens_res = __le16_to_cpu(*((__le16 *)data));
 	data += 2;
 
 	nfca_poll->nfcid1_len = min_t(__u8, *data++, NFC_NFCID1_MAXSIZE);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
