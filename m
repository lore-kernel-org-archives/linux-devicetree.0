From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] ARM: dts: lpc32xx: add pwm-cells to base dts file
Date: Wed,  7 Dec 2016 14:30:47 -0500
Message-ID: <1481139047-13166-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>

There is no need to define the "pwm-cells" in the board
specific dts file; move the entry to the base dts file.

Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
---
Changes in v2:
* Update the "pwm-cells" to be compatible with the latest
  lpc32xx-pwm driver implementation.

Note:
* This patch have a dependency on the following patcheset:
  "pwm: lpc32xx: switch driver to one phandle argument for PWM consumers"
  http://www.spinics.net/lists/arm-kernel/msg547013.html

 arch/arm/boot/dts/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 218d9fa..c031c94 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -472,6 +472,7 @@
 				assigned-clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
+				#pwm-cells = <1>;
 			};
 
 			pwm2: pwm@4005C004 {
@@ -481,6 +482,7 @@
 				assigned-clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
+				#pwm-cells = <1>;
 			};
 
 			timer3: timer@40060000 {
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
