From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: PCI: rcar: Correct example to match reality
Date: Wed, 11 Oct 2017 15:50:13 +0200
Message-ID: <1507729813-21501-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Correct the USB subnodes in the example, cfr. commit f7d569c1e6a6fa73
("ARM: dts: r8a779x: Fix PCI bus dtc warnings"):
  1. Drop the bogus 'device_type = "pci"' properties,
  2. Correct the unit addresses.

Update other bits in the example to match real use:
  1. Rename the USB subnodes from "pci" to "usb",
  2. Update the "phys" property.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
index 3d038638612b8ec2..9fe7e12a7bf37b7c 100644
--- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
+++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
@@ -60,17 +60,15 @@ Example SoC configuration:
 				 0x0800 0 0 1 &gic 0 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic 0 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		pci@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
-			phys = <&usbphy 0 0>;
+			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		pci@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
-			phys = <&usbphy 0 0>;
+			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 	};
-- 
2.7.4
