From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/10] NFC: st21nfca: Fix incorrect TAILROOM and st21nfca_hci_remove_len_crc.
Date: Thu, 24 Apr 2014 23:19:31 +0200
Message-ID: <1398374379-17133-3-git-send-email-christophe-h.ricard@st.com>
References: <1398374379-17133-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398374379-17133-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

There is no byte stuffing when data are storred in skb.
TAILROOM is 2 byte crc + 1 byte eof.

st21nfca_hci_remove_len_crc was doing an incorrect operation on
the TAILROOM data.
If shdlc timer T2 is triggered, it will request to send the same data.
Before every hci data was lost after st21nfca_hci_remove_len_crc.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 6c4d0a0..5535d02 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -48,11 +48,11 @@
 #define ST21NFCA_BYTE_STUFFING_MASK	0x20
 #define ST21NFCA_ESCAPE_BYTE_STUFFING	0x7d
 
-/* SOF + 00 fill size */
+/* SOF + 00 */
 #define ST21NFCA_FRAME_HEADROOM			2
 
-/* 4 bytes crc (worst case byte stuffing) + EOF */
-#define ST21NFCA_FRAME_TAILROOM 5
+/* 2 bytes crc + EOF */
+#define ST21NFCA_FRAME_TAILROOM 3
 
 #define ST21NFCA_HCI_I2C_DRIVER_NAME "st21nfca_hci_i2c"
 
@@ -166,9 +166,8 @@ static void st21nfca_hci_i2c_disable(void *phy_id)
 	phy->powered = 0;
 }
 
-static int st21nfca_hci_add_len_crc(struct sk_buff *skb)
+static void st21nfca_hci_add_len_crc(struct sk_buff *skb)
 {
-	int ret = 2;
 	u16 crc;
 	u8 tmp;
 
@@ -182,14 +181,12 @@ static int st21nfca_hci_add_len_crc(struct sk_buff *skb)
 
 	tmp = (crc >> 8) & 0x00ff;
 	*skb_put(skb, 1) = tmp;
-
-	return ret;
 }
 
-static void st21nfca_hci_remove_len_crc(struct sk_buff *skb, int crc_len)
+static void st21nfca_hci_remove_len_crc(struct sk_buff *skb)
 {
 	skb_pull(skb, ST21NFCA_FRAME_HEADROOM);
-	skb_trim(skb, crc_len);
+	skb_trim(skb, skb->len - ST21NFCA_FRAME_TAILROOM);
 }
 
 /*
@@ -199,7 +196,7 @@ static void st21nfca_hci_remove_len_crc(struct sk_buff *skb, int crc_len)
  */
 static int st21nfca_hci_i2c_write(void *phy_id, struct sk_buff *skb)
 {
-	int r = -1, i, j, len;
+	int r = -1, i, j;
 	struct st21nfca_i2c_phy *phy = phy_id;
 	struct i2c_client *client = phy->i2c_dev;
 	u8 tmp[ST21NFCA_HCI_LLC_MAX_SIZE * 2];
@@ -215,7 +212,7 @@ static int st21nfca_hci_i2c_write(void *phy_id, struct sk_buff *skb)
 	 * Note st21nfca_hci_add_len_crc is doing a byte stuffing
 	 * on its own value
 	 */
-	len = st21nfca_hci_add_len_crc(skb);
+	st21nfca_hci_add_len_crc(skb);
 
 	/* add ST21NFCA_SOF_EOF on tail */
 	*skb_put(skb, 1) = ST21NFCA_SOF_EOF;
@@ -259,7 +256,7 @@ static int st21nfca_hci_i2c_write(void *phy_id, struct sk_buff *skb)
 			r = 0;
 	}
 
-	st21nfca_hci_remove_len_crc(skb, len);
+	st21nfca_hci_remove_len_crc(skb);
 
 	return r;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
