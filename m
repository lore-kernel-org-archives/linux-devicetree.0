From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH] MIPS: mscc: ocelot: add MIIM1 bus
Date: Wed, 25 Jul 2018 14:22:41 +0200
Message-ID: <20180725122241.31370-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

There is an additional MIIM (MDIO) bus in this SoC so let's declare it
in the dtsi.

This bus requires GPIO 14 and 15 pins that need to be muxed. There is no
support for internal PHY reset on this bus on the contrary of MIIM0 so
there is only one register address space and not two.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
index 7096915f26e0..d7f0e3551500 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -178,6 +178,11 @@
 				pins = "GPIO_12", "GPIO_13";
 				function = "uart2";
 			};
+
+			miim1: miim1 {
+				pins = "GPIO_14", "GPIO_15";
+				function = "miim1";
+			};
 		};
 
 		mdio0: mdio@107009c {
@@ -201,5 +206,16 @@
 				reg = <3>;
 			};
 		};
+
+		mdio1: mdio@10700c0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "mscc,ocelot-miim";
+			reg = <0x10700c0 0x24>;
+			interrupts = <15>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&miim1>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.14.1
