From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/13] NFC: st21nfcb: Fix "WARNING: invalid free of devm_ allocated data"
Date: Sun, 25 Jan 2015 23:33:21 +0100
Message-ID: <1422225211-27510-4-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ndlc pointer got allocated with devm_kzalloc in ndlc_probe function.

This gives this error message:
drivers/nfc/st21nfcb/ndlc.c:296:1-6: WARNING: invalid free of devm_ allocated data.

Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Reported-by: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/ndlc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index bac50e8..ef0f997 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -297,6 +297,5 @@ void ndlc_remove(struct llt_ndlc *ndlc)
 	skb_queue_purge(&ndlc->send_q);
 
 	st21nfcb_nci_remove(ndlc->ndev);
-	kfree(ndlc);
 }
 EXPORT_SYMBOL(ndlc_remove);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
