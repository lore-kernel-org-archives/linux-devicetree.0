From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] musb: sunxi-glue: Fix sunxi-musb driver not auto-loading
Date: Mon, 21 Mar 2016 23:13:38 +0100
Message-ID: <1458598418-16959-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a missing MODULE_DEVICE_TABLE() line which was causing the
sunxi-musb glue to not auto-load when build as a module.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/musb/sunxi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index 4b472b8..9af9431 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -756,6 +756,7 @@ static const struct of_device_id sunxi_musb_match[] = {
 	{ .compatible = "allwinner,sun8i-a33-musb", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, sunxi_musb_match);
 
 static struct platform_driver sunxi_musb_driver = {
 	.probe = sunxi_musb_probe,
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
