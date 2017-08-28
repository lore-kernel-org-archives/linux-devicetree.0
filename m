From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 2/2] dt-bindings: designware: add binding for Designware PCIe in ECAM mode
Date: Mon, 28 Aug 2017 19:04:37 +0100
Message-ID: <20170828180437.2646-3-ard.biesheuvel@linaro.org>
References: <20170828180437.2646-1-ard.biesheuvel@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170828180437.2646-1-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Describe the binding for firmware-configured instances of the Synopsys
Designware PCIe controller in RC mode, that are almost but not quite
ECAM compliant.

Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt b/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt
new file mode 100644
index 000000000000..29bad1337c87
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt
@@ -0,0 +1,42 @@
+* Synopsys Designware PCIe root complex in ECAM mode
+
+In some cases, firmware may already have configured the Synopsys Designware
+PCIe controller in RC mode with static ATU window mappings that cover all
+config, MMIO and I/O spaces in a [mostly] ECAM compatible fashion.
+In this case, there is no need for the OS to perform any low level setup
+of clocks, PHYs or device registers, nor is there any reason for the driver
+to reconfigure ATU windows for config and/or IO space accesses at runtime.
+
+In cases where the IP was synthesized with a minimum ATU window size of
+64 KB, it cannot be supported by the generic ECAM driver, because it
+requires special config space accessors that filter accesses to device #1
+and beyond on the first bus.
+
+Required properties:
+- compatible: "marvell,armada8k-pcie-ecam" or
+              "socionext,synquacer-pcie-ecam" or
+              "snps,dw-pcie-ecam" (must be preceded by a more specific match)
+
+Please refer to the binding document of "pci-host-ecam-generic" in the
+file host-generic-pci.txt for a description of the remaining required
+and optional properties.
+
+Example:
+
+    pcie1: pcie@7f000000 {
+        compatible = "socionext,synquacer-pcie-ecam", "snps,dw-pcie-ecam";
+        device_type = "pci";
+        reg = <0x0 0x7f000000 0x0 0xf00000>;
+        bus-range = <0x0 0xe>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x1000000 0x00 0x00010000 0x00 0x7ff00000 0x0 0x00010000>,
+                 <0x2000000 0x00 0x70000000 0x00 0x70000000 0x0 0x0f000000>,
+                 <0x3000000 0x3f 0x00000000 0x3f 0x00000000 0x1 0x00000000>;
+
+        #interrupt-cells = <0x1>;
+        interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+        interrupt-map = <0x0 0x0 0x0 0x0 &gic 0x0 0x0 0x0 182 0x4>;
+        msi-map = <0x0 &its 0x0 0x10000>;
+        dma-coherent;
+    };
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
