From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm64: dts: Add missing gpio-controller to ps gpio
Date: Thu,  8 Nov 2018 14:35:46 +0100
Message-ID: <74a9934eab231714e65f74e442ad79cab0475267.1541684144.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Rob Herring <robherring2@gmail.com>
Cc: monstr@monstr.eu, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Will Deacon <will.deacon@arm.com>, Manish Narani <manish.narani@xilinx.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add missing gpio-controller property to ps gpio.
This was found via DT schema validation.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 07f2dd13ab33..ae3c1b929648 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -410,6 +410,7 @@
 			compatible = "xlnx,zynqmp-gpio-1.0";
 			status = "disabled";
 			#gpio-cells = <0x2>;
+			gpio-controller;
 			interrupt-parent = <&gic>;
 			interrupts = <0 16 4>;
 			interrupt-controller;
-- 
1.9.1
