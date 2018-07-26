From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/4] ARM: dts: mvebu: 98dx3236: Rename nand controller node
Date: Thu, 26 Jul 2018 16:02:54 +1200
Message-ID: <20180726040257.22285-2-chris.packham@alliedtelesis.co.nz>
References: <20180726040257.22285-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726040257.22285-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Update the 98dx3236 SoC and dependent boards to use
"nand-controller" instead of "nand".

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi     | 2 +-
 arch/arm/boot/dts/armada-xp-db-dxbc2.dts      | 2 +-
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
index 8d708cc22495..eb03a5773903 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -189,7 +189,7 @@
 				};
 			};
 
-			nand: nand@d0000 {
+			nand_controller: nand-controller@d0000 {
 				clocks = <&dfx_coredivclk 0>;
 			};
 
diff --git a/arch/arm/boot/dts/armada-xp-db-dxbc2.dts b/arch/arm/boot/dts/armada-xp-db-dxbc2.dts
index f42fc6118b7c..944e0a9c9dac 100644
--- a/arch/arm/boot/dts/armada-xp-db-dxbc2.dts
+++ b/arch/arm/boot/dts/armada-xp-db-dxbc2.dts
@@ -68,7 +68,7 @@
 	status = "okay";
 };
 
-&nand {
+&nand_controller {
 	status = "okay";
 	label = "pxa3xx_nand-0";
 	num-cs = <1>;
diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
index 8432f517e346..d58ea48cb151 100644
--- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
+++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
@@ -67,7 +67,7 @@
 	status = "okay";
 };
 
-&nand {
+&nand_controller {
 	status = "okay";
 	label = "pxa3xx_nand-0";
 	num-cs = <1>;
-- 
2.18.0
