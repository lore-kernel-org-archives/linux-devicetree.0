From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/11] NFC: st21nfca: Fix recursive fault when doing p2p in target mode.
Date: Sat, 13 Sep 2014 10:28:45 +0200
Message-ID: <1410596933-5530-4-git-send-email-christophe-h.ricard@st.com>
References: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410596933-5530-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch fix a previous patch introduce by commit	0a91e8ac240a12ac3a03581deb8cd531788c63d4

It is actually fixing a double free mistake in all st21nfca_tm_* function.
We decide to return directly in case of successful execution because skb
got already freed. In st21nfca_tm_recv_dep_req it got freed by nfc_tm_data_received.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index e5f92aa..a89e56c 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -861,19 +861,16 @@ static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 gate,
 		if (gate == ST21NFCA_RF_CARD_F_GATE) {
 			r = st21nfca_tm_event_send_data(hdev, skb, gate);
 			if (r < 0)
-				goto exit;
-		} else {
-			info->dep_info.curr_nfc_dep_pni = 0;
-			return 1;
+				return r;
+			return 0;
 		}
-		break;
+		info->dep_info.curr_nfc_dep_pni = 0;
+		return 1;
 	default:
 		return 1;
 	}
 	kfree_skb(skb);
 	return 0;
-exit:
-	return r;
 }
 
 static struct nfc_hci_ops st21nfca_hci_ops = {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
