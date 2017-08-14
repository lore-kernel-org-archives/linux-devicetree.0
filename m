From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2] ARC: HSDK: Add reset controller node to manage ethernet reset
Date: Mon, 14 Aug 2017 17:09:53 +0300
Message-ID: <20170814140953.7729-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

DW ethernet controller on HSDK hangs sometimes after SW reset, so
add reset node to make possible to reset DW ethernet controller HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1 -> v2:
  * Enable HSDK reset driver in hsdk_defconfig

 arch/arc/boot/dts/hsdk.dts      | 9 +++++++++
 arch/arc/configs/hsdk_defconfig | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index e096879..84052db 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 
 #include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/reset/snps,hsdk-v1-reset.h>
 
 / {
 	model = "snps,hsdk";
@@ -102,6 +103,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		cgu_rst: reset {
+			compatible = "snps,hsdk-v1.0-reset";
+			#reset-cells = <1>;
+			reg = <0x8A0 0x4>, <0xFF0 0x4>;
+		};
+
 		serial: serial@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
@@ -141,6 +148,8 @@
 			clocks = <&gmacclk>;
 			clock-names = "stmmaceth";
 			phy-handle = <&phy0>;
+			resets = <&cgu_rst HSDK_V1_ETH_RESET>;
+			reset-names = "stmmaceth";
 
 			mdio {
 				#address-cells = <1>;
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index f4190bc..f7fd8c4 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -61,6 +61,7 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_HSDK_V1=y
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.9.3
