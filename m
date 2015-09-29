From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: STi: DT: STiH407: Rename incorrect interrupt related binding
Date: Tue, 29 Sep 2015 09:52:18 +0100
Message-ID: <1443516738-3569-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

interrupts-names => interrupt-names

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 1683deb..7992063 100644
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
@@ -264,7 +264,7 @@
 			reg = <0x0920f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 189 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09200000 0x10000>;
 
 			pio10: pio@09200000 {
@@ -637,7 +637,7 @@
 			reg = <0x0921f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 190 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09210000 0x10000>;
 
 			tsin4 {
@@ -670,7 +670,7 @@
 			reg = <0x0922f080 0x4>;
 			reg-names = "irqmux";
 			interrupts = <GIC_SPI 191 IRQ_TYPE_NONE>;
-			interrupts-names = "irqmux";
+			interrupt-names = "irqmux";
 			ranges = <0 0x09220000 0x6000>;
 
 			pio30: gpio@09220000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
