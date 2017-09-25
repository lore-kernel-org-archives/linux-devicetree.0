From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: marvell: add NAND support on the 7040-DB board
Date: Mon, 25 Sep 2017 16:53:52 +0200
Message-ID: <20170925145352.13145-4-miquel.raynal@free-electrons.com>
References: <20170925145352.13145-1-miquel.raynal@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170925145352.13145-1-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The NAND controller used in A7K/A8K is present on the CP110 master part.
It is compatible with the pxa3xx_nand driver but requires the use of the
marvell,armada-8k-nand compatible string due to the need to first enable
the NAND controller.

Add properties to the NAND node to fit the bindings constraints of the
pxa3xx_nand driver and enable the NAND controller.

Add the 'marvell,system-controller' property to the cp110 master NAND
node with a reference to the syscon node. This is new compared to other
boards using the pxa3xx_nand driver and it is needed to be bootloader
independent and enable the NAND controller from the NAND controller
driver itself by writing in these syscon registers.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
[miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org: add NAND ready/busy MPP subnode,
change compatible string to fit the needs of the A7k/A8k SoCs and add
the system controller property]
Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi       | 14 +++++++++++++
 .../boot/dts/marvell/armada-cp110-master.dtsi      |  3 ++-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 9c3bdf87e543..b98cf265bae5 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -144,6 +144,30 @@
 	};
 };
 
+&cpm_nand {
+	status = "okay";
+	num-cs = <1>;
+	pinctrl-0 = <&nand_pins>, <&nand_rb>;
+	pinctrl-names = "default";
+	nand-ecc-strength = <4>;
+	nand-ecc-step-size = <512>;
+	marvell,nand-enable-arbiter;
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
 &cpm_spi1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
index 860b6ae9dcc5..0e1a1e5be399 100644
--- a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
@@ -64,5 +64,19 @@
 &cpm_syscon0 {
 	cpm_pinctrl: pinctrl {
 		compatible = "marvell,armada-7k-pinctrl";
+
+		nand_pins: nand-pins {
+			marvell,pins =
+			"mpp15", "mpp16", "mpp17", "mpp18",
+			"mpp19", "mpp20", "mpp21", "mpp22",
+			"mpp23", "mpp24", "mpp25", "mpp26",
+			"mpp27";
+			marvell,function = "dev";
+		};
+
+		nand_rb: nand-rb {
+			marvell,pins = "mpp13";
+			marvell,function = "nf";
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index 8263a8a504a8..d41b41b613ec 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -274,12 +274,13 @@
 				 * this controller is only usable on the CPM
 				 * for A7K and on the CPS for A8K.
 				 */
-				compatible = "marvell,armada370-nand";
+				compatible = "marvell,armada-8k-nand";
 				reg = <0x720000 0x54>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				interrupts = <ICU_GRP_NSR 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cpm_clk 1 2>;
+				marvell,system-controller = <&cpm_syscon0>;
 				status = "disabled";
 			};
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
