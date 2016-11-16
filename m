From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] ARM: zynq: Fix pmu register description coding style
Date: Wed, 16 Nov 2016 09:32:42 +0100
Message-ID: <995966ccde55b52646b929a98180d68322cb6bea.1479285154.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: julia@ni.com, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

Drop the space before/after '<' and '>'; and
separate the entries to be a bit more readable.

Reported-by: Julia Cartwright <julia@ni.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-7000.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 402b5bbe3b5b..f3ac9bfe580e 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -46,7 +46,8 @@
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <0 5 4>, <0 6 4>;
 		interrupt-parent = <&intc>;
-		reg = < 0xf8891000 0x1000 0xf8893000 0x1000 >;
+		reg = <0xf8891000 0x1000>,
+		      <0xf8893000 0x1000>;
 	};
 
 	regulator_vccpint: fixedregulator {
-- 
1.9.1
