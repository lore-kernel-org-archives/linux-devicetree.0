From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH] ARM: dts: imx23-olinuxino: Fix dr_mode of usb0
Date: Tue, 14 Apr 2015 20:37:26 +0000
Message-ID: <1429043846-28731-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The dr_mode of usb0 on imx233-olinuxino is left to default "otg".
Since the green LED (GPIO2_1) on imx233-olinuxino is connected to the
same pin as USB_OTG_ID it's possible to disable USB host by LED toggling:

echo 0 > /sys/class/leds/green/brightness
[ 1068.890000] ci_hdrc ci_hdrc.0: remove, state 1
[ 1068.890000] usb usb1: USB disconnect, device number 1
[ 1068.920000] usb 1-1: USB disconnect, device number 2
[ 1068.920000] usb 1-1.1: USB disconnect, device number 3
[ 1069.070000] usb 1-1.2: USB disconnect, device number 4
[ 1069.450000] ci_hdrc ci_hdrc.0: USB bus 1 deregistered
[ 1074.460000] ci_hdrc ci_hdrc.0: timeout waiting for 00000800 in 11

This patch fixes the issue by setting dr_mode to "host" in the dts file.

Reported-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/imx23-olinuxino.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx23-olinuxino.dts b/arch/arm/boot/dts/imx23-olinuxino.dts
index 7e6eef2..3b2d74d 100644
--- a/arch/arm/boot/dts/imx23-olinuxino.dts
+++ b/arch/arm/boot/dts/imx23-olinuxino.dts
@@ -93,6 +93,7 @@
 
 	ahb@80080000 {
 		usb0: usb@80080000 {
+			dr_mode = "host";
 			vbus-supply = <&reg_usb0_vbus>;
 			status = "okay";
 		};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
