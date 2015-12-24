From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH v10 3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes
Date: Thu, 24 Dec 2015 12:20:15 +0000
Message-ID: <1450959615-30246-4-git-send-email-harvey.hunt@imgtec.com>
References: <1450959615-30246-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450959615-30246-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com
Cc: alex@alex-smith.me.uk, Alex Smith <alex.smith@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, David Woodhouse <dwmw2@infradead.org>, Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, robh@kernel.org, Harvey Hunt <harvey.hunt@imgtec.com>
List-Id: devicetree@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

Add device tree nodes for the NEMC and BCH to the JZ4780 device tree,
and make use of them in the Ci20 device tree to add a node for the
board's NAND.

Note that since the pinctrl driver is not yet upstream, this includes
neither pin configuration nor busy/write-protect GPIO pins for the
NAND. Use of the NAND relies on the boot loader to have left the pins
configured in a usable state, which should be the case when booted
from the NAND.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: robh@kernel.org
Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
---
v9 -> v10:
 - No change.

v8 -> v9:
 - Represent the partition table as a subnode of a NAND chip. 

v7 -> v8:
 - Describe the NAND chips as children nodes of the NAND controller.
 - Remove ingenic, prefix from ECC settings.
 - Renamed some ECC settings.

v6 -> v7:
 - Add nand-ecc-mode to DT.
 - Add nand-on-flash-bbt to DT.

v4 -> v5:
 - New patch adding DT nodes for the NAND so that the driver can be
   tested.

 arch/mips/boot/dts/ingenic/ci20.dts    | 63 ++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 26 ++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 9fcb9e7..782258c 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -42,3 +42,66 @@
 &uart4 {
 	status = "okay";
 };
+
+&nemc {
+	status = "okay";
+
+	nandc: nand-controller@1 {
+		compatible = "ingenic,jz4780-nand";
+		reg = <1 0 0x1000000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ingenic,bch-controller = <&bch>;
+
+		ingenic,nemc-tAS = <10>;
+		ingenic,nemc-tAH = <5>;
+		ingenic,nemc-tBP = <10>;
+		ingenic,nemc-tAW = <15>;
+		ingenic,nemc-tSTRV = <100>;
+
+		nand@1 {
+			reg = <1>;
+
+			nand-ecc-step-size = <1024>;
+			nand-ecc-strength = <24>;
+			nand-ecc-mode = "hw";
+			nand-on-flash-bbt;
+
+			partitions {
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				partition@0 {
+					label = "u-boot-spl";
+					reg = <0x0 0x0 0x0 0x800000>;
+				};
+
+				partition@0x800000 {
+					label = "u-boot";
+					reg = <0x0 0x800000 0x0 0x200000>;
+				};
+
+				partition@0xa00000 {
+					label = "u-boot-env";
+					reg = <0x0 0xa00000 0x0 0x200000>;
+				};
+
+				partition@0xc00000 {
+					label = "boot";
+					reg = <0x0 0xc00000 0x0 0x4000000>;
+				};
+
+				partition@0x8c00000 {
+					label = "system";
+					reg = <0x0 0x4c00000 0x1 0xfb400000>;
+				};
+			};
+		};
+	};
+};
+
+&bch {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 65389f6..b868b42 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -108,4 +108,30 @@
 
 		status = "disabled";
 	};
+
+	nemc: nemc@13410000 {
+		compatible = "ingenic,jz4780-nemc";
+		reg = <0x13410000 0x10000>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <1 0 0x1b000000 0x1000000
+			  2 0 0x1a000000 0x1000000
+			  3 0 0x19000000 0x1000000
+			  4 0 0x18000000 0x1000000
+			  5 0 0x17000000 0x1000000
+			  6 0 0x16000000 0x1000000>;
+
+		clocks = <&cgu JZ4780_CLK_NEMC>;
+
+		status = "disabled";
+	};
+
+	bch: bch@134d0000 {
+		compatible = "ingenic,jz4780-bch";
+		reg = <0x134d0000 0x10000>;
+
+		clocks = <&cgu JZ4780_CLK_BCH>;
+
+		status = "disabled";
+	};
 };
-- 
2.6.4
