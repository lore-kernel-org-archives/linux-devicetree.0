From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: dts: da850: Add new ECAP and EPWM bindings
Date: Mon, 27 Jun 2016 09:14:02 -0500
Message-ID: <1467036842-20913-1-git-send-email-fcooper@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
Cc: "Cooper Jr., Franklin" <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Cooper Jr., Franklin" <fcooper-l0cyMroinI0@public.gmane.org>

Switch to a new ECAP and EPWM bindings that doesn't depend on hwmod to
provide the various required clocks.

Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

This patch is a da850 specific version of:
ARM: dts: am437x/am33xx/da850: Add new ECAP and EPWM bindings
https://patchwork.kernel.org/patch/9005661/

This patch was created since the da850 portion didn't apply cleanly in
the original patch.

 arch/arm/boot/dts/da850.dtsi | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 25f0f8e..09cf663 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -274,31 +274,36 @@
 			status = "disabled";
 		};
 		ehrpwm0: pwm@300000 {
-			compatible = "ti,da850-ehrpwm", "ti,am33xx-ehrpwm";
+			compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm",
+				     "ti,am33xx-ehrpwm";
 			#pwm-cells = <3>;
 			reg = <0x300000 0x2000>;
 			status = "disabled";
 		};
 		ehrpwm1: pwm@302000 {
-			compatible = "ti,da850-ehrpwm", "ti,am33xx-ehrpwm";
+			compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm",
+				     "ti,am33xx-ehrpwm";
 			#pwm-cells = <3>;
 			reg = <0x302000 0x2000>;
 			status = "disabled";
 		};
 		ecap0: ecap@306000 {
-			compatible = "ti,da850-ecap", "ti,am33xx-ecap";
+			compatible = "ti,da850-ecap", "ti,am3352-ecap",
+				     "ti,am33xx-ecap";
 			#pwm-cells = <3>;
 			reg = <0x306000 0x80>;
 			status = "disabled";
 		};
 		ecap1: ecap@307000 {
-			compatible = "ti,da850-ecap", "ti,am33xx-ecap";
+			compatible = "ti,da850-ecap", "ti,am3352-ecap",
+				     "ti,am33xx-ecap";
 			#pwm-cells = <3>;
 			reg = <0x307000 0x80>;
 			status = "disabled";
 		};
 		ecap2: ecap@308000 {
-			compatible = "ti,da850-ecap", "ti,am33xx-ecap";
+			compatible = "ti,da850-ecap", "ti,am3352-ecap",
+				     "ti,am33xx-ecap";
 			#pwm-cells = <3>;
 			reg = <0x308000 0x80>;
 			status = "disabled";
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
