From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: [PATCH v2 1/2] usb: doc: udc-xilinx: Add devicetree bindings
Date: Thu, 3 Apr 2014 13:05:18 +0530
Message-ID: <5a9b0116-246c-40a0-b894-3321c74648de@CH1EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, michals@xilinx.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for Xilinx axi udc driver.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
---
Changes for v2:
	- replaced xlnx,include-dma with xlnx,has-builtin-dma

 .../devicetree/bindings/usb/udc-xilinx.txt         |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/udc-xilinx.txt

diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
new file mode 100644
index 0000000..7c24fac
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
@@ -0,0 +1,20 @@
+Xilinx AXI USB2 device controller
+
+Required properties:
+- compatible		: Should be "xlnx,axi-usb2-device-4.00.a"
+- reg			: Physical base address and size of the Axi USB2
+			  device registers map.
+- interrupts		: Property with a value describing the interrupt
+			  number.
+- interrupt-parent	: Must be core interrupt controller
+- xlnx,has-builtin-dma	: if DMA is included
+
+Example:
+ 		axi-usb2-device@42e00000 {
+                        compatible = "xlnx,axi-usb2-device-4.00.a";
+                        interrupt-parent = <0x1>;
+                        interrupts = <0x0 0x39 0x1>;
+                        reg = <0x42e00000 0x10000>;
+                        xlnx,has-builtin-dma;
+                };
+
-- 
1.7.4
