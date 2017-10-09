From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/5] uio: dt-bindings: document existing binding for uio-pdrv-genirq
Date: Tue, 10 Oct 2017 11:46:51 +1300
Message-ID: <20171009224655.6173-2-chris.packham@alliedtelesis.co.nz>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for the uio-prv-genirq driver. Provide
some examples on how it can be used.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- New. Document existing binding first.

 .../devicetree/bindings/uio/uio-pdrv-genirq.txt    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt

diff --git a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
new file mode 100644
index 000000000000..5a92b1f8825f
--- /dev/null
+++ b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
@@ -0,0 +1,27 @@
+*Generic UIO platform driver with interrupts
+
+Required properties:
+- compatible: Should be a value set with the of_id module parameter.
+
+Optional properties:
+- interrupts: Should contain the interrupt to be associated with this device
+  (only a single interrupt is supported per device).
+- interrupt-parent: Specifies the phandle to the parent interrupt controller.
+- reg: Should specify the physical address spaces used by this device.
+
+Example:
+
+/* Device with MM IO and interrupt assuming of_id="me,my-device" */
+my-device@10000 {
+	compatible = "me,my-device";
+	reg = <0x10000 0x40>;
+	interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
+	interrupt-parent = <&gic>;
+};
+
+/* Device with interrupt only assuming of_id="me,my-device" */
+my-int {
+	compatible = "me,my-device";
+	interrupts = <6 IRQ_TYPE_EDGE_BOTH>;
+	interrupt-parent = <&gic>;
+};
-- 
2.14.2
