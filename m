From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: pxa: add pxa3xx pwm nodes
Date: Tue,  5 Apr 2016 08:35:51 +0200
Message-ID: <1459838155-28803-2-git-send-email-robert.jarzmik@free.fr>
References: <1459838155-28803-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459838155-28803-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The pxa3xx SoC has 4 PWMs, exactly as the pxa27x does. Add them to the
description.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index fec47bcd8292..5767ed4957ae 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -95,6 +95,38 @@
 			clocks = <&clks CLK_USBHOST>;
 			status = "disabled";
 		};
+
+		pwm0: pwm@40b00000 {
+			compatible = "marvell,pxa270-pwm";
+			reg = <0x40b00000 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&clks CLK_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@40b00010 {
+			compatible = "marvell,pxa270-pwm";
+			reg = <0x40b00010 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&clks CLK_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@40c00000 {
+			compatible = "marvell,pxa270-pwm";
+			reg = <0x40c00000 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&clks CLK_PWM0>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@40c00010 {
+			compatible = "marvell,pxa270-pwm";
+			reg = <0x40c00010 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&clks CLK_PWM1>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
