From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 7/9] ARM: dts: sun6i: Add device nodes for first
 display pipeline
Date: Fri,  7 Oct 2016 00:06:27 +0800
Message-ID: <20161006160629.11198-8-wens@csie.org>
References: <20161006160629.11198-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBC7N3G7QKGQEXOICRPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161006160629.11198-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A31 has 2 parallel display pipelines, which can be intermixed.
However the driver currently only supports one of them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi  | 152 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun6i-a31s.dtsi |   8 ++
 2 files changed, 160 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index c1b891e75f18..4d2c7786b92a 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -231,6 +231,11 @@
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun6i-a31-display-engine";
+		allwinner,pipelines = <&fe0>;
+	};
+
 	soc@01c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -246,6 +251,44 @@
 			#dma-cells = <1>;
 		};
 
+		tcon0: lcd-controller@01c0c000 {
+			compatible = "allwinner,sun6i-a31-tcon";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&ccu RST_AHB1_LCD0>;
+			reset-names = "lcd";
+			clocks = <&ccu CLK_AHB1_LCD0>,
+				 <&ccu CLK_LCD0_CH0>,
+				 <&ccu CLK_LCD0_CH1>;
+			clock-names = "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names = "tcon0-pixel-clock";
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
+					tcon0_in_drc0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&drc0_out_tcon0>;
+					};
+				};
+
+				tcon0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+
 		mmc0: mmc@01c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
@@ -799,6 +842,115 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		fe0: display-frontend@01e00000 {
+			compatible = "allwinner,sun6i-a31-display-frontend";
+			reg = <0x01e00000 0x20000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB1_FE0>, <&ccu CLK_FE0>,
+				 <&ccu CLK_DRAM_FE0>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_AHB1_FE0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					fe0_out_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_in_fe0>;
+					};
+				};
+			};
+		};
+
+		be0: display-backend@01e60000 {
+			compatible = "allwinner,sun6i-a31-display-backend";
+			reg = <0x01e60000 0x10000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB1_BE0>, <&ccu CLK_BE0>,
+				 <&ccu CLK_DRAM_BE0>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_AHB1_BE0>;
+
+			assigned-clocks = <&ccu CLK_BE0>;
+			assigned-clock-rates = <300000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				be0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					be0_in_fe0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&fe0_out_be0>;
+					};
+				};
+
+				be0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					be0_out_drc0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&drc0_in_be0>;
+					};
+				};
+			};
+		};
+
+		drc0: drc@01e70000 {
+			compatible = "allwinner,sun6i-a31-drc";
+			reg = <0x01e70000 0x10000>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB1_DRC0>, <&ccu CLK_IEP_DRC0>,
+				 <&ccu CLK_DRAM_DRC0>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_AHB1_DRC0>;
+
+			assigned-clocks = <&ccu CLK_IEP_DRC0>;
+			assigned-clock-rates = <300000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				drc0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					drc0_in_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_out_drc0>;
+					};
+				};
+
+				drc0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					drc0_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_drc0>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@01f00000 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
diff --git a/arch/arm/boot/dts/sun6i-a31s.dtsi b/arch/arm/boot/dts/sun6i-a31s.dtsi
index c17a32771b98..97e2c51d0aea 100644
--- a/arch/arm/boot/dts/sun6i-a31s.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31s.dtsi
@@ -48,6 +48,14 @@
 
 #include "sun6i-a31.dtsi"
 
+&de {
+	compatible = "allwinner,sun6i-a31s-display-engine";
+};
+
 &pio {
 	compatible = "allwinner,sun6i-a31s-pinctrl";
 };
+
+&tcon0 {
+	compatible = "allwinner,sun6i-a31s-tcon";
+};
-- 
2.9.3
