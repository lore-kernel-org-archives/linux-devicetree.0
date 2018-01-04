From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 09/12] arm64: dts: mt7622: add flash related device nodes
Date: Thu, 4 Jan 2018 17:40:59 +0800
Message-ID: <157338ea729032365251766dcc3134861de33562.1515057696.git.sean.wang@mediatek.com>
References: <cover.1515057696.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1515057696.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add nodes for NOR flash, parallel Nand flash with error correction code
support.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 23 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 34 ++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 3b2eacc..20b1160 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -235,6 +235,10 @@
 	};
 };
 
+&bch {
+	status = "disabled";
+};
+
 &btif {
 	status = "okay";
 };
@@ -257,6 +261,25 @@
 	status = "okay";
 };
 
+&nandc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&parallel_nand_pins>;
+	status = "disabled";
+};
+
+&nor_flash {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi_nor_pins>;
+	status = "disabled";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm7_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 681c87a..540d2fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -395,6 +395,40 @@
 		status = "disabled";
 	};
 
+	nandc: nfi@1100d000 {
+		compatible = "mediatek,mt7622-nfc";
+		reg = <0 0x1100D000 0 0x1000>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI_PD>,
+			 <&pericfg CLK_PERI_SNFI_PD>;
+		clock-names = "nfi_clk", "pad_clk";
+		ecc-engine = <&bch>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	bch: ecc@1100e000 {
+		compatible = "mediatek,mt7622-ecc";
+		reg = <0 0x1100e000 0 0x1000>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFIECC_PD>;
+		clock-names = "nfiecc_clk";
+		status = "disabled";
+	};
+
+	nor_flash: spi@11014000 {
+		compatible = "mediatek,mt7622-nor",
+			     "mediatek,mt8173-nor";
+		reg = <0 0x11014000 0 0xe0>;
+		clocks = <&pericfg CLK_PERI_FLASH_PD>,
+			 <&topckgen CLK_TOP_FLASH_SEL>;
+		clock-names = "spi", "sf";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		status = "disabled";
+	};
+
 	spi1: spi@11016000 {
 		compatible = "mediatek,mt7622-spi";
 		reg = <0 0x11016000 0 0x100>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
