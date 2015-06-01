From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] clk: sunxi: Add support for the usb-clk on sun8i a23 and a33 SoCs
Date: Mon,  1 Jun 2015 20:23:27 +0200
Message-ID: <1433183008-13086-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The usb-clk on sun8i a23 and a33 SoCs is similar to the ones found
on sun6i-a31 SoCs but instead of a 3th phy the a23 / a33 have a hsic
interface which gets enabled by almost the same bits as used on
the a31 for the 3th phy, but not exactly the same bits so we need
a new compatible for this.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-usb.c                       | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 4fa11af..8a47b77 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -67,6 +67,7 @@ Required properties:
 	"allwinner,sun4i-a10-usb-clk" - for usb gates + resets on A10 / A20
 	"allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
 	"allwinner,sun6i-a31-usb-clk" - for usb gates + resets on A31
+	"allwinner,sun8i-a23-usb-clk" - for usb gates + resets on A23
 	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 
diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
index a86ed2f..3a25f95 100644
--- a/drivers/clk/sunxi/clk-usb.c
+++ b/drivers/clk/sunxi/clk-usb.c
@@ -204,6 +204,17 @@ static void __init sun6i_a31_usb_setup(struct device_node *node)
 }
 CLK_OF_DECLARE(sun6i_a31_usb, "allwinner,sun6i-a31-usb-clk", sun6i_a31_usb_setup);
 
+static const struct usb_clk_data sun8i_a23_usb_clk_data __initconst = {
+	.clk_mask = BIT(16) | BIT(11) | BIT(10) | BIT(9) | BIT(8),
+	.reset_mask = BIT(2) | BIT(1) | BIT(0),
+};
+
+static void __init sun8i_a23_usb_setup(struct device_node *node)
+{
+	sunxi_usb_clk_setup(node, &sun8i_a23_usb_clk_data, &sun4i_a10_usb_lock);
+}
+CLK_OF_DECLARE(sun8i_a23_usb, "allwinner,sun8i-a23-usb-clk", sun8i_a23_usb_setup);
+
 static const struct usb_clk_data sun9i_a80_usb_mod_data __initconst = {
 	.clk_mask = BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2) | BIT(1),
 	.reset_mask = BIT(19) | BIT(18) | BIT(17),
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
