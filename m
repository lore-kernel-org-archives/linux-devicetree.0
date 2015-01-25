From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/13] NFC: st21nfca: Remove checkpatch.pl warning Possible unnecessary 'out of memory' message
Date: Sun, 25 Jan 2015 23:33:27 +0100
Message-ID: <1422225211-27510-10-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove unnecessary memory allocation message already shown by devm_kzalloc.
This remove a warning when running scripts/checkpatch.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index b2e0792..82b82db 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -591,11 +591,8 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 
 	phy = devm_kzalloc(&client->dev, sizeof(struct st21nfca_i2c_phy),
 			   GFP_KERNEL);
-	if (!phy) {
-		nfc_err(&client->dev,
-			"Cannot allocate memory for st21nfca i2c phy.\n");
+	if (!phy)
 		return -ENOMEM;
-	}
 
 	phy->i2c_dev = client;
 	phy->pending_skb = alloc_skb(ST21NFCA_HCI_LLC_MAX_SIZE * 2, GFP_KERNEL);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
