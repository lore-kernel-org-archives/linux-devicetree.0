From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/7] ARM: dts: Cygnus: Fix most DTC W=1 warnings
Date: Tue, 28 May 2019 16:01:29 -0700
Message-ID: <20190528230134.27007-3-f.fainelli@gmail.com>
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
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi | 12 ++++++------
 arch/arm/boot/dts/bcm-cygnus.dtsi       |  6 +++---
 arch/arm/boot/dts/bcm911360_entphn.dts  |  2 --
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
index 80b6ba4ca50c..52f91a12a99a 100644
--- a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
@@ -42,7 +42,7 @@ clocks {
 	};
 
 	/* Cygnus ARM PLL */
-	armpll: armpll {
+	armpll: armpll@19000000 {
 		#clock-cells = <0>;
 		compatible = "brcm,cygnus-armpll";
 		clocks = <&osc>;
@@ -67,7 +67,7 @@ clocks {
 		clock-mult = <1>;
 	};
 
-	genpll: genpll {
+	genpll: genpll@301d000 {
 		#clock-cells = <1>;
 		compatible = "brcm,cygnus-genpll";
 		reg = <0x0301d000 0x2c>, <0x0301c020 0x4>;
@@ -94,7 +94,7 @@ clocks {
 		clock-mult = <1>;
 	};
 
-	lcpll0: lcpll0 {
+	lcpll0: lcpll0@301d02c {
 		#clock-cells = <1>;
 		compatible = "brcm,cygnus-lcpll0";
 		reg = <0x0301d02c 0x1c>, <0x0301c020 0x4>;
@@ -103,7 +103,7 @@ clocks {
 				     "usb_phy", "smart_card", "ch5";
 	};
 
-	mipipll: mipipll {
+	mipipll: mipipll@180a9800 {
 		#clock-cells = <1>;
 		compatible = "brcm,cygnus-mipipll";
 		reg = <0x180a9800 0x2c>, <0x0301c020 0x4>, <0x180aa024 0x4>;
@@ -113,7 +113,7 @@ clocks {
 				     "ch5_unused";
 	};
 
-	asiu_clks: asiu_clks {
+	asiu_clks: asiu_clks@301d048 {
 		#clock-cells = <1>;
 		compatible = "brcm,cygnus-asiu-clk";
 		reg = <0x0301d048 0xc>, <0x180aa024 0x4>;
@@ -122,7 +122,7 @@ clocks {
 		clock-output-names = "keypad", "adc/touch", "pwm";
 	};
 
-	audiopll: audiopll {
+	audiopll: audiopll@180aeb00 {
 		#clock-cells = <1>;
 		compatible = "brcm,cygnus-audiopll";
 		reg = <0x180aeb00 0x68>;
diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 5f7b46503a51..2dac3efc7640 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -45,7 +45,7 @@
 		ethernet0 = &eth0;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0>;
 	};
@@ -69,7 +69,7 @@
 		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	core {
+	core@19000000 {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x19000000 0x1000000>;
 		#address-cells = <1>;
@@ -91,7 +91,7 @@
 			      <0x20100 0x100>;
 		};
 
-		L2: l2-cache {
+		L2: l2-cache@22000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x22000 0x1000>;
 			cache-unified;
diff --git a/arch/arm/boot/dts/bcm911360_entphn.dts b/arch/arm/boot/dts/bcm911360_entphn.dts
index 53f990defd6a..b2d323f4a5ab 100644
--- a/arch/arm/boot/dts/bcm911360_entphn.dts
+++ b/arch/arm/boot/dts/bcm911360_entphn.dts
@@ -49,8 +49,6 @@
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		hook {
 			label = "HOOK";
-- 
2.17.1
