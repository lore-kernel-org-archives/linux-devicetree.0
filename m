From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v1 1/2] arm64: dts: mt7622: add some misc device nodes
Date: Mon, 16 Jul 2018 22:59:08 +0800
Message-ID: <2ff39c40ef6bc3054667e63c785a1d28527b5ddf.1531753039.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add some misc nodes support - timer and ARM CCI-400.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 9213c96..8cdec52 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -217,6 +217,16 @@
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
@@ -317,6 +327,32 @@
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
+	};
+
 	auxadc: adc@11001000 {
 		compatible = "mediatek,mt7622-auxadc";
 		reg = <0 0x11001000 0 0x1000>;
-- 
1.9.1
