From: Luke Starrett <luke.starrett-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/1] arm64: dts: NS2 secondary core enablement via PSCI
Date: Mon, 18 Apr 2016 18:31:42 -0400
Message-ID: <1461018702-48450-1-git-send-email-luke.starrett@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luke Starrett <luke.starrett-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Declare PSCI-1.0 node and enable CPU_ON method via PSCI.  Spin-table
memreserve removed and syscon based reset as PSCI-1.0 expects firmware
reset implementation.

Signed-off-by: Luke Starrett <luke.starrett-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 123cd9c..ec68ec1 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -33,8 +33,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/bcm-ns2.h>
 
-/memreserve/ 0x84b00000 0x00000008;
-
 / {
 	compatible = "brcm,ns2";
 	interrupt-parent = <&gic>;
@@ -49,8 +47,7 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 0>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x84b00000>;
+			enable-method = "psci";
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
@@ -58,8 +55,7 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 1>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x84b00000>;
+			enable-method = "psci";
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
@@ -67,8 +63,7 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 2>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x84b00000>;
+			enable-method = "psci";
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
@@ -76,8 +71,7 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 3>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x84b00000>;
+			enable-method = "psci";
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
@@ -86,6 +80,11 @@
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0xff) |
@@ -252,18 +251,6 @@
 			mmu-masters;
 		};
 
-		crmu: crmu@65024000 {
-			compatible = "syscon";
-			reg = <0x65024000 0x100>;
-		};
-
-		reboot@65024000 {
-			compatible ="syscon-reboot";
-			regmap = <&crmu>;
-			offset = <0x90>;
-			mask = <0xfffffffd>;
-		};
-
 		gic: interrupt-controller@65210000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
