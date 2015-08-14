From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 06/11] nfc: st-nci: Remove data from ack_pending_q when receiving a NDLC PCB_SYNC_ACK
Date: Fri, 14 Aug 2015 22:33:35 +0200
Message-ID: <1439584420-5446-7-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When receiving a NDLC PCB_SYNC_ACK the pending data was never removed from
ack_pending_q and cleared.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/ndlc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index 56c6a4c..bb08b16 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -171,6 +171,8 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
 		if ((pcb & PCB_TYPE_MASK) == PCB_TYPE_SUPERVISOR) {
 			switch (pcb & PCB_SYNC_MASK) {
 			case PCB_SYNC_ACK:
+				skb = skb_dequeue(&ndlc->ack_pending_q);
+				kfree_skb(skb);
 				del_timer_sync(&ndlc->t1_timer);
 				del_timer_sync(&ndlc->t2_timer);
 				ndlc->t2_active = false;
-- 
2.1.4
