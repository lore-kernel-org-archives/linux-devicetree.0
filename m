From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/4] ARM: at91/dt: update udc compatible strings
Date: Mon, 15 Dec 2014 14:03:07 +0100
Message-ID: <1418648588-17872-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1418648588-17872-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418648588-17872-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

at91sam9g45, at91sam9x5 and sama5 SoCs should not use
"atmel,at91sam9rl-udc" for their USB device compatible property since
this compatible is attached to a specific hardware bug fix.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/at91sam9g45.dtsi | 2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi  | 2 +-
 arch/arm/boot/dts/sama5d3.dtsi     | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index 6c0637a..cf53155 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -1112,7 +1112,7 @@
 			usb2: gadget@fff78000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-				compatible = "atmel,at91sam9rl-udc";
+				compatible = "atmel,at91sam9g45-udc";
 				reg = <0x00600000 0x80000
 				       0xfff78000 0x400>;
 				interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index bbb3ba6..d213147 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -1057,7 +1057,7 @@
 			usb2: gadget@f803c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-				compatible = "atmel,at91sam9rl-udc";
+				compatible = "atmel,at91sam9g45-udc";
 				reg = <0x00500000 0x80000
 				       0xf803c000 0x400>;
 				interrupts = <23 IRQ_TYPE_LEVEL_HIGH 0>;
diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 5f4144d..2b407a4 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1264,7 +1264,7 @@
 		usb0: gadget@00500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "atmel,at91sam9rl-udc";
+			compatible = "atmel,sama5d3-udc";
 			reg = <0x00500000 0x100000
 			       0xf8030000 0x4000>;
 			interrupts = <33 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index e0157b0..0896efe 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -111,7 +111,7 @@
 		usb0: gadget@00400000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "atmel,at91sam9rl-udc";
+			compatible = "atmel,sama5d3-udc";
 			reg = <0x00400000 0x100000
 			       0xfc02c000 0x4000>;
 			interrupts = <47 IRQ_TYPE_LEVEL_HIGH 2>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
