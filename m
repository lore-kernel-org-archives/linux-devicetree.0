From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v6 3/5] ARM: dts: sun8i-h3: add HDMI video nodes
Date: Sun, 20 Nov 2016 12:20:21 +0100
Message-ID: <cdf50b8433e2d9a053e35f8788bfcd5d41504312.1479641523.git.moinejf@free.fr>
References: <cover.1479641523.git.moinejf@free.fr>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBANEY3AQKGQE7LKCB3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1479641523.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 416b825..7c6b1d5 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -140,6 +140,16 @@
 		#size-cells = <1>;
 		ranges;
 
+		de: de-controller@01000000 {
+			compatible = "allwinner,sun8i-h3-display-engine";
+			reg = <0x01000000 0x400000>;
+			clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+			clock-names = "bus", "clock";
+			resets = <&ccu RST_BUS_DE>;
+			ports = <&lcd0_p>;
+			status = "disabled";
+		};
+
 		dma: dma-controller@01c02000 {
 			compatible = "allwinner,sun8i-h3-dma";
 			reg = <0x01c02000 0x1000>;
@@ -149,6 +159,23 @@
 			#dma-cells = <1>;
 		};
 
+		lcd0: lcd-controller@01c0c000 {
+			compatible = "allwinner,sun8i-a83t-tcon";
+			reg = <0x01c0c000 0x400>;
+			clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
+			clock-names = "bus", "clock";
+			resets = <&ccu RST_BUS_TCON0>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			lcd0_p: port {
+				lcd0_hdmi: endpoint {
+					remote-endpoint = <&hdmi_lcd0>;
+				};
+			};
+		};
+
 		mmc0: mmc@01c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
@@ -314,6 +341,11 @@
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+
+			assigned-clocks = <&ccu CLK_PLL_DE>,
+					  <&ccu CLK_DE>;
+			assigned-clock-rates =  <864000000>,
+						<432000000>;
 		};
 
 		pio: pinctrl@01c20800 {
@@ -564,6 +596,25 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		hdmi: hdmi@01ee0000 {
+			compatible = "allwinner,sun8i-h3-hdmi";
+			reg = <0x01ee0000 0x20000>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
+				 <&ccu CLK_HDMI_DDC>;
+			clock-names = "bus", "clock", "ddc-clock";
+			resets = <&ccu RST_BUS_HDMI0>, <&ccu RST_BUS_HDMI1>;
+			reset-names = "hdmi0", "hdmi1";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {			/* video */
+				reg = <0>;
+				hdmi_lcd0: endpoint {
+					remote-endpoint = <&lcd0_hdmi>;
+				};
+			};
+		};
+
 		rtc: rtc@01f00000 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
-- 
2.10.2
