From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/11] NFC: st21nfca: Fix potential double kfree_skb error
Date: Fri, 12 Sep 2014 21:49:41 +0200
Message-ID: <1410551381-7565-12-git-send-email-christophe-h.ricard@st.com>
References: <1410551381-7565-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410551381-7565-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

skb is already freed in st21nfca_tx_work and was freed also in
st21nfca_im_send_psl_req.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca_dep.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca_dep.c b/drivers/nfc/st21nfca/st21nfca_dep.c
index 9408122..bfb6df5 100644
--- a/drivers/nfc/st21nfca/st21nfca_dep.c
+++ b/drivers/nfc/st21nfca/st21nfca_dep.c
@@ -428,8 +428,6 @@ static void st21nfca_im_send_psl_req(struct nfc_hci_dev *hdev, u8 did, u8 bsi,
 	*skb_push(skb, 1) = info->dep_info.to | 0x10;
 
 	st21nfca_im_send_pdu(info, skb);
-
-	kfree_skb(skb);
 }
 
 #define ST21NFCA_CB_TYPE_READER_F 1
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
