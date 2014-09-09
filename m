From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: imx: ventana: remove unused aliases
Date: Mon,  8 Sep 2014 23:07:27 -0700
Message-ID: <1410242851-30765-3-git-send-email-tharvey@gateworks.com>
References: <1410242851-30765-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410242851-30765-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove aliases that are either not used by bootloader or are provided via
included dtsi files.

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-gw5400-a.dts  | 3 ---
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi | 2 --
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 2 --
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi | 4 ----
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 4 ----
 5 files changed, 15 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-gw5400-a.dts b/arch/arm/boot/dts/imx6q-gw5400-a.dts
index d1ab780..035f2b1 100644
--- a/arch/arm/boot/dts/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/imx6q-gw5400-a.dts
@@ -18,7 +18,6 @@
 
 	/* these are used by bootloader for disabling nodes */
 	aliases {
-		ethernet0 = &fec;
 		ethernet1 = &eth1;
 		i2c0 = &i2c1;
 		i2c1 = &i2c2;
@@ -26,12 +25,10 @@
 		led0 = &led0;
 		led1 = &led1;
 		led2 = &led2;
-		sky2 = &eth1;
 		ssi0 = &ssi1;
 		spi0 = &ecspi1;
 		usb0 = &usbh1;
 		usb1 = &usbotg;
-		usdhc2 = &usdhc3;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
index f36492c..482ef28 100644
--- a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
@@ -12,8 +12,6 @@
 / {
 	/* these are used by bootloader for disabling nodes */
 	aliases {
-		can0 = &can1;
-		ethernet0 = &fec;
 		led0 = &led0;
 		led1 = &led1;
 		nand = &gpmi;
diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
index 0b65c7d..f8c4ab4 100644
--- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
@@ -12,7 +12,6 @@
 / {
 	/* these are used by bootloader for disabling nodes */
 	aliases {
-		ethernet0 = &fec;
 		led0 = &led0;
 		led1 = &led1;
 		led2 = &led2;
@@ -20,7 +19,6 @@
 		ssi0 = &ssi1;
 		usb0 = &usbh1;
 		usb1 = &usbotg;
-		usdhc2 = &usdhc3;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
index 0488cd1..01edfd99 100644
--- a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
@@ -12,18 +12,14 @@
 / {
 	/* these are used by bootloader for disabling nodes */
 	aliases {
-		can0 = &can1;
-		ethernet0 = &fec;
 		ethernet1 = &eth1;
 		led0 = &led0;
 		led1 = &led1;
 		led2 = &led2;
 		nand = &gpmi;
-		sky2 = &eth1;
 		ssi0 = &ssi1;
 		usb0 = &usbh1;
 		usb1 = &usbotg;
-		usdhc2 = &usdhc3;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index 620e4cf..fab9c7a 100644
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@ -12,18 +12,14 @@
 / {
 	/* these are used by bootloader for disabling nodes */
 	aliases {
-		can0 = &can1;
-		ethernet0 = &fec;
 		ethernet1 = &eth1;
 		led0 = &led0;
 		led1 = &led1;
 		led2 = &led2;
 		nand = &gpmi;
-		sky2 = &eth1;
 		ssi0 = &ssi1;
 		usb0 = &usbh1;
 		usb1 = &usbotg;
-		usdhc2 = &usdhc3;
 	};
 
 	chosen {
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
