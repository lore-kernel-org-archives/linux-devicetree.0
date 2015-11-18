From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: [PATCH 1/2] usb: doc: dwc3-xilinx: Add devicetree bindings
Date: Wed, 18 Nov 2015 18:20:31 +0530
Message-ID: <1447851031-16241-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding doc for Xilinx DWC3 glue driver.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
---
 .../devicetree/bindings/usb/dwc3-xilinx.txt        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/dwc3-xilinx.txt

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt b/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
new file mode 100644
index 0000000..30361b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
@@ -0,0 +1,33 @@
+Xilinx SuperSpeed DWC3 USB SoC controller
+
+Required properties:
+- compatible:	Should contain "xlnx,zynqmp-dwc3"
+- clocks:	A list of phandles for the clocks listed in clock-names
+- clock-names:	Should contain the following:
+  "bus_clk"	 Master/Core clock, have to be >= 125 MHz for SS
+		 operation and >= 60MHz for HS operation
+
+  "ref_clk"	 Clock source to core during PHY power down
+
+Required child node:
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+Example device node:
+
+		usb@0 {
+			#address-cells = <0x2>;
+			#size-cells = <0x1>;
+			status = "okay";
+			compatible = "xlnx,zynqmp-dwc3";
+			clock-names = "bus_clk" "ref_clk";
+			clocks = <&clk125>, <&clk125>;
+			ranges;
+
+			dwc3@fe200000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xfe200000 0x40000>;
+				interrupts = <0x0 0x41 0x4>;
+				dr_mode = "host";
+			};
+		};
-- 
2.1.2
