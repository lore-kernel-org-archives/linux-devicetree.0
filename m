From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 10/10] arm: dts: mt2701: Use real clock for UARTs
Date: Wed, 22 Jun 2016 15:40:29 +0800
Message-ID: <1466581229-2342-11-git-send-email-erin.lo@mediatek.com>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1466581229-2342-1-git-send-email-erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We used to use a fixed rate clock for the UARTs. Now that we have clock
support we can associate the correct clocks to the UARTs and drop the
26MHz fixed rate UART clock.

Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt2701.dtsi | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index c9a8dbf..7eab6f4 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -73,12 +73,6 @@
 		#clock-cells = <0>;
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
@@ -186,7 +180,8 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11002000 0 0x400>;
 		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -195,7 +190,8 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11003000 0 0x400>;
 		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -204,7 +200,8 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11004000 0 0x400>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -213,7 +210,8 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11005000 0 0x400>;
 		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
+		clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 };
-- 
1.9.1
