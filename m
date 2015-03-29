From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] msub: sunxi: Add pre/post root reset end platform functions
Date: Sun, 29 Mar 2015 12:50:48 +0200
Message-ID: <1427626248-6257-4-git-send-email-hdegoede@redhat.com>
References: <1427626248-6257-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427626248-6257-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pre/post root reset end platform functions and make them call
sun4i_usb_phy_set_squelch_detect() to work around the sunxi usb otg phy
workaround.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/musb/sunxi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index ef91548..774312f 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -24,6 +24,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy-sun4i-usb.h>
 #include <linux/platform_device.h>
 #include <linux/soc/sunxi/sunxi_sram.h>
 #include <linux/usb/musb.h>
@@ -147,6 +148,20 @@ static void sunxi_musb_set_vbus(struct musb *musb, int is_on)
 	schedule_work(&glue->work);
 }
 
+void sunxi_musb_pre_root_reset_end(struct musb *musb)
+{
+	struct sunxi_glue *glue = dev_get_drvdata(musb->controller->parent);
+
+	sun4i_usb_phy_set_squelch_detect(glue->phy, false);
+}
+
+void sunxi_musb_post_root_reset_end(struct musb *musb)
+{
+	struct sunxi_glue *glue = dev_get_drvdata(musb->controller->parent);
+
+	sun4i_usb_phy_set_squelch_detect(glue->phy, true);
+}
+
 static irqreturn_t sunxi_musb_interrupt(int irq, void *__hci)
 {
 	struct musb *musb = __hci;
@@ -515,6 +530,8 @@ static const struct musb_platform_ops sunxi_musb_ops = {
 	.readw		= sunxi_musb_readw,
 	.writew		= sunxi_musb_writew,
 	.set_vbus	= sunxi_musb_set_vbus,
+	.pre_root_reset_end = sunxi_musb_pre_root_reset_end,
+	.post_root_reset_end = sunxi_musb_post_root_reset_end,
 };
 
 /* Allwinner OTG supports up to 5 endpoints */
-- 
2.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
