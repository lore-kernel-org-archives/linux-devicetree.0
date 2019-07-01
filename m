From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH v2] arm64: zynqmp: Add ZynqMP SDHCI compatible string
Date: Mon,  1 Jul 2019 11:07:32 +0530
Message-ID: <1561959452-22915-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, michal.simek@xilinx.com, mark.rutland@arm.com, manish.narani@xilinx.com, sudeep.holla@arm.com, rrichter@cavium.com, gregory.clement@bootlin.com, amit.kucheria@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the new compatible string for ZynqMP SD Host Controller for its use
in the Arasan SDHCI driver for some of the ZynqMP specific operations.
Add required properties for the same.

Signed-off-by: Manish Narani <manish.narani@xilinx.com>
---
This patch depends on the below series of patches:
https://lkml.org/lkml/2019/7/1/25

Changes in v2:
	- Added clock-names for SD card clocks for getting clocks in the driver
---
 arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi |  4 ++--
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi     | 14 ++++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
index 306ad21..24c04a1 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
@@ -177,11 +177,11 @@
 };
 
 &sdhci0 {
-	clocks = <&clk200 &clk200>;
+	clocks = <&clk200>, <&clk200>, <&sdhci0 0>, <&sdhci0 1>;
 };
 
 &sdhci1 {
-	clocks = <&clk200 &clk200>;
+	clocks = <&clk200>, <&clk200>, <&sdhci1 0>, <&sdhci1 1>;
 };
 
 &spi0 {
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 9aa6734..4c21346 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -493,21 +493,27 @@
 		};
 
 		sdhci0: mmc@ff160000 {
-			compatible = "arasan,sdhci-8.9a";
+			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 48 4>;
 			reg = <0x0 0xff160000 0x0 0x1000>;
-			clock-names = "clk_xin", "clk_ahb";
+			clock-names = "clk_xin", "clk_ahb",
+				      "clk_sdcard", "clk_sample";
+			#clock-cells = <1>;
+			clock-output-names = "clk_out_sd0", "clk_in_sd0";
 		};
 
 		sdhci1: mmc@ff170000 {
-			compatible = "arasan,sdhci-8.9a";
+			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 49 4>;
 			reg = <0x0 0xff170000 0x0 0x1000>;
-			clock-names = "clk_xin", "clk_ahb";
+			clock-names = "clk_xin", "clk_ahb",
+				      "clk_sdcard", "clk_sample";
+			#clock-cells = <1>;
+			clock-output-names = "clk_out_sd1", "clk_in_sd1";
 		};
 
 		smmu: smmu@fd800000 {
-- 
2.1.1
