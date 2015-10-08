From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH 2/3] dts: Updated devicetree bindings for Zynq 7000 platform
Date: Fri,  9 Oct 2015 00:45:06 +0200
Message-ID: <1444344307-22509-3-git-send-email-moritz.fischer@ettus.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: michal.simek@xilinx.com
Cc: soren.brinkmann@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, atull@opensource.altera.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Added addtional bindings required for FPGA Manager operation
of the Xilinx Zynq Devc configuration interface.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index dc0457e..1a5220e 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -294,6 +294,11 @@
 		devcfg: devcfg@f8007000 {
 			compatible = "xlnx,zynq-devcfg-1.0";
 			reg = <0xf8007000 0x100>;
+			interrupt-parent = <&intc>;
+			interrupts = <0 8 4>;
+			clocks = <&clkc 12>;
+			clock-names = "ref_clk";
+			syscon = <&slcr>;
 		};
 
 		global_timer: timer@f8f00200 {
-- 
2.6.1
