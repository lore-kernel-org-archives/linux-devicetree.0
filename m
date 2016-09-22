From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/3] ARM: dts: r7s72100: add sdhi clock to device tree
Date: Thu, 22 Sep 2016 17:32:09 -0400
Message-ID: <20160922213211.7988-2-chris.brandt@renesas.com>
References: <20160922213211.7988-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160922213211.7988-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi            | 8 ++++++++
 include/dt-bindings/clock/r7s72100-clock.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e18d4e6..e97d6d1 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -149,6 +149,14 @@
 			>;
 			clock-output-names = "spi0", "spi1", "spi2", "spi3", "spi4";
 		};
+		mstp12_clks: mstp12_clks@fcfe0444 {
+			#clock-cells = <1>;
+			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
+			reg = <0xfcfe0444 4>;
+			clocks = <&p1_clk>, <&p1_clk>;
+			clock-indices = <R7S72100_CLK_SDHI1 R7S72100_CLK_SDHI0>;
+			clock-output-names = "sdhi1", "sdhi0";
+		};
 	};
 
 	cpus {
diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index 5eaf0fb..29e01ed 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -44,4 +44,8 @@
 #define R7S72100_CLK_SPI3	4
 #define R7S72100_CLK_SPI4	3
 
+/* MSTP12 */
+#define R7S72100_CLK_SDHI0	3
+#define R7S72100_CLK_SDHI1	2
+
 #endif /* __DT_BINDINGS_CLOCK_R7S72100_H__ */
-- 
2.9.2
