From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v4 1/2] dt: bindings: fpga: add xilinx slave-serial binding description
Date: Tue, 28 Feb 2017 17:40:21 +0100
Message-ID: <1488300022-30150-2-git-send-email-agust@denx.de>
References: <1488300022-30150-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488300022-30150-1-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add dt binding documentation details for Xilinx FPGA configuration
over slave serial interface.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
Acked-by: Moritz Fischer <mdf@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v4:

 - add Acked-by tags
 
Changes in v3:

 - extend example to show the usage in SPI master node, connected
   to the fpga-region node

Changes in v2:

 - correct gpios properties in example to match above description

 - use fpga-mgr@0 instead of fpga-spi@0 in example

 .../bindings/fpga/xilinx-slave-serial.txt          | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt

diff --git a/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
new file mode 100644
index 0000000..9766f74
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
@@ -0,0 +1,44 @@
+Xilinx Slave Serial SPI FPGA Manager
+
+Xilinx Spartan-6 FPGAs support a method of loading the bitstream over
+what is referred to as "slave serial" interface.
+The slave serial link is not technically SPI, and might require extra
+circuits in order to play nicely with other SPI slaves on the same bus.
+
+See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf
+
+Required properties:
+- compatible: should contain "xlnx,fpga-slave-serial"
+- reg: spi chip select of the FPGA
+- prog_b-gpios: config pin (referred to as PROGRAM_B in the manual)
+- done-gpios: config status pin (referred to as DONE in the manual)
+
+Example for full FPGA configuration:
+
+	fpga-region0 {
+		compatible = "fpga-region";
+		fpga-mgr = <&fpga_mgr_spi>;
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+	};
+
+	spi1: spi@10680 {
+		compatible = "marvell,armada-xp-spi", "marvell,orion-spi";
+		pinctrl-0 = <&spi0_pins>;
+		pinctrl-names = "default";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cell-index = <1>;
+		interrupts = <92>;
+		clocks = <&coreclk 0>;
+		status = "okay";
+
+		fpga_mgr_spi: fpga-mgr@0 {
+			compatible = "xlnx,fpga-slave-serial";
+			spi-max-frequency = <60000000>;
+			spi-cpha;
+			reg = <0>;
+			done-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+			prog_b-gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
+		};
+	};
-- 
2.7.4
