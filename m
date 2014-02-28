From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: add support for Cubox-i PWM-driven front panel LED
Date: Fri, 28 Feb 2014 21:25:22 +0000
Message-ID: <E1WJUvq-0003wg-3I@rmk-PC.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The front panel LED on the Cubox-i is driven by one of the iMX6 PWM
channels, and is wired between the PWM output and supply.  This means
that outputting a low level results in the LED being turned on, so we
need the duty cycle inverted.

There's a question about whether the output inversion should be at the
pwm or pwm-leds level - setting the output inversion bit in the iMX6
results in a PWM duty cycle of zero outputting logic zero, meaning that
the LED is fully on.  This is undesirable, as it becomes impossible to
turn the LED fully off.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index c2a24888a276..7971387c2e13 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -12,6 +12,20 @@
 		pinctrl-0 = <&pinctrl_cubox_i_ir>;
 	};
 
+	pwmleds {
+		compatible = "pwm-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cubox_i_pwm1>;
+
+		front {
+			active-low;
+			default-brightness = <128>;
+			label = "imx6:red:front";
+			max-brightness = <248>;
+			pwms = <&pwm1 0 50000>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 
@@ -82,6 +96,10 @@
 			>;
 		};
 
+		pinctrl_cubox_i_pwm1: cubox-i-pwm1-front-led {
+			fsl,pins = <MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b0>;
+		};
+
 		pinctrl_cubox_i_spdif: cubox-i-spdif {
 			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
 		};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
