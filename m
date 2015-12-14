From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] ARM64: ZynqMP: DT: Fix GIC's 'reg' property
Date: Mon, 14 Dec 2015 08:31:40 -0800
Message-ID: <1450110700-14152-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alistair Francis <alistair.francis@xilinx.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 857eda5c7217..b5d1facadf16 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -80,10 +80,10 @@
 		gic: interrupt-controller@f9010000 {
 			compatible = "arm,gic-400", "arm,cortex-a15-gic";
 			#interrupt-cells = <3>;
-			reg = <0x0 0xf9010000 0x10000>,
-			      <0x0 0xf902f000 0x2000>,
+			reg = <0x0 0xf9010000 0x1000>,
+			      <0x0 0xf9020000 0x20000>,
 			      <0x0 0xf9040000 0x20000>,
-			      <0x0 0xf906f000 0x2000>;
+			      <0x0 0xf9060000 0x20000>;
 			interrupt-controller;
 			interrupt-parent = <&gic>;
 			interrupts = <1 9 0xf04>;
-- 
2.6.3.3.g9bb996a
