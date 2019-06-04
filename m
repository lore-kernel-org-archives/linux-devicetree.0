From: Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH 1/2] media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver Subsystem
Date: Tue,  4 Jun 2019 19:25:55 +0530
Message-ID: <1559656556-79174-2-git-send-email-vishal.sagar@xilinx.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Vishal Sagar <vishal.sagar@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add bindings documentation for Xilinx UHD-SDI Receiver Subsystem.

The Xilinx UHD-SDI Receiver Subsystem consists of SMPTE UHD-SDI (RX) IP
core, an SDI RX to Video Bridge IP core to convert SDI video to native
video and a Video In to AXI4-Stream IP core to convert native video to
AXI4-Stream.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
---
 .../bindings/media/xilinx/xlnx,sdirxss.txt         | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
new file mode 100644
index 0000000..8445bee
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
@@ -0,0 +1,80 @@
+
+Xilinx SMPTE UHD-SDI Receiver Subsystem Device Tree Bindings
+------------------------------------------------------------
+
+The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create systems
+based on SMPTE SDI protocols. It receives unaligned native SDI streams from
+the SDI GT PHY and outputs an AXI4-Stream video stream, native video, or
+native SDI using Xilinx transceivers as the physical layer.
+
+The subsystem consists of
+1 - SMPTE UHD-SDI Rx
+2 - SDI Rx to Native Video Bridge
+3 - Video In to AXI4-Stream Bridge
+
+The subsystem can capture SDI streams in utpo 12G mode and output a dual pixel
+per clock YUV 422 or 420 10 bits per component AXI4-Stream.
+
+Required properties:
+--------------------
+- compatible: Must contain "xlnx,v-smpte-uhdsdi-rx-ss"
+- reg: Physical base address and length of the registers set for the device.
+- interrupts: Contains the interrupt line number.
+- clocks: List of phandles to AXI4-Lite clock, core clock to SMPTE UHD-SDI Rx
+  and Video clocks.
+- clock-names: Must contain "s_axi_aclk", "sdi_rx_clk" and "video_out_clk" in
+  the same order as clocks listed in clocks property.
+- xlnx,line-rate: The maximum mode supported by the design. Possible values are
+  are as below -
+  12G_SDI_8DS	- 12G mode
+  6G_SDI	-  6G mode
+  3G_SDI	-  3G mode
+
+Optional properties:
+--------------------
+- xlnx,include-edh: This is present when the Error Detection and Handling
+  processor is enabled in design.
+
+Ports
+-----
+The device node shall contain one 'port' child node as defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Generally the SDI port is connected to a device like SDI Broadcast camera which
+is independently controlled. Hence port@0 is a source port which can be
+connected to downstream IP which can work with AXI4 Stream data.
+
+Required port properties:
+-------------------------
+- reg: 0 - for source port.
+
+- xlnx,video-format: This can be XVIP_VF_YUV_422 or XVIP_VF_YUV_420.
+- xlnx,video-width: This is should be 10.
+
+Example:
+		v_smpte_uhdsdi_rx_ss: v_smpte_uhdsdi_rx_ss@80000000 {
+			compatible = "xlnx,v-smpte-uhdsdi-rx-ss";
+			interrupt-parent = <&gic>;
+			interrupts = <0 89 4>;
+			reg = <0x0 0x80000000 0x0 0x10000>;
+			xlnx,include-edh;
+			xlnx,line-rate = "12G_SDI_8DS";
+			clocks = <&clk_1>, <&si570_1>, <&clk_2>;
+			clock-names = "s_axi_aclk", "sdi_rx_clk", "video_out_clk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					xlnx,video-format = <XVIP_VF_YUV_422>;
+					xlnx,video-width = <10>;
+
+					sdirx_out: endpoint {
+						remote-endpoint = <&vcap_sdirx_in>;
+					};
+				};
+			};
+		};
-- 
1.8.3.1
