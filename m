From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm: zynq: Label whole PL part as fpga_full region
Date: Thu, 20 Jul 2017 15:33:16 +0200
Message-ID: <226ad80923aeb24a1654db8414378db08381d10f.1500557594.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

This will simplify dt overlay structure for the whole PL.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index f3ac9bfe580e..0f79fe1ccd9d 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -42,6 +42,14 @@
 		};
 	};
 
+	fpga_full: fpga-full {
+		compatible = "fpga-region";
+		fpga-mgr = <&devcfg>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+	};
+
 	pmu@f8891000 {
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <0 5 4>, <0 6 4>;
-- 
1.9.1
