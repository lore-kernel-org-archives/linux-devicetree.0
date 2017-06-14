From: Alan Tull <atull@kernel.org>
Subject: [PATCH v2 01/11] dt-bindings: fpga: Add bindings document for Xilinx LogiCore PR Decoupler
Date: Wed, 14 Jun 2017 10:36:25 -0500
Message-ID: <20170614153635.2763-2-atull@kernel.org>
References: <20170614153635.2763-1-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170614153635.2763-1-atull@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Alan Tull <atull@kernel.org>, linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org, Moritz Fischer <mdf@kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>

This adds the binding documentation for the Xilinx LogiCORE PR
Decoupler soft core.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed off-by: Alan Tull <atull@kernel.org>
---
 .../bindings/fpga/xilinx-pr-decoupler.txt          | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt

diff --git a/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
new file mode 100644
index 0000000..8dcfba9
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/xilinx-pr-decoupler.txt
@@ -0,0 +1,36 @@
+Xilinx LogiCORE Partial Reconfig Decoupler Softcore
+
+The Xilinx LogiCORE Partial Reconfig Decoupler manages one or more
+decouplers / fpga bridges.
+The controller can decouple/disable the bridges which prevents signal
+changes from passing through the bridge.  The controller can also
+couple / enable the bridges which allows traffic to pass through the
+bridge normally.
+
+The Driver supports only MMIO handling. A PR region can have multiple
+PR Decouplers which can be handled independently or chained via decouple/
+decouple_status signals.
+
+Required properties:
+- compatible		: Should contain "xlnx,pr-decoupler-1.00" followed by
+                          "xlnx,pr-decoupler"
+- regs			: base address and size for decoupler module
+- clocks		: input clock to IP
+- clock-names		: should contain "aclk"
+
+Optional properties:
+- bridge-enable		: 0 if driver should disable bridge at startup
+			  1 if driver should enable bridge at startup
+			  Default is to leave bridge in current state.
+
+See Documentation/devicetree/bindings/fpga/fpga-region.txt for generic bindings.
+
+Example:
+	fpga-bridge@100000450 {
+		compatible = "xlnx,pr-decoupler-1.00",
+			     "xlnx-pr-decoupler";
+		regs = <0x10000045 0x10>;
+		clocks = <&clkc 15>;
+		clock-names = "aclk";
+		bridge-enable = <0>;
+	};
-- 
2.7.4
