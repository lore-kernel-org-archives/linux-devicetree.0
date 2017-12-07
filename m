From: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH v2 2/2] uio: Introduce UIO driver dt-binding documentation
Date: Thu,  7 Dec 2017 15:46:59 +0100
Message-ID: <1512658019-30279-3-git-send-email-andrey.z@gmail.com>
References: <1512572140-48009-1-git-send-email-andrey.z@gmail.com>
 <1512658019-30279-1-git-send-email-andrey.z@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512658019-30279-1-git-send-email-andrey.z@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Zhizhikin <andrey.z@gmail.com>
List-Id: devicetree@vger.kernel.org

Create Documentation portion of UIO driver with Generic Interrupt Handler.

This patch creates a dt-binding documentation portion of the UIO Driver.

In addition to definition of standard required properties, new optional
property defined:
- no-threaded-irq: when present, request_irq() is called with
  IRQF_NO_THREAD flag set, effectively skipping threaded interrupt
  handler and taking bottom-half into irq_handler

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>

diff --git a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
new file mode 100644
index 0000000..dfcc362
--- /dev/null
+++ b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
@@ -0,0 +1,46 @@
+* Userspace I/O platform driver with generic IRQ handling code.
+
+Platform driver for User-space IO handling with generic IRQ code.
+This driver is very similar to the regular UIO platform driver, but is
+only suitable for devices that are connected to the interrupt
+controller using unique interrupt lines.
+
+Required properties:
+- compatible: Driver compatible string. For UIO device with generic IRQ
+  handling code this property is defined in device tree to any desired
+  name, and then set via module parameters passed to Kernel command line
+  in a form:
+  uio_pdrv_genirq.of_id=<your name>
+
+- reg: Physical base address and size for memory mapped region to be accessed
+  via UIO driver.
+
+- interrupts: Platform IRQ standard definition. For details on defining this
+  property, see interrupt-controller/interrupts.txt
+
+- interrupt-parent: Parent interrupt controller node.
+  For details, see interrupt-controller/interrupts.txt
+
+Optional properties:
+- no-threaded-irq: when present, request_irq() is called with IRQF_NO_THREAD
+  flag set, effectively skipping threaded interrupt handler and taking
+  bottom-half into irq_handler
+
+
+Examples:
+
+base-uio {
+	compatible = "platform-uio";
+	reg = < 0xC0000000 0x00020000 >;
+	interrupts = < 0 10 1 >;
+	interrupt-parent = <&intc>;
+};
+
+nothreaded-uio {
+	compatible = "platform-uio";
+	reg = < 0xC0040000 0x00020000 >;
+	interrupts = < 0 27 1 >;
+	interrupt-parent = <&intc>;
+	no-threaded-irq;
+};
+
-- 
2.7.4
