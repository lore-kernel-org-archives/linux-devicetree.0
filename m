From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: shmobile: r8a7794: link PCI USB devices to USB PHY
Date: Sun, 13 Sep 2015 02:00:19 +0300
Message-ID: <10927620.1TFu7PRvi4@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the PCI USB devices that are behind the PCI bridges, adding necessary
links to the USB PHY device.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against 'renesas-devel-20150911v2-v4.2' tag of Simon Horman's
'renesas.git' repo plus the R8A7794/SILK PCI USB and USB PHY support patches
just posted.

arch/arm/boot/dts/r8a7794.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -667,6 +667,20 @@
 		interrupt-map = <0x0000 0 0 1 &gic 0 108 IRQ_TYPE_LEVEL_HIGH
 				 0x0800 0 0 1 &gic 0 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic 0 108 IRQ_TYPE_LEVEL_HIGH>;
+
+		usb@0,1 {
+			reg = <0x800 0 0 0 0>;
+			device_type = "pci";
+			phys = <&usb0 0>;
+			phy-names = "usb";
+		};
+
+		usb@0,2 {
+			reg = <0x1000 0 0 0 0>;
+			device_type = "pci";
+			phys = <&usb0 0>;
+			phy-names = "usb";
+		};
 	};
 
 	pci1: pci@ee0d0000 {
@@ -688,6 +702,20 @@
 		interrupt-map = <0x0000 0 0 1 &gic 0 113 IRQ_TYPE_LEVEL_HIGH
 				 0x0800 0 0 1 &gic 0 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic 0 113 IRQ_TYPE_LEVEL_HIGH>;
+
+		usb@0,1 {
+			reg = <0x800 0 0 0 0>;
+			device_type = "pci";
+			phys = <&usb2 0>;
+			phy-names = "usb";
+		};
+
+		usb@0,2 {
+			reg = <0x1000 0 0 0 0>;
+			device_type = "pci";
+			phys = <&usb2 0>;
+			phy-names = "usb";
+		};
 	};
 
 	usbphy: usb-phy@e6590100 {

