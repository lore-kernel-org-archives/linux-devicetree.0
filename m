From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 01/13] ARM: dts: armada-375: Add node labels
Date: Sun, 13 Nov 2016 22:32:22 +0100
Message-ID: <20161113213234.3368-2-gregory.clement@free-electrons.com>
References: <20161113213234.3368-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161113213234.3368-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As it was previously done for kirkwood and for aramda 370/XP, this adds
missing node labels to Armada 375 and SoC specific nodes to allow to
reference them more easily.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-375.dtsi | 62 +++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index 45fa92f9cf5c..e016ff3ed970 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -84,12 +84,12 @@
 		#size-cells = <0>;
 		enable-method = "marvell,armada-375-smp";
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
@@ -115,7 +115,7 @@
 			reg = <MBUS_ID(0x01, 0x1d) 0 0x100000>;
 		};
 
-		devbus-bootcs {
+		devbus_bootcs: devbus-bootcs {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10400 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0xffffffff>;
@@ -125,7 +125,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs0 {
+		devbus_cs0: devbus-cs0 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10408 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3e) 0 0xffffffff>;
@@ -135,7 +135,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs1 {
+		devbus_cs1: devbus-cs1 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10410 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3d) 0 0xffffffff>;
@@ -145,7 +145,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs2 {
+		devbus_cs2: devbus-cs2 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10418 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3b) 0 0xffffffff>;
@@ -155,7 +155,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs3 {
+		devbus_cs3: devbus-cs3 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10420 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x37) 0 0xffffffff>;
@@ -182,12 +182,12 @@
 				prefetch-data = <1>;
 			};
 
-			scu@c000 {
+			scu: scu@c000 {
 				compatible = "arm,cortex-a9-scu";
 				reg = <0xc000 0x58>;
 			};
 
-			timer@c600 {
+			timer0: timer@c600 {
 				compatible = "arm,cortex-a9-twd-timer";
 				reg = <0xc600 0x20>;
 				interrupts = <GIC_PPI 13 (IRQ_TYPE_EDGE_RISING | GIC_CPU_MASK_SIMPLE(2))>;
@@ -203,7 +203,7 @@
 				      <0xc100 0x100>;
 			};
 
-			mdio {
+			mdio: mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "marvell,orion-mdio";
@@ -212,7 +212,7 @@
 			};
 
 			/* Network controller */
-			ethernet@f0000 {
+			ethernet: ethernet@f0000 {
 				compatible = "marvell,armada-375-pp2";
 				reg = <0xf0000 0xa000>, /* Packet Processor regs */
 				      <0xc0000 0x3060>, /* LMS regs */
@@ -235,7 +235,7 @@
 				};
 			};
 
-			rtc@10300 {
+			rtc: rtc@10300 {
 				compatible = "marvell,orion-rtc";
 				reg = <0x10300 0x20>;
 				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
@@ -307,7 +307,7 @@
 				status = "disabled";
 			};
 
-			pinctrl {
+			pinctrl: pinctrl {
 				compatible = "marvell,mv88f6720-pinctrl";
 				reg = <0x18000 0x24>;
 
@@ -382,7 +382,7 @@
 				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			system-controller@18200 {
+			systemc: system-controller@18200 {
 				compatible = "marvell,armada-375-system-controller";
 				reg = <0x18200 0x100>;
 			};
@@ -415,7 +415,7 @@
 				interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			timer@20300 {
+			timer1: timer@20300 {
 				compatible = "marvell,armada-375-timer", "marvell,armada-370-timer";
 				reg = <0x20300 0x30>, <0x21040 0x30>;
 				interrupts-extended = <&gic  GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
@@ -428,24 +428,24 @@
 				clock-names = "nbclk", "fixed";
 			};
 
-			watchdog@20300 {
+			watchdog: watchdog@20300 {
 				compatible = "marvell,armada-375-wdt";
 				reg = <0x20300 0x34>, <0x20704 0x4>, <0x18254 0x4>;
 				clocks = <&coreclk 0>, <&refclk>;
 				clock-names = "nbclk", "fixed";
 			};
 
-			cpurst@20800 {
+			cpurst: cpurst@20800 {
 				compatible = "marvell,armada-370-cpu-reset";
 				reg = <0x20800 0x10>;
 			};
 
-			coherency-fabric@21010 {
+			coherencyfab: coherency-fabric@21010 {
 				compatible = "marvell,armada-375-coherency-fabric";
 				reg = <0x21010 0x1c>;
 			};
 
-			usb@50000 {
+			usb0: usb@50000 {
 				compatible = "marvell,orion-ehci";
 				reg = <0x50000 0x500>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
@@ -455,7 +455,7 @@
 				status = "disabled";
 			};
 
-			usb@54000 {
+			usb1: usb@54000 {
 				compatible = "marvell,orion-ehci";
 				reg = <0x54000 0x500>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
@@ -463,7 +463,7 @@
 				status = "disabled";
 			};
 
-			usb3@58000 {
+			usb2: usb3@58000 {
 				compatible = "marvell,armada-375-xhci";
 				reg = <0x58000 0x20000>,<0x5b880 0x80>;
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
@@ -473,7 +473,7 @@
 				status = "disabled";
 			};
 
-			xor@60800 {
+			xor0: xor@60800 {
 				compatible = "marvell,orion-xor";
 				reg = <0x60800 0x100
 				       0x60A00 0x100>;
@@ -493,7 +493,7 @@
 				};
 			};
 
-			xor@60900 {
+			xor1: xor@60900 {
 				compatible = "marvell,orion-xor";
 				reg = <0x60900 0x100
 				       0x60b00 0x100>;
@@ -513,7 +513,7 @@
 				};
 			};
 
-			crypto@90000 {
+			cesa: crypto@90000 {
 				compatible = "marvell,armada-375-crypto";
 				reg = <0x90000 0x10000>;
 				reg-names = "regs";
@@ -528,7 +528,7 @@
 				marvell,crypto-sram-size = <0x800>;
 			};
 
-			sata@a0000 {
+			sata: sata@a0000 {
 				compatible = "marvell,armada-370-sata";
 				reg = <0xa0000 0x5000>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -537,7 +537,7 @@
 				status = "disabled";
 			};
 
-			nand@d0000 {
+			nand: nand@d0000 {
 				compatible = "marvell,armada370-nand";
 				reg = <0xd0000 0x54>;
 				#address-cells = <1>;
@@ -547,7 +547,7 @@
 				status = "disabled";
 			};
 
-			mvsdio@d4000 {
+			sdio: mvsdio@d4000 {
 				compatible = "marvell,orion-sdio";
 				reg = <0xd4000 0x200>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -559,7 +559,7 @@
 				status = "disabled";
 			};
 
-			thermal@e8078 {
+			thermal: thermal@e8078 {
 				compatible = "marvell,armada375-thermal";
 				reg = <0xe8078 0x4>, <0xe807c 0x8>;
 				status = "okay";
@@ -580,7 +580,7 @@
 			};
 		};
 
-		pcie-controller {
+		pciec: pcie-controller {
 			compatible = "marvell,armada-370-pcie";
 			status = "disabled";
 			device_type = "pci";
@@ -599,7 +599,7 @@
 				0x82000000 0x2 0       MBUS_ID(0x04, 0xd8) 0 1 0 /* Port 1 MEM */
 				0x81000000 0x2 0       MBUS_ID(0x04, 0xd0) 0 1 0 /* Port 1 IO  */>;
 
-			pcie@1,0 {
+			pcie0: pcie@1,0 {
 				device_type = "pci";
 				assigned-addresses = <0x82000800 0 0x40000 0 0x2000>;
 				reg = <0x0800 0 0 0 0>;
@@ -616,7 +616,7 @@
 				status = "disabled";
 			};
 
-			pcie@2,0 {
+			pcie1: pcie@2,0 {
 				device_type = "pci";
 				assigned-addresses = <0x82000800 0 0x44000 0 0x2000>;
 				reg = <0x1000 0 0 0 0>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
