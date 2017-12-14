From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] xtensa: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 17:54:14 +0100
Message-ID: <20171214165414.28225-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Mark Rutland <mark.rutland@arm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, devicetree@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" {} +

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/xtensa/boot/dts/csp.dts                |  2 +-
 arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi | 10 +++++-----
 arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi  | 10 +++++-----
 arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi   |  6 +++---
 arch/xtensa/boot/dts/xtfpga.dtsi            | 10 +++++-----
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/xtensa/boot/dts/csp.dts b/arch/xtensa/boot/dts/csp.dts
index 885495460f7e..96c9bca1d737 100644
--- a/arch/xtensa/boot/dts/csp.dts
+++ b/arch/xtensa/boot/dts/csp.dts
@@ -44,7 +44,7 @@
 		compatible = "simple-bus";
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
-		uart0: serial@0d000000 {
+		uart0: serial@d000000 {
 			compatible = "xlnx,xuartps", "cdns,uart-r1p8";
 			clocks = <&osc>, <&osc>;
 			clock-names = "uart_clk", "pclk";
diff --git a/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi b/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi
index 9bf8bad1dd18..7b0cd356e0db 100644
--- a/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi
@@ -1,26 +1,26 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	soc {
-		flash: flash@00000000 {
+		flash: flash@0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
 			reg = <0x00000000 0x08000000>;
 			bank-width = <2>;
 			device-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "data";
 				reg = <0x00000000 0x06000000>;
 			};
-			partition@0x6000000 {
+			partition@6000000 {
 				label = "boot loader area";
 				reg = <0x06000000 0x00800000>;
 			};
-			partition@0x6800000 {
+			partition@6800000 {
 				label = "kernel image";
 				reg = <0x06800000 0x017e0000>;
 			};
-			partition@0x7fe0000 {
+			partition@7fe0000 {
 				label = "boot environment";
 				reg = <0x07fe0000 0x00020000>;
 			};
diff --git a/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi b/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi
index 40c2f81f7cb6..c5e56cf0f8df 100644
--- a/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi
@@ -1,26 +1,26 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	soc {
-		flash: flash@08000000 {
+		flash: flash@8000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
 			reg = <0x08000000 0x01000000>;
 			bank-width = <2>;
 			device-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "boot loader area";
 				reg = <0x00000000 0x00400000>;
 			};
-			partition@0x400000 {
+			partition@400000 {
 				label = "kernel image";
 				reg = <0x00400000 0x00600000>;
 			};
-			partition@0xa00000 {
+			partition@a00000 {
 				label = "data";
 				reg = <0x00a00000 0x005e0000>;
 			};
-			partition@0xfe0000 {
+			partition@fe0000 {
 				label = "boot environment";
 				reg = <0x00fe0000 0x00020000>;
 			};
diff --git a/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi b/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi
index fb8d3a9f33c2..ad0d2ec45447 100644
--- a/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi
@@ -1,18 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	soc {
-		flash: flash@08000000 {
+		flash: flash@8000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
 			reg = <0x08000000 0x00400000>;
 			bank-width = <2>;
 			device-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "boot loader area";
 				reg = <0x00000000 0x003f0000>;
 			};
-			partition@0x3f0000 {
+			partition@3f0000 {
 				label = "boot environment";
 				reg = <0x003f0000 0x00010000>;
 			};
diff --git a/arch/xtensa/boot/dts/xtfpga.dtsi b/arch/xtensa/boot/dts/xtfpga.dtsi
index 1090528825ec..5ede496ed9be 100644
--- a/arch/xtensa/boot/dts/xtfpga.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga.dtsi
@@ -54,7 +54,7 @@
 			reg = <0x0d020004 0x4>;
 		};
 
-		serial0: serial@0d050020 {
+		serial0: serial@d050020 {
 			device_type = "serial";
 			compatible = "ns16550a";
 			no-loopback-test;
@@ -66,7 +66,7 @@
 			clocks = <&osc>;
 		};
 
-		enet0: ethoc@0d030000 {
+		enet0: ethoc@d030000 {
 			compatible = "opencores,ethoc";
 			reg = <0x0d030000 0x4000 0x0d800000 0x4000>;
 			native-endian;
@@ -75,7 +75,7 @@
 			clocks = <&osc>;
 		};
 
-		i2s0: xtfpga-i2s@0d080000 {
+		i2s0: xtfpga-i2s@d080000 {
 			#sound-dai-cells = <0>;
 			compatible = "cdns,xtfpga-i2s";
 			reg = <0x0d080000 0x40>;
@@ -83,7 +83,7 @@
 			clocks = <&cdce706 4>;
 		};
 
-		i2c0: i2c-master@0d090000 {
+		i2c0: i2c-master@d090000 {
 			compatible = "opencores,i2c-ocores";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -103,7 +103,7 @@
 			};
 		};
 
-		spi0: spi-master@0d0a0000 {
+		spi0: spi-master@d0a0000 {
 			compatible = "cdns,xtfpga-spi";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.11.0
