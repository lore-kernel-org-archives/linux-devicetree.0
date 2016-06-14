From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2 1/2] arm64: dts: apm: Use lowercase consistently for hex
 constants
Date: Tue, 14 Jun 2016 08:00:20 -0500
Message-ID: <20160614130020.22169.51495.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160614125756.22169.50783.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160614125756.22169.50783.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Duc Dang <dhdang@apm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The convention in these files is to use lowercase for "0x" prefixes and for
the hex constants themselves, but a few changes didn't follow that
convention, which makes the file annoying to read.

Use lowercase consistently for the hex constants.  No functional change
intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 .../devicetree/bindings/net/apm-xgene-enet.txt     |    4 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   40 ++++++++++----------
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   36 +++++++++---------
 3 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
index 05f705e3..e41b2d5 100644
--- a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
+++ b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
@@ -59,8 +59,8 @@ Example:
 		compatible = "apm,xgene-enet";
 		status = "disabled";
 		reg = <0x0 0x17020000 0x0 0xd100>,
-		      <0x0 0X17030000 0x0 0X400>,
-		      <0x0 0X10000000 0x0 0X200>;
+		      <0x0 0x17030000 0x0 0x400>,
+		      <0x0 0x10000000 0x0 0x200>;
 		reg-names = "enet_csr", "ring_csr", "ring_cmd";
 		interrupts = <0x0 0x3c 0x4>;
 		port-id = <0>;
diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index c569f76..9773687 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -106,9 +106,9 @@
 		interrupts = <1 9 0xf04>;	/* GIC Maintenence IRQ */
 		ranges = <0 0 0 0x79000000 0x0 0x800000>; /* MSI Range */
 		reg = <0x0 0x78090000 0x0 0x10000>,	/* GIC Dist */
-		      <0x0 0x780A0000 0x0 0x20000>,	/* GIC CPU */
-		      <0x0 0x780C0000 0x0 0x10000>,	/* GIC VCPU Control */
-		      <0x0 0x780E0000 0x0 0x20000>;	/* GIC VCPU */
+		      <0x0 0x780a0000 0x0 0x20000>,	/* GIC CPU */
+		      <0x0 0x780c0000 0x0 0x10000>,	/* GIC VCPU Control */
+		      <0x0 0x780e0000 0x0 0x20000>;	/* GIC VCPU */
 		v2m0: v2m@0x00000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
@@ -159,35 +159,35 @@
 			msi-controller;
 			reg = <0x0 0x90000 0x0 0x1000>;
 		};
-		v2m10: v2m@0xA0000 {
+		v2m10: v2m@0xa0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0x0 0xA0000 0x0 0x1000>;
+			reg = <0x0 0xa0000 0x0 0x1000>;
 		};
-		v2m11: v2m@0xB0000 {
+		v2m11: v2m@0xb0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0x0 0xB0000 0x0 0x1000>;
+			reg = <0x0 0xb0000 0x0 0x1000>;
 		};
-		v2m12: v2m@0xC0000 {
+		v2m12: v2m@0xc0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0x0 0xC0000 0x0 0x1000>;
+			reg = <0x0 0xc0000 0x0 0x1000>;
 		};
-		v2m13: v2m@0xD0000 {
+		v2m13: v2m@0xd0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0x0 0xD0000 0x0 0x1000>;
+			reg = <0x0 0xd0000 0x0 0x1000>;
 		};
-		v2m14: v2m@0xE0000 {
+		v2m14: v2m@0xe0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0x0 0xE0000 0x0 0x1000>;
+			reg = <0x0 0xe0000 0x0 0x1000>;
 		};
-		v2m15: v2m@0xF0000 {
+		v2m15: v2m@0xf0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0x0 0xF0000 0x0 0x1000>;
+			reg = <0x0 0xf0000 0x0 0x1000>;
 		};
 	};
 
@@ -629,8 +629,8 @@
 			compatible = "apm,xgene2-sgenet";
 			status = "disabled";
 			reg = <0x0 0x1f610000 0x0 0x10000>,
-			      <0x0 0x1f600000 0x0 0Xd100>,
-			      <0x0 0x20000000 0x0 0X20000>;
+			      <0x0 0x1f600000 0x0 0xd100>,
+			      <0x0 0x20000000 0x0 0x20000>;
 			interrupts = <0 96 4>,
 				     <0 97 4>;
 			dma-coherent;
@@ -643,8 +643,8 @@
 			compatible = "apm,xgene2-xgenet";
 			status = "disabled";
 			reg = <0x0 0x1f620000 0x0 0x10000>,
-			      <0x0 0x1f600000 0x0 0Xd100>,
-			      <0x0 0x20000000 0x0 0X220000>;
+			      <0x0 0x1f600000 0x0 0xd100>,
+			      <0x0 0x20000000 0x0 0x220000>;
 			interrupts = <0 108 4>,
 				     <0 109 4>,
 				     <0 110 4>,
@@ -684,7 +684,7 @@
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0x10640000 0x0 0x1000>;
-			interrupts = <0 0x3A 0x4>;
+			interrupts = <0 0x3a 0x4>;
 			clocks = <&i2c4clk 0>;
 			bus_num = <4>;
 		};
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 5147d76..e0e8d2a 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -204,7 +204,7 @@
 				#clock-cells = <1>;
 				clocks = <&socplldiv2 0>;
 				clock-names = "qmlclk";
-				reg = <0x0 0x1703C000 0x0 0x1000>;
+				reg = <0x0 0x1703c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "qmlclk";
 			};
@@ -226,7 +226,7 @@
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
 				clocks = <&ethclk 0>;
-				reg = <0x0 0x1702C000 0x0 0x1000>;
+				reg = <0x0 0x1702c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "menetclk";
 			};
@@ -925,8 +925,8 @@
 			compatible = "apm,xgene-enet";
 			status = "disabled";
 			reg = <0x0 0x17020000 0x0 0xd100>,
-			      <0x0 0X17030000 0x0 0Xc300>,
-			      <0x0 0X10000000 0x0 0X200>;
+			      <0x0 0x17030000 0x0 0xc300>,
+			      <0x0 0x10000000 0x0 0x200>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
 			interrupts = <0x0 0x3c 0x4>;
 			dma-coherent;
@@ -951,11 +951,11 @@
 			compatible = "apm,xgene1-sgenet";
 			status = "disabled";
 			reg = <0x0 0x1f210000 0x0 0xd100>,
-			      <0x0 0x1f200000 0x0 0Xc300>,
-			      <0x0 0x1B000000 0x0 0X200>;
+			      <0x0 0x1f200000 0x0 0xc300>,
+			      <0x0 0x1b000000 0x0 0x200>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
-			interrupts = <0x0 0xA0 0x4>,
-				     <0x0 0xA1 0x4>;
+			interrupts = <0x0 0xa0 0x4>,
+				     <0x0 0xa1 0x4>;
 			dma-coherent;
 			clocks = <&sge0clk 0>;
 			local-mac-address = [00 00 00 00 00 00];
@@ -966,11 +966,11 @@
 			compatible = "apm,xgene1-sgenet";
 			status = "disabled";
 			reg = <0x0 0x1f210030 0x0 0xd100>,
-			      <0x0 0x1f200000 0x0 0Xc300>,
-			      <0x0 0x1B000000 0x0 0X8000>;
+			      <0x0 0x1f200000 0x0 0xc300>,
+			      <0x0 0x1b000000 0x0 0x8000>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
-			interrupts = <0x0 0xAC 0x4>,
-				     <0x0 0xAD 0x4>;
+			interrupts = <0x0 0xac 0x4>,
+				     <0x0 0xad 0x4>;
 			port-id = <1>;
 			dma-coherent;
 			clocks = <&sge1clk 0>;
@@ -982,8 +982,8 @@
 			compatible = "apm,xgene1-xgenet";
 			status = "disabled";
 			reg = <0x0 0x1f610000 0x0 0xd100>,
-			      <0x0 0x1f600000 0x0 0Xc300>,
-			      <0x0 0x18000000 0x0 0X200>;
+			      <0x0 0x1f600000 0x0 0xc300>,
+			      <0x0 0x18000000 0x0 0x200>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
 			interrupts = <0x0 0x60 0x4>,
 				     <0x0 0x61 0x4>,
@@ -1005,11 +1005,11 @@
 			compatible = "apm,xgene1-xgenet";
 			status = "disabled";
 			reg = <0x0 0x1f620000 0x0 0xd100>,
-			      <0x0 0x1f600000 0x0 0Xc300>,
-			      <0x0 0x18000000 0x0 0X8000>;
+			      <0x0 0x1f600000 0x0 0xc300>,
+			      <0x0 0x18000000 0x0 0x8000>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
-			interrupts = <0x0 0x6C 0x4>,
-				     <0x0 0x6D 0x4>;
+			interrupts = <0x0 0x6c 0x4>,
+				     <0x0 0x6d 0x4>;
 			port-id = <1>;
 			dma-coherent;
 			clocks = <&xge1clk 0>;
