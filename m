From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v3] ARC: [plat-hsdk]: Add support of Vivante GPU
Date: Tue, 21 May 2019 20:54:39 +0300
Message-ID: <20190521175439.15723-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

HSDK board has built-in Vivante GPU IP which works perfectly fine
with Etnaviv driver, so let's use it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v2->v3:
 * Rebase onto latest kernel. No functional change intended.

Changes v1->v2:
 * Add clock inputs to etnaviv device tree node (reported by Lucas Stach)

 arch/arc/boot/dts/hsdk.dts      | 29 +++++++++++++++++++++++++++++
 arch/arc/configs/hsdk_defconfig |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 7425bb0f2d1b..32b3974ae4e2 100644
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
 		dmac_core_clk: dmac-core-clk {
 			compatible = "fixed-clock";
 			clock-frequency = <400000000>;
@@ -252,6 +270,17 @@
 			};
 		};
 
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
+
 		dmac: dmac@80000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x80000 0x400>;
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 0e5fd29ed238..643b58be022d 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -53,6 +53,7 @@ CONFIG_GPIO_DWAPB=y
 CONFIG_DRM=y
 # CONFIG_DRM_FBDEV_EMULATION is not set
 CONFIG_DRM_UDL=y
+CONFIG_DRM_ETNAVIV=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB_EHCI_HCD=y
@@ -64,7 +65,6 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
-# CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.14.5
