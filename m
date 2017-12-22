From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 05/11] ARM: sun8i: h3/h5: add DE2 CCU device node for H3
Date: Fri, 22 Dec 2017 20:22:37 +0800
Message-ID: <20171222122243.25735-6-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222122243.25735-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DE2 in H3/H5 has a clock control unit in it, and the behavior is
slightly different between H3 and H5.

Add the common parts in H3/H5 DTSI, and add the compatible string in H3
DTSI.

The compatible string of H5 DE2 CCU will be added in a separated patch.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v2:
- Use H3 DE2 CCU compatible as it's discovered that H3 and A83T DE2 CCU are
  not equal.

 arch/arm/boot/dts/sun8i-h3.dtsi    |  4 ++++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index b36f9f423c39..8495deecedad 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -85,6 +85,10 @@
 	compatible = "allwinner,sun8i-h3-ccu";
 };
 
+&display_clocks {
+	compatible = "allwinner,sun8i-h3-de2-clk";
+};
+
 &mmc0 {
 	compatible = "allwinner,sun7i-a20-mmc";
 	clocks = <&ccu CLK_BUS_MMC0>,
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 8d40c00d64bb..fcb909658cf0 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -40,9 +40,11 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/clock/sun8i-de2.h>
 #include <dt-bindings/clock/sun8i-h3-ccu.h>
 #include <dt-bindings/clock/sun8i-r-ccu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun8i-h3-ccu.h>
 #include <dt-bindings/reset/sun8i-r-ccu.h>
 
@@ -85,6 +87,18 @@
 		#size-cells = <1>;
 		ranges;
 
+		display_clocks: clock@1000000 {
+			/* compatible is in per SoC .dtsi file */
+			reg = <0x01000000 0x100000>;
+			clocks = <&ccu CLK_DE>,
+				 <&ccu CLK_BUS_DE>;
+			clock-names = "mod",
+				      "bus";
+			resets = <&ccu RST_BUS_DE>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		syscon: syscon@1c00000 {
 			compatible = "allwinner,sun8i-h3-system-controller",
 				"syscon";
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
