From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 3/4] ARM: dts: mvebu: db-xc3-24g4: use new style nand binding
Date: Thu, 26 Jul 2018 16:02:56 +1200
Message-ID: <20180726040257.22285-4-chris.packham@alliedtelesis.co.nz>
References: <20180726040257.22285-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726040257.22285-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Update the nand flash binding to the new style.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
index d58ea48cb151..df048050615f 100644
--- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
+++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
@@ -69,12 +69,16 @@
 
 &nand_controller {
 	status = "okay";
-	label = "pxa3xx_nand-0";
-	num-cs = <1>;
-	marvell,nand-keep-config;
-	nand-on-flash-bbt;
-	nand-ecc-strength = <4>;
-	nand-ecc-step-size = <512>;
+
+	nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		nand-rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
 };
 
 &spi0 {
-- 
2.18.0
