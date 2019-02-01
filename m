From: Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
Subject: [PATCH v2] ARC: [plat-hsdk]: Add support of Vivante GPU
Date: Fri,  1 Feb 2019 15:12:11 +0300
Message-ID: <20190201121211.23701-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, Vineet Gupta <vineet.gupta1@synopsys.com>
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <alexey.brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

HSDK board has built-in Vivante GPU IP which works perfectly fine
with Etnaviv driver, so let's use it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1->v2:
 * Add clock inputs to etnaviv device tree node (reported by Lucas Stach)

 arch/arc/boot/dts/hsdk.dts      | 29 +++++++++++++++++++++++++++++
 arch/arc/configs/hsdk_defconfig |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 43f17b51ee89..df86d0818db8 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -167,6 +167,24 @@
 			#clock-cells = <0>;
 		};
 
+		gpu_core_clk: gpu-core-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		gpu_dma_clk: gpu-dma-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		gpu_cfg_clk: gpu-cfg-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+			#clock-cells = <0>;
+		};
+
 		gmac: ethernet@8000 {
 			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
@@ -237,6 +255,17 @@
 				reg = <0>;
 			};
 		};
+
+		gpu_3d: gpu@90000 {
+			compatible = "vivante,gc";
+			reg = <0x90000 0x4000>;
+			clocks = <&gpu_dma_clk>,
+				 <&gpu_cfg_clk>,
+				 <&gpu_core_clk>,
+				 <&gpu_core_clk>;
+			clock-names = "bus", "reg", "core", "shader";
+			interrupts = <28>;
+		};
 	};
 
 	memory@80000000 {
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 87b23b7fb781..915e1cca31f8 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -52,6 +52,7 @@ CONFIG_GPIO_DWAPB=y
 CONFIG_DRM=y
 # CONFIG_DRM_FBDEV_EMULATION is not set
 CONFIG_DRM_UDL=y
+CONFIG_DRM_ETNAVIV=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB_EHCI_HCD=y
@@ -63,7 +64,6 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
-# CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.14.5
