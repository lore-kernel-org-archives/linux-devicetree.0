From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARC: HSDK: Add core pll node to DT to manage cpu clk
Date: Mon,  4 Sep 2017 12:48:43 +0300
Message-ID: <20170904094843.32207-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add core pll node (core_clk) to manage cpu frequency.
core_clk node represents pll itself.
input_clk node represents clock signal source (basically xtal)
which comes to pll input.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 arch/arc/boot/dts/hsdk.dts      | 11 +++++++++--
 arch/arc/configs/hsdk_defconfig |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 229d13a..8412669 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -57,10 +57,10 @@
 		};
 	};
 
-	core_clk: core-clk {
+	input_clk: input-clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-		clock-frequency = <500000000>;
+		clock-frequency = <33333333>;
 	};
 
 	cpu_intc: cpu-interrupt-controller {
@@ -102,6 +102,13 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		core_clk: core-clk@0 {
+			compatible = "snps,hsdk-core-pll-clock";
+			reg = <0x00 0x10>, <0x14B8 0x4>;
+			#clock-cells = <0>;
+			clocks = <&input_clk>;
+		};
+
 		serial: serial@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index a7114cd..3f35f52 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -62,6 +62,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
+CONFIG_CLK_HSDK=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
