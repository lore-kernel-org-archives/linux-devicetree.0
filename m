From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH] ARM: dts: am33xx: Move the cppi41dma node so it's probed early
Date: Tue, 22 Apr 2014 11:19:31 -0300
Message-ID: <1398176371-26468-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DMA controller is needed for the USB controller to be correctly
registered. Therefore, if the DMA node is located at the end an unecessary
probe deferral is produced systematically.

This is easily fixed by moving the node at the beggining of the child list,
so it's probed first.

Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
---
Felipe, Sebastian:

I cannot see why the cppi41dma node must be placed inside the
"ti,am33xx-usb" compatible node. Tried to move it out
so it's probed just like the edma engine, but the USB doesn't work
properly in that case.

Can you enlighten me?

In any case, this change is good enough to remove the deferral probe.

Thanks!

 arch/arm/boot/dts/am33xx.dtsi | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 9770e35..c673be4 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -453,6 +453,21 @@
 			ti,hwmods = "usb_otg_hs";
 			status = "disabled";
 
+			cppi41dma: dma-controller@47402000 {
+				compatible = "ti,am3359-cppi41";
+				reg =  <0x47400000 0x1000
+					0x47402000 0x1000
+					0x47403000 0x1000
+					0x47404000 0x4000>;
+				reg-names = "glue", "controller", "scheduler", "queuemgr";
+				interrupts = <17>;
+				interrupt-names = "glue";
+				#dma-cells = <2>;
+				#dma-channels = <30>;
+				#dma-requests = <256>;
+				status = "disabled";
+			};
+
 			usb_ctrl_mod: control@44e10620 {
 				compatible = "ti,am335x-usb-ctrl-module";
 				reg = <0x44e10620 0x10
@@ -556,20 +571,6 @@
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
-				compatible = "ti,am3359-cppi41";
-				reg =  <0x47400000 0x1000
-					0x47402000 0x1000
-					0x47403000 0x1000
-					0x47404000 0x4000>;
-				reg-names = "glue", "controller", "scheduler", "queuemgr";
-				interrupts = <17>;
-				interrupt-names = "glue";
-				#dma-cells = <2>;
-				#dma-channels = <30>;
-				#dma-requests = <256>;
-				status = "disabled";
-			};
 		};
 
 		epwmss0: epwmss@48300000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
