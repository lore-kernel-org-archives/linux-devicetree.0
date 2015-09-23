From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: [RFC PATCH 1/2] usb: doc: Add bindings for ULPI platform driver
Date: Wed, 23 Sep 2015 18:24:01 +0530
Message-ID: <1443012841-13673-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com, peter.chen@freescale.com, devicetree@vger.kernel.org, kishon@ti.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, punnaia@xilinx.com, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding doc info for generic ULPI PHYs
platform driver.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
---
 .../devicetree/bindings/usb/ulpi-platform-phy.txt  |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt

diff --git a/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
new file mode 100644
index 0000000..7b8cbb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
@@ -0,0 +1,34 @@
+Platform driver for generic ULPI PHYs
+
+Required properties:
+- compatible		: Should be "ulpi-phy"
+- reg			: Physical base address and size of the USB
+			  controller registers map to which this PHY
+			  is connected.
+- view-port		: Should contain viewport register offset of the
+			  USB controller to which this PHY is connected
+Optional properties:
+- drv-vbus		: required if turning VBUS on/off has to be driven
+			  by writing to PHY. This feature depends on board
+			  design.
+
+Example:
+Below example shows the PHY binding for Chipidea USB controller which has
+ulpi viewport register at 0x0170
+
+		usb_phy0: phy0 {
+                	compatible = "ulpi-phy";
+                	reg = <0xe0002000 0x1000>;
+                	view-port = <0x0170>;
+                	drv-vbus;
+        	};
+
+		usb0: usb@e0002000 {
+                        compatible = "chipidea,usb2";
+                        interrupt-parent = <&intc>;
+                        interrupts = <0 21 4>;
+                        reg = <0xe0002000 0x1000>;
+                        phy_type = "ulpi";
+			dr_mode = "host";
+			usb-phy = <&usb_phy0>;
+                };
-- 
1.7.1
