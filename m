From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: j721e-main: Add SDHCI nodes
Date: Thu, 19 Sep 2019 21:02:41 +0530
Message-ID: <20190919153242.29399-2-faiz_abbas@ti.com>
References: <20190919153242.29399-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919153242.29399-1-faiz_abbas@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

Add nodes for the 3 SDHCI instances present on TI's J721E device.
instance 0 supports HS400 (8 bit bus widht, DDR, 400 MBps)
while instances 1 and 2 support SDR104 (4 bit width, SDR, 100 MBps) as
their highest speed modes. Currently, only High speed (50 MHz clock) has
been enabled.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 199bc9a00b20..1650bbd10932 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -372,4 +372,54 @@
 		clocks = <&k3_clks 112 0>;
 		clock-names = "gpio";
 	};
+
+	main_sdhci0: sdhci@4f80000 {
+		compatible = "ti,j721e-sdhci-8bit";
+		reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
+		clock-names = "clk_xin", "clk_ahb";
+		clocks = <&k3_clks 91 1>, <&k3_clks 91 0>;
+		assigned-clocks = <&k3_clks 91 1>;
+		assigned-clock-parents = <&k3_clks 91 2>;
+		bus-width = <8>;
+		mmc-hs400-1_8v;
+		mmc-ddr-1_8v;
+		ti,otap-del-sel = <0x2>;
+		ti,trm-icp = <0x8>;
+		ti,strobe-sel = <0x77>;
+		dma-coherent;
+	};
+
+	main_sdhci1: sdhci@4fb0000 {
+		compatible = "ti,j721e-sdhci-4bit";
+		reg = <0x0 0x04fb0000 0x0 0x1000>, <0x0 0x4fb8000 0x0 0x400>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 92 TI_SCI_PD_EXCLUSIVE>;
+		clock-names = "clk_xin", "clk_ahb";
+		clocks = <&k3_clks 92 0>, <&k3_clks 92 5>;
+		assigned-clocks = <&k3_clks 92 0>;
+		assigned-clock-parents = <&k3_clks 92 1>;
+		ti,otap-del-sel = <0x2>;
+		ti,trm-icp = <0x8>;
+		ti,clkbuf-sel = <0x7>;
+		dma-coherent;
+		no-1-8-v;
+	};
+
+	main_sdhci2: sdhci@4f98000 {
+		compatible = "ti,j721e-sdhci-4bit";
+		reg = <0x0 0x4f98000 0x0 0x1000>, <0x0 0x4f90000 0x0 0x400>;
+		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 93 TI_SCI_PD_EXCLUSIVE>;
+		clock-names = "clk_xin", "clk_ahb";
+		clocks = <&k3_clks 93 0>, <&k3_clks 93 5>;
+		assigned-clocks = <&k3_clks 93 0>;
+		assigned-clock-parents = <&k3_clks 93 1>;
+		ti,otap-del-sel = <0x2>;
+		ti,trm-icp = <0x8>;
+		ti,clkbuf-sel = <0x7>;
+		dma-coherent;
+		no-1-8-v;
+	};
 };
-- 
2.19.2
