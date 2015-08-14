From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/11] nfc: st-nci: Remove pr_err in llt_ndlc_rcv_queue when ndlc header is unknown
Date: Fri, 14 Aug 2015 22:33:39 +0200
Message-ID: <1439584420-5446-11-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

spi phy needs to use ndlc_recv at every spi transaction causing "unknown
packet control byte" error message each time the header is 00.

Make this silent.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/ndlc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index 4f51649..d2cf84e 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -194,7 +194,6 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
 					  msecs_to_jiffies(NDLC_TIMER_T1_WAIT));
 				break;
 			default:
-				pr_err("UNKNOWN Packet Control Byte=%d\n", pcb);
 				kfree_skb(skb);
 				break;
 			}
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
