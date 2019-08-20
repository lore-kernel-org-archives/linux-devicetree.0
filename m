From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Subject: [PATCH v2 3/3] arm64: dts: sun50i-h6: Add support for
 RTC and fix the clock tree
Date: Tue, 20 Aug 2019 17:19:34 +0200
Message-ID: <20190820151934.3860-4-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBCU76DVAKGQELVQCEHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190820151934.3860-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

This patch adds RTC node and fixes the clock properties and nodes
to reflect the real clock tree.

The device nodes for the internal oscillator and osc32k are removed,
as these clocks are now provided by the RTC device. Clock references
are fixed accordingly, too.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 30 +++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 67b732e34091..67f920e0fc33 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -56,14 +56,6 @@
 		status = "disabled";
 	};
 
-	iosc: internal-osc-clk {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <16000000>;
-		clock-accuracy = <300000000>;
-		clock-output-names = "iosc";
-	};
-
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -71,11 +63,11 @@
 		clock-output-names = "osc24M";
 	};
 
-	osc32k: osc32k_clk {
+	ext_osc32k: ext_osc32k_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
-		clock-output-names = "osc32k";
+		clock-output-names = "ext_osc32k";
 	};
 
 	psci {
@@ -197,7 +189,7 @@
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-h6-ccu";
 			reg = <0x03001000 0x1000>;
-			clocks = <&osc24M>, <&osc32k>, <&iosc>;
+			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>;
 			clock-names = "hosc", "losc", "iosc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -236,7 +228,7 @@
 				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1>, <&osc24M>, <&osc32k>;
+			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
@@ -710,10 +702,20 @@
 			};
 		};
 
+		rtc: rtc@7000000 {
+			compatible = "allwinner,sun50i-h6-rtc";
+			reg = <0x07000000 0x400>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clock-output-names = "osc32k", "osc32k-out", "iosc";
+			clocks = <&ext_osc32k>;
+			#clock-cells = <1>;
+		};
+
 		r_ccu: clock@7010000 {
 			compatible = "allwinner,sun50i-h6-r-ccu";
 			reg = <0x07010000 0x400>;
-			clocks = <&osc24M>, <&osc32k>, <&iosc>,
+			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>,
 				 <&ccu CLK_PLL_PERIPH0>;
 			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
@@ -741,7 +743,7 @@
 			reg = <0x07022000 0x400>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&osc32k>;
+			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
-- 
2.22.1
