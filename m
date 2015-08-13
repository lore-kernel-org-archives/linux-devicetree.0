From: <atull@opensource.altera.com>
Subject: [PATCH v10 6/8] staging: add bindings document for simple fpga bus
Date: Thu, 13 Aug 2015 12:37:30 -0500
Message-ID: <1439487452-23977-8-git-send-email-atull@opensource.altera.com>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, Alan Tull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

New bindings document for simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v9:  initial version added to this patchset

v10: s/fpga/FPGA/g
     replace DT overlay example with slightly more complicated example
     move to staging/simple-fpga-bus
---
 .../Documentation/bindings/simple-fpga-bus.txt     |   83 ++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 drivers/staging/simple-fpga-bus/Documentation/bindings/simple-fpga-bus.txt

diff --git a/drivers/staging/simple-fpga-bus/Documentation/bindings/simple-fpga-bus.txt b/drivers/staging/simple-fpga-bus/Documentation/bindings/simple-fpga-bus.txt
new file mode 100644
index 0000000..5a55fb2
--- /dev/null
+++ b/drivers/staging/simple-fpga-bus/Documentation/bindings/simple-fpga-bus.txt
@@ -0,0 +1,83 @@
+Simple FPGA Bus
+===============
+
+A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
+before populating the devices below its node.  All this happens when a device
+tree overlay is added to the live tree.  This document describes that device
+tree overlay.
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
+  reconfiguration is to be done.
+- resets : should contain a list of resets that the bus will assert before
+  programming the FPGA and then deassert after the FPGA has been programmed
+  i.e. FPGA bridges.
+- reset-names : should contain a list of the names of the resets.
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
+			bridge@0xff200000 {
+				compatible = "simple-fpga-bus";
+				reg = <0xc0000000 0x20000000>,
+				      <0xff200000 0x00200000>;
+				reg-names = "axi_h2f", "axi_h2f_lw";
+
+				#address-cells = <0x2>;
+				#size-cells = <0x1>;
+
+				ranges = <0x00000000 0x00000000 0xc0000000 0x00010000>,
+					 <0x00000001 0x00020000 0xff220000 0x00000008>,
+					 <0x00000001 0x00010040 0xff210040 0x00000020>;
+
+				clocks = <0x2 0x2>;
+				clock-names = "h2f_lw_axi_clock", "f2h_sdram0_clock";
+
+				fpga-mgr = <&hps_0_fpgamgr>;
+				fpga-firmware = "soc_system.rbf";
+
+				resets = <&hps_fpgabridge0 0>, <&hps_fpgabridge1 0>, <&hps_fpgabridge2 0>;
+				reset-names = "hps2fpga", "lwhps2fpga", "fpga2hps";
+
+				onchip_memory2_0: memory@0x000000000 {
+					device_type = "memory";
+					compatible = "ALTR,onchipmem-15.1";
+					reg = <0x00000000 0x00000000 0x00010000>;
+				};
+
+				jtag_uart: serial@0x100020000 {
+					compatible = "altr,juart-15.1", "altr,juart-1.0";
+					reg = <0x00000001 0x00020000 0x00000008>;
+					interrupt-parent = <&intc>;
+					interrupts = <0 42 4>;
+				};
+
+				led_pio: gpio@0x100010040 {
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
1.7.9.5
