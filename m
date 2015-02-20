From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: dts: stih407: Fix property name
Date: Fri, 20 Feb 2015 10:12:42 +0530
Message-ID: <1424407362-3912-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It's interrupt-names, not interrupts-names.

Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 402844c..55dbd62 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -53,7 +53,7 @@
 			reg = <0x0961f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 188 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09610000 0x6000>;
 
 			pio0: gpio@09610000 {
@@ -263,7 +263,7 @@
 			reg = <0x0920f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 189 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09200000 0x10000>;
 
 			pio10: pio@09200000 {
@@ -448,7 +448,7 @@
 			reg = <0x0921f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 190 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09210000 0x10000>;
 
 			pio20: pio@09210000 {
@@ -469,7 +469,7 @@
 			reg = <0x0922f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 191 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09220000 0x6000>;
 
 			pio30: gpio@09220000 {
@@ -566,7 +566,7 @@
 			reg = <0x0923f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 192 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09230000 0x3000>;
 
 			pio40: gpio@09230000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
