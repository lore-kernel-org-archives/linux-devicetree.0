From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: cubox-i: add support for PWM-driven front panel
 LED
Date: Tue, 17 Jun 2014 14:40:56 +0100
Message-ID: <E1WwtdA-00004r-2V@rmk-PC.arm.linux.org.uk>
References: <20140617134016.GK23430@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140617134016.GK23430-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The front panel LED on the Cubox-i is driven by one of the iMX6 PWM
channels, and is wired between the PWM output and supply.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index 25da82a03110..9202c8d18a30 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -12,6 +12,19 @@
 		pinctrl-0 = <&pinctrl_cubox_i_ir>;
 	};
 
+	pwmleds {
+		compatible = "pwm-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cubox_i_pwm1>;
+
+		front {
+			active-low;
+			label = "imx6:red:front";
+			max-brightness = <248>;
+			pwms = <&pwm1 0 50000>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 
@@ -109,6 +122,10 @@
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
