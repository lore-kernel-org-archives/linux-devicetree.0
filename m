From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v5 07/15] usb: phy: add notify suspend and resume callback
Date: Mon, 9 Dec 2013 14:30:56 +0800
Message-ID: <1386570664-6713-8-git-send-email-peter.chen@freescale.com>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386570664-6713-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

They are used to notify PHY that the controller enters suspend
or finishes resume.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
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


