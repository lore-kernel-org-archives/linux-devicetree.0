From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/12] ARM: dts: nanopi: Fix node with unit name and no reg property
Date: Fri, 22 Sep 2017 20:40:37 +0200
Message-ID: <20170922184045.6498-5-clabbe.montjoie@gmail.com>
References: <20170922184045.6498-1-clabbe.montjoie@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922184045.6498-1-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fix the warning "xxx has a unit name, but no reg property" by
removing "@0" from such node.

Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
index c6decee41a27..7646e331bd29 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
@@ -81,7 +81,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&sw_r_npi>;
 
-		k1@0 {
+		k1 {
 			label = "k1";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
@@ -108,19 +108,19 @@
 };
 
 &pio {
-	leds_npi: led_pins@0 {
+	leds_npi: led_pins {
 		pins = "PA10";
 		function = "gpio_out";
 	};
 };
 
 &r_pio {
-	leds_r_npi: led_pins@0 {
+	leds_r_npi: led_pins {
 		pins = "PL10";
 		function = "gpio_out";
 	};
 
-	sw_r_npi: key_pins@0 {
+	sw_r_npi: key_pins {
 		pins = "PL3";
 		function = "gpio_in";
 	};
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
