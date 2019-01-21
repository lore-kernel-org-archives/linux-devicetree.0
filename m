From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga driver
Date: Mon, 21 Jan 2019 22:54:27 +0530
Message-ID: <20190121172427.20446-7-nava.manne@xilinx.com>
References: <20190121172427.20446-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121172427.20446-1-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, michals@xilinx.com, RAJANV@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, JOLLYS@xilinx.com, chinnikishore369@gmail.com
Cc: Nava kishore Manne <nava.manne@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add documentation to describe Xilinx ZynqMP fpga driver
bindings.

Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
---
Changes for v3:
		-Removed PCAP as a child node to the FW and Created
		an independent node since PCAP driver is a consumer
		not a provider. 

 .../bindings/fpga/xlnx,zynqmp-pcap-fpga.txt         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt

diff --git a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
new file mode 100644
index 000000000000..1f6f58872311
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
@@ -0,0 +1,13 @@
+Device Tree zynqmp-fpga bindings for the Zynq Ultrascale+ MPSoC controlled
+using ZynqMP SoC firmware interface
+For Bitstream configuration on ZynqMp Soc uses processor configuration
+port(PCAP) to configure the programmable logic(PL) through PS by using
+FW interface.
+
+Required properties:
+- compatible: should contain "xlnx,zynqmp-pcap-fpga"
+
+Example:
+	zynqmp_pcap: pcap {
+		compatible = "xlnx,zynqmp-pcap-fpga";
+	};
-- 
2.18.0
