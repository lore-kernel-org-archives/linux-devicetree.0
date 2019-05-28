From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/7] ARM: dts: bcm-mobile: Fix most DTC W=1 warnings
Date: Tue, 28 May 2019 16:01:30 -0700
Message-ID: <20190528230134.27007-4-f.fainelli@gmail.com>
References: <20190528230134.27007-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190528230134.27007-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

Fix the bulk of the unit_address_vs_reg warnings and unnecessary
\#address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm11351.dtsi        | 12 ++++++------
 arch/arm/boot/dts/bcm21664-garnet.dts  |  2 +-
 arch/arm/boot/dts/bcm21664.dtsi        | 10 +++++-----
 arch/arm/boot/dts/bcm23550-sparrow.dts |  2 +-
 arch/arm/boot/dts/bcm23550.dtsi        |  8 ++++----
 arch/arm/boot/dts/bcm28155-ap.dts      |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index b99c2e579622..6197e7d80e3b 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -100,7 +100,7 @@
 		reg-io-width = <4>;
 	};
 
-	L2: l2-cache {
+	L2: l2-cache@3ff20000 {
 		compatible = "brcm,bcm11351-a2-pl310-cache";
 		reg = <0x3ff20000 0x1000>;
 		cache-unified;
@@ -225,21 +225,21 @@
 		#size-cells = <1>;
 		ranges;
 
-		root_ccu: root_ccu {
+		root_ccu: root_ccu@35001000 {
 			compatible = "brcm,bcm11351-root-ccu";
 			reg = <0x35001000 0x0f00>;
 			#clock-cells = <1>;
 			clock-output-names = "frac_1m";
 		};
 
-		hub_ccu: hub_ccu {
+		hub_ccu: hub_ccu@34000000 {
 			compatible = "brcm,bcm11351-hub-ccu";
 			reg = <0x34000000 0x0f00>;
 			#clock-cells = <1>;
 			clock-output-names = "tmon_1m";
 		};
 
-		aon_ccu: aon_ccu {
+		aon_ccu: aon_ccu@35002000 {
 			compatible = "brcm,bcm11351-aon-ccu";
 			reg = <0x35002000 0x0f00>;
 			#clock-cells = <1>;
@@ -248,7 +248,7 @@
 					     "pmu_bsc_var";
 		};
 
-		master_ccu: master_ccu {
+		master_ccu: master_ccu@3f001000 {
 			compatible = "brcm,bcm11351-master-ccu";
 			reg = <0x3f001000 0x0f00>;
 			#clock-cells = <1>;
@@ -261,7 +261,7 @@
 					     "hsic2_12m";
 		};
 
-		slave_ccu: slave_ccu {
+		slave_ccu: slave_ccu@3e011000 {
 			compatible = "brcm,bcm11351-slave-ccu";
 			reg = <0x3e011000 0x0f00>;
 			#clock-cells = <1>;
diff --git a/arch/arm/boot/dts/bcm21664-garnet.dts b/arch/arm/boot/dts/bcm21664-garnet.dts
index 8b045cfab64b..be468f4adc37 100644
--- a/arch/arm/boot/dts/bcm21664-garnet.dts
+++ b/arch/arm/boot/dts/bcm21664-garnet.dts
@@ -21,7 +21,7 @@
 	model = "BCM21664 Garnet board";
 	compatible = "brcm,bcm21664-garnet", "brcm,bcm21664";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>; /* 1 GB */
 	};
diff --git a/arch/arm/boot/dts/bcm21664.dtsi b/arch/arm/boot/dts/bcm21664.dtsi
index 758daa334148..3cf66faf3b56 100644
--- a/arch/arm/boot/dts/bcm21664.dtsi
+++ b/arch/arm/boot/dts/bcm21664.dtsi
@@ -90,7 +90,7 @@
 		reg-io-width = <4>;
 	};
 
-	L2: l2-cache {
+	L2: l2-cache@3ff20000 {
 		compatible = "arm,pl310-cache";
 		reg = <0x3ff20000 0x1000>;
 		cache-unified;
@@ -295,21 +295,21 @@
 			clock-frequency = <156000000>;
 		};
 
-		root_ccu: root_ccu {
+		root_ccu: root_ccu@35001000 {
 			compatible = BCM21664_DT_ROOT_CCU_COMPAT;
 			reg = <0x35001000 0x0f00>;
 			#clock-cells = <1>;
 			clock-output-names = "frac_1m";
 		};
 
-		aon_ccu: aon_ccu {
+		aon_ccu: aon_ccu@35002000 {
 			compatible = BCM21664_DT_AON_CCU_COMPAT;
 			reg = <0x35002000 0x0f00>;
 			#clock-cells = <1>;
 			clock-output-names = "hub_timer";
 		};
 
-		master_ccu: master_ccu {
+		master_ccu: master_ccu@3f001000 {
 			compatible = BCM21664_DT_MASTER_CCU_COMPAT;
 			reg = <0x3f001000 0x0f00>;
 			#clock-cells = <1>;
@@ -323,7 +323,7 @@
 					     "sdio4_sleep";
 		};
 
-		slave_ccu: slave_ccu {
+		slave_ccu: slave_ccu@3e011000 {
 			compatible = BCM21664_DT_SLAVE_CCU_COMPAT;
 			reg = <0x3e011000 0x0f00>;
 			#clock-cells = <1>;
diff --git a/arch/arm/boot/dts/bcm23550-sparrow.dts b/arch/arm/boot/dts/bcm23550-sparrow.dts
index 1c66b15f3013..ace77709f468 100644
--- a/arch/arm/boot/dts/bcm23550-sparrow.dts
+++ b/arch/arm/boot/dts/bcm23550-sparrow.dts
@@ -45,7 +45,7 @@
 		bootargs = "console=ttyS0,115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/bcm23550.dtsi b/arch/arm/boot/dts/bcm23550.dtsi
index 701198f5f498..a36c9b1d23c8 100644
--- a/arch/arm/boot/dts/bcm23550.dtsi
+++ b/arch/arm/boot/dts/bcm23550.dtsi
@@ -371,21 +371,21 @@
 			clock-frequency = <156000000>;
 		};
 
-		root_ccu: root_ccu {
+		root_ccu: root_ccu@35001000 {
 			compatible = BCM21664_DT_ROOT_CCU_COMPAT;
 			reg = <0x35001000 0x0f00>;
 			#clock-cells = <1>;
 			clock-output-names = "frac_1m";
 		};
 
-		aon_ccu: aon_ccu {
+		aon_ccu: aon_ccu@35002000 {
 			compatible = BCM21664_DT_AON_CCU_COMPAT;
 			reg = <0x35002000 0x0f00>;
 			#clock-cells = <1>;
 			clock-output-names = "hub_timer";
 		};
 
-		slave_ccu: slave_ccu {
+		slave_ccu: slave_ccu@3e011000 {
 			compatible = BCM21664_DT_SLAVE_CCU_COMPAT;
 			reg = <0x3e011000 0x0f00>;
 			#clock-cells = <1>;
@@ -398,7 +398,7 @@
 					     "bsc4";
 		};
 
-		master_ccu: master_ccu {
+		master_ccu: master_ccu@3f001000 {
 			compatible = BCM21664_DT_MASTER_CCU_COMPAT;
 			reg = <0x3f001000 0x0f00>;
 			#clock-cells = <1>;
diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
index fbfca83bd28f..ead6e9804dbf 100644
--- a/arch/arm/boot/dts/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/bcm28155-ap.dts
@@ -21,7 +21,7 @@
 	model = "BCM28155 AP board";
 	compatible = "brcm,bcm28155-ap", "brcm,bcm11351";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>; /* 1 GB */
 	};
-- 
2.17.1
