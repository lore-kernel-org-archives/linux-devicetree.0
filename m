From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 20/20] ARM: dts: sun8i: sina33: Enable USB hosts
Date: Fri,  5 Jun 2015 21:02:23 +0200
Message-ID: <1433530943-12599-21-git-send-email-hdegoede@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433530943-12599-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

The Sina33 SDK board exposes the EHCI/OHCI USB host pair.
VBUS for this port is always on and non-controllable.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
index 5788c29..1d5390d 100644
--- a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
+++ b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
@@ -63,6 +63,10 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &lradc {
 	vref-supply = <&reg_vcc3v0>;
 	status = "okay";
@@ -113,6 +117,10 @@
 	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &pio {
 	mmc0_cd_pin_sina33: mmc0_cd_pin@0 {
 		allwinner,pins = "PB4";
@@ -127,3 +135,8 @@
 	pinctrl-0 = <&uart0_pins_b>;
 	status = "okay";
 };
+
+&usbphy {
+	status = "okay";
+	usb1_vbus-supply = <&reg_vcc5v0>; /* USB1 VBUS is always on */
+};
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
