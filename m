From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 09/10] ARM: dts: sun7i: Add device nodes for
 display pipelines
Date: Tue, 17 Oct 2017 20:18:06 +0800
Message-ID: <20171017121807.2994-10-wens@csie.org>
References: <20171017121807.2994-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBPKS7HQKGQEFTCLKWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171017121807.2994-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The A20 has two interconnected display pipelines, mirroring the A10.

Add all the device nodes for them, including the downstream HDMI
controller that we already support.

Signed-off-by: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
[wens-jdAy2FN1RRM@public.gmane.org: Squashed in HDMI and provided commit message]
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 307 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 307 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 2f63ae861e68..3843a635f7fa 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -228,6 +228,12 @@
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun7i-a20-display-engine";
+		allwinner,pipelines = <&fe0>, <&fe1>;
+		status = "disabled";
+	};
+
 	soc@1c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -346,6 +352,104 @@
 			#size-cells = <0>;
 		};
 
+		tcon0: lcd-controller@1c0c000 {
+			compatible = "allwinner,sun7i-a20-tcon";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&ccu RST_TCON0>;
+			reset-names = "lcd";
+			clocks = <&ccu CLK_AHB_LCD0>,
+				 <&ccu CLK_TCON0_CH0>,
+				 <&ccu CLK_TCON0_CH1>;
+			clock-names = "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names = "tcon0-pixel-clock";
+			dmas = <&dma SUN4I_DMA_DEDICATED 14>;
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
+					tcon0_in_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_out_tcon0>;
+					};
+
+					tcon0_in_be1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&be1_out_tcon0>;
+					};
+				};
+
+				tcon0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon0_out_hdmi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hdmi_in_tcon0>;
+						allwinner,tcon-channel = <1>;
+					};
+				};
+			};
+		};
+
+		tcon1: lcd-controller@1c0d000 {
+			compatible = "allwinner,sun7i-a20-tcon";
+			reg = <0x01c0d000 0x1000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&ccu RST_TCON1>;
+			reset-names = "lcd";
+			clocks = <&ccu CLK_AHB_LCD1>,
+				 <&ccu CLK_TCON1_CH0>,
+				 <&ccu CLK_TCON1_CH1>;
+			clock-names = "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names = "tcon1-pixel-clock";
+			dmas = <&dma SUN4I_DMA_DEDICATED 15>;
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
+					tcon1_in_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_out_tcon1>;
+					};
+
+					tcon1_in_be1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&be1_out_tcon1>;
+					};
+				};
+
+				tcon1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon1_out_hdmi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hdmi_in_tcon1>;
+						allwinner,tcon-channel = <1>;
+					};
+				};
+			};
+		};
+
 		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
@@ -470,6 +574,49 @@
 			clock-names = "ahb", "mod";
 		};
 
+		hdmi: hdmi@1c16000 {
+			compatible = "allwinner,sun7i-a20-hdmi",
+				     "allwinner,sun5i-a10s-hdmi";
+			reg = <0x01c16000 0x1000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_HDMI0>, <&ccu CLK_HDMI>,
+				 <&ccu CLK_PLL_VIDEO0_2X>,
+				 <&ccu CLK_PLL_VIDEO1_2X>;
+			clock-names = "ahb", "mod", "pll-0", "pll-1";
+			dmas = <&dma SUN4I_DMA_NORMAL 16>,
+			       <&dma SUN4I_DMA_NORMAL 16>,
+			       <&dma SUN4I_DMA_DEDICATED 24>;
+			dma-names = "ddc-tx", "ddc-rx", "audio-tx";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					hdmi_in_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_out_hdmi>;
+					};
+
+					hdmi_in_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_out_hdmi>;
+					};
+				};
+
+				hdmi_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+
 		spi2: spi@1c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
@@ -1104,5 +1251,165 @@
 			#interrupt-cells = <3>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
+
+		fe0: display-frontend@1e00000 {
+			compatible = "allwinner,sun7i-a20-display-frontend";
+			reg = <0x01e00000 0x20000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_DE_FE0>, <&ccu CLK_DE_FE0>,
+				 <&ccu CLK_DRAM_DE_FE0>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_DE_FE0>;
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
+
+					fe0_out_be1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&be1_in_fe0>;
+					};
+				};
+			};
+		};
+
+		fe1: display-frontend@1e20000 {
+			compatible = "allwinner,sun7i-a20-display-frontend";
+			reg = <0x01e20000 0x20000>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_DE_FE1>, <&ccu CLK_DE_FE1>,
+				 <&ccu CLK_DRAM_DE_FE1>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_DE_FE1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					fe1_out_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_in_fe1>;
+					};
+
+					fe1_out_be1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&be1_in_fe1>;
+					};
+				};
+			};
+		};
+
+		be1: display-backend@1e40000 {
+			compatible = "allwinner,sun7i-a20-display-backend";
+			reg = <0x01e40000 0x10000>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_DE_BE1>, <&ccu CLK_DE_BE1>,
+				 <&ccu CLK_DRAM_DE_BE1>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_DE_BE1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				be1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					be1_in_fe0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&fe0_out_be1>;
+					};
+
+					be1_in_fe1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&fe1_out_be1>;
+					};
+				};
+
+				be1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					be1_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon1_in_be0>;
+					};
+
+					be1_out_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_in_be1>;
+					};
+				};
+			};
+		};
+
+		be0: display-backend@1e60000 {
+			compatible = "allwinner,sun7i-a20-display-backend";
+			reg = <0x01e60000 0x10000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_DE_BE0>, <&ccu CLK_DE_BE0>,
+				 <&ccu CLK_DRAM_DE_BE0>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_DE_BE0>;
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
+
+					be0_in_fe1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&fe1_out_be0>;
+					};
+				};
+
+				be0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					be0_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_be0>;
+					};
+
+					be0_out_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_in_be0>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.14.2
