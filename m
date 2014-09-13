From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/11] NFC: st21nfcb: Fix improper management of -EREMOTEIO error code.
Date: Sat, 13 Sep 2014 10:28:47 +0200
Message-ID: <1410596933-5530-6-git-send-email-christophe-h.ricard@st.com>
References: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410596933-5530-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On st21nfcb the irq line might be kept to active state because of other
interfaces activity. This may generate i2c read tentative resulting in
i2c NACK.

This fix will currently let NDLC upper layer to decide when it is relevent
to signal to the physical layer when the chip as muted.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c  | 19 ++++---------------
 drivers/nfc/st21nfcb/ndlc.h |  4 ++++
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 8342346..0b8f721 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -55,12 +55,6 @@ struct st21nfcb_i2c_phy {
 	unsigned int irq_polarity;
 
 	int powered;
-
-	/*
-	 * < 0 if hardware error occured (e.g. i2c err)
-	 * and prevents normal operation.
-	 */
-	int hard_fault;
 };
 
 #define I2C_DUMP_SKB(info, skb)					\
@@ -114,8 +108,8 @@ static int st21nfcb_nci_i2c_write(void *phy_id, struct sk_buff *skb)
 
 	I2C_DUMP_SKB("st21nfcb_nci_i2c_write", skb);
 
-	if (phy->hard_fault != 0)
-		return phy->hard_fault;
+	if (phy->ndlc->hard_fault != 0)
+		return phy->ndlc->hard_fault;
 
 	r = i2c_master_send(client, skb->data, skb->len);
 	if (r == -EREMOTEIO) {  /* Retry, chip was in standby */
@@ -218,7 +212,7 @@ static irqreturn_t st21nfcb_nci_irq_thread_fn(int irq, void *phy_id)
 	client = phy->i2c_dev;
 	dev_dbg(&client->dev, "IRQ\n");
 
-	if (phy->hard_fault)
+	if (phy->ndlc->hard_fault)
 		return IRQ_HANDLED;
 
 	if (!phy->powered) {
@@ -227,13 +221,8 @@ static irqreturn_t st21nfcb_nci_irq_thread_fn(int irq, void *phy_id)
 	}
 
 	r = st21nfcb_nci_i2c_read(phy, &skb);
-	if (r == -EREMOTEIO) {
-		phy->hard_fault = r;
-		ndlc_recv(phy->ndlc, NULL);
-		return IRQ_HANDLED;
-	} else if (r == -ENOMEM || r == -EBADMSG) {
+	if (r == -EREMOTEIO || r == -ENOMEM || r == -EBADMSG)
 		return IRQ_HANDLED;
-	}
 
 	ndlc_recv(phy->ndlc, skb);
 
diff --git a/drivers/nfc/st21nfcb/ndlc.h b/drivers/nfc/st21nfcb/ndlc.h
index c30a2f0..b28140e 100644
--- a/drivers/nfc/st21nfcb/ndlc.h
+++ b/drivers/nfc/st21nfcb/ndlc.h
@@ -42,6 +42,10 @@ struct llt_ndlc {
 
 	struct device *dev;
 
+	/*
+	 * < 0 if hardware error occured
+	 * and prevents normal operation.
+	 */
 	int hard_fault;
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
