From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: dts: mt8127: correct uart instance address
Date: Sat, 16 May 2015 15:30:11 +0800
Message-ID: <1431761411-29516-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This is based on v4.1-rc1

------------8<-------------------------------------------
The instance address for uart nodes are incorrect. Correct them.

Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt8127.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mt8127.dtsi b/arch/arm/boot/dts/mt8127.dtsi
index aaa7862..ca3402e 100644
--- a/arch/arm/boot/dts/mt8127.dtsi
+++ b/arch/arm/boot/dts/mt8127.dtsi
@@ -107,7 +107,7 @@
 			      <0 0x10216000 0 0x2000>;
 		};
 
-		uart0: serial@11006000 {
+		uart0: serial@11002000 {
 			compatible = "mediatek,mt8127-uart","mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
@@ -115,7 +115,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@11007000 {
+		uart1: serial@11003000 {
 			compatible = "mediatek,mt8127-uart","mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
@@ -123,7 +123,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@11008000 {
+		uart2: serial@11004000 {
 			compatible = "mediatek,mt8127-uart","mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
@@ -131,7 +131,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@11009000 {
+		uart3: serial@11005000 {
 			compatible = "mediatek,mt8127-uart","mediatek,mt6577-uart";
 			reg = <0 0x11005000 0 0x400>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
