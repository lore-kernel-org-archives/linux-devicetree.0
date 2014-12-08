From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 04/34] NFC: st21nfca: Remove unreachable code
Date: Mon,  8 Dec 2014 22:08:09 +0100
Message-ID: <1418072919-10535-5-git-send-email-christophe-h.ricard@st.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418072919-10535-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

kfree_skb(skb) in st21nfca_hci_event_received is never reach.

Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index f2596c8..880193b 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -845,8 +845,6 @@ static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 gate,
 	default:
 		return 1;
 	}
-	kfree_skb(skb);
-	return 0;
 }
 
 static struct nfc_hci_ops st21nfca_hci_ops = {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
