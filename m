From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 4/7] phy-sun4i-usb: Add support for phy_set_mode
Date: Sun, 21 Aug 2016 14:16:36 +0200
Message-ID: <1471781799-10457-4-git-send-email-hdegoede@redhat.com>
References: <1471781799-10457-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471781799-10457-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Together with some musb sunxi glue changes this allows run-time dr_mode
switching support via the "mode" musb sysfs attribute.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-No changes
Changes in v3:
-Fix switch-case code style
---
 drivers/phy/phy-sun4i-usb.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index fb2d4f3..af42f8d 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -427,6 +427,35 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	return 0;
 }
 
+static int sun4i_usb_phy_set_mode(struct phy *_phy, enum phy_mode mode)
+{
+	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
+	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+
+	if (phy->index != 0)
+		return -EINVAL;
+
+	switch (mode) {
+	case PHY_MODE_USB_HOST:
+		data->dr_mode = USB_DR_MODE_HOST;
+		break;
+	case PHY_MODE_USB_DEVICE:
+		data->dr_mode = USB_DR_MODE_PERIPHERAL;
+		break;
+	case PHY_MODE_USB_OTG:
+		data->dr_mode = USB_DR_MODE_OTG;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_info(&_phy->dev, "Changing dr_mode to %d\n", (int)data->dr_mode);
+	data->force_session_end = true;
+	queue_delayed_work(system_wq, &data->detect, 0);
+
+	return 0;
+}
+
 void sun4i_usb_phy_set_squelch_detect(struct phy *_phy, bool enabled)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
@@ -440,6 +469,7 @@ static const struct phy_ops sun4i_usb_phy_ops = {
 	.exit		= sun4i_usb_phy_exit,
 	.power_on	= sun4i_usb_phy_power_on,
 	.power_off	= sun4i_usb_phy_power_off,
+	.set_mode	= sun4i_usb_phy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
