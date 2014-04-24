From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/10] NFC: st21nfca: Fix incorrect byte stuffing revocation.
Date: Thu, 24 Apr 2014 23:19:32 +0200
Message-ID: <1398374379-17133-4-git-send-email-christophe-h.ricard@st.com>
References: <1398374379-17133-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398374379-17133-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Byte stuffing was not correctly removed after a i2c read operation.
This was causing improper crc calculation when byte stuffing was
applied to more than 1 byte.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 5535d02..e29351c 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -312,11 +312,10 @@ static int st21nfca_hci_i2c_repack(struct sk_buff *skb)
 		skb_trim(skb, size);
 		/* remove ST21NFCA byte stuffing for upper layer */
 		for (i = 1, j = 0; i < skb->len; i++) {
-			if (skb->data[i] ==
+			if (skb->data[i + j] ==
 					(u8) ST21NFCA_ESCAPE_BYTE_STUFFING) {
-				skb->data[i] =
-				    skb->data[i +
-					      1] | ST21NFCA_BYTE_STUFFING_MASK;
+				skb->data[i] = skb->data[i + j + 1]
+						| ST21NFCA_BYTE_STUFFING_MASK;
 				i++;
 				j++;
 			}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
