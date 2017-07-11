From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] ARM: dts: meson8b: use the existing wdt node to override the compatible
Date: Wed, 12 Jul 2017 00:22:22 +0200
Message-ID: <20170711222222.11023-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Meson8b has to define it's own compatible string for the watchdog. This
patch removes the duplicate resource (register region and interrupt)
definition from meson8b.dtsi and simply re-uses these values from
meson.dtsi (as the register offset, size and interrupt are identical).

This is purely cosmetic and does not change any functionality.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8b.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 65b36c944b45..8fce13844b0c 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -136,12 +136,6 @@
 		status = "disabled";
 	};
 
-	wdt: watchdog@9900 {
-		compatible = "amlogic,meson8b-wdt";
-		reg = <0x9900 0x8>;
-		interrupts = <0 0 1>;
-	};
-
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8b-cbus-pinctrl";
 		reg = <0x9880 0x10>;
@@ -236,3 +230,7 @@
 	clock-names = "usb_general", "usb";
 	resets = <&reset RESET_USB_OTG>;
 };
+
+&wdt {
+	compatible = "amlogic,meson8b-wdt";
+};
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
