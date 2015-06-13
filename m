From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 6/7] phy-sun4i-usb: Add support for boards
 with broken Vusb-detection
Date: Sat, 13 Jun 2015 14:37:50 +0200
Message-ID: <1434199071-22127-7-git-send-email-hdegoede@redhat.com>
References: <1434199071-22127-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBNOI6CVQKGQENHXLZYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1434199071-22127-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On some boards we cannot detect the presence of an external Vusb, because
e.g. the 5V of the otg connector is directly connected to the 5V of the board,
and thus is always high.

This commit adds support for using such boards by only looking at the
id-detection pin.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index 5060257..0681641 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/extcon.h>
 #include <linux/io.h>
@@ -309,7 +310,7 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
 	phy->regulator_on = true;
 
 	/* We must report Vbus high within OTG_TIME_A_WAIT_VRISE msec. */
-	if (phy->index == 0 && data->phy0_poll)
+	if (phy->index == 0 && data->vbus_det_gpio && data->phy0_poll)
 		mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
 
 	return 0;
@@ -330,7 +331,7 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	 * phy0 vbus typically slowly discharges, sometimes this causes the
 	 * Vbus gpio to not trigger an edge irq on Vbus off, so force a rescan.
 	 */
-	if (phy->index == 0 && !data->phy0_poll)
+	if (phy->index == 0 && data->vbus_det_gpio && !data->phy0_poll)
 		mod_delayed_work(system_wq, &data->detect, POLL_TIME);
 
 	return 0;
@@ -359,7 +360,10 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	int id_det, vbus_det, id_notify = 0, vbus_notify = 0;
 
 	id_det = gpiod_get_value_cansleep(data->id_det_gpio);
-	vbus_det = gpiod_get_value_cansleep(data->vbus_det_gpio);
+	if (data->vbus_det_gpio)
+		vbus_det = gpiod_get_value_cansleep(data->vbus_det_gpio);
+	else
+		vbus_det = 1; /* Report vbus as high */
 
 	mutex_lock(&phy0->mutex);
 
@@ -369,6 +373,16 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	}
 
 	if (id_det != data->id_det) {
+		/*
+		 * When a host cable (id == 0) gets plugged in on systems
+		 * without vbus detection report vbus low for long enough for
+		 * the musb-ip to end the current device session.
+		 */
+		if (!data->vbus_det_gpio && id_det == 0) {
+			sun4i_usb_phy0_set_vbus_detect(phy0, 0);
+			msleep(200);
+			sun4i_usb_phy0_set_vbus_detect(phy0, 1);
+		}
 		sun4i_usb_phy0_set_id_detect(phy0, id_det);
 		data->id_det = id_det;
 		id_notify = 1;
@@ -382,9 +396,22 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 
 	mutex_unlock(&phy0->mutex);
 
-	if (id_notify)
+	if (id_notify) {
 		extcon_set_cable_state_(data->extcon, EXTCON_USB_HOST,
 					!id_det);
+		/*
+		 * When a host cable gets unplugged (id == 1) on systems
+		 * without vbus detection report vbus low for long enough to
+		 * the musb-ip to end the current host session.
+		 */
+		if (!data->vbus_det_gpio && id_det == 1) {
+			mutex_lock(&phy0->mutex);
+			sun4i_usb_phy0_set_vbus_detect(phy0, 0);
+			msleep(1000);
+			sun4i_usb_phy0_set_vbus_detect(phy0, 1);
+			mutex_unlock(&phy0->mutex);
+		}
+	}
 
 	if (vbus_notify)
 		extcon_set_cable_state_(data->extcon, EXTCON_USB, vbus_det);
@@ -495,9 +522,9 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 		data->vbus_det_gpio = NULL;
 	}
 
-	/* We either want both gpio pins or neither (when in host mode) */
-	if (!data->id_det_gpio != !data->vbus_det_gpio) {
-		dev_err(dev, "failed to get id or vbus detect pin\n");
+	/* vbus_det without id_det makes no sense, and is not supported */
+	if (data->vbus_det_gpio && !data->id_det_gpio) {
+		dev_err(dev, "usb0_id_det missing or invalid\n");
 		return -ENODEV;
 	}
 
@@ -565,7 +592,8 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 
 	data->id_det_irq = gpiod_to_irq(data->id_det_gpio);
 	data->vbus_det_irq = gpiod_to_irq(data->vbus_det_gpio);
-	if (data->id_det_irq  < 0 || data->vbus_det_irq < 0)
+	if ((data->id_det_gpio && data->id_det_irq < 0) ||
+	    (data->vbus_det_gpio && data->vbus_det_irq < 0))
 		data->phy0_poll = true;
 
 	if (data->id_det_irq >= 0) {
-- 
2.4.3
