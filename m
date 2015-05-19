From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/3] ARM64: dts: mt8173: Use real clock for UARTs
Date: Tue, 19 May 2015 12:53:43 +0200
Message-ID: <1432032824-7955-3-git-send-email-s.hauer@pengutronix.de>
References: <1432032824-7955-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432032824-7955-1-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We used to use a fixed rate clock for the UARTs. Now that we have clock
support we can associate the correct clocks to the UARTs and drop the
26MHz fixed rate UART clock.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 30ac8dd..cfdca03 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -82,12 +82,6 @@
 		cpu_on	      = <0x84000003>;
 	};
 
-	uart_clk: dummy26m {
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-		#clock-cells = <0>;
-	};
-
 	clk26m: oscillator@0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -193,7 +187,8 @@
 					"mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -202,7 +197,8 @@
 					"mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -211,7 +207,8 @@
 					"mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -220,7 +217,8 @@
 					"mediatek,mt6577-uart";
 			reg = <0 0x11005000 0 0x400>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
