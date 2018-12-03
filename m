From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 6/8] arm64: dts: add mmc nodes for MT2712
Date: Mon, 3 Dec 2018 19:36:00 +0800
Message-ID: <1543836962-18293-7-git-send-email-yt.shen@mediatek.com>
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
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index e9856fe..4f0aa65 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -611,6 +611,40 @@
 		status = "disabled";
 	};
 
+	mmc0: mmc@11230000 {
+		compatible = "mediatek,mt2712-mmc";
+		reg = <0 0x11230000 0 0x1000>;
+		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_0>,
+			 <&pericfg CLK_PERI_MSDC50_0_HCLK_EN>,
+			 <&pericfg CLK_PERI_MSDC30_0_QTR_EN>,
+			 <&pericfg CLK_PERI_MSDC50_0_EN>;
+		clock-names = "source", "hclk", "bus_clk", "source_cg";
+		status = "disabled";
+	};
+
+	mmc1: mmc@11240000 {
+		compatible = "mediatek,mt2712-mmc";
+		reg = <0 0x11240000 0 0x1000>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_1>,
+			 <&topckgen CLK_TOP_AXI_SEL>,
+			 <&pericfg CLK_PERI_MSDC30_1_EN>;
+		clock-names = "source", "hclk", "source_cg";
+		status = "disabled";
+	};
+
+	mmc2: mmc@11250000 {
+		compatible = "mediatek,mt2712-mmc";
+		reg = <0 0x11250000 0 0x1000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_2>,
+			 <&topckgen CLK_TOP_AXI_SEL>,
+			 <&pericfg CLK_PERI_MSDC30_2_EN>;
+		clock-names = "source", "hclk", "source_cg";
+		status = "disabled";
+	};
+
 	ssusb: usb@11271000 {
 		compatible = "mediatek,mt2712-mtu3", "mediatek,mtu3";
 		reg = <0 0x11271000 0 0x3000>,
-- 
1.9.1
