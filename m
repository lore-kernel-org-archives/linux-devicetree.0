From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 06/11] NFC: st21nfcb: Fix improper ndlc T2 management
Date: Sat, 13 Sep 2014 10:28:48 +0200
Message-ID: <1410596933-5530-7-git-send-email-christophe-h.ricard@st.com>
References: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410596933-5530-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

T2 was never started when sending a command.
Start it when sending a command for the first attempt
and stop it once we receive the answer.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/ndlc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index 83c97c3..e7bff89 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -112,6 +112,10 @@ static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
 		ndlc->t1_active = true;
 		mod_timer(&ndlc->t1_timer, time_sent +
 			msecs_to_jiffies(NDLC_TIMER_T1));
+		/* start timer t2 for chip availability */
+		ndlc->t2_active = true;
+		mod_timer(&ndlc->t2_timer, time_sent +
+			msecs_to_jiffies(NDLC_TIMER_T2));
 	}
 }
 
@@ -207,7 +211,7 @@ static void llt_ndlc_sm_work(struct work_struct *work)
 		ndlc->t2_active = false;
 		ndlc->t1_active = false;
 		del_timer_sync(&ndlc->t1_timer);
-
+		del_timer_sync(&ndlc->t2_timer);
 		ndlc_close(ndlc);
 		ndlc->hard_fault = -EREMOTEIO;
 	}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
