From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v3 06/11] usb: phy: add notify suspend and resume callback
Date: Tue, 5 Nov 2013 09:49:38 +0800
Message-ID: <1383616183-10511-7-git-send-email-peter.chen@freescale.com>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, peter.chen@freescale.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
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
1.7.1
