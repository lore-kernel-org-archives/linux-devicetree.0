From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 09/11] usb: phy: Add set_wakeup API
Date: Tue, 5 Nov 2013 09:49:41 +0800
Message-ID: <1383616183-10511-10-git-send-email-peter.chen@freescale.com>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383616183-10511-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This API is used to set wakeup enable at PHY registers, in that
case, the PHY can be waken up from suspend due to external events,
like vbus change, dp/dm change and id change.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 include/linux/usb/phy.h |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
index a747960..c6ebe1d 100644
--- a/include/linux/usb/phy.h
+++ b/include/linux/usb/phy.h
@@ -111,6 +111,13 @@ struct usb_phy {
 	int	(*set_suspend)(struct usb_phy *x,
 				int suspend);
 
+	/*
+	 * Set wakeup enable for PHY, in that case, the PHY can be
+	 * waken up from suspend status due to external events,
+	 * like vbus change, dp/dm change and id.
+	 */
+	int	(*set_wakeup)(struct usb_phy *x, bool enabled);
+
 	/* notify phy connect status change */
 	int	(*notify_connect)(struct usb_phy *x,
 			enum usb_device_speed speed);
@@ -270,6 +277,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
 }
 
 static inline int
+usb_phy_set_wakeup(struct usb_phy *x, bool enabled)
+{
+	if (x && x->set_wakeup)
+		return x->set_wakeup(x, enabled);
+	else
+		return 0;
+}
+
+static inline int
 usb_phy_notify_connect(struct usb_phy *x, enum usb_device_speed speed)
 {
 	if (x && x->notify_connect)
-- 
1.7.1


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
