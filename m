From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 3/3] ARM: dts: vfxxx: add missing reg properties
Date: Fri,  1 Apr 2016 23:13:41 -0700
Message-ID: <1459577621-3160-3-git-send-email-stefan@agner.ch>
References: <1459577621-3160-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459577621-3160-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add missing reg properties to AIPS bus and Cortex-A5's PMU unit.
This change avoids the following warnings:
 Warning (unit_address_vs_reg): Node /soc/aips-bus@40000000 has a unit
 name, but no reg property
 Warning (unit_address_vs_reg): Node /soc/aips-bus@40080000 has a unit
 name, but no reg property
 Warning (unit_address_vs_reg): Node /soc/aips-bus@40080000/pmu@40089000
 has a unit name, but no reg property

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf500.dtsi | 1 +
 arch/arm/boot/dts/vfxxx.dtsi | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/vf500.dtsi b/arch/arm/boot/dts/vf500.dtsi
index 9d37272..a3824e6 100644
--- a/arch/arm/boot/dts/vf500.dtsi
+++ b/arch/arm/boot/dts/vf500.dtsi
@@ -81,6 +81,7 @@
 				compatible = "arm,cortex-a5-pmu";
 				interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-affinity = <&a5_cpu>;
+				reg = <0x40089000 0x1000>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 5c09754..04ef54d 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -95,6 +95,7 @@
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
+			reg = <0x40000000 0x00070000>;
 			ranges;
 
 			mscm_cpucfg: cpucfg@40001000 {
@@ -481,6 +482,7 @@
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
+			reg = <0x40080000 0x0007f000>;
 			ranges;
 
 			edma1: dma-controller@40098000 {
-- 
2.7.4
