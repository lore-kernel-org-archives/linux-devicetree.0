From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH] ARM: dts: armada-38x add node labels
Date: Wed,  1 Feb 2017 22:02:59 +1300
Message-ID: <20170201090300.6289-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As was done with Armada XP, add node labels to Armada 38x common and SoC
specific nodes to make them easier to reference in board device trees.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
 arch/arm/boot/dts/armada-385.dtsi | 20 +++++++++-----------
 arch/arm/boot/dts/armada-388.dtsi |  9 ++++-----
 arch/arm/boot/dts/armada-38x.dtsi | 38 +++++++++++++++++++-------------------
 3 files changed, 32 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385.dtsi b/arch/arm/boot/dts/armada-385.dtsi
index 8e63be33472e..7fcc4c4885cf 100644
--- a/arch/arm/boot/dts/armada-385.dtsi
+++ b/arch/arm/boot/dts/armada-385.dtsi
@@ -70,13 +70,7 @@
 	};
 
 	soc {
-		internal-regs {
-			pinctrl@18000 {
-				compatible = "marvell,mv88f6820-pinctrl";
-			};
-		};
-
-		pcie-controller {
+		pciec: pcie-controller {
 			compatible = "marvell,armada-370-pcie";
 			status = "disabled";
 			device_type = "pci";
@@ -106,7 +100,7 @@
 			 * configured in x4 by the bootloader, then
 			 * pcie@4,0 is not available.
 			 */
-			pcie@1,0 {
+			pcie1: pcie@1,0 {
 				device_type = "pci";
 				assigned-addresses = <0x82000800 0 0x80000 0 0x2000>;
 				reg = <0x0800 0 0 0 0>;
@@ -124,7 +118,7 @@
 			};
 
 			/* x1 port */
-			pcie@2,0 {
+			pcie2: pcie@2,0 {
 				device_type = "pci";
 				assigned-addresses = <0x82000800 0 0x40000 0 0x2000>;
 				reg = <0x1000 0 0 0 0>;
@@ -142,7 +136,7 @@
 			};
 
 			/* x1 port */
-			pcie@3,0 {
+			pcie3: pcie@3,0 {
 				device_type = "pci";
 				assigned-addresses = <0x82000800 0 0x44000 0 0x2000>;
 				reg = <0x1800 0 0 0 0>;
@@ -163,7 +157,7 @@
 			 * x1 port only available when pcie@1,0 is
 			 * configured as a x1 port
 			 */
-			pcie@4,0 {
+			pcie4: pcie@4,0 {
 				device_type = "pci";
 				assigned-addresses = <0x82000800 0 0x48000 0 0x2000>;
 				reg = <0x2000 0 0 0 0>;
@@ -182,3 +176,7 @@
 		};
 	};
 };
+
+&pinctrl {
+	compatible = "marvell,mv88f6820-pinctrl";
+};
diff --git a/arch/arm/boot/dts/armada-388.dtsi b/arch/arm/boot/dts/armada-388.dtsi
index 564fa5937e25..1c0d151b2aaa 100644
--- a/arch/arm/boot/dts/armada-388.dtsi
+++ b/arch/arm/boot/dts/armada-388.dtsi
@@ -50,13 +50,8 @@
 	model = "Marvell Armada 388 family SoC";
 	compatible = "marvell,armada388", "marvell,armada385",
 		"marvell,armada380";
-
 	soc {
 		internal-regs {
-			pinctrl@18000 {
-				compatible = "marvell,mv88f6828-pinctrl";
-			};
-
 			sata@e0000 {
 				compatible = "marvell,armada-380-ahci";
 				reg = <0xe0000 0x2000>;
@@ -68,3 +63,7 @@
 		};
 	};
 };
+
+&pinctrl {
+	compatible = "marvell,mv88f6828-pinctrl";
+};
diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 79b767507eab..c558a5d6a21f 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -82,7 +82,7 @@
 			reg = <MBUS_ID(0x01, 0x1d) 0 0x200000>;
 		};
 
-		devbus-bootcs {
+		devbus_bootcs: devbus-bootcs {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10400 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0xffffffff>;
@@ -92,7 +92,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs0 {
+		devbus_cs0: devbus-cs0 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10408 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3e) 0 0xffffffff>;
@@ -102,7 +102,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs1 {
+		devbus_cs1: devbus-cs1 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10410 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3d) 0 0xffffffff>;
@@ -112,7 +112,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs2 {
+		devbus_cs2: devbus-cs2 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10418 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3b) 0 0xffffffff>;
@@ -122,7 +122,7 @@
 			status = "disabled";
 		};
 
-		devbus-cs3 {
+		devbus_cs3: devbus-cs3 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10420 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x37) 0 0xffffffff>;
@@ -339,7 +339,7 @@
 					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			system-controller@18200 {
+			systemc: system-controller@18200 {
 				compatible = "marvell,armada-380-system-controller",
 					     "marvell,armada-370-xp-system-controller";
 				reg = <0x18200 0x100>;
@@ -373,7 +373,7 @@
 				interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			timer@20300 {
+			timer: timer@20300 {
 				compatible = "marvell,armada-380-timer",
 					     "marvell,armada-xp-timer";
 				reg = <0x20300 0x30>, <0x21040 0x30>;
@@ -387,14 +387,14 @@
 				clock-names = "nbclk", "fixed";
 			};
 
-			watchdog@20300 {
+			watchdog: watchdog@20300 {
 				compatible = "marvell,armada-380-wdt";
 				reg = <0x20300 0x34>, <0x20704 0x4>, <0x18260 0x4>;
 				clocks = <&coreclk 2>, <&refclk>;
 				clock-names = "nbclk", "fixed";
 			};
 
-			cpurst@20800 {
+			cpurst: cpurst@20800 {
 				compatible = "marvell,armada-370-cpu-reset";
 				reg = <0x20800 0x10>;
 			};
@@ -404,12 +404,12 @@
 				reg = <0x20d20 0x6c>;
 			};
 
-			coherency-fabric@21010 {
+			coherencyfab: coherency-fabric@21010 {
 				compatible = "marvell,armada-380-coherency-fabric";
 				reg = <0x21010 0x1c>;
 			};
 
-			pmsu@22000 {
+			pmsu: pmsu@22000 {
 				compatible = "marvell,armada-380-pmsu";
 				reg = <0x22000 0x1000>;
 			};
@@ -451,7 +451,7 @@
 				status = "disabled";
 			};
 
-			usb@58000 {
+			usb0: usb@58000 {
 				compatible = "marvell,orion-ehci";
 				reg = <0x58000 0x500>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
@@ -459,7 +459,7 @@
 				status = "disabled";
 			};
 
-			xor@60800 {
+			xor0: xor@60800 {
 				compatible = "marvell,armada-380-xor", "marvell,orion-xor";
 				reg = <0x60800 0x100
 				       0x60a00 0x100>;
@@ -479,7 +479,7 @@
 				};
 			};
 
-			xor@60900 {
+			xor1: xor@60900 {
 				compatible = "marvell,armada-380-xor", "marvell,orion-xor";
 				reg = <0x60900 0x100
 				       0x60b00 0x100>;
@@ -507,7 +507,7 @@
 				clocks = <&gateclk 4>;
 			};
 
-			crypto@90000 {
+			cesa: crypto@90000 {
 				compatible = "marvell,armada-38x-crypto";
 				reg = <0x90000 0x10000>;
 				reg-names = "regs";
@@ -522,7 +522,7 @@
 				marvell,crypto-sram-size = <0x800>;
 			};
 
-			rtc@a3800 {
+			rtc: rtc@a3800 {
 				compatible = "marvell,armada-380-rtc";
 				reg = <0xa3800 0x20>, <0x184a0 0x0c>;
 				reg-names = "rtc", "rtc-soc";
@@ -561,13 +561,13 @@
 				clock-output-names = "nand";
 			};
 
-			thermal@e8078 {
+			thermal: thermal@e8078 {
 				compatible = "marvell,armada380-thermal";
 				reg = <0xe4078 0x4>, <0xe4074 0x4>;
 				status = "okay";
 			};
 
-			flash@d0000 {
+			nand: flash@d0000 {
 				compatible = "marvell,armada370-nand";
 				reg = <0xd0000 0x54>;
 				#address-cells = <1>;
@@ -577,7 +577,7 @@
 				status = "disabled";
 			};
 
-			sdhci@d8000 {
+			sdhci: sdhci@d8000 {
 				compatible = "marvell,armada-380-sdhci";
 				reg-names = "sdhci", "mbus", "conf-sdio3";
 				reg = <0xd8000 0x1000>,
-- 
2.11.0.24.ge6920cf

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
