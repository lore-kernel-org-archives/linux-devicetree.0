From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 7/7] ARM: dts: NSP: Fix the bulk of W=1 DTC warnings
Date: Tue, 28 May 2019 16:01:34 -0700
Message-ID: <20190528230134.27007-8-f.fainelli@gmail.com>
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
 arch/arm/boot/dts/bcm-nsp.dtsi     | 9 +++------
 arch/arm/boot/dts/bcm958522er.dts  | 2 +-
 arch/arm/boot/dts/bcm958525er.dts  | 2 +-
 arch/arm/boot/dts/bcm958525xmc.dts | 2 +-
 arch/arm/boot/dts/bcm958622hr.dts  | 2 +-
 arch/arm/boot/dts/bcm958623hr.dts  | 2 +-
 arch/arm/boot/dts/bcm958625hr.dts  | 2 +-
 arch/arm/boot/dts/bcm958625k.dts   | 2 +-
 arch/arm/boot/dts/bcm988312hr.dts  | 2 +-
 9 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 6925b30c2253..da6d70f09ef1 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -77,7 +77,7 @@
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
-	mpcore {
+	mpcore@19000000 {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x19000000 0x00023000>;
 		#address-cells = <1>;
@@ -122,7 +122,7 @@
 			      <0x20100 0x100>;
 		};
 
-		L2: l2-cache {
+		L2: l2-cache@22000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x22000 0x1000>;
 			cache-unified;
@@ -166,7 +166,7 @@
 		};
 	};
 
-	axi {
+	axi@18000000 {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x18000000 0x0011c40c>;
 		#address-cells = <1>;
@@ -415,9 +415,6 @@
 					  "imp_sleep_timer_p5",
 					  "imp_sleep_timer_p7",
 					  "imp_sleep_timer_p8";
-			#address-cells = <1>;
-			#size-cells = <0>;
-
 			status = "disabled";
 
 			/* ports are defined in board DTS */
diff --git a/arch/arm/boot/dts/bcm958522er.dts b/arch/arm/boot/dts/bcm958522er.dts
index 21479b4ce823..8c388eb8a08f 100644
--- a/arch/arm/boot/dts/bcm958522er.dts
+++ b/arch/arm/boot/dts/bcm958522er.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm958525er.dts b/arch/arm/boot/dts/bcm958525er.dts
index cda3d790965b..c339771bb22e 100644
--- a/arch/arm/boot/dts/bcm958525er.dts
+++ b/arch/arm/boot/dts/bcm958525er.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index f86649812b59..1c72ec8288de 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm958622hr.dts b/arch/arm/boot/dts/bcm958622hr.dts
index df60602b054d..96a021cebd97 100644
--- a/arch/arm/boot/dts/bcm958622hr.dts
+++ b/arch/arm/boot/dts/bcm958622hr.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm958623hr.dts b/arch/arm/boot/dts/bcm958623hr.dts
index 3893e7af343a..b2c7f21d471e 100644
--- a/arch/arm/boot/dts/bcm958623hr.dts
+++ b/arch/arm/boot/dts/bcm958623hr.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
index cf226b02141f..a2c9de35ddfb 100644
--- a/arch/arm/boot/dts/bcm958625hr.dts
+++ b/arch/arm/boot/dts/bcm958625hr.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm958625k.dts b/arch/arm/boot/dts/bcm958625k.dts
index 10b3d512bb33..3fcca12d83c2 100644
--- a/arch/arm/boot/dts/bcm958625k.dts
+++ b/arch/arm/boot/dts/bcm958625k.dts
@@ -42,7 +42,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm988312hr.dts b/arch/arm/boot/dts/bcm988312hr.dts
index e39db14d805e..edd0f630e025 100644
--- a/arch/arm/boot/dts/bcm988312hr.dts
+++ b/arch/arm/boot/dts/bcm988312hr.dts
@@ -43,7 +43,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x80000000>;
 	};
-- 
2.17.1
