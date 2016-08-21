From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/7] phy-sun4i-usb: Use bool where appropriate
Date: Sun, 21 Aug 2016 14:16:33 +0200
Message-ID: <1471781799-10457-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We're using bool as true/false type in most places in phy-sun4i-usb.c
for consistency fixup the remaining uses of ints which are ever only
0 or 1 to be bools too.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-No changes
Changes in v3:
-No changes
---
 drivers/phy/phy-sun4i-usb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index fcf4d95e..1cb84a8 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -445,7 +445,8 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	struct sun4i_usb_phy_data *data =
 		container_of(work, struct sun4i_usb_phy_data, detect.work);
 	struct phy *phy0 = data->phys[0].phy;
-	int id_det, vbus_det, id_notify = 0, vbus_notify = 0;
+	bool id_notify = false, vbus_notify = false;
+	int id_det, vbus_det;
 
 	if (phy0 == NULL)
 		return;
@@ -474,13 +475,13 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 		}
 		sun4i_usb_phy0_set_id_detect(phy0, id_det);
 		data->id_det = id_det;
-		id_notify = 1;
+		id_notify = true;
 	}
 
 	if (vbus_det != data->vbus_det) {
 		sun4i_usb_phy0_set_vbus_detect(phy0, vbus_det);
 		data->vbus_det = vbus_det;
-		vbus_notify = 1;
+		vbus_notify = true;
 	}
 
 	mutex_unlock(&phy0->mutex);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
