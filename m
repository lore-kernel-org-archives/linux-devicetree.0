From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 3/7] ARM64: zynqmp: Add SMMU support
Date: Mon, 27 Jul 2015 11:48:11 +0200
Message-ID: <014e41d9e1ba7ae406d463f75dfa236857192560.1437990464.git.michal.simek@xilinx.com>
References: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
In-Reply-To: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
References: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Suneel Garapati <suneel.garapati@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add SMMU DT node to DTSI.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index d58c9689c82a..7617722cc969 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -244,6 +244,18 @@
 			#size-cells = <0>;
 		};
 
+		smmu0: smmu0@fd800000 {
+			compatible = "arm,mmu-500";
+			reg = <0x0 0xfd800000 0x20000>;
+			#global-interrupts = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 157 4>,
+				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>,
+				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>,
+				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>,
+				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>;
+		};
+
 		spi0: spi@ff040000 {
 			compatible = "cdns,spi-r1p6";
 			status = "disabled";
-- 
2.3.5
