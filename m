From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [RFC PATCH 10/11] ARM: sun8i: h3: add display engine
 pipeline for TVE
Date: Thu, 18 May 2017 00:43:53 +0800
Message-ID: <20170517164354.16399-11-icenowy@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBW746HEAKGQEMORPECA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170517164354.16399-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As we have already the support for the TV encoder on Allwinner H3, add
the display engine pipeline device tree nodes to its DTSI file.

The H5 pipeline has some differences and will be enabled later.

The currently-unused mixer0 and tcon0 are also needed, for the
completement of the pipeline.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 189 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index b36f9f423c39..20172ef92415 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -41,6 +41,8 @@
  */
 
 #include "sunxi-h3-h5.dtsi"
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	cpus {
@@ -72,6 +74,193 @@
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun8i-h3-display-engine";
+		allwinner,pipelines = <&mixer0>,
+				      <&mixer1>;
+		status = "disabled";
+	};
+
+	soc {
+		display_clocks: clock@1000000 {
+			compatible = "allwinner,sun8i-a83t-de2-clk";
+			reg = <0x01000000 0x100000>;
+			clocks = <&ccu CLK_BUS_DE>,
+				 <&ccu CLK_DE>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&ccu RST_BUS_DE>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&ccu CLK_DE>;
+			assigned-clock-parents = <&ccu CLK_PLL_DE>;
+			assigned-clock-rates = <432000000>;
+		};
+
+		mixer0: mixer@1100000 {
+			compatible = "allwinner,sun8i-h3-de2-mixer0";
+			reg = <0x01100000 0x100000>;
+			clocks = <&display_clocks CLK_BUS_MIXER0>,
+				 <&display_clocks CLK_MIXER0>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&display_clocks RST_MIXER0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mixer0_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_mixer0>;
+					};
+
+					mixer0_out_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_in_mixer0>;
+					};
+				};
+			};
+		};
+
+		mixer1: mixer@1200000 {
+			compatible = "allwinner,sun8i-h3-de2-mixer1";
+			reg = <0x01200000 0x100000>;
+			clocks = <&display_clocks CLK_BUS_MIXER1>,
+				 <&display_clocks CLK_MIXER1>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&display_clocks RST_WB>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mixer1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mixer1_out_tcon1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon1_in_mixer1>;
+					};
+
+					mixer1_out_tcon0: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon0_in_mixer1>;
+					};
+				};
+			};
+		};
+
+		tcon0: lcd-controller@1c0c000 {
+			compatible = "allwinner,sun8i-h3-tcon0";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON0>,
+				 <&ccu CLK_TCON0>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon0>;
+					};
+
+					tcon0_in_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer1_out_tcon0>;
+					};
+				};
+			};
+		};
+
+		tcon1: lcd-controller@1c0d000 {
+			compatible = "allwinner,sun8i-h3-tcon1";
+			reg = <0x01c0d000 0x1000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON1>;
+			clock-names = "ahb";
+			resets = <&ccu RST_BUS_TCON1>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon1_in_mixer1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer1_out_tcon1>;
+					};
+
+					tcon1_in_mixer0: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer0_out_tcon1>;
+					};
+				};
+
+				tcon1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon1_out_tve0: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tve0_in_tcon1>;
+					};
+				};
+			};
+		};
+
+		tve0: tv-encoder@1e00000 {
+			compatible = "allwinner,sun8i-h3-tv-encoder";
+			reg = <0x01e00000 0x1000>;
+			clocks = <&ccu CLK_BUS_TVE>, <&ccu CLK_TVE>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_TVE>;
+			status = "disabled";
+
+			assigned-clocks = <&ccu CLK_TVE>;
+			assigned-clock-parents = <&ccu CLK_PLL_DE>;
+			assigned-clock-rates = <216000000>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tve0_in_tcon1: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&tcon1_out_tve0>;
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.12.2
