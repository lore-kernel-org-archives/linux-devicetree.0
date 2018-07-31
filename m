From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [RFC PATCH 1/2] ARM: dt: fpga: Added binding docs for Xilinx zynqmp FPGA manager
Date: Tue, 31 Jul 2018 10:02:45 +0000 (UTC)
Message-ID: <20180801100457.25614-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 1 Aug 2018 15:34:56 +0530
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, atull@opensource.altera.com, moritz.fischer@ettus.com, nava.manne@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, appanad@xilinx.com, chinnikishore369@gmail.com
Cc: Nava kishore Manne <navam@xilinx.com>
List-Id: devicetree@vger.kernel.org

New bindings document for zynqmp fpga manager.

Signed-off-by: Nava kishore Manne <navam@xilinx.com>
---
 .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt

diff --git a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
new file mode 100644
index 000000000000..0eac747747f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
@@ -0,0 +1,9 @@
+Xilinx Zynqmp FPGA Manager
+
+Required properties:
+- compatible:		should contain "xlnx,zynqmp-pcap-fpga"
+
+Example:
+	pcap: pcap@00 {
+		compatible = "xlnx,zynqmp-pcap-fpga";
+	};
-- 
2.18.0
