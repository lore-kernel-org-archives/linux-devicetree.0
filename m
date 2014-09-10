From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: [PATCH v5 1/2] usb: doc: udc-xilinx: Add devicetree bindings
Date: Wed, 10 Sep 2014 19:24:03 +0530
Message-ID: <33b86c3c-4de1-47c9-9bd8-71d5a7325447@BY2FFO11FD055.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, michals@xilinx.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, svemula@xilinx.com, anirudh@xilinx.com, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for Xilinx udc driver.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
---
Changes for v5:
	- None
Changes for v4:
        - renamed xlnx,axi-usb2-device-4.00.a to xlnx,usb2-device-4.00.a
Changes for v3:
        - None
Changes for v2:
        - replaced xlnx,include-dma with xlnx,has-builtin-dma

 .../devicetree/bindings/usb/udc-xilinx.txt         |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/udc-xilinx.txt

diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
new file mode 100644
index 0000000..47b4e39
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
@@ -0,0 +1,18 @@
+Xilinx USB2 device controller
+
+Required properties:
+- compatible		: Should be "xlnx,usb2-device-4.00.a"
+- reg			: Physical base address and size of the USB2
+			  device registers map.
+- interrupts		: Should contain single irq line of USB2 device
+			  controller
+- xlnx,has-builtin-dma	: if DMA is included
+
+Example:
+ 		axi-usb2-device@42e00000 {
+                        compatible = "xlnx,usb2-device-4.00.a";
+                        interrupts = <0x0 0x39 0x1>;
+                        reg = <0x42e00000 0x10000>;
+                        xlnx,has-builtin-dma;
+                };
+
-- 
1.7.4
