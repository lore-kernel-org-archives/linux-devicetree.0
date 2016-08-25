From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH RESEND] bindings: PCI: artpec: correct pci binding example
Date: Fri, 26 Aug 2016 00:01:56 +0200
Message-ID: <1472162516-8966-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>

 - Increase config size. When using a PCIe switch,
   the previous config size only had room for one device.
 - Add bus range. Inherited optional property.
 - Map downstream I/O to PCI address 0. We can map it to any
   address, but let's be consistent with other drivers.

Signed-off-by: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
---
 Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
index 330a45b..5ecaea1 100644
--- a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
@@ -24,16 +24,17 @@ Example:
 		compatible = "axis,artpec6-pcie", "snps,dw-pcie";
 		reg = <0xf8050000 0x2000
 		       0xf8040000 0x1000
-		       0xc0000000 0x1000>;
+		       0xc0000000 0x2000>;
 		reg-names = "dbi", "phy", "config";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		device_type = "pci";
 			  /* downstream I/O */
-		ranges = <0x81000000 0 0x00010000 0xc0010000 0 0x00010000
+		ranges = <0x81000000 0 0 0xc0002000 0 0x00010000
 			  /* non-prefetchable memory */
-			  0x82000000 0 0xc0020000 0xc0020000 0 0x1ffe0000>;
+			  0x82000000 0 0xc0012000 0xc0012000 0 0x1ffee000>;
 		num-lanes = <2>;
+		bus-range = <0x00 0xff>;
 		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi";
 		#interrupt-cells = <1>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
