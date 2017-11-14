From: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/8] dt-bindings: pci: Add DT docs for Brcmstb PCIe device
Date: Tue, 14 Nov 2017 17:12:06 -0500
Message-ID: <1510697532-32828-3-git-send-email-jim2101024@gmail.com>
References: <1510697532-32828-1-git-send-email-jim2101024@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510697532-32828-1-git-send-email-jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DT bindings description of the Brcmstb PCIe device is described.  This
node can be used by almost all Broadcom settop box chips, using
ARM, ARM64, or MIPS CPU architectures.

Signed-off-by: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/pci/brcmstb-pcie.txt       | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/brcmstb-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/brcmstb-pcie.txt b/Documentation/devicetree/bindings/pci/brcmstb-pcie.txt
new file mode 100644
index 0000000..a1a9ad5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/brcmstb-pcie.txt
@@ -0,0 +1,59 @@
+Brcmstb PCIe Host Controller Device Tree Bindings
+
+Required Properties:
+- compatible
+  "brcm,bcm7425-pcie" -- for 7425 family MIPS-based SOCs.
+  "brcm,bcm7435-pcie" -- for 7435 family MIPS-based SOCs.
+  "brcm,bcm7445-pcie" -- for 7445 and later ARM based SOCs (not including
+      the 7278).
+  "brcm,bcm7278-pcie"  -- for 7278 family ARM-based SOCs.
+
+- reg -- the register start address and length for the PCIe reg block.
+- interrupts -- two interrupts are specified; the first interrupt is for
+     the PCI host controller and the second is for MSI if the built-in
+     MSI controller is to be used.
+- interrupt-names -- names of the interrupts (above): "pcie" and "msi".
+- #address-cells -- set to <3>.
+- #size-cells -- set to <2>.
+- #interrupt-cells: set to <1>.
+- interrupt-map-mask and interrupt-map, standard PCI properties to define the
+     mapping of the PCIe interface to interrupt numbers.
+- ranges: ranges for the PCI memory and I/O regions.
+- linux,pci-domain -- should be unique per host controller.
+
+Optional Properties:
+- clocks -- phandle of pcie clock.
+- clock-names -- set to "sw_pcie" if clocks is used.
+- dma-ranges -- Specifies the inbound memory mapping regions when
+     an "identity map" is not possible.
+- msi-controller -- this property is typically specified to have the
+     PCIe controller use its internal MSI controller.
+- msi-parent -- set to use an external MSI interrupt controller.
+- brcm,enable-ssc -- (boolean) indicates usage of spread-spectrum clocking.
+- max-link-speed --  (integer) indicates desired generation of link:
+     1 => 2.5 Gbps (gen1), 2 => 5.0 Gbps (gen2), 3 => 8.0 Gbps (gen3).
+
+Example Node:
+
+pcie0: pcie@f0460000 {
+		reg = <0x0 0xf0460000 0x0 0x9310>;
+		interrupts = <0x0 0x0 0x4>;
+		compatible = "brcm,bcm7445-pcie";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges = <0x02000000 0x00000000 0x00000000 0x00000000 0xc0000000 0x00000000 0x08000000
+			  0x02000000 0x00000000 0x08000000 0x00000000 0xc8000000 0x00000000 0x08000000>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &intc 0 47 3
+				 0 0 0 2 &intc 0 48 3
+				 0 0 0 3 &intc 0 49 3
+				 0 0 0 4 &intc 0 50 3>;
+		clocks = <&sw_pcie0>;
+		clock-names = "sw_pcie";
+		msi-parent = <&pcie0>;  /* use PCIe's internal MSI controller */
+		msi-controller;         /* use PCIe's internal MSI controller */
+		brcm,ssc;
+		max-link-speed = <1>;
+		linux,pci-domain = <0>;
+	};
-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
