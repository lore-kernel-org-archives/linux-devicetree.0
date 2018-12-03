From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 7/8] arm64: dts: add nand nodes for MT2712
Date: Mon, 3 Dec 2018 19:36:01 +0800
Message-ID: <1543836962-18293-8-git-send-email-yt.shen@mediatek.com>
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
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 4f0aa65..e8afb54 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -504,6 +504,27 @@
 		status = "disabled";
 	};
 
+	nandc: nfi@1100e000 {
+		compatible = "mediatek,mt2712-nfc";
+		reg = <0 0x1100e000 0 0x1000>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_NFI2X_EN>, <&pericfg CLK_PERI_NFI>;
+		clock-names = "nfi_clk", "pad_clk";
+		ecc-engine = <&bch>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	bch: ecc@1100f000 {
+		compatible = "mediatek,mt2712-ecc";
+		reg = <0 0x1100f000 0 0x1000>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_NFI1X_CK_EN>;
+		clock-names = "nfiecc_clk";
+		status = "disabled";
+	};
+
 	i2c3: i2c@11010000 {
 		compatible = "mediatek,mt2712-i2c";
 		reg = <0 0x11010000 0 0x90>,
-- 
1.9.1
