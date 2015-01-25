From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/13] NFC: st21nfcb: Avoid use of skb after free
Date: Sun, 25 Jan 2015 23:33:23 +0100
Message-ID: <1422225211-27510-6-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anda-Maria Nicolae <anda-maria.nicolae-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Do not insert in send queue the skb that contains unknown Packet Control
Byte

Acked-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Anda-Maria Nicolae <anda-maria.nicolae-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/nfc/st21nfcb/ndlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index ef0f997..5fbf59d 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -138,7 +138,7 @@ static void llt_ndlc_requeue_data_pending(struct llt_ndlc *ndlc)
 		default:
 			pr_err("UNKNOWN Packet Control Byte=%d\n", pcb);
 			kfree_skb(skb);
-			break;
+			continue;
 		}
 		skb_queue_head(&ndlc->send_q, skb);
 	}
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
