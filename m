From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v6 07/15] usb: phy: add notify suspend and resume callback
Date: Fri, 13 Dec 2013 09:23:37 +0800
Message-ID: <1386897825-6130-8-git-send-email-peter.chen@freescale.com>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386897825-6130-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

They are used to notify PHY that the controller enters suspend
or finishes resume.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 include/linux/usb/phy.h |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
index 6c0b1c5..a747960 100644
--- a/include/linux/usb/phy.h
+++ b/include/linux/usb/phy.h
@@ -116,6 +116,11 @@ struct usb_phy {
 			enum usb_device_speed speed);
 	int	(*notify_disconnect)(struct usb_phy *x,
 			enum usb_device_speed speed);
+	int	(*notify_suspend)(struct usb_phy *x,
+			enum usb_device_speed speed);
+	int	(*notify_resume)(struct usb_phy *x,
+			enum usb_device_speed speed);
+
 };
 
 /**
@@ -282,6 +287,24 @@ usb_phy_notify_disconnect(struct usb_phy *x, enum usb_device_speed speed)
 		return 0;
 }
 
+static inline int usb_phy_notify_suspend
+	(struct usb_phy *x, enum usb_device_speed speed)
+{
+	if (x && x->notify_suspend)
+		return x->notify_suspend(x, speed);
+	else
+		return 0;
+}
+
+static inline int usb_phy_notify_resume
+	(struct usb_phy *x, enum usb_device_speed speed)
+{
+	if (x && x->notify_resume)
+		return x->notify_resume(x, speed);
+	else
+		return 0;
+}
+
 /* notifiers */
 static inline int
 usb_register_notifier(struct usb_phy *x, struct notifier_block *nb)
-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
