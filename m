From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 4/8] arm64: dts: add spi nodes for MT2712
Date: Mon, 3 Dec 2018 19:35:58 +0800
Message-ID: <1543836962-18293-5-git-send-email-yt.shen@mediatek.com>
References: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: YT Shen <yt.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 65 +++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 7bac8b6..4843376 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -463,6 +463,19 @@
 		status = "disabled";
 	};
 
+	spi0: spi@1100a000 {
+		compatible = "mediatek,mt2712-spi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0 0x1100a000 0 0x100>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
+			 <&topckgen CLK_TOP_SPI_SEL>,
+			 <&pericfg CLK_PERI_SPI0>;
+		clock-names = "parent-clk", "sel-clk", "spi-clk";
+		status = "disabled";
+	};
+
 	i2c3: i2c@11010000 {
 		compatible = "mediatek,mt2712-i2c";
 		reg = <0 0x11010000 0 0x90>,
@@ -508,6 +521,58 @@
 		status = "disabled";
 	};
 
+	spi2: spi@11015000 {
+		compatible = "mediatek,mt2712-spi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0 0x11015000 0 0x100>;
+		interrupts = <GIC_SPI 284 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
+			 <&topckgen CLK_TOP_SPI_SEL>,
+			 <&pericfg CLK_PERI_SPI2>;
+		clock-names = "parent-clk", "sel-clk", "spi-clk";
+		status = "disabled";
+	};
+
+	spi3: spi@11016000 {
+		compatible = "mediatek,mt2712-spi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0 0x11016000 0 0x100>;
+		interrupts = <GIC_SPI 285 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
+			 <&topckgen CLK_TOP_SPI_SEL>,
+			 <&pericfg CLK_PERI_SPI3>;
+		clock-names = "parent-clk", "sel-clk", "spi-clk";
+		status = "disabled";
+	};
+
+	spi4: spi@10012000 {
+		compatible = "mediatek,mt2712-spi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0 0x10012000 0 0x100>;
+		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
+			 <&topckgen CLK_TOP_SPI_SEL>,
+			 <&infracfg CLK_INFRA_AO_SPI0>;
+		clock-names = "parent-clk", "sel-clk", "spi-clk";
+		status = "disabled";
+	};
+
+	spi5: spi@11018000 {
+		compatible = "mediatek,mt2712-spi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0 0x11018000 0 0x100>;
+		interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
+			 <&topckgen CLK_TOP_SPI_SEL>,
+			 <&pericfg CLK_PERI_SPI5>;
+		clock-names = "parent-clk", "sel-clk", "spi-clk";
+		status = "disabled";
+	};
+
 	uart4: serial@11019000 {
 		compatible = "mediatek,mt2712-uart",
 			     "mediatek,mt6577-uart";
-- 
1.9.1
