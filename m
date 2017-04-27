From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
Date: Thu, 27 Apr 2017 12:10:45 -0700
Message-ID: <20170427191045.21199-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the USB0 and USB1 clocks to the device tree.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/r7s72100.dtsi            | 6 +++---
 include/dt-bindings/clock/r7s72100-clock.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index fb54cb5d3fad..4ed12a4d9d51 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -144,9 +144,9 @@
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0xfcfe0430 4>;
-			clocks = <&b_clk>;
-			clock-indices = <R7S72100_CLK_ETHER>;
-			clock-output-names = "ether";
+			clocks = <&b_clk>, <&p1_clk>, <&p1_clk>;
+			clock-indices = <R7S72100_CLK_ETHER R7S72100_CLK_USB0 R7S72100_CLK_USB1>;
+			clock-output-names = "ether", "usb0", "usb1";
 		};
 
 		mstp8_clks: mstp8_clks@fcfe0434 {
diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index bc256d31099a..dcd2072151fc 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -34,6 +34,8 @@
 
 /* MSTP7 */
 #define R7S72100_CLK_ETHER	4
+#define R7S72100_CLK_USB0	1
+#define R7S72100_CLK_USB1	0
 
 /* MSTP8 */
 #define R7S72100_CLK_MMCIF	4
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
