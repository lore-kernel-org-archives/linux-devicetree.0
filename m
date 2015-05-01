From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 12/14] nfc: st21nfcb: disable irq when st21nfcb is disabled
Date: Fri,  1 May 2015 22:19:35 +0200
Message-ID: <1430511577-19678-13-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

When st21nfcb is disabled, the irq line may remain active while no data
are available flooding the system with irrelevant i2c transaction.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 41b5bdb..dbc0dfd 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -70,6 +70,9 @@ static int st21nfcb_nci_i2c_enable(void *phy_id)
 	gpio_set_value(phy->gpio_reset, 1);
 	usleep_range(80000, 85000);
 
+	if (phy->ndlc->powered == 0)
+		enable_irq(phy->i2c_dev->irq);
+
 	return 0;
 }
 
@@ -77,10 +80,7 @@ static void st21nfcb_nci_i2c_disable(void *phy_id)
 {
 	struct st21nfcb_i2c_phy *phy = phy_id;
 
-	/* reset chip in order to flush clf */
-	gpio_set_value(phy->gpio_reset, 0);
-	usleep_range(10000, 15000);
-	gpio_set_value(phy->gpio_reset, 1);
+	disable_irq_nosync(phy->i2c_dev->irq);
 }
 
 /*
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
