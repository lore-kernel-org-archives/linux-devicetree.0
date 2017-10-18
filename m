From: Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [RFC 12/12] ARM64: dts: marvell: use reworked NAND controller driver on Armada 7K/8K
Date: Wed, 18 Oct 2017 16:36:29 +0200
Message-ID: <20171018143629.29302-13-miquel.raynal@free-electrons.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, bcm-kernel-feedback-list@broadcom.com, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Daniel Mack <daniel@zonque.org>, David Woodhouse <dwmw2@infradead.org>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@free-electrons.com>, Han Xu <han.xu@nxp.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>linux
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Miquel Raynal <miquel.raynal@free-electrons.com>, Igor Grinberg <grinberg@compulab.co.il>, Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Hanna Hawa <hannah@marvell.com>
List-Id: devicetree@vger.kernel.org

Change the bindings to use the reworked Marvell NAND controller driver.
Also adapt the nand controller node organization to distinguish which
property is relevant for the controller, and which one is NAND chip
specific. Expose the partitions as a subnode of the NAND chip.

Remove the 'marvell,nand-enable-arbiter' property, inefective with
Armada boards.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 47 +++++++++++++---------
 .../boot/dts/marvell/armada-cp110-master.dtsi      |  6 +--
 .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi |  6 +--
 3 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 3cb4e81f6415..cd0290613eea 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -144,32 +144,41 @@
 	};
 };
 
-&cpm_nand {
+&cpm_nand_controller {
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
-
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
+
+	nand@0 {
+		reg = <0>;
+		marvell,rb = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
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
 
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index f203f7300194..c209f2f93b6c 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -268,14 +268,14 @@
 				status = "disabled";
 			};
 
-			cpm_nand: nand@720000 {
+			cpm_nand_controller: nand@720000 {
 				/*
 				 * Due to the limiation of the pin available
 				 * this controller is only usable on the CPM
 				 * for A7K and on the CPS for A8K.
 				 */
-				compatible = "marvell,armada-8k-nand",
-					     "marvell,armada370-nand";
+				compatible = "marvell,armada-8k-nand-controller",
+					     "marvell,armada370-nand-controller";
 				reg = <0x720000 0x54>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index 7d78767d3024..22789485d77e 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -269,14 +269,14 @@
 				status = "disabled";
 			};
 
-			cps_nand: nand@720000 {
+			cps_nand_controller: nand@720000 {
 				/*
 				 * Due to the limiation of the pin available
 				 * this controller is only usable on the CPM
 				 * for A7K and on the CPS for A8K.
 				 */
-				compatible = "marvell,armada370-nand",
-					     "marvell,armada370-nand";
+				compatible = "marvell,armada-8k-nand-controller",
+					     "marvell,armada370-nand-controller";
 				reg = <0x720000 0x54>;
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.11.0
