From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/9] dt/bindings: add versatile PCI binding
Date: Tue, 30 Dec 2014 13:28:30 -0600
Message-ID: <1419967718-26909-2-git-send-email-robherring2@gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419967718-26909-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Add binding documentation for the PCI controller found on Versatile PB
boards.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/pci/versatile.txt          | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/versatile.txt

diff --git a/Documentation/devicetree/bindings/pci/versatile.txt b/Documentation/devicetree/bindings/pci/versatile.txt
new file mode 100644
index 0000000..2cc6071
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/versatile.txt
@@ -0,0 +1,59 @@
+* ARM Versatile Platform Baseboard PCI interface
+
+PCI host controller found on the ARM Versatile PB board's FPGA.
+
+Required properties:
+- compatible: should contain "arm,versatile-pci" to identify the Versatile PCI
+  controller.
+- reg: base addresses and lengths of the pci controller. There must be 3
+  entries:
+	- Versatile specific registers
+	- Self Config space
+	- Config space
+- #address-cells: set to <3>
+- #size-cells: set to <2>
+- device_type: set to "pci"
+- bus-range: set to <0 0xff>
+- ranges: ranges for the PCI memory and I/O regions
+- #interrupt-cells: set to <1>
+- interrupt-map-mask and interrupt-map: standard PCI properties	to define
+	the mapping of the PCI interface to interrupt numbers.
+
+Example:
+
+pci-controller@10001000 {
+	compatible = "arm,versatile-pci";
+	device_type = "pci";
+	reg = <0x10001000 0x1000
+	       0x41000000 0x10000
+	       0x42000000 0x100000>;
+	bus-range = <0 0xff>;
+	#address-cells = <3>;
+	#size-cells = <2>;
+	#interrupt-cells = <1>;
+
+	ranges = <0x01000000 0 0x00000000 0x43000000 0 0x00010000   /* downstream I/O */
+		  0x02000000 0 0x50000000 0x50000000 0 0x10000000   /* non-prefetchable memory */
+		  0x42000000 0 0x60000000 0x60000000 0 0x10000000>; /* prefetchable memory */
+
+	interrupt-map-mask = <0x1800 0 0 7>;
+	interrupt-map = <0x1800 0 0 1 &sic 28
+			 0x1800 0 0 2 &sic 29
+			 0x1800 0 0 3 &sic 30
+			 0x1800 0 0 4 &sic 27
+
+			 0x1000 0 0 1 &sic 27
+			 0x1000 0 0 2 &sic 28
+			 0x1000 0 0 3 &sic 29
+			 0x1000 0 0 4 &sic 30
+
+			 0x0800 0 0 1 &sic 30
+			 0x0800 0 0 2 &sic 27
+			 0x0800 0 0 3 &sic 28
+			 0x0800 0 0 4 &sic 29
+
+			 0x0000 0 0 1 &sic 29
+			 0x0000 0 0 2 &sic 30
+			 0x0000 0 0 3 &sic 27
+			 0x0000 0 0 4 &sic 28>;
+};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
