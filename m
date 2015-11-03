From: <atull@opensource.altera.com>
Subject: [PATCH v13 2/6] fpga: add bindings document for simple fpga bus
Date: Tue, 3 Nov 2015 11:11:00 -0600
Message-ID: <1446570664-10293-3-git-send-email-atull@opensource.altera.com>
References: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

New bindings document for simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v9:  initial version added to this patchset
v10: s/fpga/FPGA/g
     replace DT overlay example with slightly more complicated example
     move to staging/simple-fpga-bus
v11: No change in this patch for v11 of the patch set
v12: Moved out of staging.
     Changed to use FPGA bridges framework instead of resets
     for bridges.
v13: bridge@0xff20000 -> bridge@ff200000, etc
     Leave out directly talking about overlays
     Remove regs and clocks directly under simple-fpga-bus in example
     Use common "firmware-name" binding instead of "fpga-firmware"
---
 .../devicetree/bindings/fpga/simple-fpga-bus.txt   | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt

diff --git a/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
new file mode 100644
index 0000000..9646c09
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
@@ -0,0 +1,74 @@
+Simple FPGA Bus
+===============
+
+A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
+before populating the devices below its node.
+
+Required properties:
+- compatible : should contain "simple-fpga-bus"
+- #address-cells, #size-cells, ranges: must be present to handle address space
+  mapping for children.
+
+Optional properties:
+- fpga-mgr : should contain a phandle to a FPGA manager.
+- fpga-firmware : should contain the name of a FPGA image file located on the
+  firmware search path.
+- partial-reconfig : boolean property should be defined if partial
+  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
+  is done.
+- fpga-bridges : should contain a list of bridges that the bus will disable
+  before programming the FPGA and then enable after the FPGA has been
+  programmed.
+
+Example:
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path="/soc";
+		__overlay__ {
+			#address-cells = <1>;
+	                #size-cells = <1>;
+
+			bridge@ff200000 {
+				compatible = "simple-fpga-bus";
+
+				#address-cells = <0x2>;
+				#size-cells = <0x1>;
+
+				ranges = <0x00000000 0x00000000 0xc0000000 0x00010000>,
+					 <0x00000001 0x00020000 0xff220000 0x00000008>,
+					 <0x00000001 0x00010040 0xff210040 0x00000020>;
+
+				fpga-mgr = <&hps_0_fpgamgr>;
+				firmware-name = "soc_system.rbf";
+
+				fpga-bridges = <&hps_fpgabridge0>, <&hps_fpgabridge1>, <&hps_fpgabridge2>;
+
+				onchip_memory2_0: memory@000000000 {
+					device_type = "memory";
+					compatible = "ALTR,onchipmem-15.1";
+					reg = <0x00000000 0x00000000 0x00010000>;
+				};
+
+				jtag_uart: serial@100020000 {
+					compatible = "altr,juart-15.1", "altr,juart-1.0";
+					reg = <0x00000001 0x00020000 0x00000008>;
+					interrupt-parent = <&intc>;
+					interrupts = <0 42 4>;
+				};
+
+				led_pio: gpio@100010040 {
+					compatible = "altr,pio-15.1", "altr,pio-1.0";
+					reg = <0x00000001 0x00010040 0x00000020>;
+					altr,gpio-bank-width = <4>;
+					resetvalue = <0>;
+					#gpio-cells = <2>;
+					gpio-controller;
+				};
+			};
+		};
+	};
+};
+
-- 
1.9.1
