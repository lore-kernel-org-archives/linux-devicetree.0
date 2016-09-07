From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH resend 1/5] phy-sun4i-usb: Use bool where appropriate
Date: Wed,  7 Sep 2016 22:20:37 +0200
Message-ID: <20160907202041.17656-2-hdegoede@redhat.com>
References: <20160907202041.17656-1-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160907202041.17656-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
