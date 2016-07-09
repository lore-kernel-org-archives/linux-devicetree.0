From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: sun8i: Add ethernet1 alias to Orange Pi 2 dts
Date: Sat,  9 Jul 2016 22:21:57 +0200
Message-ID: <1468095718-18515-3-git-send-email-hdegoede@redhat.com>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468095718-18515-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This will allow u-boot to fill in a mac-address for Orange Pi 2
variants which use an sdio wifi without an eeprom for the mac.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index f93f5d1..f89fe00 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -54,6 +54,8 @@
 
 	aliases {
 		serial0 = &uart0;
+		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
+		ethernet1 = &rtl8189;
 	};
 
 	chosen {
@@ -131,6 +133,14 @@
 	bus-width = <4>;
 	non-removable;
 	status = "okay";
+
+	/*
+	 * Explicitly define the sdio device, so that we can add an ethernet
+	 * alias for it (which e.g. makes u-boot set a mac-address).
+	 */
+	rtl8189: sdio_wifi@1 {
+		reg = <1>;
+	};
 };
 
 &pio {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
