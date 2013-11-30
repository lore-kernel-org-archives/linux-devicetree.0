From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v6 03/17] dts: mpc512x: add clock related device tree specs
Date: Sat, 30 Nov 2013 23:51:23 +0100
Message-ID: <1385851897-23475-4-git-send-email-gsi@denx.de>
References: <1385851897-23475-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385851897-23475-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

this addresses the clock driver aka provider's side of clocks
- introduce a 'clocks' subtree with an 'osc' node for the crystal
  or oscillator SoC input (fixed frequency)
- the 'clock@f00' clock-control-module node references the 'osc' for
  its input, and is another provider for all the clocks which the
  CCM component manages
- prepare for future references to clocks from peripheral nodes
  by means of the <&clks ID> syntax and symbolic ID names which a
  header file provides
- provide default values with 33MHz oscillator frequency in the
  common include (the 66MHz IPS bus already was there), and add
  override values for the ifm AC14xx board which deviates from
  the reference design (25MHz xtal, 80MHz IPS bus)

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> # for v3, before &osc
Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 arch/powerpc/boot/dts/ac14xx.dts   |    7 +++++++
 arch/powerpc/boot/dts/mpc5121.dtsi |   18 +++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
index a543c4088cba..a1b883730b31 100644
--- a/arch/powerpc/boot/dts/ac14xx.dts
+++ b/arch/powerpc/boot/dts/ac14xx.dts
@@ -139,7 +139,14 @@
 		};
 	};
 
+	clocks {
+		osc {
+			clock-frequency = <25000000>;
+		};
+	};
+
 	soc@80000000 {
+		bus-frequency = <80000000>;	/* 80 MHz ips bus */
 
 		clock@f00 {
 			compatible = "fsl,mpc5121rev2-clock", "fsl,mpc5121-clock";
diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index bd14c00e5146..9bfcb7558197 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -9,6 +9,8 @@
  * option) any later version.
  */
 
+#include <dt-bindings/clock/mpc512x-clock.h>
+
 /dts-v1/;
 
 / {
@@ -73,6 +75,17 @@
 		ranges = <0x0 0x0 0xfc000000 0x04000000>;
 	};
 
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		osc: osc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <33000000>;
+		};
+	};
+
 	soc@80000000 {
 		compatible = "fsl,mpc5121-immr";
 		#address-cells = <1>;
@@ -118,9 +131,12 @@
 		};
 
 		/* Clock control */
-		clock@f00 {
+		clks: clock@f00 {
 			compatible = "fsl,mpc5121-clock";
 			reg = <0xf00 0x100>;
+			#clock-cells = <1>;
+			clocks = <&osc>;
+			clock-names = "osc";
 		};
 
 		/* Power Management Controller */
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
