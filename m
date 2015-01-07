From: Bart Tanghe <bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>
Subject: [PATCH v2] ARM: dts: add bcm2835-pwm bindings
Date: Wed,  7 Jan 2015 12:00:58 +0100
Message-ID: <1420628458-11459-1-git-send-email-bart.tanghe@thomasmore.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bart Tanghe <bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To probe the bcm2835-pwm driver properly, this dts bindings has to be added 
to the bcm2835 dtsi file.
In expectation of a bcm2835 clock driver, I've added fixed-clock clock binding.
---
Changes in v2:
 - status set to disabled
 - follow the clock naming convention

Signed-off-by: Bart Tanghe <bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 3342cb1..ba76bb4 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -146,6 +147,14 @@
 			interrupts = <1 9>;
 		};
 
+		pwm: pwm@7e20e000 {
+			compatible = "brcm,bcm2835-pwm";
+			reg = <0x7e20c000 0x28>;
+			clocks = <&clk_pwm>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		arm-pmu {
 			compatible = "arm,arm1176-pmu";
 		};
@@ -179,5 +188,13 @@
 			clock-output-names = "spi";
 			clock-frequency = <250000000>;
 		};
+
+		clk_pwm: clock@3 {
+			compatible = "fixed-clock";
+			reg = <3>;
+			#clock-cells = <0>;
+			clock-output-names = "pwm";
+			clock-frequency = <9200000>;
+		};
 	};
 };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
