From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 1/3] dt: bindings: fpga: add lattice machxo2 slave spi binding description
Date: Mon, 16 Apr 2018 20:43:35 -0700
Message-ID: <20180417034337.8855-2-mdf@kernel.org>
References: <20180417034337.8855-1-mdf@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417034337.8855-1-mdf@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linux-foundation.org
Cc: linux-fpga.vger@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, atull@kernel.org, robh+dt@kernel.org, Paolo Pisati <p.pisati@gmail.com>, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Paolo Pisati <p.pisati@gmail.com>

Add dt binding documentation details for Lattice MachXO2 FPGA configuration
over Slave SPI interface.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 .../bindings/fpga/lattice-machxo2-spi.txt     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt

diff --git a/Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt b/Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt
new file mode 100644
index 000000000000..a8c362eb160c
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt
@@ -0,0 +1,29 @@
+Lattice MachXO2 Slave SPI FPGA Manager
+
+Lattice MachXO2 FPGAs support a method of loading the bitstream over
+'slave SPI' interface.
+
+See 'MachXO2ProgrammingandConfigurationUsageGuide.pdf' on www.latticesemi.com
+
+Required properties:
+- compatible: should contain "lattice,machxo2-slave-spi"
+- reg: spi chip select of the FPGA
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
+	spi1: spi@2000 {
+        ...
+
+		fpga_mgr_spi: fpga-mgr@0 {
+			compatible = "lattice,machxo2-slave-spi";
+			spi-max-frequency = <8000000>;
+			reg = <0>;
+		};
+	};
-- 
2.17.0
