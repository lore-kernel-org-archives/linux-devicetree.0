From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3] ARM: shmobile: r8a7790: link PCI USB devices to USB PHY
Date: Wed, 23 Jul 2014 02:24:23 +0400
Message-ID: <201407230224.24152.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux@arm.linux.org.uk, linux-usb@vger.kernel.org, magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe the PCI USB devices that are behind the PCI bridges, adding necessary
links to the USB PHY device.

Based on the original work by Ben Dooks <ben.dooks@codethink.co.uk>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against 'renesas-devel-v3.16-rc5-20140722' tag of Simon Horman's
'renesas.git' repo plus R8A7790/Lager USB PHY support patches posted before.
The patch requires the USB PHY driver, and USB HCD generic PHY support (also
already posted) in order to work.

Changes in version 3:
- adjusted "phys" properties in the PCI OHCI/EHCI device nodes;
- resolved rejects.

Changes in version 2:
- renamed the PCI OHCI/EHCI device nodes to comply with the PCI binding;
- changed the PHY specifier in the PCI#2 node to reflect that channel #1 support
  was dropped;
- resolved rejects, refreshed the patch.

 arch/arm/boot/dts/r8a7790.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7790.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7790.dtsi
+++ renesas/arch/arm/boot/dts/r8a7790.dtsi
@@ -999,6 +999,20 @@
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
 
 	pci1: pci@ee0b0000 {
@@ -1039,6 +1053,20 @@
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
 
 	pciec: pcie@fe000000 {
