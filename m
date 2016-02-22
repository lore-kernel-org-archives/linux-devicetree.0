From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 02/10] ARM: dts: sunxi: make PLL8 in the H3 a
 proper clock
Date: Mon, 22 Feb 2016 18:20:47 +0000
Message-ID: <1456165255-31013-3-git-send-email-andre.przywara@arm.com>
References: <1456165255-31013-1-git-send-email-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBENDVW3AKGQERKB6YOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1456165255-31013-1-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now that we can reuse the A31 PLL6 clock driver for clocks other then
PLL6 itself, describe the PLL8 clock properly.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 3ba65c2..d84ea9b 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -137,12 +137,12 @@
 			clock-output-names = "pll6d2";
 		};
 
-		/* dummy clock until pll6 can be reused */
-		pll8: pll8_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <1>;
-			clock-output-names = "pll8";
+		pll8: clk@c01c20044 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun6i-a31-pll6-clk";
+			reg = <0x01c20044 0x4>;
+			clocks = <&osc24M>;
+			clock-output-names = "pll8", "pll8x2";
 		};
 
 		cpu: cpu_clk@01c20050 {
@@ -243,7 +243,7 @@
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20088 0x4>;
-			clocks = <&osc24M>, <&pll6 0>, <&pll8>;
+			clocks = <&osc24M>, <&pll6 0>, <&pll8 0>;
 			clock-output-names = "mmc0",
 					     "mmc0_output",
 					     "mmc0_sample";
@@ -253,7 +253,7 @@
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c2008c 0x4>;
-			clocks = <&osc24M>, <&pll6 0>, <&pll8>;
+			clocks = <&osc24M>, <&pll6 0>, <&pll8 0>;
 			clock-output-names = "mmc1",
 					     "mmc1_output",
 					     "mmc1_sample";
@@ -263,7 +263,7 @@
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20090 0x4>;
-			clocks = <&osc24M>, <&pll6 0>, <&pll8>;
+			clocks = <&osc24M>, <&pll6 0>, <&pll8 0>;
 			clock-output-names = "mmc2",
 					     "mmc2_output",
 					     "mmc2_sample";
-- 
2.6.4
