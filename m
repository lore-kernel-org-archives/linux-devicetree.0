From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/11] NFC: st21nfca: Replace all remaining IS_ERR(skb) with !skb
Date: Fri, 12 Sep 2014 21:49:40 +0200
Message-ID: <1410551381-7565-11-git-send-email-christophe-h.ricard@st.com>
References: <1410551381-7565-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410551381-7565-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

!skb is much simpler and more appropriate for callback returning void
because:
- IS_ERR(NULL) return false and skb migth be NULL.
- skb cannot be a ERR_PTR as nfc_hci_send_cmd_async it never using such cast.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca_dep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca_dep.c b/drivers/nfc/st21nfca/st21nfca_dep.c
index bf3132b..9408122 100644
--- a/drivers/nfc/st21nfca/st21nfca_dep.c
+++ b/drivers/nfc/st21nfca/st21nfca_dep.c
@@ -443,7 +443,7 @@ static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff *skb,
 	if (err != 0)
 		return;
 
-	if (IS_ERR(skb))
+	if (!skb)
 		return;
 
 	switch (info->async_cb_type) {
@@ -555,7 +555,7 @@ static void st21nfca_im_recv_dep_res_cb(void *context, struct sk_buff *skb,
 	if (err != 0)
 		return;
 
-	if (IS_ERR(skb))
+	if (!skb)
 		return;
 
 	switch (info->async_cb_type) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
