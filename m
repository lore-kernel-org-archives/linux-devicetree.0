From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V5 01/11] dt-bindings: xilinx-sdfec: Add SDFEC binding
Date: Sun, 9 Jun 2019 01:04:06 +0100
Message-ID: <1560038656-380620-2-git-send-email-dragan.cvetic@xilinx.com>
References: <1560038656-380620-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560038656-380620-1-git-send-email-dragan.cvetic@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>, Derek Kiernan <derek.kiernan@xilinx.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the Soft Decision Forward Error Correction (SDFEC) Engine
bindings which is available for the Zynq UltraScale+ RFSoC
FPGA's.

Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
---
 .../devicetree/bindings/misc/xlnx,sd-fec.txt       | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
new file mode 100644
index 0000000..e328963
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
@@ -0,0 +1,58 @@
+* Xilinx SDFEC(16nm) IP *
+
+The Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP block
+which provides high-throughput LDPC and Turbo Code implementations.
+The LDPC decode & encode functionality is capable of covering a range of
+customer specified Quasi-cyclic (QC) codes. The Turbo decode functionality
+principally covers codes used by LTE. The FEC Engine offers significant
+power and area savings versus implementations done in the FPGA fabric.
+
+
+Required properties:
+- compatible: Must be "xlnx,sd-fec-1.1"
+- clock-names : List of input clock names from the following:
+    - "core_clk", Main processing clock for processing core (required)
+    - "s_axi_aclk", AXI4-Lite memory-mapped slave interface clock (required)
+    - "s_axis_din_aclk", DIN AXI4-Stream Slave interface clock (optional)
+    - "s_axis_din_words-aclk", DIN_WORDS AXI4-Stream Slave interface clock (optional)
+    - "s_axis_ctrl_aclk",  Control input AXI4-Stream Slave interface clock (optional)
+    - "m_axis_dout_aclk", DOUT AXI4-Stream Master interface clock (optional)
+    - "m_axis_dout_words_aclk", DOUT_WORDS AXI4-Stream Master interface clock (optional)
+    - "m_axis_status_aclk", Status output AXI4-Stream Master interface clock (optional)
+- clocks : Clock phandles (see clock_bindings.txt for details).
+- reg: Should contain Xilinx SDFEC 16nm Hardened IP block registers
+  location and length.
+- xlnx,sdfec-code : Should contain "ldpc" or "turbo" to describe the codes
+  being used.
+- xlnx,sdfec-din-words : A value 0 indicates that the DIN_WORDS interface is
+  driven with a fixed value and is not present on the device, a value of 1
+  configures the DIN_WORDS to be block based, while a value of 2 configures the
+  DIN_WORDS input to be supplied for each AXI transaction.
+- xlnx,sdfec-din-width : Configures the DIN AXI stream where a value of 1
+  configures a width of "1x128b", 2 a width of "2x128b" and 4 configures a width
+  of "4x128b".
+- xlnx,sdfec-dout-words : A value 0 indicates that the DOUT_WORDS interface is
+  driven with a fixed value and is not present on the device, a value of 1
+  configures the DOUT_WORDS to be block based, while a value of 2 configures the
+  DOUT_WORDS input to be supplied for each AXI transaction.
+- xlnx,sdfec-dout-width : Configures the DOUT AXI stream where a value of 1
+  configures a width of "1x128b", 2 a width of "2x128b" and 4 configures a width
+  of "4x128b".
+Optional properties:
+- interrupts: should contain SDFEC interrupt number
+
+Example
+---------------------------------------
+	sd_fec_0: sd-fec@a0040000 {
+		compatible = "xlnx,sd-fec-1.1";
+		clock-names = "core_clk","s_axi_aclk","s_axis_ctrl_aclk","s_axis_din_aclk","m_axis_status_aclk","m_axis_dout_aclk";
+		clocks = <&misc_clk_2>,<&misc_clk_0>,<&misc_clk_1>,<&misc_clk_1>,<&misc_clk_1>, <&misc_clk_1>;
+		reg = <0x0 0xa0040000 0x0 0x40000>;
+		interrupt-parent = <&axi_intc>;
+		interrupts = <1 0>;
+		xlnx,sdfec-code = "ldpc";
+		xlnx,sdfec-din-words = <0>;
+		xlnx,sdfec-din-width = <2>;
+		xlnx,sdfec-dout-words = <0>;
+		xlnx,sdfec-dout-width = <1>;
+	};
-- 
2.7.4
