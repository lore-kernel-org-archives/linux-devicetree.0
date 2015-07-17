From: <atull@opensource.altera.com>
Subject: [PATCH v9 3/7] staging: add bindings document for simple fpga bus
Date: Fri, 17 Jul 2015 10:51:13 -0500
Message-ID: <1437148277-5405-4-git-send-email-atull@opensource.altera.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.co>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

New bindings document for simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 .../Documentation/bindings/simple-fpga-bus.txt     |   61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt

diff --git a/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
new file mode 100644
index 0000000..221e781
--- /dev/null
+++ b/drivers/staging/fpga/Documentation/bindings/simple-fpga-bus.txt
@@ -0,0 +1,61 @@
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
+- fpga-mgr : should contain a phandle to a fpga manager.
+- fpga-firmware : should contain the name of a fpga image file located on the
+  firmware search path.
+- partial-reconfig : boolean property should be defined if partial
+  reconfiguration is to be done.
+- resets : should contain a list of resets that should be released after the
+  fpga has been programmed i.e. fpga bridges.
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
+				#address-cells = <0x2>;
+				#size-cells = <0x1>;
+				ranges = <0x1 0x10040 0xff210040 0x20>;
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
+				gpio@0x100010040 {
+					compatible = "altr,pio-14.0", "altr,pio-1.0";
+					reg = <0x1 0x10040 0x20>;
+					clocks = <0x2>;
+					altr,gpio-bank-width = <0x4>;
+					resetvalue = <0x0>;
+					#gpio-cells = <0x2>;
+					gpio-controller;
+				};
+			};
+		};
+	};
+};
+
-- 
1.7.9.5
