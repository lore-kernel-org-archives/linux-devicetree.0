From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] arm: dts: lpc32xx: add labels to all defined peripheral nodes
Date: Tue, 13 Oct 2015 02:54:03 +0300
Message-ID: <1444694045-22000-4-git-send-email-vz@mleia.com>
References: <1444694045-22000-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444694045-22000-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

To simplify writing of dts files for all lpc32xx.dtsi users who adjust
device node properties, add labels to all defined peripheral device
nodes in lpc32xx.dtsi.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 3ef804c..dcb52cb 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -49,7 +49,7 @@
 			status = "disabled";
 		};
 
-		dma@31000000 {
+		dma: dma@31000000 {
 			compatible = "arm,pl080", "arm,primecell";
 			reg = <0x31000000 0x1000>;
 			interrupts = <0x1c 0>;
@@ -58,21 +58,21 @@
 		/*
 		 * Enable either ohci or usbd (gadget)!
 		 */
-		ohci@31020000 {
+		ohci: ohci@31020000 {
 			compatible = "nxp,ohci-nxp", "usb-ohci";
 			reg = <0x31020000 0x300>;
 			interrupts = <0x3b 0>;
 			status = "disabled";
 		};
 
-		usbd@31020000 {
+		usbd: usbd@31020000 {
 			compatible = "nxp,lpc3220-udc";
 			reg = <0x31020000 0x300>;
 			interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
 			status = "disabled";
 		};
 
-		clcd@31040000 {
+		clcd: clcd@31040000 {
 			compatible = "arm,pl110", "arm,primecell";
 			reg = <0x31040000 0x1000>;
 			interrupts = <0x0e 0>;
@@ -118,7 +118,7 @@
 				reg = <0x20094000 0x1000>;
 			};
 
-			sd@20098000 {
+			sd: sd@20098000 {
 				compatible = "arm,pl18x", "arm,primecell";
 				reg = <0x20098000 0x1000>;
 				interrupts = <0x0f 0>, <0x0d 0>;
@@ -243,7 +243,7 @@
 				status = "disabled";
 			};
 
-			rtc@40024000 {
+			rtc: rtc@40024000 {
 				compatible = "nxp,lpc3220-rtc";
 				reg = <0x40024000 0x1000>;
 				interrupts = <0x34 0>;
@@ -256,7 +256,7 @@
 				#gpio-cells = <3>; /* bank, pin, flags */
 			};
 
-			watchdog@4003C000 {
+			watchdog: watchdog@4003C000 {
 				compatible = "nxp,pnx4008-wdt";
 				reg = <0x4003C000 0x1000>;
 			};
@@ -268,21 +268,21 @@
 			 * them
 			 */
 
-			adc@40048000 {
+			adc: adc@40048000 {
 				compatible = "nxp,lpc3220-adc";
 				reg = <0x40048000 0x1000>;
 				interrupts = <0x27 0>;
 				status = "disabled";
 			};
 
-			tsc@40048000 {
+			tsc: tsc@40048000 {
 				compatible = "nxp,lpc3220-tsc";
 				reg = <0x40048000 0x1000>;
 				interrupts = <0x27 0>;
 				status = "disabled";
 			};
 
-			key@40050000 {
+			key: key@40050000 {
 				compatible = "nxp,lpc3220-key";
 				reg = <0x40050000 0x1000>;
 				interrupts = <54 0>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
