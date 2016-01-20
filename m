From: <atull@opensource.altera.com>
Subject: [PATCH v15 1/6] fpga: add bindings document for fpga area and fpga bus
Date: Wed, 20 Jan 2016 13:24:22 -0600
Message-ID: <1453317867-10422-2-git-send-email-atull@opensource.altera.com>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

New bindings document for FPGA Area for reprogramming
FPGA's under Device Tree control

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
v14: Use firmware-name in bindings description
     Call it FPGA Area
     Remove bindings that specify FPGA Manager and FPGA Bridges
v15: Cleanup as per Rob's comments
     Combine usage doc with bindings document
     Document as being Altera specific
     Additions and changes to add FPGA Bus
---
 .../bindings/fpga/altera-fpga-bus-fpga-area.txt    |  452 ++++++++++++++++++++
 1 file changed, 452 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga-bus-fpga-area.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-fpga-bus-fpga-area.txt b/Documentation/devicetree/bindings/fpga/altera-fpga-bus-fpga-area.txt
new file mode 100644
index 0000000..8ea38ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-fpga-bus-fpga-area.txt
@@ -0,0 +1,452 @@
+Altera FPGA Area and FPGA Bus Device Tree Binding
+
+Alan Tull 2016
+
+ CONTENTS
+ - Introduction
+ - Terminology
+ - Overview
+ - Constraints
+ - FPGA Bus
+ - FPGA Area
+ - Supported Use Models
+ - Sequence
+ - Device Tree Examples
+
+
+Introduction
+============
+
+FPGA Buses and FPGA Areas are introduced as a way to solve the problem of how to
+reprogram an Altera FPGA under an operating system and have the new hardware
+show up in the device tree.  By adding these bindings to the Device Tree, a
+system can have the information needed to do the FPGA programming to add the
+desired hardware, and also the information about the devices to be added to the
+Device Tree once the programming has succeeded.
+
+
+Terminology
+===========
+
+Full Reconfiguration
+ * The entire FPGA is programmed.
+
+Partial Reconfiguration (PR)
+ * The FPGA is broken up into regions.  One of these regions is reprogrammed
+   while the rest of the FPGA is not affected.  Not all FPGA's support this.
+
+FPGA Manager & FPGA Manager Framework
+ * An FPGA Manager is a hardware block that programs an FPGA under the control
+   of a host processor.
+ * The FPGA Manager Framework provides drivers and functions to program an
+   FPGA.
+
+FPGA Bridge & FPGA Bridge Framework
+ * Provides drivers and functions to control bridges that enable/disable
+   data to the FPGA.
+ * FPGA Bridges should be disabled while the FPGA is being programmed to
+   prevent spurious data on the bus.
+ * FPGA Bridges may not be needed in implementations where the FPGA Manager
+   handles this.
+
+Freeze Blocks
+ * Freeze Blocks function as FPGA Bridges within the FPGA fabric.  In the case
+   of PR, the buses from the processor are split within the FPGA.  Each PR
+   region gets its own split of the buses, protected by an independently
+   controlled Freeze Block.  Several busses may be connected to a single
+   PR region; a Freeze Block controls the traffic of all these busses
+   together.
+
+Controlling Bridge
+ * The processor and FPGA may be connected by multiple FPGA Bridges.  In a text
+   based hierarchy, it is difficult to show this properly as a device would
+   have several parents.
+ * The bridge that handles register access to the FPGA is designated the
+   "controlling" bridge.
+ * The controlling bridge will be the target point under which the overlay is
+   inserted.
+
+
+Overview
+========
+
+This binding introduces the FPGA Bus and FPGA Area.
+
+An FPGA Bus is a virtualized bus that contains the devices needed to be able to
+program an FPGA device.  It contains a child FPGA Manager and may contain child
+FPGA Bridges, if needed.  The FPGA Manager is the hardware block that handles
+programming the FPGA.  FPGA Bridges function to prevent spurious data from the
+FPGA going on the processor busses during FPGA programming.  In the case of
+partial reconfiguration, additional bridges (Freeze Blocks) for each
+reconfiguration region are required.
+
+An FPGA Area contains information about a section of an FPGA (in the case of
+partial reconfiguration or the whole FPGA (for full reconfiguration).  The FPGA
+Area contains the name of the FPGA image file to be programmed and the child
+devices that will be contained in the FPGA after programming.
+
+The intended use is that device tree overlays can be used to add hardware to an
+FPGA while an operating system is running.  In that case, the FPGA Bus and its
+associated information will exist in the live device tree, while FPGA Areas are
+added to the device tree by applying device tree overlays while the operating
+system is running.  Loading such an overlay will cause the FPGA to be programmed
+and the child devices to be populated.  Removing an overlay will cause the
+devices to be removed from the device tree and free up those FPGA resources.
+
+
+Constraints
+===========
+
+It is beyond the scope of this document to fully describe all the FPGA design
+constraints required to make partial reconfiguration work[1] [2], but a few
+deserve quick mention.  A partial reconfiguration FPGA image must have
+boundary connections that line up with those the current programming of the
+FPGA.  Also, those during programming, those connections must be frozen.  This
+can be achieved by "Freeze Blocks" which are FPGA Bridges that exist on the FPGA
+fabric prior to the partial reconfiguration.
+
+
+FPGA Bus
+========
+
+An FPGA bus is a virtualized bus that specifies the devices needed to program an
+FPGA.
+
+Required properties:
+- compatible : should contain "altr,fpga-bus" and "simple-bus"
+	       "simple-bus" is required to allow populating the child nodes.
+
+A FPGA Bus should contain an FPGA Manager as a child node.
+
+A FPGA Bus may require FPGA Bridges as child nodes if the FPGA Manager does not
+control the hardware bridges.
+
+The FPGA Bridge that allows memory mapped register access is designated the
+"controlling" bridge.  This bridge serves as the insertion point of DT overlays.
+Both the FPGA Area and the controlling bridge require the "simple-bus"
+compatibility string to allow populating the child nodes contained in the
+overlay.
+
+In the example below, fpgamgr@ff706000 would be used to do any programming
+operations on the FPGA and the two bridges specified would be disabled
+during the programming and re-enabled afterwards if the programming
+succeeds.
+
+Example:
+	fpgabus@0 {
+		compatible = "altr,fpga-bus", "simple-bus";
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		ranges;
+
+		fpgamgr@ff706000 {
+			compatible = "altr,socfpga-fpga-mgr";
+			reg = <0xff706000 0x1000
+			       0xffb90000 0x1000>;
+			interrupts = <0 175 4>;
+		};
+
+		bridge@0 {
+			compatible = "altr,socfpga-lwhps2fpga-bridge",
+				     "simple-bus";
+			resets = <&rst LWHPS2FPGA_RESET>;
+			reset-names = "lwhps2fpga";
+			clocks = <&l4_main_clk>;
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+			ranges;
+		};
+
+		bridge@1 {
+			compatible = "altr,socfpga-hps2fpga-bridge";
+			resets = <&rst HPS2FPGA_RESET>;
+			reset-names = "hps2fpga";
+			clocks = <&l4_main_clk>;
+		};
+	};
+
+FPGA Area
+=========
+
+An FPGA Area details information about a section of an FPGA including the FPGA
+image needed to program it and the hardware contained once it is programmed.
+
+An FPGA Area corresponds to the whole FPGA in the case of full reconfiguration
+or a section of an FPGA in the case of partial reconfiguration.
+
+Required properties:
+- compatible : should contain "altr,fpga-area"
+- #address-cells, #size-cells, ranges: must be present to handle address space
+  mapping for children.
+
+Optional properties:
+- firmware-name : should contain the name of an FPGA image file located on the
+  firmware search path.
+- partial-reconfig : boolean property should be defined if partial
+  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
+  is done.
+
+In the example below, the target path is the controlling bridge of the FPGA Bus
+example.  The FPGA would be programmed with the image contained in the
+"soc_system.rbf" specified.  Assuming programming succeeds, the child devices
+would be populated afterwords.  In this particular example, ranges has two
+chip selects as one memory region is tied to the host processor and the
+other is a memory region on the FPGA.
+
+If there are no bridges in the FPGA Bus, the target path would point to
+the FPGA Manager.
+
+Example:
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path="/soc/fpgamgr@ff706000/bridge@0";
+		__overlay__ {
+			#address-cells = <1>;
+		        #size-cells = <1>;
+
+			bridge@ff200000 {
+				compatible = "fpga-area";
+
+				#address-cells = <2>;
+				#size-cells = <1>;
+
+				ranges = <0 0x00000000 0xc0000000 0x00010000>,
+					 <1 0x00020000 0xff220000 0x00000008>,
+					 <1 0x00010040 0xff210040 0x00000020>;
+
+				firmware-name = "soc_system.rbf";
+
+				onchip_memory2_0: memory@0 {
+					device_type = "memory";
+					compatible = "altr,onchipmem-15.1";
+					reg = <0 0x00000000 0x00010000>;
+				};
+
+				jtag_uart: serial@100020000 {
+					compatible = "altr,juart-1.0";
+					reg = <1 0x00020000 0x00000008>;
+					interrupt-parent = <&intc>;
+					interrupts = <0 42 4>;
+				};
+
+				led_pio: gpio@100010040 {
+					compatible = "altr,pio-1.0";
+					reg = <1 0x00010040 0x00000020>;
+					altr,gpio-bank-width = <4>;
+					#gpio-cells = <2>;
+					gpio-controller;
+				};
+			};
+		};
+	};
+};
+
+Supported Use Models
+====================
+
+Here's a list of supported use models.  We may need to add more.  Some uses are
+specific to one FPGA device or another.
+
+ * No FPGA Bridges
+   In this case, the FPGA Manager which programs the FPGA also handles the
+   bridges.  No FPGA Bridge devices are needed for full reconfiguration.
+
+   The DT overlay will specify the FPGA Manager as the overlay target.
+
+ * Full reconfiguration with bridges
+   In the case, there are several bridges between the processor and FPGA, that
+   need to be disabled during full reconfiguration.  The live DT before the
+   overlay is applied will have an FPGA Bus.
+
+   The DT overlay will specify the controlling bridge as the overlay target.
+
+ * Partial reconfiguration with bridges in the FPGA
+   In this case, the FPGA will have more than one section that will be
+   programmed separately.  Other sections may be active on the bus while FPGA
+   is being programmed.  To manage this, Freeze blocks need to exist on the FPGA
+   that can freeze all the buses going to one FPGA area while the buses are
+   enabled for other sections.
+
+Sequence
+========
+
+When a DT overlay is loaded, the FPGA Area will be probed and will do the
+following:
+ 1. Disable the FPGA Bridges.
+ 2. Use the the FPGA manager core to program the FPGA.
+ 3. Enable the FPGA Bridges.
+ 4. Call of_platform_populate resulting in device drivers getting probed.
+
+When the overlay is removed, the FPGA Area in it is removed.  This causes the
+child nodes to be removed and then the bridges are disabled.
+
+Device Tree Examples
+====================
+
+The intention of this section is to give some simple examples, focusing on
+the placement of the elements detailed above, especially:
+ * FPGA Bus and associated FPGA Manager and FPGA Bridges
+ * FPGA Area and associated properties
+ * simple-bus
+ * ranges
+ * target-path
+
+For the purposes of this section, I'm dividing the Device Tree into two parts,
+each with its own requirements.  The two parts are:
+ * The live DT prior to the overlay being added
+ * The DT overlay
+
+The live Device Tree must contain an FPGA Bus, which has a child FPGA Manager to
+handle programming the FPGA.  If FPGA Bridges need to be involved, they show up
+in the DT as direct children of the FPGA Bus.  During full reconfiguration, the
+FPGA Area will disable any bridges that are direct children of the FPGA Bus and
+will re-enable them after FPGA programming has succeeded.
+
+The Device Tree Overlay will contain:
+ * "target-path"
+   The insertion point where the the contents of the overlay will go into the
+   live tree.
+ * "ranges"
+ * "firmware-name"
+   Specifies the name of the FPGA image file on the firmware search
+   path.  The search path is described in the firmware class documentation.
+ * "partial-reconfig"
+   This binding is a boolean and should be present if partial reconfiguration
+   is to be done.
+ * child nodes corresponding to hardware that will be loaded in this region of
+   the FPGA.
+
+
+Device Tree Example: Partial Reconfiguration with no Bridges
+============================================================
+
+Live Device Tree contains:
+	fpgamgr@ffd03000 {
+		compatible = "altr,socfpga-a10-fpga-mgr", "simple-bus";
+		clocks = <&l4_mp_clk>;
+		resets = <&rst FPGAMGR_RESET>;
+		reset-names = "fpgamgr";
+		reg = <0xffd03000 0x1000
+		       0xffcfe400 0x1000>;
+
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		ranges;
+	};
+
+DT Overlay contains:
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path="/soc/fpgamgr@ffd03000";  /* targeted to the manager */
+		__overlay__ {
+			#address-cells = <1>;
+		        #size-cells = <1>;
+
+			area@0 {
+				compatible = "fpga-area";
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x10010 0xff210010 0x10>;
+
+				firmware-name = "fit_pr_v1.rbf";
+				partial-reconfig;
+
+				gpio@100010010 {
+					compatible = "altr,pio-1.0";
+					reg = <0x10010 0x10>;
+					altr,ngpio = <4>;
+					#gpio-cells = <0x2>;
+					gpio-controller;
+				};
+			};
+		};
+	};
+};
+
+
+Device Tree Example: Full Reconfiguration with Bridges
+======================================================
+
+Live Device Tree contains:
+	fpgamgr@ff706000 {
+		compatible = "altr,socfpga-fpga-mgr", "simple-bus";
+		reg = <0xff706000 0x1000
+		       0xffb90000 0x1000>;
+		interrupts = <0 175 4>;
+
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		ranges;
+
+		bridge@0 {
+			/* both the manager and the controlling bridge have
+			 * the added simple-bus compatible to allow child
+			 * devices to be populated. */
+			compatible = "altr,socfpga-lwhps2fpga-bridge",
+				     "simple-bus";
+			resets = <&rst LWHPS2FPGA_RESET>;
+			reset-names = "lwhps2fpga";
+			clocks = <&l4_main_clk>;
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+			ranges;
+		};
+
+		bridge@1 {
+			/* In the case of full reconfiguration, both bridge@0
+			 * and bridge@1 will be disabled during FPGA
+			 * programming and enabled afterwards. */
+			compatible = "altr,socfpga-hps2fpga-bridge";
+			resets = <&rst HPS2FPGA_RESET>;
+			reset-names = "hps2fpga";
+			clocks = <&l4_main_clk>;
+		};
+	};
+
+DT Overlay contains:
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path="/soc/fpgamgr@ff706000/bridge@0"; /* controlling bridge */
+		__overlay__ {
+			#address-cells = <1>;
+		        #size-cells = <1>;
+
+			area@0 {
+				compatible = "fpga-area";
+
+				#address-cells = <2>;
+				#size-cells = <1>;
+				ranges = <0 0x00000000 0xc0000000 0x00010000>,
+					 <1 0x00020000 0xff220000 0x00000008>;
+
+				firmware-name = "soc_system.rbf";
+
+				onchip_memory2_0: memory@0 {
+					device_type = "memory";
+					compatible = "altr,onchipmem-15.1";
+					reg = <0 0x00000000 0x00010000>;
+				};
+
+				jtag_uart: serial@100020000 {
+					compatible = "altr,juart-1.0";
+					reg = <1 0x00020000 0x00000008>;
+					interrupt-parent = <&intc>;
+					interrupts = <0 42 4>;
+					clocks = <&osc2>;
+				};
+			};
+		};
+	};
+};
+
+--
+[1] www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_partrecon.pdf
+[2] tspace.library.utoronto.ca/bitstream/1807/67932/1/Byma_Stuart_A_201411_MAS_thesis.pdf
-- 
1.7.9.5
