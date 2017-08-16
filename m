From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCHv2 2/3] arm64: zynqmp: dt: Add PM firmware node
Date: Wed, 16 Aug 2017 14:24:57 +0200
Message-ID: <b591c913ab9a1479c0ee4f7b546bb4808e7a51fa.1502886277.git.michal.simek@xilinx.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1502886277.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1502886277.git.michal.simek@xilinx.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: edgar.iglesias@xilinx.com, Rob Herring <robh@kernel.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Alexander Graf <agraf@suse.de>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Moritz Fischer <mdf@kernel.org>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: Soren Brinkmann <soren.brinkmann@xilinx.com>

Add node for the firmware interface.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Add zynqmp firmware node to firmware node
- Change commit message

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 54dc28351c8c..41c0034fd905 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -49,6 +49,15 @@
 		};
 	};
 
+	firmware {
+		zynqmp-firmware {
+			compatible = "xlnx,zynqmp-pm";
+			method = "smc";
+			interrupt-parent = <&gic>;
+			interrupts = <0 35 4>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupt-parent = <&gic>;
-- 
1.9.1
