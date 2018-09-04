From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [RFC PATCH v2 2/3] dt-bindings: fpga: Add bindings for ZynqMP fpga driver
Date: Tue, 4 Sep 2018 07:23:32 +0000 (UTC)
Message-ID: <20180905072448.12488-3-nava.manne@xilinx.com>
References: <20180905072448.12488-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 5 Sep 2018 12:54:47 +0530
In-Reply-To: <20180905072448.12488-1-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, atull@kernel.org, mdf@kernel.org, jollys@xilinx.com, sboyd@kernel.org, rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org, chinnikishore369@gmail.com
Cc: Nava kishore Manne <nava.manne@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add documentation to describe Xilinx ZynqMP fpga driver
bindings.

Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
---
Changes for v2:
                -Moved pcap node as a child to firwmare
                 node as suggested by Rob.

 .../firmware/xilinx/xlnx,zynqmp-firmware.txt        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
index 1b431d9bbe44..ef0c3978e6e7 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
@@ -16,6 +16,16 @@ Required properties:
 		Permitted values are:
 		  - "smc" : SMC #0, following the SMCCC
 		  - "hvc" : HVC #0, following the SMCCC
+--------------------------------------------------------------------------
+Device Tree zynqmp-fpga bindings for the Zynq Ultrascale+ MPSoC controlled
+using ZynqMP SoC firmware interface
+--------------------------------------------------------------------------
+For Bitstream configuration on ZynqMp Soc uses processor configuration
+port(PCAP) to configure the programmable logic(PL) through PS by using
+FW interface.
+
+Required properties:
+- compatible: should contain "xlnx,zynqmp-pcap-fpga"
 
 -------
 Example
@@ -25,5 +35,8 @@ firmware {
 	zynqmp_firmware: zynqmp-firmware {
 		compatible = "xlnx,zynqmp-firmware";
 		method = "smc";
+		zynqmp_pcap: pcap {
+			compatible = "xlnx,zynqmp-pcap-fpga";
+		};
 	};
 };
-- 
2.18.0
