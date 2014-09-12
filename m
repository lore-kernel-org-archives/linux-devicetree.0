From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/11] NFC: st21nfca: Fix few coding style issue
Date: Fri, 12 Sep 2014 21:49:31 +0200
Message-ID: <1410551381-7565-2-git-send-email-christophe-h.ricard@st.com>
References: <1410551381-7565-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410551381-7565-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix few conding style issue such as useless line return or tab.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca_dep.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca_dep.c b/drivers/nfc/st21nfca/st21nfca_dep.c
index 6c09a66..03dacc6 100644
--- a/drivers/nfc/st21nfca/st21nfca_dep.c
+++ b/drivers/nfc/st21nfca/st21nfca_dep.c
@@ -129,9 +129,8 @@ static void st21nfca_tx_work(struct work_struct *work)
 		device_lock(&dev->dev);
 
 		nfc_hci_send_cmd_async(info->hdev, ST21NFCA_RF_READER_F_GATE,
-							ST21NFCA_WR_XCHG_DATA,
-							skb->data, skb->len,
-							info->async_cb, info);
+				ST21NFCA_WR_XCHG_DATA, skb->data, skb->len,
+				info->async_cb, info);
 		device_unlock(&dev->dev);
 		kfree_skb(skb);
 	}
@@ -239,7 +238,6 @@ static int st21nfca_tm_send_psl_res(struct nfc_hci_dev *hdev,
 	struct st21nfca_psl_res *psl_res;
 	struct sk_buff *skb;
 	u8 bitrate[2] = {0, 0};
-
 	int r;
 
 	skb = alloc_skb(sizeof(struct st21nfca_psl_res), GFP_KERNEL);
@@ -311,7 +309,7 @@ int st21nfca_tm_send_dep_res(struct nfc_hci_dev *hdev, struct sk_buff *skb)
 	*skb_push(skb, 1) = skb->len;
 
 	r = nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
-				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
+			ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
 	kfree_skb(skb);
 
 	return r;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
