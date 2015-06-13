From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 2/7] phy-sun4i-usb: Add extcon support for the otg phy (phy0)
Date: Sat, 13 Jun 2015 14:37:46 +0200
Message-ID: <1434199071-22127-3-git-send-email-hdegoede@redhat.com>
References: <1434199071-22127-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434199071-22127-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The sunxi musb glue needs to know if a host or normal usb cable is plugged
in, add extcon support so that the musb glue can monitor the host status.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
-Split out of the "Add id and vbus detection support" commit
-Ported to the new extcon API queued for 4.2
---
 drivers/phy/Kconfig         |  1 +
 drivers/phy/phy-sun4i-usb.c | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index a53bd5b..9841780 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -173,6 +173,7 @@ config PHY_SUN4I_USB
 	tristate "Allwinner sunxi SoC USB PHY driver"
 	depends on ARCH_SUNXI && HAS_IOMEM && OF
 	depends on RESET_CONTROLLER
+	depends on EXTCON
 	select GENERIC_PHY
 	help
 	  Enable this to support the transceiver that is part of Allwinner
diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index bdf63ad..86d9ce1 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -23,6 +23,7 @@
 
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/extcon.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -99,6 +100,7 @@ struct sun4i_usb_phy_data {
 		int index;
 	} phys[MAX_PHYS];
 	/* phy0 / otg related variables */
+	struct extcon_dev *extcon;
 	bool phy0_init;
 	bool phy0_poll;
 	struct gpio_desc *id_det_gpio;
@@ -343,7 +345,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	struct sun4i_usb_phy_data *data =
 		container_of(work, struct sun4i_usb_phy_data, detect.work);
 	struct phy *phy0 = data->phys[0].phy;
-	int id_det, vbus_det;
+	int id_det, vbus_det, id_notify = 0, vbus_notify = 0;
 
 	id_det = gpiod_get_value_cansleep(data->id_det_gpio);
 	vbus_det = gpiod_get_value_cansleep(data->vbus_det_gpio);
@@ -358,15 +360,24 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	if (id_det != data->id_det) {
 		sun4i_usb_phy0_set_id_detect(phy0, id_det);
 		data->id_det = id_det;
+		id_notify = 1;
 	}
 
 	if (vbus_det != data->vbus_det) {
 		sun4i_usb_phy0_set_vbus_detect(phy0, vbus_det);
 		data->vbus_det = vbus_det;
+		vbus_notify = 1;
 	}
 
 	mutex_unlock(&phy0->mutex);
 
+	if (id_notify)
+		extcon_set_cable_state_(data->extcon, EXTCON_USB_HOST,
+					!id_det);
+
+	if (vbus_notify)
+		extcon_set_cable_state_(data->extcon, EXTCON_USB, vbus_det);
+
 	if (data->phy0_poll)
 		queue_delayed_work(system_wq, &data->detect, POLL_TIME);
 }
@@ -407,6 +418,12 @@ static int sun4i_usb_phy_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const unsigned int sun4i_usb_phy0_cable[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+	EXTCON_NONE,
+};
+
 static int sun4i_usb_phy_probe(struct platform_device *pdev)
 {
 	struct sun4i_usb_phy_data *data;
@@ -466,6 +483,19 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (data->id_det_gpio) {
+		data->extcon = devm_extcon_dev_allocate(dev,
+							sun4i_usb_phy0_cable);
+		if (IS_ERR(data->extcon))
+			return PTR_ERR(data->extcon);
+
+		ret = devm_extcon_dev_register(dev, data->extcon);
+		if (ret) {
+			dev_err(dev, "failed to register extcon: %d\n", ret);
+			return ret;
+		}
+	}
+
 	for (i = 0; i < data->num_phys; i++) {
 		struct sun4i_usb_phy *phy = data->phys + i;
 		char name[16];
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
