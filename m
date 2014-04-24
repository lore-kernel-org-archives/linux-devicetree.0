From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/10] NFC: st21nfca: Improved check for correct data reception on i2c bus.
Date: Thu, 24 Apr 2014 23:19:33 +0200
Message-ID: <1398374379-17133-5-git-send-email-christophe-h.ricard@st.com>
References: <1398374379-17133-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398374379-17133-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

A frame starts with ST21NFCA_SOF_EOF(0x7e) + 0x00.
A frame ends with ST21NFCA_SOF_EOF(0x7e).
It is possible that the i2c macrocell is stopped for other
communication interfaces with highest priority(RF or SWP).
This can be seen with some 0xFF data at the end of a received shdlc buffer.
If this happen we need to discard the frame because the CLF will repeat it.

In order to push accurate data to hci layer, we add the following fix:
- Instead of looking for the first 0x7e in the frame, check that the last
received byte is 0x7e.
- Check that the first frame reception block start with start of
frame(0x7e 0x00). If not, clear the buffer.
- Check that the next frame reception block do not start with start of
frame(0x7e). If so, clear the buffer.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index e29351c..dece61f 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -53,6 +53,8 @@
 
 /* 2 bytes crc + EOF */
 #define ST21NFCA_FRAME_TAILROOM 3
+#define IS_START_OF_FRAME(buf) (buf[0] == ST21NFCA_SOF_EOF && \
+				buf[1] == 0)
 
 #define ST21NFCA_HCI_I2C_DRIVER_NAME "st21nfca_hci_i2c"
 
@@ -361,6 +363,7 @@ static int st21nfca_hci_i2c_read(struct st21nfca_i2c_phy *phy,
 {
 	int r, i;
 	u8 len;
+	u8 buf[ST21NFCA_HCI_LLC_MAX_PAYLOAD];
 	struct i2c_client *client = phy->i2c_dev;
 
 	if (phy->current_read_len < ARRAY_SIZE(len_seq)) {
@@ -373,7 +376,7 @@ static int st21nfca_hci_i2c_read(struct st21nfca_i2c_phy *phy,
 		 */
 		r = 0;
 		for (i = 0; i < ARRAY_SIZE(wait_tab) && r <= 0; i++) {
-			r = i2c_master_recv(client, skb_put(skb, len), len);
+			r = i2c_master_recv(client, buf, len);
 			if (r < 0)
 				msleep(wait_tab[i]);
 		}
@@ -383,8 +386,27 @@ static int st21nfca_hci_i2c_read(struct st21nfca_i2c_phy *phy,
 			return -EREMOTEIO;
 		}
 
-		if (memchr(skb->data + 2, ST21NFCA_SOF_EOF,
-				skb->len - 2) != NULL) {
+		/*
+		 * The first read sequence does not start with SOF.
+		 * Data are corrupeted. Drop them.
+		 */
+		if (!phy->current_read_len && buf[0] != ST21NFCA_SOF_EOF) {
+			skb_trim(skb, 0);
+			phy->current_read_len = 0;
+			return -EIO;
+		} else if (phy->current_read_len &&
+			IS_START_OF_FRAME(buf)) {
+			/*
+			 * Previous frame transmission was interrupted and
+			 * the frame got repeated.
+			 * Received frame start with ST21NFCA_SOF_EOF + 00.
+			 */
+			skb_trim(skb, 0);
+			phy->current_read_len = 0;
+		}
+		memcpy(skb_put(skb, len), buf, len);
+
+		if (skb->data[skb->len - 1] == ST21NFCA_SOF_EOF) {
 			phy->current_read_len = 0;
 			return st21nfca_hci_i2c_repack(skb);
 		}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
