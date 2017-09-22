From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v3] ARC: [plat-hsdk]: Add reset controller node to manage ethernet reset
Date: Fri, 22 Sep 2017 19:49:11 +0300
Message-ID: <20170922164911.1125-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

DW ethernet controller on HSDK hangs sometimes after SW reset, so
add reset node to make possible to reset DW ethernet controller HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v2 -> v3:
  * Remove v1 suffix as we finaly got rid of v1 suffix in reset
    driver and docs.
  * Rename reset node to "reset-controller" for consistency with
    the other bindings.

Changes v1 -> v2:
  * Enable HSDK reset driver in hsdk_defconfig

 arch/arc/boot/dts/hsdk.dts      | 9 +++++++++
 arch/arc/configs/hsdk_defconfig | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index b922f3f..8adde1b 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 
 #include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/reset/snps,hsdk-reset.h>
 
 / {
 	model = "snps,hsdk";
@@ -102,6 +103,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		cgu_rst: reset-controller@8a0 {
+			compatible = "snps,hsdk-reset";
+			#reset-cells = <1>;
+			reg = <0x8A0 0x4>, <0xFF0 0x4>;
+		};
+
 		core_clk: core-clk@0 {
 			compatible = "snps,hsdk-core-pll-clock";
 			reg = <0x00 0x10>, <0x14B8 0x4>;
@@ -158,6 +165,8 @@
 			clocks = <&gmacclk>;
 			clock-names = "stmmaceth";
 			phy-handle = <&phy0>;
+			resets = <&cgu_rst HSDK_ETH_RESET>;
+			reset-names = "stmmaceth";
 
 			mdio {
 				#address-cells = <1>;
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 7b8f8fa..15f0f6b 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -63,6 +63,7 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_HSDK=y
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.9.3
