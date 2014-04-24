From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/10] NFC: st21nfca: Add mutex to force a successful i2c transaction.
Date: Thu, 24 Apr 2014 23:19:34 +0200
Message-ID: <1398374379-17133-6-git-send-email-christophe-h.ricard@st.com>
References: <1398374379-17133-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398374379-17133-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stabilize communication in case of i2c transaction failure.
This avoid a write transaction during a read retry or a read
transaction during a write retry.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index dece61f..ef5e648 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -89,6 +89,7 @@ struct st21nfca_i2c_phy {
 	 * and prevents normal operation.
 	 */
 	int hard_fault;
+	struct mutex phy_lock;
 };
 static u8 len_seq[] = { 13, 24, 15, 29 };
 static u16 wait_tab[] = { 2, 3, 5, 15, 20, 40};
@@ -245,11 +246,13 @@ static int st21nfca_hci_i2c_write(void *phy_id, struct sk_buff *skb)
 	 * Manage sleep mode
 	 * Try 3 times to send data with delay between each
 	 */
+	mutex_lock(&phy->phy_lock);
 	for (i = 0; i < ARRAY_SIZE(wait_tab) && r < 0; i++) {
 		r = i2c_master_send(client, tmp, j);
 		if (r < 0)
 			msleep(wait_tab[i]);
 	}
+	mutex_unlock(&phy->phy_lock);
 
 	if (r >= 0) {
 		if (r != j)
@@ -375,11 +378,13 @@ static int st21nfca_hci_i2c_read(struct st21nfca_i2c_phy *phy,
 		 * RF or SWP interface
 		 */
 		r = 0;
+		mutex_lock(&phy->phy_lock);
 		for (i = 0; i < ARRAY_SIZE(wait_tab) && r <= 0; i++) {
 			r = i2c_master_recv(client, buf, len);
 			if (r < 0)
 				msleep(wait_tab[i]);
 		}
+		mutex_unlock(&phy->phy_lock);
 
 		if (r != len) {
 			phy->current_read_len = 0;
@@ -574,6 +579,7 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 
 	phy->current_read_len = 0;
 	phy->crc_trials = 0;
+	mutex_init(&phy->phy_lock);
 	i2c_set_clientdata(client, phy);
 
 	pdata = client->dev.platform_data;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
