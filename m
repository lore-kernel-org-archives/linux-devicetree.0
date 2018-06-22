From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 5/7] arm64: allwinner: a64: add necessary
 device tree nodes for DE2 CCU
Date: Fri, 22 Jun 2018 20:45:38 +0800
Message-ID: <20180622124540.56203-4-icenowy@aosc.io>
References: <20180622124540.56203-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBXPAWPMQKGQEEDXXYTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180622124540.56203-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As we have all necessary parts to enable the DE2 CCU on the Allwinner
A64 SoC, add the needed device tree nodes, including the DE2 CCU itself
and the DE2 bus.

The "mixer0-lcd0" simplefb device node is updated to use the DE2 CCU.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v2:
- Drop SRAM controller device tree node addition (as it's already added
  as part of syscon change.)
- Fix the clock reference in LCD SimpleFB.

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index ff2ddde1e117..318c4ba8ae9f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -43,9 +43,11 @@
  */
 
 #include <dt-bindings/clock/sun50i-a64-ccu.h>
+#include <dt-bindings/clock/sun8i-de2.h>
 #include <dt-bindings/clock/sun8i-r-ccu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/sun50i-a64-ccu.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun8i-r-ccu.h>
 
 / {
@@ -58,17 +60,12 @@
 		#size-cells = <1>;
 		ranges;
 
-/*
- * The pipeline mixer0-lcd0 depends on clock CLK_MIXER0 from DE2 CCU.
- * However there is no support for this clock on A64 yet, so we depend
- * on the upstream clocks here to keep them (and thus CLK_MIXER0) up.
- */
 		simplefb_lcd: framebuffer-lcd {
 			compatible = "allwinner,simple-framebuffer",
 				     "simple-framebuffer";
 			allwinner,pipeline = "mixer0-lcd0";
 			clocks = <&ccu CLK_TCON0>,
-				 <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
+				 <&display_clocks CLK_MIXER0>;
 			status = "disabled";
 		};
 	};
@@ -169,6 +166,27 @@
 		#size-cells = <1>;
 		ranges;
 
+		de2@1000000 {
+			compatible = "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&de2_sram 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@0 {
+				compatible = "allwinner,sun50i-a64-de2-clk";
+				reg = <0x0 0x100000>;
+				clocks = <&ccu CLK_DE>,
+					 <&ccu CLK_BUS_DE>;
+				clock-names = "mod",
+					      "bus";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+		};
+
 		syscon: syscon@1c00000 {
 			compatible = "allwinner,sun50i-a64-system-control";
 			reg = <0x01c00000 0x1000>;
-- 
2.17.1
