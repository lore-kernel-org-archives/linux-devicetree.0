From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 2/3] arm64: zynqmp: dt: Add PM firmware node
Date: Fri,  4 Aug 2017 15:45:31 +0200
Message-ID: <e6142b056ab007012dd5f92d668911c89b130428.1501854302.git.michal.simek@xilinx.com>
References: <cover.1501854302.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501854302.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1501854302.git.michal.simek@xilinx.com>
References: <cover.1501854302.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Alexander Graf <agraf@suse.de>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Bharat Kumar Gogada <bharatku@xilinx.com>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Moritz Fischer <mdf@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: Soren Brinkmann <soren.brinkmann@xilinx.com>

Add node for the power management firmware.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 54dc28351c8c..cc612c178d60 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -63,6 +63,13 @@
 		method = "smc";
 	};
 
+	pmufw: firmware {
+		compatible = "xlnx,zynqmp-pm";
+		method = "smc";
+		interrupt-parent = <&gic>;
+		interrupts = <0 35 4>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
1.9.1
