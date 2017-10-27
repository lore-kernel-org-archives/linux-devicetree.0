From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 05/10] ARM: sun8i: h3/h5: add DE2 CCU device
 node for H3
Date: Fri, 27 Oct 2017 23:06:53 +0800
Message-ID: <20171027150658.18509-6-icenowy@aosc.io>
References: <20171027150658.18509-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBLMYZXHQKGQEXHZ4ZQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171027150658.18509-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
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
index d7a71e726a9f..367319d22116 100644
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
2.13.6
