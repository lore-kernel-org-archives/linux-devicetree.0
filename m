From: "Hean-Loong, Ong" <hean.loong.ong@intel.com>
Subject: [PATCHv13 1/3] ARM:dt-bindings:display Intel FPGA Video and Image Processing Suite
Date: Tue, 12 Feb 2019 10:36:21 +0800
Message-ID: <20190212023623.2646-2-hean.loong.ong@intel.com>
References: <20190212023623.2646-1-hean.loong.ong@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212023623.2646-1-hean.loong.ong@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Rienk de Jong <rienk.dejong@quest-innovations.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, hean.loong.ong@intel.com, chin.liang.see@intel.com, Ong@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ong, Hean Loong <hean.loong.ong@intel.com>

Device tree binding for Intel FPGA Video and Image Processing Suite.
The bindings would set the max width, max height,
bits per pixel and memory port width.
The device tree binding only supports the Intel
Arria10 devkit and its variants. Vendor name retained as altr.

V12:
Wrap comments and fix commit message

V11:
No change

V10:
No change

V9:
Remove Display port node

V8:
*Add port to Display port decoder

V7:
*Fix OF graph for better description
*Add description for encoder

V6:
*Description have not describe DT device in general

V5:
*remove bindings for bits per symbol as it has only one value which is 8

V4:
*fix properties that does not describe the values

V3:
*OF graph not in accordance to graph.txt

V2:
*Remove Linux driver description

V1:
*Missing vendor prefix

Signed-off-by: Ong, Hean Loong <hean.loong.ong@intel.com>
---
 .../devicetree/bindings/display/altr,vip-fb2.txt   |   63 ++++++++++++++++++++
 1 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt

diff --git a/Documentation/devicetree/bindings/display/altr,vip-fb2.txt b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
new file mode 100644
index 0000000..89a3b9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
@@ -0,0 +1,63 @@
+Intel Video and Image Processing(VIP) Frame Buffer II bindings
+
+Supported hardware: Intel FPGA SoC Arria10 and above with display port IP
+
+The Video Frame Buffer II in Video Image Processing (VIP) suite is an IP core
+that interfaces between system memory and Avalon-ST video ports. The IP core
+can be configured to support the memory reader (from memory to Avalon-ST)
+and/or memory writer (from Avalon-ST to memory) interfaces.
+
+More information the FPGA video IP component can be acquired from
+https://www.altera.com/content/dam/altera-www/global/en_US/pdfs\
+/literature/ug/ug_vip.pdf
+
+DT-Bindings:
+=============
+Required properties:
+----------------------------
+- compatible: "altr,vip-frame-buffer-2.0"
+- reg: Physical base address and length of the framebuffer controller's
+	registers.
+- altr,max-width: The maximum width of the framebuffer in pixels.
+- altr,max-height: The maximum height of the framebuffer in pixels.
+- altr,mem-port-width = the bus width of the avalon master port
+	on the frame reader
+
+Optional sub-nodes:
+- ports: The connection to the encoder
+
+Connections between the Frame Buffer II and other video IP cores in the system
+are modelled using the OF graph DT bindings. The Frame Buffer II node has up
+to two OF graph ports. When the memory writer interface is enabled, port 0
+maps to the Avalon-ST Input (din) port. When the memory reader interface is
+enabled, port 1 maps to the Avalon-ST Output (dout) port.
+
+The encoder is built into the FPGA HW design and therefore would not
+be accessible from the DDR.
+
+		Port 0				Port1
+---------------------------------------------------------
+ARRIA10 AVALON_ST (DIN)		AVALON_ST (DOUT)
+
+Required Properties Example:
+----------------------------
+
+framebuffer@100000280 {
+		compatible = "altr,vip-frame-buffer-2.0";
+		reg = <0x00000001 0x00000280 0x00000040>;
+		altr,max-width = <1280>;
+		altr,max-height = <720>;
+		altr,mem-port-width = <128>;
+
+		ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+					fb_output: endpoint {
+						remote-endpoint = <&dp_encoder_input>;
+					};
+			};
+		};
+};
-- 
1.7.1
