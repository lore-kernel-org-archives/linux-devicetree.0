Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49691 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932132AbeBSWUv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:20:51 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/2] arm64: dts: marvell: use reworked NAND controller driver on Armada 7K
Date: Mon, 19 Feb 2018 23:20:44 +0100
Message-Id: <20180219222045.1927-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180219222045.1927-1-miquel.raynal@bootlin.com>
References: <20180219222045.1927-1-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Use the new bindings of the reworked Marvell NAND controller driver.
Also adapt the nand controller node organization to distinguish which
property is relevant for the controller, and which one is NAND chip
specific. Expose the partitions as a subnode of the NAND chip.

Remove the 'marvell,nand-enable-arbiter' property, not needed anymore as
the driver activates the arbiter by default for all boards (either
needed or harmless).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 50 ++++++++++++++++----------
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi  |  8 ++---
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 3ae05eee2c9a..225da3f33a72 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -162,36 +162,48 @@
 	};
 };
 
-&cp0_nand {
+&cp0_nand_controller {
 	/*
 	 * SPI on CPM and NAND have common pins on this board. We can
-	 * use only one at a time. To enable the NAND (whihch will
+	 * use only one at a time. To enable the NAND (which will
 	 * disable the SPI), the "status = "okay";" line have to be
 	 * added here.
 	 */
-	num-cs = <1>;
 	pinctrl-0 = <&nand_pins>, <&nand_rb>;
 	pinctrl-names = "default";
-	nand-ecc-strength = <4>;
-	nand-ecc-step-size = <512>;
-	marvell,nand-enable-arbiter;
-	nand-on-flash-bbt;
 
-	partition@0 {
-		label = "U-Boot";
-		reg = <0 0x200000>;
-	};
-	partition@200000 {
-		label = "Linux";
-		reg = <0x200000 0xe00000>;
-	};
-	partition@1000000 {
-		label = "Filesystem";
-		reg = <0x1000000 0x3f000000>;
+	nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		nand-rb = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0 0x200000>;
+			};
+
+			partition@200000 {
+				label = "Linux";
+				reg = <0x200000 0xe00000>;
+			};
+
+			partition@1000000 {
+				label = "Filesystem";
+				reg = <0x1000000 0x3f000000>;
+			};
+
+		};
 	};
 };
 
-
 &cp0_spi1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
index a8af4136dbe7..d65e1da10825 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
@@ -290,17 +290,17 @@
 			status = "disabled";
 		};
 
-		CP110_LABEL(nand): nand@720000 {
+		CP110_LABEL(nand_controller): nand@720000 {
 			/*
 			* Due to the limitation of the pins available
 			* this controller is only usable on the CPM
 			* for A7K and on the CPS for A8K.
 			*/
-			compatible = "marvell,armada-8k-nand",
-			"marvell,armada370-nand";
+			compatible = "marvell,armada-8k-nand-controller",
+				"marvell,armada370-nand-controller";
 			reg = <0x720000 0x54>;
 			#address-cells = <1>;
-			#size-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <ICU_GRP_NSR 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&CP110_LABEL(clk) 1 2>;
 			marvell,system-controller = <&CP110_LABEL(syscon0)>;
-- 
2.14.1

