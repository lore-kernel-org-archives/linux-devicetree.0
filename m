From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 8/9] ARM: dts: sun6i: Add second display
 pipeline device nodes
Date: Fri, 21 Apr 2017 16:38:56 +0800
Message-ID: <20170421083857.29636-9-wens@csie.org>
References: <20170421083857.29636-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJUK47DQKGQEG6C5V7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170421083857.29636-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Allwinner A31/A31s SoCs have 2 display pipelines, as in 2 display
frontends, backends, and tcons each. The relationship between the
backends and tcons are 1:1, but the frontends can feed either backend.

Add device nodes and of graph nodes describing this relationship.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 168 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 9c999d3788f6..dfcf64515d7f 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -232,7 +232,7 @@
 
 	de: display-engine {
 		compatible = "allwinner,sun6i-a31-display-engine";
-		allwinner,pipelines = <&fe0>;
+		allwinner,pipelines = <&fe0>, <&fe1>;
 		status = "disabled";
 	};
 
@@ -289,6 +289,43 @@
 			};
 		};
 
+		tcon1: lcd-controller@01c0d000 {
+			compatible = "allwinner,sun6i-a31-tcon";
+			reg = <0x01c0d000 0x1000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&ccu RST_AHB1_LCD1>;
+			reset-names = "lcd";
+			clocks = <&ccu CLK_AHB1_LCD1>,
+				 <&ccu CLK_LCD1_CH0>,
+				 <&ccu CLK_LCD1_CH1>;
+			clock-names = "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names = "tcon1-pixel-clock";
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
+					tcon1_in_drc1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&drc1_out_tcon1>;
+					};
+				};
+
+				tcon1_out: port@1 {
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
@@ -896,6 +933,130 @@
 						reg = <0>;
 						remote-endpoint = <&be0_in_fe0>;
 					};
+
+					fe0_out_be1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&be1_in_fe0>;
+					};
+				};
+			};
+		};
+
+		fe1: display-frontend@01e20000 {
+			compatible = "allwinner,sun6i-a31-display-frontend";
+			reg = <0x01e20000 0x20000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB1_FE1>, <&ccu CLK_FE1>,
+				 <&ccu CLK_DRAM_FE1>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_AHB1_FE1>;
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
+		be1: display-backend@01e40000 {
+			compatible = "allwinner,sun6i-a31-display-backend";
+			reg = <0x01e40000 0x10000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB1_BE1>, <&ccu CLK_BE1>,
+				 <&ccu CLK_DRAM_BE1>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_AHB1_BE1>;
+
+			assigned-clocks = <&ccu CLK_BE1>;
+			assigned-clock-rates = <300000000>;
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
+					be1_out_drc1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&drc1_in_be1>;
+					};
+				};
+			};
+		};
+
+		drc1: drc@01e50000 {
+			compatible = "allwinner,sun6i-a31-drc";
+			reg = <0x01e50000 0x10000>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB1_DRC1>, <&ccu CLK_IEP_DRC1>,
+				 <&ccu CLK_DRAM_DRC1>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&ccu RST_AHB1_DRC1>;
+
+			assigned-clocks = <&ccu CLK_IEP_DRC1>;
+			assigned-clock-rates = <300000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				drc1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					drc1_in_be1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be1_out_drc1>;
+					};
+				};
+
+				drc1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					drc1_out_tcon1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon1_in_drc1>;
+					};
 				};
 			};
 		};
@@ -926,6 +1087,11 @@
 						reg = <0>;
 						remote-endpoint = <&fe0_out_be0>;
 					};
+
+					be0_in_fe1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&fe1_out_be0>;
+					};
 				};
 
 				be0_out: port@1 {
-- 
2.11.0
