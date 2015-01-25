From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/13] NFC: st21nfcb: Fix "NULL pointer dereference" possible error
Date: Sun, 25 Jan 2015 23:33:29 +0100
Message-ID: <1422225211-27510-12-git-send-email-christophe-h.ricard@st.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When the platform with CONFIG_ST21NFCB_I2C=y without any st21nfcb component
physically connected a:
"Unable to handle kernel NULL pointer dereference at virtual address" may
show up at driver initialization phase.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index b65847c..eb88693 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -199,7 +199,7 @@ static irqreturn_t st21nfcb_nci_irq_thread_fn(int irq, void *phy_id)
 	struct sk_buff *skb = NULL;
 	int r;
 
-	if (!phy || irq != phy->i2c_dev->irq) {
+	if (!phy || !phy->ndlc || irq != phy->i2c_dev->irq) {
 		WARN_ON_ONCE(1);
 		return IRQ_NONE;
 	}
@@ -343,18 +343,22 @@ static int st21nfcb_nci_i2c_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
+	r = ndlc_probe(phy, &i2c_phy_ops, &client->dev,
+			ST21NFCB_FRAME_HEADROOM, ST21NFCB_FRAME_TAILROOM,
+			&phy->ndlc);
+	if (r < 0) {
+		nfc_err(&client->dev, "Unable to register ndlc layer\n");
+		return r;
+	}
+
 	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 				st21nfcb_nci_irq_thread_fn,
 				phy->irq_polarity | IRQF_ONESHOT,
 				ST21NFCB_NCI_DRIVER_NAME, phy);
-	if (r < 0) {
+	if (r < 0)
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
-		return r;
-	}
 
-	return ndlc_probe(phy, &i2c_phy_ops, &client->dev,
-			ST21NFCB_FRAME_HEADROOM, ST21NFCB_FRAME_TAILROOM,
-			&phy->ndlc);
+	return r;
 }
 
 static int st21nfcb_nci_i2c_remove(struct i2c_client *client)
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
