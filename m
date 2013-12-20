From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v7 11/14] usb: phy: Add set_wakeup API
Date: Fri, 20 Dec 2013 15:52:07 +0800
Message-ID: <1387525930-27313-12-git-send-email-peter.chen@freescale.com>
References: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This API is used to set wakeup enable at PHY registers, in that
case, the PHY can be waken up from suspend due to external events,
like vbus change, dp/dm change and id change.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 include/linux/usb/phy.h |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
index 6c0b1c5..c2c6f49 100644
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
@@ -265,6 +272,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
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
1.7.8


