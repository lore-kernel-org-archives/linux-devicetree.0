From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/11] nfc: st-nci: Free data with irrelevant NDLC PCB_SYNC value
Date: Fri, 14 Aug 2015 22:33:36 +0200
Message-ID: <1439584420-5446-8-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

PCB_SYNC different than PCB_TYPE_SUPERVISOR or PCB_TYPE_DATAFRAME should
be discarded.

Irrelevant data may be forwarded up to the ndlc state machine by phys like
spi to prevent missing potential data during "write" transaction.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/ndlc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index bb08b16..4f51649 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -198,8 +198,10 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
 				kfree_skb(skb);
 				break;
 			}
-		} else {
+		} else if ((pcb & PCB_TYPE_MASK) == PCB_TYPE_DATAFRAME) {
 			nci_recv_frame(ndlc->ndev, skb);
+		} else {
+			kfree_skb(skb);
 		}
 	}
 }
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
