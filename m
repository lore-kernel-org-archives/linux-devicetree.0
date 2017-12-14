From: Dhaval Shah <dhaval.shah@xilinx.com>
Subject: [PATCH v3 1/2] dt-bindings: misc: Add DT bindings to xlnx_vcu driver
Date: Wed, 13 Dec 2017 21:55:19 -0800
Message-ID: <1513230920-9005-2-git-send-email-dshah@xilinx.com>
References: <200703.nxabyfcjbswwbp4v@rob-hp-laptop>
 <1513230920-9005-1-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513230920-9005-1-git-send-email-dshah@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, pombredanne@nexb.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, hyunk@xilinx.com, Dhaval Shah <dshah@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add Device Tree binding document for logicoreIP. This logicoreIP
provides the isolation between the processing system and
programmable logic. Also provides the clock related information.

Signed-off-by: Dhaval Shah <dshah@xilinx.com>
---
Chnages since v3:
 * Use "dt-bindings: misc: ..." for the subject.
Changes since v2:
 * Describe the h/w
 * compatible string is updated to make it more specific
   based on the logicoreIP version.
 * Removed that encoder and decoder child nodes and relatd properties as that
   will be a separate driver and dts nodes. other team is working on that.
 * Updated to use as a single driver.

 .../devicetree/bindings/misc/xlnx,vcu.txt          | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,vcu.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,vcu.txt b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
new file mode 100644
index 0000000..6786d67
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
@@ -0,0 +1,31 @@
+LogicoreIP designed compatible with Xilinx ZYNQ family.
+-------------------------------------------------------
+
+General concept
+---------------
+
+LogicoreIP design to provide the isolation between processing system
+and programmable logic. Also provides the list of register set to configure
+the frequency.
+
+Required properties:
+- compatible: shall be one of:
+	"xlnx,vcu"
+	"xlnx,vcu-logicoreip-1.0"
+- reg, reg-names: There are two sets of registers need to provide.
+	1. vcu slcr
+	2. Logicore
+	reg-names should contain name for the each register sequence.
+- clocks: phandle for aclk and pll_ref clocksource
+- clock-names: The identification string, "aclk", is always required for
+   the axi clock. "pll_ref" is required for pll.
+Example:
+
+	xlnx_vcu: vcu@a0040000 {
+		compatible = "xlnx,vcu-logicoreip-1.0";
+		reg = <0x0 0xa0040000 0x0 0x1000>,
+			 <0x0 0xa0041000 0x0 0x1000>;
+		reg-names = "vcu_slcr", "logicore";
+		clocks = <&si570_1>, <&clkc 71>;
+		clock-names = "pll_ref", "aclk";
+	};
-- 
2.7.4
