From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 13/18] ARM: dts: vf610: add WKPU connection to GPIO
Date: Wed,  9 Mar 2016 18:16:54 -0800
Message-ID: <1457576219-7971-14-git-send-email-stefan@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457576219-7971-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sergeimir-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some GPIO have extended wake-up capabilities through the WKPU
module. Encode the connection between the GPIO's and the WKPU
interrupt sources in the device tree.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/vfxxx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 335f4e5..869b230 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -383,6 +383,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 0 32>;
+				fsl,gpio-wakeup = <&wakeup 22 0 8>; /* PTB0...PTB7 */
 			};
 
 			gpio1: gpio@4004a000 {
@@ -394,6 +395,10 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 32 32>;
+				fsl,gpio-wakeup = <&wakeup 1 8 2>, /* PTB11, PTB12 (NMI)*/
+						<&wakeup 4 10 1>, /* PTB14 */
+						<&wakeup 6 11 1>, /* PTB16 */
+						<&wakeup 9 12 2>; /* PTB19, PTB20 */
 			};
 
 			gpio2: gpio@4004b000 {
@@ -416,6 +421,9 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 96 32>;
+				fsl,gpio-wakeup = <&wakeup 1 14 1>, /* PTB27 */
+						<&wakeup 7 15 1>, /* PTC30 */
+						<&wakeup 29 16 1>; /* PTE20 */
 			};
 
 			gpio4: gpio@4004d000 {
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
