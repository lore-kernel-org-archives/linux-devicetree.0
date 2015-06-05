From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 17/20] ARM: dts: sun8i: Enable USB DRC on Ippo Q8H-A33 tablet
Date: Fri,  5 Jun 2015 21:02:20 +0200
Message-ID: <1433530943-12599-18-git-send-email-hdegoede@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433530943-12599-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the otg/drc usb controller on the Ippo Q8H-A33 tablet, for now it
is enabled in host-only mode, because true OTG support requires support
for detecting and enabling Vbus through the axp221 pmic.

For this to work the Vbus on the port must be enabled by u-boot,
or a powered hub must be used.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dts b/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dts
index 12dfb1e..dc14091 100644
--- a/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dts
+++ b/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dts
@@ -116,3 +116,12 @@
 	pinctrl-0 = <&r_uart_pins_a>;
 	status = "okay";
 };
+
+&usb_otg {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
