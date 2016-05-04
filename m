From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: pci: add DT binding for Axis ARTPEC-6 PCIe controller
Date: Wed, 4 May 2016 13:54:17 +0200
Message-ID: <1462362857-27481-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: niklass-VrBV9hrLPhE@public.gmane.org, jespern-VrBV9hrLPhE@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>

This commit adds the Device Tree binding documentation that allows to
describe the PCIe controller found in the Axis ARTPEC-6 SoC.

Signed-off-by: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
---
 .../devicetree/bindings/pci/axis,artpec6-pcie.txt  | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
new file mode 100644
index 0000000..fdac2a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
@@ -0,0 +1,45 @@
+* Axis ARTPEC-6 PCIe interface
+
+This PCIe host controller is based on the Synopsis Designware PCIe IP
+and thus inherits all the common properties defined in designware-pcie.txt.
+
+Required properties:
+- compatible: "axis,artpec6-pcie", "snps,dw-pcie"
+- reg: base addresses and lengths of the pcie controller (DBI),
+	the phy controller, and configuration address space.
+- reg-names: Must include the following entries:
+	- "dbi"
+	- "phy"
+	- "config"
+- interrupts: A list of interrupt outputs of the controller. Must contain an
+  entry for each entry in the interrupt-names property.
+- interrupt-names: Must include the following entries:
+	- "msi": The interrupt that is asserted when an MSI is received
+- syscon: Should contain a link to the syscon device node.
+
+Example:
+
+	pcie@f8050000 {
+		compatible = "axis,artpec6-pcie", "snps,dw-pcie";
+		reg = <0xf8050000 0x2000
+		       0xf8040000 0x1000
+		       0xc0000000 0x1000>;
+		reg-names = "dbi", "phy", "config";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+			  /* downstream I/O */
+		ranges = <0x81000000 0 0	  0xc0001000 0 0x00010000
+			  /* non-prefetchable memory */
+			  0x82000000 0 0xc0011000 0xc0011000 0 0x1ffef000>;
+		num-lanes = <2>;
+		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi";
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0x7>;
+		interrupt-map = <0 0 0 1 &intc GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+		                <0 0 0 2 &intc GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+		                <0 0 0 3 &intc GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+		                <0 0 0 4 &intc GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		syscon = <&syscon>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
