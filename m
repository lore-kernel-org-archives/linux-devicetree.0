From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: lpc32xx: set default parent clock for pwm1 & pwm2
Date: Wed, 22 Jun 2016 08:32:11 -0400
Message-ID: <1466598731-5144-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>

The change setup the peripheral clock (PERIPH_CLK) as the default 
parent clock for PWM1 & PWM2.

Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
---
Dependencies:
- clk: lpc32xx: allow peripheral clock selection in device tree
  http://thread.gmane.org/gmane.linux.kernel.clk/6938

 arch/arm/boot/dts/lpc32xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index e295e1e..ed85b95 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -469,6 +469,9 @@
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005C000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
+				assigned-clocks = <&clk LPC32XX_CLK_PWM1>,
+						  <&clk LPC32XX_CLK_PERIPH>;
+				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
 			};
 
@@ -476,6 +479,9 @@
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005C004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
+				assigned-clocks = <&clk LPC32XX_CLK_PWM2>,
+						  <&clk LPC32XX_CLK_PERIPH>;
+				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
 			};
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
