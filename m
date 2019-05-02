Return-Path: <SRS0=kpDl=TC=gmail.com=jonas.gorski@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
Date: Thu,  2 May 2019 14:26:57 +0200
Message-Id: <20190502122657.15577-4-jonas.gorski@gmail.com>
In-Reply-To: <20190502122657.15577-1-jonas.gorski@gmail.com>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Now that we have a driver for the clock controller, add nodes to allow
devices to make use of it.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm3368.dtsi  | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm6328.dtsi  |  6 ++++++
 arch/mips/boot/dts/brcm/bcm6358.dtsi  | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm6362.dtsi  | 12 +++++++++---
 arch/mips/boot/dts/brcm/bcm6368.dtsi  | 12 +++++++++---
 6 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
index 7a3e5c8943ca..69cbef472377 100644
--- a/arch/mips/boot/dts/brcm/bcm3368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@fff8c000 {
+		clkctl: clock-controller@fff8c004 {
+			compatible = "brcm,bcm3368-clocks";
+			reg = <0xfff8c004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@fff8c008 {
 			compatible = "syscon";
-			reg = <0xfff8c000 0xc>;
+			reg = <0xfff8c000 0x4>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@fff8c008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 58790b173bb2..beec24145af7 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@10000000 {
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm63268-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0x14>;
+			reg = <0x10000000 0xc>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@10000008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index bf6716aa425a..af860d06def6 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -51,6 +51,12 @@
 		compatible = "simple-bus";
 		ranges;
 
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm6328-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
 		periph_intc: interrupt-controller@10000020 {
 			compatible = "brcm,bcm6345-l1-intc";
 			reg = <0x10000020 0x10>,
diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index 26ddae5a4247..f21176cac038 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@fffe0000 {
+		clkctl: clock-controller@fffe0004 {
+			compatible = "brcm,bcm6358-clocks";
+			reg = <0xfffe0004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@fffe0008 {
 			compatible = "syscon";
-			reg = <0xfffe0000 0xc>;
+			reg = <0xfffe0000 0x4>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@fffe0008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index c387793525dd..8ae6981735b8 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@10000000 {
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm6362-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0x14>;
+			reg = <0x10000000 0xc>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@10000008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index e116a385525f..449c167dd892 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -51,16 +51,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		periph_cntl: syscon@10000000 {
+		clkctl: clock-controller@10000004 {
+			compatible = "brcm,bcm6368-clocks";
+			reg = <0x10000004 0x4>;
+			#clock-cells = <1>;
+		};
+
+		periph_cntl: syscon@100000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0x14>;
+			reg = <0x10000000 0xc>;
 			native-endian;
 		};
 
 		reboot: syscon-reboot@10000008 {
 			compatible = "syscon-reboot";
 			regmap = <&periph_cntl>;
-			offset = <0x8>;
+			offset = <0x0>;
 			mask = <0x1>;
 		};
 
-- 
2.13.2
