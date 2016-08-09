From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] ARM64: zynqmp: Add missing interrupt-parent to PMU node
Date: Tue,  9 Aug 2016 15:38:16 +0200
Message-ID: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, monstr@monstr.eu, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org, Bharat Kumar Gogada <bharatku@xilinx.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

ZynqMP is not using global interrupt-parent setting that's why
it has to be listed in every node separately. PMU node missed it and
this patch is adding it.

Reported-by: John Linn <John.Linn@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index fbdd6ab98988..8ed4f42e781b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -51,6 +51,7 @@
 
 	pmu {
 		compatible = "arm,armv8-pmuv3";
+		interrupt-parent = <&gic>;
 		interrupts = <0 143 4>,
 			     <0 144 4>,
 			     <0 145 4>,
-- 
1.9.1
