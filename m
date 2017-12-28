From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i: Fix power for USB Ethernet controller
Date: Thu, 28 Dec 2017 13:52:22 +0100
Message-ID: <20171228125222.12942-1-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: icenowy-h8G6r0blFSE@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The RTL8152B USB controller needs a 3.3 volt power supply which is
controlled by PAD20. Without this patch Linux will not see that there is
a device connected to the USB bus and the 2. USB port will not work.

I do not of a better solution to add a regulator to a USB device.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
index 32a6d312422e..1d5db0e0bd12 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
@@ -47,13 +47,15 @@
 	model = "Xunlong Orange Pi R1";
 	compatible = "xunlong,orangepi-r1", "allwinner,sun8i-h2-plus";
 
-	/delete-node/ reg_vcc_wifi;
-
 	aliases {
 		ethernet1 = &rtl8189etv;
 	};
 };
 
+&reg_vcc_wifi {
+	regulator-always-on;
+};
+
 &ohci1 {
 	/*
 	 * RTL8152B USB-Ethernet adapter is connected to USB1,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
