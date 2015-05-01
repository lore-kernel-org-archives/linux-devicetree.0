From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 09/14] nfc: st21nfcb: Move powered flag from phy to ndlc layer
Date: Fri,  1 May 2015 22:19:32 +0200
Message-ID: <1430511577-19678-10-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The powered flag can be set from the ndlc_open and ndlc_close layer.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c  | 6 +-----
 drivers/nfc/st21nfcb/ndlc.c | 3 +++
 drivers/nfc/st21nfcb/ndlc.h | 1 +
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index c44f8cf..41b5bdb 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -52,8 +52,6 @@ struct st21nfcb_i2c_phy {
 
 	unsigned int gpio_reset;
 	unsigned int irq_polarity;
-
-	int powered;
 };
 
 #define I2C_DUMP_SKB(info, skb)					\
@@ -70,7 +68,6 @@ static int st21nfcb_nci_i2c_enable(void *phy_id)
 	gpio_set_value(phy->gpio_reset, 0);
 	usleep_range(10000, 15000);
 	gpio_set_value(phy->gpio_reset, 1);
-	phy->powered = 1;
 	usleep_range(80000, 85000);
 
 	return 0;
@@ -80,7 +77,6 @@ static void st21nfcb_nci_i2c_disable(void *phy_id)
 {
 	struct st21nfcb_i2c_phy *phy = phy_id;
 
-	phy->powered = 0;
 	/* reset chip in order to flush clf */
 	gpio_set_value(phy->gpio_reset, 0);
 	usleep_range(10000, 15000);
@@ -203,7 +199,7 @@ static irqreturn_t st21nfcb_nci_irq_thread_fn(int irq, void *phy_id)
 	if (phy->ndlc->hard_fault)
 		return IRQ_HANDLED;
 
-	if (!phy->powered) {
+	if (!phy->ndlc->powered) {
 		st21nfcb_nci_i2c_disable(phy);
 		return IRQ_HANDLED;
 	}
diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
index 429cf05..3ee22b4 100644
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -59,6 +59,7 @@ int ndlc_open(struct llt_ndlc *ndlc)
 {
 	/* toggle reset pin */
 	ndlc->ops->enable(ndlc->phy_id);
+	ndlc->powered = 1;
 	return 0;
 }
 EXPORT_SYMBOL(ndlc_open);
@@ -67,6 +68,7 @@ void ndlc_close(struct llt_ndlc *ndlc)
 {
 	/* toggle reset pin */
 	ndlc->ops->disable(ndlc->phy_id);
+	ndlc->powered = 0;
 }
 EXPORT_SYMBOL(ndlc_close);
 
@@ -262,6 +264,7 @@ int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct device *dev,
 	ndlc->ops = phy_ops;
 	ndlc->phy_id = phy_id;
 	ndlc->dev = dev;
+	ndlc->powered = 0;
 
 	*ndlc_id = ndlc;
 
diff --git a/drivers/nfc/st21nfcb/ndlc.h b/drivers/nfc/st21nfcb/ndlc.h
index b28140e..cf6a9d9 100644
--- a/drivers/nfc/st21nfcb/ndlc.h
+++ b/drivers/nfc/st21nfcb/ndlc.h
@@ -47,6 +47,7 @@ struct llt_ndlc {
 	 * and prevents normal operation.
 	 */
 	int hard_fault;
+	int powered;
 };
 
 int ndlc_open(struct llt_ndlc *ndlc);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
