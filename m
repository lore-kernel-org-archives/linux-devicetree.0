From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 23/48] ARM: dts: armada-xp: fix Armada XP boards NAND description
Date: Wed, 13 Mar 2019 15:12:25 -0400
Message-ID: <20190313191250.158955-23-sashal@kernel.org>
References: <20190313191250.158955-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313191250.158955-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

[ Upstream commit 6fc979179c98d2591784937d5618edc3e5cd31c1 ]

Commit 3b79919946cd2cf4dac47842afc9a893acec4ed7 ("ARM: dts:
armada-370-xp: update NAND node with new bindings") updated some
Marvell Armada DT description to use the new NAND controller bindings,
but did it incorrectly for a number of boards: armada-xp-gp,
armada-xp-db and armada-xp-lenovo-ix4-300d. Due to this, the NAND is
no longer detected on those platforms.

This commit fixes that by properly using the new NAND DT binding. This
commit was runtime-tested on Armada XP GP, the two other platforms are
only compile-tested.

Fixes: 3b79919946cd2 ("ARM: dts: armada-370-xp: update NAND node with new bindings")
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/armada-xp-db.dts            | 46 +++++-----
 arch/arm/boot/dts/armada-xp-gp.dts            | 13 +--
 .../boot/dts/armada-xp-lenovo-ix4-300d.dts    | 85 ++++++++++---------
 3 files changed, 76 insertions(+), 68 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index f3ac7483afed..5d04dc68cf57 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -144,30 +144,32 @@
 				status = "okay";
 			};
 
-			nand@d0000 {
+			nand-controller@d0000 {
 				status = "okay";
-				label = "pxa3xx_nand-0";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				nand-on-flash-bbt;
-
-				partitions {
-					compatible = "fixed-partitions";
-					#address-cells = <1>;
-					#size-cells = <1>;
-
-					partition@0 {
-						label = "U-Boot";
-						reg = <0 0x800000>;
-					};
-					partition@800000 {
-						label = "Linux";
-						reg = <0x800000 0x800000>;
-					};
-					partition@1000000 {
-						label = "Filesystem";
-						reg = <0x1000000 0x3f000000>;
 
+				nand@0 {
+					reg = <0>;
+					label = "pxa3xx_nand-0";
+					nand-rb = <0>;
+					nand-on-flash-bbt;
+
+					partitions {
+						compatible = "fixed-partitions";
+						#address-cells = <1>;
+						#size-cells = <1>;
+
+						partition@0 {
+							label = "U-Boot";
+							reg = <0 0x800000>;
+						};
+						partition@800000 {
+							label = "Linux";
+							reg = <0x800000 0x800000>;
+						};
+						partition@1000000 {
+							label = "Filesystem";
+							reg = <0x1000000 0x3f000000>;
+						};
 					};
 				};
 			};
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 1139e9469a83..b4cca507cf13 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -160,12 +160,15 @@
 				status = "okay";
 			};
 
-			nand@d0000 {
+			nand-controller@d0000 {
 				status = "okay";
-				label = "pxa3xx_nand-0";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				nand-on-flash-bbt;
+
+				nand@0 {
+					reg = <0>;
+					label = "pxa3xx_nand-0";
+					nand-rb = <0>;
+					nand-on-flash-bbt;
+				};
 			};
 		};
 
diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
index bbbb38888bb8..87dcb502f72d 100644
--- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
+++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
@@ -81,49 +81,52 @@
 
 			};
 
-			nand@d0000 {
+			nand-controller@d0000 {
 				status = "okay";
-				label = "pxa3xx_nand-0";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				nand-on-flash-bbt;
-
-				partitions {
-					compatible = "fixed-partitions";
-					#address-cells = <1>;
-					#size-cells = <1>;
-
-					partition@0 {
-						label = "u-boot";
-						reg = <0x00000000 0x000e0000>;
-						read-only;
-					};
-
-					partition@e0000 {
-						label = "u-boot-env";
-						reg = <0x000e0000 0x00020000>;
-						read-only;
-					};
-
-					partition@100000 {
-						label = "u-boot-env2";
-						reg = <0x00100000 0x00020000>;
-						read-only;
-					};
-
-					partition@120000 {
-						label = "zImage";
-						reg = <0x00120000 0x00400000>;
-					};
-
-					partition@520000 {
-						label = "initrd";
-						reg = <0x00520000 0x00400000>;
-					};
 
-					partition@e00000 {
-						label = "boot";
-						reg = <0x00e00000 0x3f200000>;
+				nand@0 {
+					reg = <0>;
+					label = "pxa3xx_nand-0";
+					nand-rb = <0>;
+					nand-on-flash-bbt;
+
+					partitions {
+						compatible = "fixed-partitions";
+						#address-cells = <1>;
+						#size-cells = <1>;
+
+						partition@0 {
+							label = "u-boot";
+							reg = <0x00000000 0x000e0000>;
+							read-only;
+						};
+
+						partition@e0000 {
+							label = "u-boot-env";
+							reg = <0x000e0000 0x00020000>;
+							read-only;
+						};
+
+						partition@100000 {
+							label = "u-boot-env2";
+							reg = <0x00100000 0x00020000>;
+							read-only;
+						};
+
+						partition@120000 {
+							label = "zImage";
+							reg = <0x00120000 0x00400000>;
+						};
+
+						partition@520000 {
+							label = "initrd";
+							reg = <0x00520000 0x00400000>;
+						};
+
+						partition@e00000 {
+							label = "boot";
+							reg = <0x00e00000 0x3f200000>;
+						};
 					};
 				};
 			};
-- 
2.19.1
