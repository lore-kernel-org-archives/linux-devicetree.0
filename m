From: <atull@opensource.altera.com>
Subject: [PATCH v13 5/6] ARM: socfpga: add bindings document for fpga bridge drivers
Date: Tue, 3 Nov 2015 11:11:03 -0600
Message-ID: <1446570664-10293-6-git-send-email-atull@opensource.altera.com>
References: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add bindings documentation for Altera SOCFPGA bridges:
 * fpga2sdram
 * fpga2hps
 * hps2fpga
 * lwhps2fpga

Signed-off-by: Alan Tull <atull@opensource.altera.com>
Signed-off-by: Matthew Gerlach <mgerlach@altera.com>
Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
v2:  separate into 2 documents for the 2 drivers
v12: bump version to line up with simple-fpga-bus version
     remove Linux specific notes such as references to sysfs
     move non-DT specific documentation elsewhere
     remove bindings that would have been used to pass configuration
     clean up formatting
v13: Remove 'label' property
     Change property from init-val to bridge-enable
     Fix email address
---
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     | 15 +++++++++++
 .../bindings/fpga/altera-hps2fpga-bridge.txt       | 31 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
new file mode 100644
index 0000000..81e2f06
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
@@ -0,0 +1,15 @@
+Altera FPGA To SDRAM Bridge Driver
+
+Required properties:
+- compatible		: Should contain "altr,socfpga-fpga2sdram-bridge"
+
+Optional properties:
+- bridge-enable		: 0 if driver should disable bridge at startup
+			  1 if driver should enable bridge at startup
+			  Default is to leave bridge in current state.
+
+Example:
+	fpga2sdram_br: fpgabridge@3 {
+		compatible = "altr,socfpga-fpga2sdram-bridge";
+		bridge-enable = <0>;
+	};
diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
new file mode 100644
index 0000000..67c28b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
@@ -0,0 +1,31 @@
+Altera FPGA/HPS Bridge Driver
+
+Required properties:
+- compatible	: Should contain one of:
+		  "altr,socfpga-hps2fpga-bridge",
+		  "altr,socfpga-lwhps2fpga-bridge", or
+		  "altr,socfpga-fpga2hps-bridge"
+- clocks	: Clocks used by this module.
+
+Optional properties:
+- bridge-enable	: 0 if driver should disable bridge at startup.
+		  1 if driver should enable bridge at startup.
+		  Default is to leave bridge in its current state.
+
+Example:
+	hps_fpgabridge0: fpgabridge@0 {
+		compatible = "altr,socfpga-hps2fpga-bridge";
+		clocks = <&l4_main_clk>;
+		bridge-enable = <1>;
+	};
+
+	hps_fpgabridge1: fpgabridge@1 {
+		compatible = "altr,socfpga-lwhps2fpga-bridge";
+		clocks = <&l4_main_clk>;
+		bridge-enable = <0>;
+	};
+
+	hps_fpgabridge2: fpgabridge@2 {
+		compatible = "altr,socfpga-fpga2hps-bridge";
+		clocks = <&l4_main_clk>;
+	};
-- 
1.9.1
