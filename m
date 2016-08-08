From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/8] ARM: dts: sun8i: Add touchscreen node for sun8i-a23-inet86dz
Date: Mon,  8 Aug 2016 21:43:15 +0200
Message-ID: <1470685398-14568-5-git-send-email-hdegoede@redhat.com>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470685398-14568-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The inet86dz tablet has a gsl1680 touchscreen,
add a dt node describing it.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23-inet86dz.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-inet86dz.dts b/arch/arm/boot/dts/sun8i-a23-inet86dz.dts
index 0f9f71b..9972021 100644
--- a/arch/arm/boot/dts/sun8i-a23-inet86dz.dts
+++ b/arch/arm/boot/dts/sun8i-a23-inet86dz.dts
@@ -53,6 +53,13 @@
 	status = "okay";
 };
 
+&gsl1680 {
+	touchscreen-size-x = <960>;
+	touchscreen-size-y = <640>;
+	touchscreen-fw-name = "silead/gsl1680-inet86dz.fw";
+	status = "okay";
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_dldo1>;
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
