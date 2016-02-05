From: <atull@opensource.altera.com>
Subject: [PATCH v16 1/6] fpga: add bindings document for fpga region
Date: Fri, 5 Feb 2016 15:29:58 -0600
Message-ID: <1454707803-27947-2-git-send-email-atull@opensource.altera.com>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

New bindings document for FPGA Region to support programming
FPGA's under Device Tree control

Signed-off-by: Alan Tull <atull@opensource.altera.com>
Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
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
v16: Reworked to document FPGA Regions
     rename altera-fpga-bus-fpga-area.txt -> fpga-region.txt
     Remove references that made it sound exclusive to Altera
     Remove altr, prefix from fpga-bus and fpga-area compatible strings
     Added Moritz' usage example with Xilinx
     Cleaned up unit addresses
---
 .../devicetree/bindings/fpga/fpga-region.txt       |  348 ++++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt

diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
new file mode 100644
index 0000000..ccd7127
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
@@ -0,0 +1,348 @@
+FPGA Region Device Tree Binding
+
+Alan Tull 2016
+
+ CONTENTS
+ - Introduction
+ - Terminology
+ - Overview
+ - Constraints
+ - FPGA Region
+ - Supported Use Models
+ - Sequence
+ - Device Tree Examples
+
+
+Introduction
+============
+
+FPGA Regions are introduced as a way to solve the problem of how to program an
+FPGA under an operating system and have the new hardware show up in the device
+tree.  By adding these bindings to the Device Tree, a system can have the
+information needed to program the FPGA and add the desired hardware, and also
+the information about the devices to be added to the Device Tree once the
+programming has succeeded.
+
+
+Terminology
+===========
+
+Full Reconfiguration
+ * The entire FPGA is programmed.
+
+Partial Reconfiguration (PR)
+Partial Reconfiguration Region (PRR)
+ * The FPGA is divided into regions.  Each of these regions can be programmed
+   while the rest of the FPGA is not affected.  Not all FPGA's support this.
+ * PRR's may vary in size and in the connections at their edge.  The image
+   that is loaded into a PRR must fit and must use a subset of the region's
+   connections.
+
+Base image
+ * An FPGA image that is designed to do full reconfiguration of the FPGA.
+ * A base image may set up a set of regions to allow for partial
+   reconfiguration.
+
+Persona
+ * An FPGA image that is designed to be loaded into a PRR.  There may be
+   any number of personas designed to fit into a PRR, but only one at at time
+   may be loaded.
+ * A persona may create more regions.
+
+FPGA Manager & FPGA Manager Framework
+ * An FPGA Manager is a hardware block that programs an FPGA under the control
+   of a host processor.
+ * The FPGA Manager Framework provides drivers and functions to program an
+   FPGA.
+
+FPGA Bridge Framework
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
+
+Overview
+========
+
+This binding introduces the FPGA Region.
+
+An FPGA Region references the devices needed to be able to program an FPGA
+device.  The base FPGA Region in the device tree is required to include a
+property with a phandle to an FPGA Manager.  This region may also contain a
+property that has a list of FPGA Bridge phandles, if needed.  Child FPGA Regions
+inherit the parent's FPGA Manager but specify their own bridges.
+
+The base FPGA Region supports full reconfiguration of the FPGA device.  If the
+FPGA image loaded contains the logic that creates a set of Partial
+Reconfiguration Regions, then the DT that programs the FPGA should also add a
+set of FPGA Regions as children of the original FPGA Region.
+The child FPGA Regions do not require specifying an FPGA Manager as they will
+use the ancestor region's FPGA Manager.
+
+The FPGA Manager is the hardware block that handles programming the FPGA.  FPGA
+Bridges function to prevent spurious data from the FPGA going on the processor
+busses during FPGA programming.  In the case of partial reconfiguration,
+additional bridges (Freeze Blocks) for each reconfiguration region are required.
+
+The intended use is that device tree overlays can be used to add hardware to an
+FPGA while an operating system is running.  In that case, the live device tree
+will contain an FPGA Manager, (possibly) FPGA Bridges, and the base FPGA Region.
+The device tree overlays contain the name of the FPGA image file to be
+programmed and the child devices that will be contained in the FPGA after
+programming.  Applying such an overlay will cause the FPGA to be programmed and
+the child devices to be populated.  Removing an overlay will cause the devices
+to be removed from the device tree and free up those FPGA resources.
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
+FPGA Region
+===========
+
+An FPGA Region specifies the devices needed to reconfigure a FPGA device.
+
+Required properties:
+- compatible   : should contain "fpga-region"
+- fpga-mgr     : should contain a phandle to an FPGA Manager.  Child FPGA
+		 Regions inherit this property from the parent, so it
+		 should be left out for any child FPGA Regions.
+- fpga-bridges : should contain a list of phandles to FPGA Bridges.  This
+		 property is optional if the FPGA Manager controls the
+		 bridges during reprogramming.
+- #address-cells, #size-cells, ranges: must be present to handle address space
+  mapping for children.
+
+Properties added in an overlay:
+- firmware-name : should contain the name of an FPGA image file located on the
+  firmware search path.
+- partial-reconfig : boolean property should be defined if partial
+  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
+  is done.
+- child nodes : devices in the FPGA after programming.
+
+In the example below, fpgamgr@ff706000 is used to program the FPGA.  The two
+bridges specified would be disabled during the programming and re-enabled
+afterwards if the programming succeeds.  The FPGA would be programmed with the
+image contained in the "soc_system.rbf" specified in the overlay.  Assuming
+programming succeeds, the child devices would be populated afterwords.
+
+Example:
+Base tree contains:
+
+	fpgamgr0: fpgamgr@ff706000 {
+		compatible = "altr,socfpga-fpga-mgr";
+		reg = <0xff706000 0x1000
+		       0xffb90000 0x1000>;
+		interrupts = <0 175 4>;
+	};
+
+	bridge0: bridge@ff400000 {
+		compatible = "altr,socfpga-lwhps2fpga-bridge";
+		reg = <0xff400000 0x100000>;
+		resets = <&rst LWHPS2FPGA_RESET>;
+		reset-names = "lwhps2fpga";
+		clocks = <&l4_main_clk>;
+	};
+
+	bridge1: bridge@ff500000 {
+		compatible = "altr,socfpga-hps2fpga-bridge";
+		reg = <0xff500000 0x10000>;
+		resets = <&rst HPS2FPGA_RESET>;
+		reset-names = "hps2fpga";
+		clocks = <&l4_main_clk>;
+	};
+
+	base_fpga_region {
+		compatible = "fpga-region";
+		fpga-mgr = <&fpgamgr0>;
+		fpga-bridges = <&bridge0>, <&bridge1>;
+
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		ranges;
+	};
+
+Overlay has:
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/soc/base_fpga_region";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x00020000 0xff220000 0x00000008>,
+				 <0x00010040 0xff210040 0x00000020>;
+
+			firmware-name = "soc_system.rbf";
+
+			jtag_uart: serial@20000 {
+				compatible = "altr,juart-1.0";
+				reg = <0x00020000 0x00000008>;
+				interrupt-parent = <&intc>;
+				interrupts = <0 42 4>;
+			};
+
+			led_pio: gpio@10040 {
+				compatible = "altr,pio-1.0";
+				reg = <0x00010040 0x00000020>;
+				altr,gpio-bank-width = <4>;
+				#gpio-cells = <2>;
+				gpio-controller;
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
+In all cases the live DT must specify the FPGA Manager, FPGA Bridges (if any),
+and a FPGA Region.  The target of the Device Tree Overlay is the FPGA Region.
+
+ * No FPGA Bridges
+   In this case, the FPGA Manager which programs the FPGA also handles the
+   bridges.  No FPGA Bridge devices are needed for full reconfiguration.
+
+ * Full reconfiguration with bridges
+   In this case, there are several bridges between the processor and FPGA that
+   need to be disabled during full reconfiguration.  The live DT before the
+   overlay is applied will include the FPGA Manager, Bridges, and Region.
+   The FPGA Region will include the phandles of the FPGA Manager and Bridges.
+
+ * Partial reconfiguration with bridges in the FPGA
+   In this case, the FPGA will have more than one PRR that will be programmed
+   separately.  While one PRR is being programmed, other PRR's may be active
+   on the bus.  To manage this, Freeze blocks need to exist on the FPGA
+   that can freeze all the buses going to one FPGA region while the buses are
+   enabled for other sections.
+
+Sequence
+========
+
+When a DT overlay is loaded, the FPGA Region will be notified and will do the
+following:
+ 1. Disable the FPGA Bridges.
+ 2. Use the the FPGA manager core to program the FPGA.
+ 3. Enable the FPGA Bridges.
+ 4. Call of_platform_populate resulting in device drivers getting probed.
+
+When the overlay is removed, the FPGA Region will be notified and will disable
+the bridges and the child nodes will be removed.
+
+Device Tree Examples
+====================
+
+The intention of this section is to give some simple examples, focusing on
+the placement of the elements detailed above, especially:
+ * FPGA Manager
+ * FPGA Bridges
+ * FPGA Region
+ * ranges
+ * target-path or target
+
+For the purposes of this section, I'm dividing the Device Tree into two parts,
+each with its own requirements.  The two parts are:
+ * The live DT prior to the overlay being added
+ * The DT overlay
+
+The live Device Tree must contain an FPGA Region, an FPGA Manager, and any FPGA
+Bridges.  The FPGA Region's "fpga-mgr" property specifies the manager by phandle
+to handle programming the FPGA.  If the FPGA Region is the child of another FPGA
+Region, the parent's FPGA Manager is used.  If FPGA Bridges need to be involved,
+they are specified in the FPGA Region by the "fpga-bridges" property.  During
+FPGA programming, the FPGA Region will disable the bridges that are in its
+"fpga-bridges" list and will re-enable them after FPGA programming has
+succeeded.
+
+The Device Tree Overlay will contain:
+ * "target-path" or "target"
+   The insertion point where the the contents of the overlay will go into the
+   live tree.  target-path is a full path, while target is a phandle.
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
+Device Tree Example: Full Reconfiguration without Bridges
+=========================================================
+
+Live Device Tree contains:
+	fpga_mgr0: fpgamgr@f8007000 {
+		compatible = "xlnx,zynq-devcfg-1.0";
+		reg = <0xf8007000 0x100>;
+		interrupt-parent = <&intc>;
+		interrupts = <0 8 4>;
+		clocks = <&clkc 12>;
+		clock-names = "ref_clk";
+		syscon = <&slcr>;
+	};
+
+	base_fpga_region {
+		compatible = "fpga-region";
+		fpga-mgr = <&fpga_mgr0>;
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		ranges;
+	};
+
+DT Overlay contains:
+/dts-v1/;
+/plugin/;
+/ {
+fragment@0 {
+	target = <&base_fpga_region>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	__overlay__ {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		firmware-name = "zynq-gpio.bin";
+
+		gpio1: gpio@40000000 {
+			compatible = "xlnx,xps-gpio-1.00.a";
+			reg = <0x40000000 0x10000>;
+			gpio-controller;
+			#gpio-cells = <0x2>;
+			xlnx,gpio-width= <0x6>;
+		};
+	};
+};
+
+--
+[1] www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_partrecon.pdf
+[2] tspace.library.utoronto.ca/bitstream/1807/67932/1/Byma_Stuart_A_201411_MAS_thesis.pdf
-- 
1.7.9.5

