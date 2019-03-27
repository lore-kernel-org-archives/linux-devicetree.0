From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 01/25] arm64: dts: add display nodes for mt8183
Date: Wed, 27 Mar 2019 14:18:57 +0800
Message-ID: <1553667561-25447-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add display nodes for mt8183

Change-Id: I9ce7081a2159ec7cc199999285b0390b01de43fe
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 107 +++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 75c4881..f219dbd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -16,6 +16,14 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl0 = &ovl0;
+		ovl_2l0 = &ovl0_2l;
+		ovl_2l1 = &ovl1_2l;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -317,6 +325,105 @@
 			#clock-cells = <1>;
 		};
 
+		display_components: dispsys@14000000 {
+			compatible = "mediatek,mt8183-display";
+			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+		};
+
+		ovl0: ovl@14008000 {
+			compatible = "mediatek,mt8183-disp-ovl";
+			reg = <0 0x14008000 0 0x1000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl0_2l: ovl@14009000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl1_2l: ovl@1400a000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
+			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		rdma0: rdma@1400b000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		rdma1: rdma@1400c000 {
+			compatible = "mediatek,mt8183-disp-rdma1";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,larb = <&larb0>;
+		};
+
+		color0: color@1400e000 {
+			compatible = "mediatek,mt8183-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+		};
+
+		ccorr0: ccorr@1400f000 {
+			compatible = "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+		};
+
+		aal0: aal@14010000 {
+			compatible = "mediatek,mt8183-disp-aal",
+				     "mediatek,mt8173-disp-aal";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+		};
+
+		gamma0: gamma@14011000 {
+			compatible = "mediatek,mt8183-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+		};
+
+		dither0: dither@14012000 {
+			compatible = "mediatek,mt8183-disp-dither";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+		};
+
 		smi_common: smi@14019000 {
 			compatible = "mediatek,mt8183-smi-common", "syscon";
 			reg = <0 0x14019000 0 0x1000>;
-- 
1.8.1.1.dirty
