From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/5] arm64: dts: mt7622: add some misc device nodes
Date: Wed, 15 Aug 2018 13:18:13 +0800
Message-ID: <68c4ca0158518d6bf50f2f7becfcb87ff3ce158a.1534130854.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Roy Luo <cheng-hao.luo@mediatek.com>, Weijie Gao <weijie.gao@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add timer and CCI-400 device nodes for MT7622.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 9213c96..b235df7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -79,6 +79,7 @@
 			#cooling-cells = <2>;
 			enable-method = "psci";
 			clock-frequency = <1300000000>;
+			cci-control-port = <&cci_control2>;
 		};
 
 		cpu1: cpu@1 {
@@ -91,6 +92,7 @@
 			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
 			clock-frequency = <1300000000>;
+			cci-control-port = <&cci_control2>;
 		};
 	};
 
@@ -217,6 +219,16 @@
 		#reset-cells = <1>;
 	};
 
+	timer: timer@10004000 {
+		compatible = "mediatek,mt7622-timer",
+			     "mediatek,mt6577-timer";
+		reg = <0 0x10004000 0 0x80>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_APXGPT_PD>,
+			 <&topckgen CLK_TOP_RTC>;
+		clock-names = "system-clk", "rtc-clk";
+	};
+
 	scpsys: scpsys@10006000 {
 		compatible = "mediatek,mt7622-scpsys",
 			     "syscon";
@@ -317,6 +329,42 @@
 		      <0 0x10360000 0 0x2000>;
 	};
 
+	cci: cci@10390000 {
+		compatible = "arm,cci-400";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0 0x10390000 0 0x1000>;
+		ranges = <0 0 0x10390000 0x10000>;
+
+		cci_control0: slave-if@1000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace-lite";
+			reg = <0x1000 0x1000>;
+		};
+
+		cci_control1: slave-if@4000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x4000 0x1000>;
+		};
+
+		cci_control2: slave-if@5000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x5000 0x1000>;
+		};
+
+		pmu@9000 {
+			compatible = "arm,cci-400-pmu,r1";
+			reg = <0x9000 0x5000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 61 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
 	auxadc: adc@11001000 {
 		compatible = "mediatek,mt7622-auxadc";
 		reg = <0 0x11001000 0 0x1000>;
-- 
1.9.1
