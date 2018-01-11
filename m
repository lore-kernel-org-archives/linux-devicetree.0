From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i: acivate SPI on Orange Pi R1
Date: Thu, 11 Jan 2018 22:53:55 +0100
Message-ID: <20180111215355.22182-1-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: icenowy-h8G6r0blFSE@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This board has a SPI flash, activate it also in device tree by default.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
index 112f09c67d67..3356f4210d45 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
@@ -68,6 +68,14 @@
 	};
 };
 
+&spi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "mxicy,mx25l12805d", "jedec,spi-nor";
+	};
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
