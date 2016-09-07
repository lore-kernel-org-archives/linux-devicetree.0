From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH resend 2/5] phy-sun4i-usb: Refactor forced session ending
Date: Wed,  7 Sep 2016 22:20:38 +0200
Message-ID: <20160907202041.17656-3-hdegoede@redhat.com>
References: <20160907202041.17656-1-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160907202041.17656-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The phy-sun4i-usb code supports forced ending a session on systems
which lack Vbus detection, to allow switching between host and peripheral
mode on such systems.

Role switching via the musb driver "mode" sysfs attribute requires force
ending the session too. This commit refactors the code to allow other
parts of the phy-sun4i-usb code to request a forced session end.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-No changes
Changes in v3:
-No changes
---
 drivers/phy/phy-sun4i-usb.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index 1cb84a8..02cb65e 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -133,6 +133,7 @@ struct sun4i_usb_phy_data {
 	struct power_supply *vbus_power_supply;
 	struct notifier_block vbus_power_nb;
 	bool vbus_power_nb_registered;
+	bool force_session_end;
 	int id_det_irq;
 	int vbus_det_irq;
 	int id_det;
@@ -445,7 +446,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	struct sun4i_usb_phy_data *data =
 		container_of(work, struct sun4i_usb_phy_data, detect.work);
 	struct phy *phy0 = data->phys[0].phy;
-	bool id_notify = false, vbus_notify = false;
+	bool force_session_end, id_notify = false, vbus_notify = false;
 	int id_det, vbus_det;
 
 	if (phy0 == NULL)
@@ -461,14 +462,17 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 		return;
 	}
 
+	force_session_end = data->force_session_end;
+	data->force_session_end = false;
+
 	if (id_det != data->id_det) {
-		/*
-		 * When a host cable (id == 0) gets plugged in on systems
-		 * without vbus detection report vbus low for long enough for
-		 * the musb-ip to end the current device session.
-		 */
+		/* id-change, force session end if we've no vbus detection */
 		if (data->dr_mode == USB_DR_MODE_OTG &&
-		    !sun4i_usb_phy0_have_vbus_det(data) && id_det == 0) {
+		    !sun4i_usb_phy0_have_vbus_det(data))
+			force_session_end = true;
+
+		/* When entering host mode (id = 0) force end the session now */
+		if (force_session_end && id_det == 0) {
 			sun4i_usb_phy0_set_vbus_detect(phy0, 0);
 			msleep(200);
 			sun4i_usb_phy0_set_vbus_detect(phy0, 1);
@@ -489,13 +493,8 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	if (id_notify) {
 		extcon_set_cable_state_(data->extcon, EXTCON_USB_HOST,
 					!id_det);
-		/*
-		 * When a host cable gets unplugged (id == 1) on systems
-		 * without vbus detection report vbus low for long enough to
-		 * the musb-ip to end the current host session.
-		 */
-		if (data->dr_mode == USB_DR_MODE_OTG &&
-		    !sun4i_usb_phy0_have_vbus_det(data) && id_det == 1) {
+		/* When leaving host mode force end the session here */
+		if (force_session_end && id_det == 1) {
 			mutex_lock(&phy0->mutex);
 			sun4i_usb_phy0_set_vbus_detect(phy0, 0);
 			msleep(1000);
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
