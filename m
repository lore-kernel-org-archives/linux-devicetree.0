From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm64: dts: Use mmc@ instead sdhci@
Date: Wed, 26 Sep 2018 13:39:39 +0200
Message-ID: <59fd089c075740303d81e4a3475598dfd48e5026.1537961975.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

mmc name is recommended based on devicetree specification.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 29ce23422acf..dacabde6ff7e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -484,7 +484,7 @@
 			interrupts = <0 133 4>;
 		};
 
-		sdhci0: sdhci@ff160000 {
+		sdhci0: mmc@ff160000 {
 			compatible = "arasan,sdhci-8.9a";
 			status = "disabled";
 			interrupt-parent = <&gic>;
@@ -493,7 +493,7 @@
 			clock-names = "clk_xin", "clk_ahb";
 		};
 
-		sdhci1: sdhci@ff170000 {
+		sdhci1: mmc@ff170000 {
 			compatible = "arasan,sdhci-8.9a";
 			status = "disabled";
 			interrupt-parent = <&gic>;
-- 
1.9.1
