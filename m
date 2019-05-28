From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 5/7] ARM: dts: BCM63xx: Fix DTC W=1 warnings
Date: Tue, 28 May 2019 16:01:32 -0700
Message-ID: <20190528230134.27007-6-f.fainelli@gmail.com>
References: <20190528230134.27007-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528230134.27007-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM IPROC ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Fix the bulk of the unit_address_vs_reg warnings and unnecessary
\#address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm63138.dtsi    | 9 +++------
 arch/arm/boot/dts/bcm963138dvt.dts | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
index e6a41e1b27fd..9c0325cf9e22 100644
--- a/arch/arm/boot/dts/bcm63138.dtsi
+++ b/arch/arm/boot/dts/bcm63138.dtsi
@@ -41,9 +41,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		/* UBUS peripheral clock */
 		periph_clk: periph_clk {
 			#clock-cells = <0>;
@@ -94,7 +91,7 @@
 			reg = <0x1e000 0x100>;
 		};
 
-		gic: interrupt-controller@1e100 {
+		gic: interrupt-controller@1f000 {
 			compatible = "arm,cortex-a9-gic";
 			reg = <0x1f000 0x1000
 				0x1e100 0x100>;
@@ -125,7 +122,7 @@
 						  IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		armpll: armpll {
+		armpll: armpll@20000 {
 			#clock-cells = <0>;
 			compatible = "brcm,bcm63138-armpll";
 			clocks = <&periph_clk>;
@@ -144,7 +141,7 @@
 			#reset-cells = <2>;
 		};
 
-		ahci: sata@8000 {
+		ahci: sata@a000 {
 			compatible = "brcm,bcm63138-ahci", "brcm,sata3-ahci";
 			reg-names = "ahci", "top-ctrl";
 			reg = <0xa000 0x9ac>, <0x8040 0x24>;
diff --git a/arch/arm/boot/dts/bcm963138dvt.dts b/arch/arm/boot/dts/bcm963138dvt.dts
index 8dca97eeaf57..43a5f78acd5e 100644
--- a/arch/arm/boot/dts/bcm963138dvt.dts
+++ b/arch/arm/boot/dts/bcm963138dvt.dts
@@ -16,7 +16,7 @@
 		stdout-path = &serial0;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0x0 0x08000000>;
 	};
 
-- 
2.17.1
