Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49698 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932116AbeBSWUv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:20:51 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/2] arm64: dts: marvell: use reworked NAND controller driver on Armada 8K
Date: Mon, 19 Feb 2018 23:20:45 +0100
Message-Id: <20180219222045.1927-3-miquel.raynal@bootlin.com>
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
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 44 +++++++++++++++-----------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index dba55baff20f..fecd455ca047 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -279,27 +279,35 @@
  * Proper NAND usage will require DPR-76 to be in position 1-2, which disables
  * MDIO signal of CP1.
  */
-&cp1_nand {
-	num-cs = <1>;
+&cp1_nand_controller {
 	pinctrl-0 = <&nand_pins>, <&nand_rb>;
 	pinctrl-names = "default";
-	nand-ecc-strength = <4>;
-	nand-ecc-step-size = <512>;
-	marvell,nand-enable-arbiter;
-	marvell,system-controller = <&cp1_syscon0>;
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
+			partition@200000 {
+				label = "Linux";
+				reg = <0x200000 0xe00000>;
+			};
+			partition@1000000 {
+				label = "Filesystem";
+				reg = <0x1000000 0x3f000000>;
+			};
+		};
 	};
 };
 
-- 
2.14.1

