From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 1/2] ARM: dts: NSP: Device Tree clean-ups
Date: Tue, 17 Nov 2015 14:55:26 -0500
Message-ID: <1447790127-27237-2-git-send-email-jonmason@broadcom.com>
References: <1447790127-27237-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447790127-27237-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Minor changes to the Broadcom Northstar Plus device tree to make it more
organized and clean.  Firstly, move the GIC and L2 cache entries to be
sequential with respect to the memory addresses.  Secondly, modify the
address portion of the entry names to reflect the difference from the
range modification.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 50 +++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 4bcdd28..7335a74 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -58,30 +58,14 @@
 			};
 		};
 
-		L2: l2-cache {
-			compatible = "arm,pl310-cache";
-			reg = <0x2000 0x1000>;
-			cache-unified;
-			cache-level = <2>;
-		};
-
-		gic: interrupt-controller@19021000 {
-			compatible = "arm,cortex-a9-gic";
-			#interrupt-cells = <3>;
-			#address-cells = <0>;
-			interrupt-controller;
-			reg = <0x1000 0x1000>,
-			      <0x0100 0x100>;
-		};
-
-		timer@19020200 {
+		timer@0200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x0200 0x100>;
 			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&periph_clk>;
 		};
 
-		twd-timer@19020600 {
+		twd-timer@0600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x0600 0x20>;
 			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
@@ -89,13 +73,29 @@
 			clocks = <&periph_clk>;
 		};
 
-		twd-watchdog@19020620 {
+		twd-watchdog@0620 {
 			compatible = "arm,cortex-a9-twd-wdt";
 			reg = <0x0620 0x20>;
 			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
 						  IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&periph_clk>;
 		};
+
+		gic: interrupt-controller@1000 {
+			compatible = "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x1000 0x1000>,
+			      <0x0100 0x100>;
+		};
+
+		L2: l2-cache {
+			compatible = "arm,pl310-cache";
+			reg = <0x2000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+		};
 	};
 
 	clocks {
@@ -116,7 +116,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		uart0: serial@18000300 {
+		uart0: serial@0300 {
 			compatible = "ns16550a";
 			reg = <0x0300 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -124,7 +124,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@18000400 {
+		uart1: serial@0400 {
 			compatible = "ns16550a";
 			reg = <0x0400 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -132,7 +132,7 @@
 			status = "disabled";
 		};
 
-		pcie0: pcie@18012000 {
+		pcie0: pcie@12000 {
 			compatible = "brcm,iproc-pcie";
 			reg = <0x12000 0x1000>;
 
@@ -156,7 +156,7 @@
 			status = "disabled";
 		};
 
-		pcie1: pcie@18013000 {
+		pcie1: pcie@13000 {
 			compatible = "brcm,iproc-pcie";
 			reg = <0x13000 0x1000>;
 
@@ -180,7 +180,7 @@
 			status = "disabled";
 		};
 
-		pcie2: pcie@18014000 {
+		pcie2: pcie@14000 {
 			compatible = "brcm,iproc-pcie";
 			reg = <0x14000 0x1000>;
 
@@ -204,7 +204,7 @@
 			status = "disabled";
 		};
 
-		nand: nand@18026000 {
+		nand: nand@26000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x026000 0x600>,
 			      <0x11b408 0x600>,
-- 
1.9.1
