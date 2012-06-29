From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 10/14] usb: otg: add notify_connect/notify_disconnect callback
Date: Fri, 29 Jun 2012 17:48:58 +0800
Message-ID: <1340963342-28735-11-git-send-email-richard.zhao@freescale.com>
References: <1340963342-28735-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340963342-28735-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This let usb phy driver has a chance to change hw settings when connect
status change.

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
---
 include/linux/usb/otg.h |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
index 38ab3f4..6dfdc8d 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -117,6 +117,9 @@ struct usb_phy {
 	int	(*set_suspend)(struct usb_phy *x,
 				int suspend);
 
+	/* notify phy connect status change */
+	int	(*notify_connect)(struct usb_phy *x, int port);
+	int	(*notify_disconnect)(struct usb_phy *x, int port);
 };
 
 
@@ -252,6 +255,24 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
 }
 
 static inline int
+usb_phy_notify_connect(struct usb_phy *x, int port)
+{
+	if (x->notify_connect)
+		return x->notify_connect(x, port);
+	else
+		return 0;
+}
+
+static inline int
+usb_phy_notify_disconnect(struct usb_phy *x, int port)
+{
+	if (x->notify_disconnect)
+		return x->notify_disconnect(x, port);
+	else
+		return 0;
+}
+
+static inline int
 otg_start_srp(struct usb_otg *otg)
 {
 	if (otg && otg->start_srp)
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
