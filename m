From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] arm64: dts: marvell: add NAND support on the 8040-DB board
Date: Mon,  6 Nov 2017 23:28:23 +0100
Message-ID: <20171106222823.3442-1-miquel.raynal@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add NAND support on the Armada-8040-DB by adding the same tree as for
the Armada-7040-DB by using the same compatible string
"marvell,armada-8k-nand".

Do not enable the NAND node as enabling it (and changing manually the
proper DPR-76 switch) would disable MDIO from CP1 (and thus disable CPS
Ethernet PHY).

Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     | 28 ++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi       | 17 +++++++++++++
 .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi |  3 ++-
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 0d7b2ae46610..1c4b4e9137e8 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -216,6 +216,34 @@
 	clock-frequency = <100000>;
 };
 
+/*
+ * Proper NAND usage will require DPR-76 to be in position 1-2, which disables
+ * MDIO signal of CP1.
+ */
+&cps_nand {
+	num-cs = <1>;
+	pinctrl-0 = <&nand_pins>, <&nand_rb>;
+	pinctrl-names = "default";
+	nand-ecc-strength = <4>;
+	nand-ecc-step-size = <512>;
+	marvell,nand-enable-arbiter;
+	marvell,system-controller = <&cps_syscon0>;
+	nand-on-flash-bbt;
+
+	partition@0 {
+		label = "U-Boot";
+		reg = <0 0x200000>;
+	};
+	partition@200000 {
+		label = "Linux";
+		reg = <0x200000 0xe00000>;
+	};
+	partition@1000000 {
+		label = "Filesystem";
+		reg = <0x1000000 0x3f000000>;
+	};
+};
+
 /* CON4 on CP1 expansion */
 &cps_sata0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
index 666ebe96ba0d..b280ddd3c397 100644
--- a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
@@ -72,5 +72,22 @@
 &cps_syscon0 {
 	cps_pinctrl: pinctrl {
 		compatible = "marvell,armada-8k-cps-pinctrl";
+
+		nand_pins: nand-pins {
+			marvell,pins =
+			"mpp0", "mpp1", "mpp2", "mpp3",
+			"mpp4", "mpp5", "mpp6", "mpp7",
+			"mpp8", "mpp9", "mpp10", "mpp11",
+			"mpp15", "mpp16", "mpp17", "mpp18",
+			"mpp19", "mpp20", "mpp21", "mpp22",
+			"mpp23", "mpp24", "mpp25", "mpp26",
+			"mpp27";
+			marvell,function = "dev";
+		};
+
+		nand_rb: nand-rb {
+			marvell,pins = "mpp13", "mpp12";
+			marvell,function = "nf";
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index b71ee6c83668..64663f3f4dfe 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -275,12 +275,13 @@
 				 * this controller is only usable on the CPM
 				 * for A7K and on the CPS for A8K.
 				 */
-				compatible = "marvell,armada370-nand";
+				compatible = "marvell,armada-8k-nand";
 				reg = <0x720000 0x54>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				interrupts = <ICU_GRP_NSR 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cps_clk 1 2>;
+				marvell,system-controller = <&cpm_syscon0>;
 				status = "disabled";
 			};
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
