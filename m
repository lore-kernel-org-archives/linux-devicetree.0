From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] ARM: dts: r8a779x: Fix PCI bus dtc warnings
Date: Fri,  9 Jun 2017 17:50:40 +0200
Message-ID: <1497023440-23845-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

The bogus 'device_type = "pci"' confuses dtc, causing lots of totally
unrelated warnings.  After fixing that, real warnings like

    arch/arm/boot/dts/r8a7790-lager.dtb: Warning (pci_device_reg): Node /pci@ee090000/usb@0,1 PCI unit address format error, expected "1,0"

are left.  Correct the unit-addresses and reg properties of the subnodes
to fix these.

Signed-off-by: Rob Herring <robh@kernel.org>
[geert: Improve description]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Take over from Rob,
  - Improve patch description.

 arch/arm/boot/dts/r8a7790.dtsi | 16 ++++++----------
 arch/arm/boot/dts/r8a7791.dtsi | 16 ++++++----------
 arch/arm/boot/dts/r8a7794.dtsi | 16 ++++++----------
 3 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 043c599011798042..2ed727f81a66981b 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1233,16 +1233,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -1289,16 +1287,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x20800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x21000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index a56be0f9dcfc907d..111027383e6cdd8a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1254,16 +1254,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -1289,16 +1287,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x10800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x11000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index c2bc6ba9200ecc40..33fc723f0c2ec42e 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -820,16 +820,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -855,16 +853,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x10800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x11000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
-- 
2.7.4
