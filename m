From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re:[PATCH 01/16] arm: dts: add clock controller device nodes
Date: Wed, 22 Mar 2017 16:04:25 +0800
Message-ID: <1490169865-12993-1-git-send-email-sean.wang@mediatek.com>
References: <1485170975-51813-2-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485170975-51813-2-git-send-email-john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Hi John,

Some nitpicking below.

>Add clock controller nodes for MT7623, including topckgen, infracfg, pericfg and apmixedsys. This patch 
>also cleans up two oscillators that provide clocks for MT7623. Switch the uart clocks to the real ones 
>while at it.
>
>Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
>---
> arch/arm/boot/dts/mt7623.dtsi |   60 ++++++++++++++++++++++++++++++++++-------
> 1 file changed, 51 insertions(+), 9 deletions(-)
>
>diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi index fd2b614..592fc0a 
>100644
>--- a/arch/arm/boot/dts/mt7623.dtsi
>+++ b/arch/arm/boot/dts/mt7623.dtsi
>@@ -14,6 +14,8 @@
> 
> #include <dt-bindings/interrupt-controller/irq.h>
> #include <dt-bindings/interrupt-controller/arm-gic.h>
>+#include <dt-bindings/clock/mt2701-clk.h> #include 
>+<dt-bindings/reset/mt2701-resets.h>
> #include "skeleton64.dtsi"
> 
> / {
>@@ -53,16 +55,18 @@
> 		#clock-cells = <0>;
> 	};
> 
>-	rtc_clk: dummy32k {
>+	rtc32k: oscillator@1 {
> 		compatible = "fixed-clock";
>-		clock-frequency = <32000>;
> 		#clock-cells = <0>;
>+		clock-frequency = <32000>;
>+		clock-output-names = "rtc32k";
> 	};
> 
>-	uart_clk: dummy26m {
>+	clk26m: oscillator@0 {
> 		compatible = "fixed-clock";
>-		clock-frequency = <26000000>;
> 		#clock-cells = <0>;
>+		clock-frequency = <26000000>;
>+		clock-output-names = "clk26m";
> 	};
> 
> 	timer {
>@@ -74,6 +78,32 @@
> 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> 	};
> 
>+	topckgen: syscon@10000000 {
>+		compatible = "mediatek,mt7623-topckgen",
>+			     "mediatek,mt2701-topckgen",
>+			     "syscon";
>+		reg = <0 0x10000000 0 0x1000>;
>+		#clock-cells = <1>;
>+	};
>+
>+	infracfg: syscon@10001000 {
>+		compatible = "mediatek,mt2701-infracfg",
>+			     "mediatek,mt7623-infracfg",

the order should be 
		compatible =  "mediatek,mt7623-pericfg",
			      "mediatek,mt2701-pericfg"
?

>+			     "syscon";
>+		reg = <0 0x10001000 0 0x1000>;
>+		#clock-cells = <1>;
>+		#reset-cells = <1>;
>+	};
>+
>+	pericfg: syscon@10003000 {
>+		compatible =  "mediatek,mt7623-pericfg",
>+			      "mediatek,mt2701-pericfg",
>+			      "syscon";
>+		reg = <0 0x10003000 0 0x1000>;
>+		#clock-cells = <1>;
>+		#reset-cells = <1>;
>+	};
>+
> 	watchdog: watchdog@10007000 {
> 		compatible = "mediatek,mt7623-wdt",
> 			     "mediatek,mt6589-wdt";
>@@ -85,7 +115,7 @@
> 			     "mediatek,mt6577-timer";
> 		reg = <0 0x10008000 0 0x80>;
> 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;
>-		clocks = <&system_clk>, <&rtc_clk>;
>+		clocks = <&system_clk>, <&rtc32k>;
> 		clock-names = "system-clk", "rtc-clk";
> 	};
> 
>@@ -98,6 +128,14 @@
> 		reg = <0 0x10200100 0 0x1c>;
> 	};
> 
>+	apmixedsys: syscon@10209000 {
>+		compatible = "mediatek,mt2701-apmixedsys",
>+			     "mediatek,mt2701-apmixedsys",

duplicated items which seems wrong to type

>+			     "syscon";
>+		reg = <0 0x10209000 0 0x1000>;
>+		#clock-cells = <1>;
>+	};
>+
> 	gic: interrupt-controller@10211000 {
> 		compatible = "arm,cortex-a7-gic";
> 		interrupt-controller;
>@@ -114,7 +152,8 @@
> 			     "mediatek,mt6577-uart";
> 		reg = <0 0x11002000 0 0x400>;
> 		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
>-		clocks = <&uart_clk>;
>+		clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
>+		clock-names = "baud", "bus";
> 		status = "disabled";
> 	};
> 
>@@ -123,7 +162,8 @@
> 			     "mediatek,mt6577-uart";
> 		reg = <0 0x11003000 0 0x400>;
> 		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
>-		clocks = <&uart_clk>;
>+		clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
>+		clock-names = "baud", "bus";
> 		status = "disabled";
> 	};
> 
>@@ -132,7 +172,8 @@
> 			     "mediatek,mt6577-uart";
> 		reg = <0 0x11004000 0 0x400>;
> 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
>-		clocks = <&uart_clk>;
>+		clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
>+		clock-names = "baud", "bus";
> 		status = "disabled";
> 	};
> 
>@@ -141,7 +182,8 @@
> 			     "mediatek,mt6577-uart";
> 		reg = <0 0x11005000 0 0x400>;
> 		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
>-		clocks = <&uart_clk>;
>+		clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
>+		clock-names = "baud", "bus";
> 		status = "disabled";
> 	};
>};
--
1.7.10.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
