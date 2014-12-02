From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 01/13] NFC: st21nfcb: Remove useless pr_info
Date: Tue,  2 Dec 2014 21:27:46 +0100
Message-ID: <1417552078-9269-2-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

- pr_info in st21nfcb_nci_i2c_disable is not necessary

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/i2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index e0c4901..363c2fc 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -80,8 +80,6 @@ static void st21nfcb_nci_i2c_disable(void *phy_id)
 {
 	struct st21nfcb_i2c_phy *phy = phy_id;
 
-	pr_info("\n");
-
 	phy->powered = 0;
 	/* reset chip in order to flush clf */
 	gpio_set_value(phy->gpio_reset, 0);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
