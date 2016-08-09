From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 2/2] ARM64: zynqmp: Correct the watchdog timer interrupt number
Date: Tue,  9 Aug 2016 15:38:17 +0200
Message-ID: <1d73c4f687ebab2f5f2c48f9174055f08bdd40dd.1470749892.git.michal.simek@xilinx.com>
References: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek@xilinx.com>
In-Reply-To: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek@xilinx.com>
References: <73e2ff39077d4593e92a1b484fbb586afcddb4bf.1470749892.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, monstr@monstr.eu, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org, Bharat Kumar Gogada <bharatku@xilinx.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>

Corrected the watchdog timer interrupt number.
Origin value was for CSUPMU watchdog.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 8ed4f42e781b..3bae4b2675d9 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -369,7 +369,7 @@
 			compatible = "cdns,wdt-r1p2";
 			status = "disabled";
 			interrupt-parent = <&gic>;
-			interrupts = <0 52 1>;
+			interrupts = <0 113 1>;
 			reg = <0x0 0xfd4d0000 0x0 0x1000>;
 			timeout-sec = <10>;
 		};
-- 
1.9.1
