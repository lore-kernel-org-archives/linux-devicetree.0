From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] ARM64: zynqmp: Fix W=1 dtc 1.4 warnings
Date: Tue, 15 Nov 2016 15:04:42 +0100
Message-ID: <1e8f8f0f369b6838bf995e7369bb364c3020a411.1479218678.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, monstr@monstr.eu, Alexander Graf <agraf@suse.de>, Carlo Caione <carlo@endlessm.com>, devicetree@vger.kernel.org, Bharat Kumar Gogada <bharatku@xilinx.com>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The patch removes these warnings reported by dtc 1.4:
Warning (unit_address_vs_reg): Node /amba_apu has a reg or ranges
property, but no unit name
Warning (unit_address_vs_reg): Node /memory has a reg or ranges
property, but no unit name

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 358089687a69..ef1b9e573af0 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -27,7 +27,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 68a908334c7b..83791eadff41 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -72,7 +72,7 @@
 			     <1 10 0xf08>;
 	};
 
-	amba_apu {
+	amba_apu: amba_apu@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-- 
1.9.1
