From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH v2] ARM: zynq: DT: Use the zynq binding with macb
Date: Wed, 27 May 2015 14:58:48 -0500
Message-ID: <1432756728-6778-1-git-send-email-nathan.sullivan@ni.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: michal.simek@xilinx.com
Cc: soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Sullivan <nathan.sullivan@ni.com>
List-Id: devicetree@vger.kernel.org

Use the new zynq binding for macb ethernet, since it will disable half
duplex gigabit like the Zynq TRM says to do. Also allow the compatible
cadence gem binding that won't disable half duplex but works otherwise.

Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
---
 arch/arm/boot/dts/zynq-7000.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index a5cd2ed..154bf93 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -57,7 +57,7 @@
 		regulator-always-on;
 	};
 
-	amba {
+	amba@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -193,7 +193,7 @@
 		};
 
 		gem0: ethernet@e000b000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynq-gem", "cdns,gem";
 			reg = <0xe000b000 0x1000>;
 			status = "disabled";
 			interrupts = <0 22 4>;
@@ -204,7 +204,7 @@
 		};
 
 		gem1: ethernet@e000c000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynq-gem", "cdns,gem";
 			reg = <0xe000c000 0x1000>;
 			status = "disabled";
 			interrupts = <0 45 4>;
-- 
1.7.10.4
