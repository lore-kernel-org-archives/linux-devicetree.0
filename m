From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH 1/2] uio: dt-bindings: document binding for uio-pdrv-genirq
Date: Thu, 21 Sep 2017 12:53:25 +1200
Message-ID: <20170921005326.30490-2-chris.packham@alliedtelesis.co.nz>
References: <20170921005326.30490-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921005326.30490-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
 .../bindings/uio/linux,uio-pdrv-genirq.txt         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt

diff --git a/Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt
new file mode 100644
index 000000000000..90447905e886
--- /dev/null
+++ b/Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt
@@ -0,0 +1,28 @@
+*Generic UIO platform driver with interrupts
+
+Required properties:
+- compatible: Should be "linux,uio-pdrv-genirq" or a value set with the of_id
+  module parameter.
+
+Optional properties:
+- interrupts: Should contain the interrupt to be associated with this device
+  (only a single interrupt is supported per device).
+- interrupt-parent: Specifies the phandle to the parent interrupt controller.
+- reg: Should specify the physical address spaces used by this device.
+
+Example:
+
+/* Device with MM IO and interrupt */
+my-device@10000 {
+	compatible = "linux,uio-pdrv-genirq";
+	reg = <0x10000 0x40>;
+	interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
+	interrupt-parent = <&gic>;
+};
+
+/* Device with interrupt only */
+my-int {
+	compatible = "linux,uio-pdrv-genirq";
+	interrupts = <6 IRQ_TYPE_EDGE_BOTH>;
+	interrupt-parent = <&gic>;
+};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
