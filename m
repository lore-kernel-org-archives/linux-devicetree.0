From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/10] NFC: st21nfca: Free buffer when a bad frame is detected
Date: Thu, 24 Apr 2014 23:19:35 +0200
Message-ID: <1398374379-17133-7-git-send-email-christophe-h.ricard@st.com>
References: <1398374379-17133-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398374379-17133-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

When a bad frame is detected for a bad crc.
We were reallocating and loosing the previous frame pointer.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index ef5e648..9a7f190 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -475,6 +475,7 @@ static irqreturn_t st21nfca_hci_irq_thread_fn(int irq, void *phy_id)
 		msleep(wait_tab[phy->crc_trials]);
 		phy->crc_trials++;
 		phy->current_read_len = 0;
+		kfree_skb(phy->pending_skb);
 	} else if (r > 0) {
 		/*
 		 * We succeeded to read data from the CLF and
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
