From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/7] ARM: dts: Fix BCM7445 DTC warnings
Date: Tue, 28 May 2019 16:01:28 -0700
Message-ID: <20190528230134.27007-2-f.fainelli@gmail.com>
References: <20190528230134.27007-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528230134.27007-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM IPROC ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Fixes a number of unit_address_vs_reg warnings:

  DTC     arch/arm/boot/dts/bcm7445-bcm97445svmb.dtb
arch/arm/boot/dts/bcm7445.dtsi:66.6-225.4: Warning (unit_address_vs_reg): /rdb: node has a reg or ranges property, but no unit name
arch/arm/boot/dts/bcm7445.dtsi:227.21-298.4: Warning (unit_address_vs_reg): /memory_controllers: node has a reg or ranges property, but no unit name
arch/arm/boot/dts/bcm7445-bcm97445svmb.dts:9.9-14.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
arch/arm/boot/dts/bcm7445.dtsi:255.10-275.5: Warning (simple_bus_reg): /memory_controllers/memc@1: simple-bus unit address format error, expected "80000"
arch/arm/boot/dts/bcm7445.dtsi:277.10-297.5: Warning (simple_bus_reg): /memory_controllers/memc@2: simple-bus unit address format error, expected "100000"

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts | 2 +-
 arch/arm/boot/dts/bcm7445.dtsi             | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts b/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
index 8006c69a3fdf..8313b7cad542 100644
--- a/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
+++ b/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
@@ -6,7 +6,7 @@
 	model = "Broadcom STB (bcm7445), SVMB reference board";
 	compatible = "brcm,bcm7445", "brcm,brcmstb";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00 0x00000000 0x00 0x40000000>,
 		      <0x00 0x40000000 0x00 0x40000000>,
diff --git a/arch/arm/boot/dts/bcm7445.dtsi b/arch/arm/boot/dts/bcm7445.dtsi
index 504a63236a5e..58f67c9b830b 100644
--- a/arch/arm/boot/dts/bcm7445.dtsi
+++ b/arch/arm/boot/dts/bcm7445.dtsi
@@ -63,7 +63,7 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	rdb {
+	rdb@f0000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
@@ -224,7 +224,7 @@
 
 	};
 
-	memory_controllers {
+	memory_controllers@f1100000 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0xf1100000 0x200000>;
 		#address-cells = <1>;
@@ -252,7 +252,7 @@
 			};
 		};
 
-		memc@1 {
+		memc@80000 {
 			compatible = "brcm,brcmstb-memc", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -274,7 +274,7 @@
 			};
 		};
 
-		memc@2 {
+		memc@100000 {
 			compatible = "brcm,brcmstb-memc", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.17.1
