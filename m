From: <sean.wang@mediatek.com>
Subject: [PATCH 07/12] arm64: dts: mt7622: turn uart0 clock to real ones
Date: Thu, 4 Jan 2018 17:40:57 +0800
Message-ID: <0fc5e7b4b75a781649c189e91c6e270d0d82d1ea.1515057696.git.sean.wang@mediatek.com>
References: <cover.1515057696.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1515057696.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

This patch also cleans up two oscillators that provide clocks for MT7623.
Switch the uart clocks to the real ones while at it.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 90b2761..3b6f082 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -88,18 +88,6 @@
 		};
 	};
 
-	uart_clk: dummy25m {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-	};
-
-	bus_clk: dummy280m {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <280000000>;
-	};
-
 	pwrap_clk: dummy40m {
 		compatible = "fixed-clock";
 		clock-frequency = <40000000>;
@@ -231,7 +219,8 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11002000 0 0x400>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>, <&bus_clk>;
+		clocks = <&topckgen CLK_TOP_UART_SEL>,
+			 <&pericfg CLK_PERI_UART1_PD>;
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
-- 
2.7.4
