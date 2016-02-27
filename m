From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 3/5] ARM: dts: sunxi: Add the SPDIF to the A10
 and A20
Date: Sat, 27 Feb 2016 17:18:27 +0100
Message-ID: <1456589909-2428-4-git-send-email-codekipper@gmail.com>
References: <1456589909-2428-1-git-send-email-codekipper@gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBXEYY63AKGQEUDPOTBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1456589909-2428-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, ennesimamail.av-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add the SPDIF transceiver controller and clock to the A10 and
A20 dtsi.

Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 0483640..83d46b2 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -477,6 +477,17 @@
 			clock-output-names = "ir1";
 		};
 
+		spdif_clk: clk@01c200c0 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-mod1-clk";
+			reg = <0x01c200c0 0x4>;
+			clocks = <&pll2 SUN4I_A10_PLL2_8X>,
+				 <&pll2 SUN4I_A10_PLL2_4X>,
+				 <&pll2 SUN4I_A10_PLL2_2X>,
+				 <&pll2 SUN4I_A10_PLL2_1X>;
+			clock-output-names = "spdif";
+		};
+
 		usb_clk: clk@01c200cc {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -1055,6 +1066,18 @@
 			status = "disabled";
 		};
 
+		spdif: spdif@01c21000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun4i-a10-spdif";
+			reg = <0x01c21000 0x40>;
+			interrupts = <13>;
+			clocks = <&apb0_gates 1>, <&spdif_clk>;
+			clock-names = "apb", "spdif";
+			dmas = <&dma 0 2>, <&dma 0 2>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		ir0: ir@01c21800 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&apb0_gates 6>, <&ir0_clk>;
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 7264d5e..4631660 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -476,6 +476,17 @@
 			clock-output-names = "ir1";
 		};
 
+		spdif_clk: clk@01c200c0 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-mod1-clk";
+			reg = <0x01c200c0 0x4>;
+			clocks = <&pll2 SUN4I_A10_PLL2_8X>,
+				 <&pll2 SUN4I_A10_PLL2_4X>,
+				 <&pll2 SUN4I_A10_PLL2_2X>,
+				 <&pll2 SUN4I_A10_PLL2_1X>;
+			clock-output-names = "spdif";
+		};
+
 		keypad_clk: clk@01c200c4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
@@ -1247,6 +1258,18 @@
 			status = "disabled";
 		};
 
+		spdif: spdif@01c21000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun4i-a10-spdif";
+			reg = <0x01c21000 0x40>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb0_gates 1>, <&spdif_clk>;
+			clock-names = "apb", "spdif";
+			dmas = <&dma 0 2>, <&dma 0 2>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		ir0: ir@01c21800 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&apb0_gates 6>, <&ir0_clk>;
-- 
2.7.1
