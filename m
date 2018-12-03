From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 3/8] arm64: dts: add i2c nodes for MT2712
Date: Mon, 3 Dec 2018 19:35:57 +0800
Message-ID: <1543836962-18293-4-git-send-email-yt.shen@mediatek.com>
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
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index d429770..7bac8b6 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -418,6 +418,96 @@
 		status = "disabled";
 	};
 
+	i2c0: i2c@11007000 {
+		compatible = "mediatek,mt2712-i2c";
+		reg = <0 0x11007000 0 0x90>,
+		      <0 0x11000180 0 0x80>;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <4>;
+		clocks = <&pericfg CLK_PERI_I2C0>,
+			 <&pericfg CLK_PERI_AP_DMA>;
+		clock-names = "main",
+			      "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c1: i2c@11008000 {
+		compatible = "mediatek,mt2712-i2c";
+		reg = <0 0x11008000 0 0x90>,
+		      <0 0x11000200 0 0x80>;
+		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <4>;
+		clocks = <&pericfg CLK_PERI_I2C1>,
+			 <&pericfg CLK_PERI_AP_DMA>;
+		clock-names = "main",
+			      "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@11009000 {
+		compatible = "mediatek,mt2712-i2c";
+		reg = <0 0x11009000 0 0x90>,
+		      <0 0x11000280 0 0x80>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <4>;
+		clocks = <&pericfg CLK_PERI_I2C2>,
+			 <&pericfg CLK_PERI_AP_DMA>;
+		clock-names = "main",
+			      "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c3: i2c@11010000 {
+		compatible = "mediatek,mt2712-i2c";
+		reg = <0 0x11010000 0 0x90>,
+		      <0 0x11000300 0 0x80>;
+		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <4>;
+		clocks = <&pericfg CLK_PERI_I2C3>,
+			 <&pericfg CLK_PERI_AP_DMA>;
+		clock-names = "main",
+			      "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c4: i2c@11011000 {
+		compatible = "mediatek,mt2712-i2c";
+		reg = <0 0x11011000 0 0x90>,
+		      <0 0x11000380 0 0x80>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <4>;
+		clocks = <&pericfg CLK_PERI_I2C4>,
+			 <&pericfg CLK_PERI_AP_DMA>;
+		clock-names = "main",
+			      "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c5: i2c@11013000 {
+		compatible = "mediatek,mt2712-i2c";
+		reg = <0 0x11013000 0 0x90>,
+		      <0 0x11000100 0 0x80>;
+		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <4>;
+		clocks = <&pericfg CLK_PERI_I2C5>,
+			 <&pericfg CLK_PERI_AP_DMA>;
+		clock-names = "main",
+			      "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	uart4: serial@11019000 {
 		compatible = "mediatek,mt2712-uart",
 			     "mediatek,mt6577-uart";
-- 
1.9.1
