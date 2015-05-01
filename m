From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 07/14] nfc: st21nfcb: Move st21nfcb_nci_remove in ndlc_remove
Date: Fri,  1 May 2015 22:19:30 +0200
Message-ID: <1430511577-19678-8-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Removing st21nfcb may need to execute some specific commands before
stopping the ndlc state machine.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/ndlc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index 6014b58..429cf05 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -286,6 +286,8 @@ EXPORT_SYMBOL(ndlc_probe);
 
 void ndlc_remove(struct llt_ndlc *ndlc)
 {
+	st21nfcb_nci_remove(ndlc->ndev);
+
 	/* cancel timers */
 	del_timer_sync(&ndlc->t1_timer);
 	del_timer_sync(&ndlc->t2_timer);
@@ -294,7 +296,5 @@ void ndlc_remove(struct llt_ndlc *ndlc)
 
 	skb_queue_purge(&ndlc->rcv_q);
 	skb_queue_purge(&ndlc->send_q);
-
-	st21nfcb_nci_remove(ndlc->ndev);
 }
 EXPORT_SYMBOL(ndlc_remove);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
