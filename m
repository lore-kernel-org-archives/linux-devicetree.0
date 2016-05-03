From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 1/2] ARM: sun4i: dt: Add pll3 and pll7 clocks
Date: Tue,  3 May 2016 20:14:18 +0300
Message-ID: <1462295659-6945-2-git-send-email-plaes@plaes.org>
References: <1462295659-6945-1-git-send-email-plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBB5NYUO4QKGQEAQM4PRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1462295659-6945-1-git-send-email-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable pll3 and pll7 clocks that are needed to drive display clocks.

Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 268a150..c893744 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -184,6 +184,15 @@
 			clock-output-names = "osc24M";
 		};
 
+		osc3M: osc3M_clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <8>;
+			clock-mult = <1>;
+			clocks = <&osc24M>;
+			clock-output-names = "osc3M";
+		};
+
 		osc32k: clk@0 {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -208,6 +217,24 @@
 					     "pll2-4x", "pll2-8x";
 		};
 
+		pll3: clk@01c20010 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-pll3-clk";
+			reg = <0x01c20010 0x4>;
+			clocks = <&osc3M>;
+			clock-output-names = "pll3";
+		};
+
+		pll3x2: pll3x2_clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <2>;
+			clocks = <&pll3>;
+			clock-output-names = "pll3-x2";
+		};
+
+
 		pll4: clk@01c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll1-clk";
@@ -232,6 +259,23 @@
 			clock-output-names = "pll6_sata", "pll6_other", "pll6";
 		};
 
+		pll7: clk@01c20030 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-pll3-clk";
+			reg = <0x01c20030 0x4>;
+			clocks = <&osc3M>;
+			clock-output-names = "pll7";
+		};
+
+		pll7x2: pll7x2_clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <2>;
+			clocks = <&pll7>;
+			clock-output-names = "pll7-2x";
+		};
+
 		/* dummy is 200M */
 		cpu: cpu@01c20054 {
 			#clock-cells = <0>;
-- 
2.8.1
