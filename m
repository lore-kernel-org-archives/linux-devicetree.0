From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/7] ARM: dts: Enable N950 keyboard sleep leds by default
Date: Sun, 13 Mar 2016 01:06:17 +0100
Message-ID: <1457827580-16919-5-git-send-email-sre__643.600922967558$1457828146$gmane$org@kernel.org>
References: <1457827580-16919-1-git-send-email-sre@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457827580-16919-1-git-send-email-sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Like the Nokia N900, the N950 has leds to show
the state of sys_clkreq and sys_off_mode pins.

A detailed description for the LEDs and
OMAP's sleep states can be found in Tony's
commit for the Nokia N900:

c1be2032f66df9e1238bd5bc4ca666de88a62abc

Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/omap3-n950-n9.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index 3c7f1d2deb2f..c42e8fc846b9 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -31,9 +31,27 @@
 		startup-delay-us = <150>;
 		enable-active-high;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			label = "debug::sleep";
+			gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;  /* gpio92 */
+			linux,default-trigger = "default-on";
+			pinctrl-names = "default";
+			pinctrl-0 = <&debug_leds>;
+		};
+	};
 };
 
 &omap3_pmx_core {
+	debug_leds: pinmux_debug_led_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x2108, PIN_OUTPUT | MUX_MODE4)       /* dss_data22.gpio_92 */
+		>;
+	};
+
 	mmc2_pins: pinmux_mmc2_pins {
 		pinctrl-single,pins = <
 			OMAP3_CORE1_IOPAD(0x2158, PIN_INPUT_PULLUP | MUX_MODE0) /* sdmmc2_clk */
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
