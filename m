From: <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC 3/3] arm: dts: mt2701: Add display subsystem related nodes for MT2701
Date: Thu, 12 May 2016 19:49:55 +0800
Message-ID: <1463053795-55455-4-git-send-email-yt.shen@mediatek.com>
References: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463053795-55455-1-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This patch adds the device nodes for the DISP function blocks for MT2701

Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt2701.dtsi |  117 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 363de0d..0beef2a 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -24,6 +24,13 @@
 	compatible = "mediatek,mt2701";
 	interrupt-parent = <&sysirq>;
 
+	aliases {
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		dpi0 = &dpi0;
+		dpi1 = &dpi1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -171,6 +178,14 @@
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
 
+	mipi_tx0: mipi-dphy@10010000 {
+		compatible = "mediatek,mt2701-mipi-tx";
+		reg = <0 0x10010000 0 0x90>;
+		clocks = <&clk26m>;
+		clock-output-names = "mipi_tx0_pll";
+		status = "disabled";
+	};
+
 	sysirq: interrupt-controller@10200100 {
 		compatible = "mediatek,mt2701-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -255,6 +270,79 @@
 		status = "disabled";
 	};
 
+	ovl@14007000 {
+		compatible = "mediatek,mt2701-disp-ovl";
+		reg = <0 0x14007000 0 0x1000>;
+		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_OVL>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	rdma0: rdma@14008000 {
+		compatible = "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14008000 0 0x1000>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	wdma@14009000 {
+		compatible = "mediatek,mt2701-disp-wdma";
+		reg = <0 0x14009000 0 0x1000>;
+		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_WDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	bls@1400a000 {
+		compatible = "mediatek,mt2701-disp-bls";
+		reg = <0 0x1400a000 0 0x1000>;
+		interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_BLS>;
+	};
+
+	color@1400b000 {
+		compatible = "mediatek,mt2701-disp-color";
+		reg = <0 0x1400b000 0 0x1000>;
+		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_COLOR>;
+	};
+
+	dsi0: dsi@1400c000 {
+		compatible = "mediatek,mt2701-dsi";
+		reg = <0 0x1400c000 0 0x1000>;
+		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DSI_ENGINE>, <&mmsys CLK_MM_DSI_DIG>,
+			 <&mipi_tx0>;
+		clock-names = "engine", "digital", "hs";
+		phys = <&mipi_tx0>;
+		phy-names = "dphy";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	dpi0: dpi@1400d000 {
+		compatible = "mediatek,mt2701-dpi";
+		reg = <0 0x1400d000 0 0x1000>;
+		interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DPI_DIGL>,
+			 <&mmsys CLK_MM_DPI_ENGINE>;
+		clock-names = "clk_dpi_digl",
+			      "clk_dpi_engine";
+		status = "disabled";
+	};
+
+	mutex: mutex@1400e000 {
+		compatible = "mediatek,mt2701-disp-mutex";
+		reg = <0 0x1400e000 0 0x1000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+	};
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt2701-smi-larb";
 		reg = <0 0x14010000 0 0x1000>;
@@ -265,6 +353,35 @@
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
 
+	rdma1: rdma@14012000 {
+		compatible = "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14012000 0 0x1000>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
+		mediatek,larb = <&larb0>;
+	};
+
+	ufoe@14013000 {
+		compatible = "mediatek,mt2701-disp-ufoe";
+		reg = <0 0x14013000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_DISP_UFOE>;
+	};
+
+	dpi1: dpi@14014000 {
+		compatible = "mediatek,mt2701-dpi";
+		reg = <0 0x14014000 0 0x1000>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DPI1_DIGL>,
+			 <&mmsys CLK_MM_DPI1_ENGINE>,
+			 <&topckgen CLK_TOP_DPI1_SEL>,
+			 <&topckgen CLK_TOP_TVDPLL>,
+			 <&topckgen CLK_TOP_TVDPLL_D2>,
+			 <&topckgen CLK_TOP_TVDPLL_D4>;
+		clock-names = "pixel", "engine", "sel","div1","div2","div4";
+		status = "disabled";
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt2701-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
