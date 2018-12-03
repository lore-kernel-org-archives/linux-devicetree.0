From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 2/8] arm64: dts: add iommu/smi nodes for MT2712
Date: Mon, 3 Dec 2018 19:35:56 +0800
Message-ID: <1543836962-18293-3-git-send-email-yt.shen@mediatek.com>
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
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 128 ++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 6c228a2..d429770 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt2712-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/memory/mt2712-larb-port.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt2712-power.h>
 #include "mt2712-pinfunc.h"
@@ -313,12 +314,33 @@
 		status = "disabled";
 	};
 
+	iommu0: iommu@10205000 {
+		compatible = "mediatek,mt2712-m4u";
+		reg = <0 0x10205000 0 0x1000>;
+		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_M4U>;
+		clock-names = "bclk";
+		mediatek,larbs = <&larb0 &larb1 &larb2
+				  &larb3 &larb6>;
+		#iommu-cells = <1>;
+	};
+
 	apmixedsys: syscon@10209000 {
 		compatible = "mediatek,mt2712-apmixedsys", "syscon";
 		reg = <0 0x10209000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
+	iommu1: iommu@1020a000 {
+		compatible = "mediatek,mt2712-m4u";
+		reg = <0 0x1020a000 0 0x1000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_M4U>;
+		clock-names = "bclk";
+		mediatek,larbs = <&larb4 &larb5 &larb7>;
+		#iommu-cells = <1>;
+	};
+
 	mcucfg: syscon@10220000 {
 		compatible = "mediatek,mt2712-mcucfg", "syscon";
 		reg = <0 0x10220000 0 0x1000>;
@@ -543,12 +565,85 @@
 		#clock-cells = <1>;
 	};
 
+	larb0: larb@14021000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x14021000 0 0x1000>;
+		mediatek,smi = <&smi_common0>;
+		mediatek,larb-id = <0>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_SMI_LARB0>,
+			 <&mmsys CLK_MM_SMI_LARB0>;
+		clock-names = "apb", "smi";
+	};
+
+	smi_common0: smi@14022000 {
+		compatible = "mediatek,mt2712-smi-common";
+		reg = <0 0x14022000 0 0x1000>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_SMI_COMMON>,
+			 <&mmsys CLK_MM_SMI_COMMON>;
+		clock-names = "apb", "smi";
+	};
+
+	larb4: larb@14027000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x14027000 0 0x1000>;
+		mediatek,smi = <&smi_common1>;
+		mediatek,larb-id = <4>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_SMI_LARB4>,
+			 <&mmsys CLK_MM_SMI_LARB4>;
+		clock-names = "apb", "smi";
+	};
+
+	larb5: larb@14030000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x14030000 0 0x1000>;
+		mediatek,smi = <&smi_common1>;
+		mediatek,larb-id = <5>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_SMI_LARB5>,
+			 <&mmsys CLK_MM_SMI_LARB5>;
+		clock-names = "apb", "smi";
+	};
+
+	smi_common1: smi@14031000 {
+		compatible = "mediatek,mt2712-smi-common";
+		reg = <0 0x14031000 0 0x1000>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_SMI_COMMON1>,
+			 <&mmsys CLK_MM_SMI_COMMON1>;
+		clock-names = "apb", "smi";
+	};
+
+	larb7: larb@14032000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x14032000 0 0x1000>;
+		mediatek,smi = <&smi_common1>;
+		mediatek,larb-id = <7>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_SMI_LARB7>,
+			 <&mmsys CLK_MM_SMI_LARB7>;
+		clock-names = "apb", "smi";
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt2712-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
+	larb2: larb@15001000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x15001000 0 0x1000>;
+		mediatek,smi = <&smi_common0>;
+		mediatek,larb-id = <2>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
+		clocks = <&imgsys CLK_IMG_SMI_LARB2>,
+			 <&imgsys CLK_IMG_SMI_LARB2>;
+		clock-names = "apb", "smi";
+	};
+
 	bdpsys: syscon@15010000 {
 		compatible = "mediatek,mt2712-bdpsys", "syscon";
 		reg = <0 0x15010000 0 0x1000>;
@@ -561,12 +656,45 @@
 		#clock-cells = <1>;
 	};
 
+	larb1: larb@16010000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x16010000 0 0x1000>;
+		mediatek,smi = <&smi_common0>;
+		mediatek,larb-id = <1>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_VDEC>;
+		clocks = <&vdecsys CLK_VDEC_CKEN>,
+			 <&vdecsys CLK_VDEC_LARB1_CKEN>;
+		clock-names = "apb", "smi";
+	};
+
 	vencsys: syscon@18000000 {
 		compatible = "mediatek,mt2712-vencsys", "syscon";
 		reg = <0 0x18000000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
+	larb3: larb@18001000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x18001000 0 0x1000>;
+		mediatek,smi = <&smi_common0>;
+		mediatek,larb-id = <3>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_VENC>;
+		clocks = <&vencsys CLK_VENC_SMI_COMMON_CON>,
+			 <&vencsys CLK_VENC_VENC>;
+		clock-names = "apb", "smi";
+	};
+
+	larb6: larb@18002000 {
+		compatible = "mediatek,mt2712-smi-larb";
+		reg = <0 0x18002000 0 0x1000>;
+		mediatek,smi = <&smi_common0>;
+		mediatek,larb-id = <6>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_VENC>;
+		clocks = <&vencsys CLK_VENC_SMI_COMMON_CON>,
+			 <&vencsys CLK_VENC_VENC>;
+		clock-names = "apb", "smi";
+	};
+
 	jpgdecsys: syscon@19000000 {
 		compatible = "mediatek,mt2712-jpgdecsys", "syscon";
 		reg = <0 0x19000000 0 0x1000>;
-- 
1.9.1
