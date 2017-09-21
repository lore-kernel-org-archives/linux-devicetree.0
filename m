From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] uio: dt-bindings: document binding for uio-pdrv-genirq
Date: Fri, 22 Sep 2017 03:48:13 +1200
Message-ID: <20170921154814.7510-2-chris.packham@alliedtelesis.co.nz>
References: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for the uio-prv-genirq driver. Provide
some examples on how it can be used.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
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
