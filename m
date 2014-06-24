From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 3/3] ARM: shmobile: henninger: enable internal PCI
Date: Tue, 24 Jun 2014 22:13:38 +0400
Message-ID: <201406242213.39873.sergei.shtylyov@cogentembedded.com>
References: <201406242207.32790.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201406242207.32790.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable internal AHB-PCI bridges for the USB EHCI/OHCI controllers attached to
them.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 4:
- moved the PCI bridge nodes before PCIe clock/bridge nodes.

Changes in version 3:
- refreshed the patch.

 arch/arm/boot/dts/r8a7791-henninger.dts |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7791-henninger.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791-henninger.dts
+++ renesas/arch/arm/boot/dts/r8a7791-henninger.dts
@@ -125,6 +125,16 @@
 				 "msiof0_tx";
 		renesas,function = "msiof0";
 	};
+
+	usb0_pins: usb0 {
+		renesas,groups = "usb0";
+		renesas,function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		renesas,groups = "usb1";
+		renesas,function = "usb1";
+	};
 };
 
 &scif0 {
@@ -231,6 +241,18 @@
 	};
 };
 
+&pci0 {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
+&pci1 {
+	status = "okay";
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+};
+
 &pcie_bus_clk {
 	status = "okay";
 };
