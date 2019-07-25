From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] riscv: dts: fu540-c000: drop "timebase-frequency"
Date: Thu, 25 Jul 2019 14:30:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1907251429420.32766@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On FU540-based systems, the "timebase-frequency" (RTCCLK) is sourced
from an external crystal located on the PCB.  Thus the
timebase-frequency DT property should be defined by the board that
uses the SoC, not the SoC itself.  Drop the superfluous
timebase-frequency property from the SoC DT data.  (It's already
present in the board DT data.)

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 9bf63f0ab253..42b5ec223100 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -21,7 +21,6 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		timebase-frequency = <1000000>;
 		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
-- 
2.22.0
