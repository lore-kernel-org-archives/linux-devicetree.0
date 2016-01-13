From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] phy: zynqmp: Add dt bindings for ZynqMP PHY.
Date: Wed, 13 Jan 2016 14:52:23 +0530
Message-ID: <1452676943-18931-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the document describing dt bindings for ZynqMP
PHY. ZynqMP SOC has a High Speed Processing System Gigabit
Transceiver which provides PHY capabilties to USB, SATA,
PCIE, Display Port and Ehernet SGMII controllers.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-zynqmp.txt         | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-zynqmp.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-zynqmp.txt b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
new file mode 100644
index 0000000..ec0d3de
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
@@ -0,0 +1,104 @@
+Xilinx ZynqMP PHY binding
+
+This binding describes a ZynqMP PHY device that is used to control ZynqMP
+High Speed Gigabit Transceiver(GT). ZynqMP PS GTR provides four lanes
+and are used by USB, SATA, PCIE, Display port and Ethernet SGMMI controllers.
+
+Required properties (controller (parent) node):
+- compatible    : Should be "xlnx,zynqmp-psgtr"
+
+- reg		: Address and length of register sets for each device in
+		  "reg-names"
+- reg-names     : The names of the register addresses corresponding to the
+		  registers filled in "reg":
+			- serdes: SERDES block register set
+			- siou: SIOU block register set
+			- lpd: Low power domain peripherals reset control
+			- fpd: Full power domain peripherals reset control
+
+-xlnx,tx_termination_fix: Include fix for a functional issue in the GT. The TX
+			  termination resistance can be out of spec due to a
+			  bug in the calibration logic. This issue will be fixed
+			  in silicon in future versions.
+
+Required nodes	:  A sub-node is required for each lane the controller
+		   provides. These nodes are translated by the driver's
+		   .xlate() function.
+
+Required properties (port (child) nodes):
+lane0:
+- #phy-cells	: Should be 1
+		  Cell after port phandle is device type from:
+			- XPSGTR_TYPE_PCIE_0
+			- XPSGTR_TYPE_SATA_0
+			- XPSGTR_TYPE_USB0
+			- XPSGTR_TYPE_DP_1
+			- XPSGTR_TYPE_SGMII0
+lane1:
+- #phy-cells	: Should be 1
+		  Cell after port phandle is device type from:
+			- XPSGTR_TYPE_PCIE_1
+			- XPSGTR_TYPE_SATA_1
+			- XPSGTR_TYPE_USB0
+			- XPSGTR_TYPE_DP_0
+			- XPSGTR_TYPE_SGMII1
+lane2:
+- #phy-cells	: Should be 1
+		  Cell after port phandle is device type from:
+			- XPSGTR_TYPE_PCIE_2
+			- XPSGTR_TYPE_SATA_0
+			- XPSGTR_TYPE_USB0
+			- XPSGTR_TYPE_DP_1
+			- XPSGTR_TYPE_SGMII2
+lane3:
+- #phy-cells	: Should be 1
+		  Cell after port phandle is device type from:
+			- XPSGTR_TYPE_PCIE_3
+			- XPSGTR_TYPE_SATA_1
+			- XPSGTR_TYPE_USB1
+			- XPSGTR_TYPE_DP_0
+			- XPSGTR_TYPE_SGMII3
+
+Example:
+	zynqmp_phy@fd400000 {
+		compatible = "xlnx,zynqmp-psgtr";
+		status = "okay";
+		reg = <0x0 0xfd400000 0x40000>, <0x0 0xfd3d0000 0x1000>,
+			<0x0 0xfd1a0000 0x1000>, <0x0 0xff5e0000 0x1000>;
+		reg-names = "serdes", "siou", "fpd", "lpd";
+
+		lane0: lane@0 {
+			#phy-cells = <1>;
+		};
+		lane1: lane@1 {
+			#phy-cells = <1>;
+		};
+		lane2: lane@2 {
+			#phy-cells = <1>;
+		};
+		lane3: lane@3 {
+			#phy-cells = <1>;
+		};
+	};
+
+Specifying phy control of devices
+=================================
+
+Device nodes should specify the configuration required in their "phys"
+property, containing a phandle to the phy port node and a device type.
+
+Example:
+
+#include <dt-bindings/phy/phy.h>
+
+	usb@fe200000 {
+		...
+		phys	  = <&lane2 XPSGTR_TYPE_USB0>;
+		...
+	};
+
+	ahci@fd0c0000 {
+		...
+		phys	  = <&lane3 XPSGTR_TYPE_SATA_0>;
+		...
+	};
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
