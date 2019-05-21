Return-Path: <SRS0=9+SW=TV=linaro.org=masahisa.kojima@kernel.org>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: spi: Add DT bindings for Synquacer
Date: Tue, 21 May 2019 20:59:57 +0900
Message-Id: <20190521115958.22504-3-masahisa.kojima@linaro.org>
In-Reply-To: <20190521115958.22504-1-masahisa.kojima@linaro.org>
References: <20190521115958.22504-1-masahisa.kojima@linaro.org>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: broonie@kernel.org, geert@linux-m68k.org, tpiepho@impinj.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, ard.biesheuvel@linaro.org, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, okamoto.satoru@socionext.com, osaki.yoshitoyo@socionext.com, Masahisa Kojima <masahisa.kojima@linaro.org>
List-ID: <devicetree@vger.kernel.org>

This patch adds documentation for Device-Tree bindings for the
Socionext Synquacer spi driver.

Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/spi-synquacer.txt      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-synquacer.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-synquacer.txt b/Documentation/devicetree/bindings/spi/spi-synquacer.txt
new file mode 100644
index 000000000000..291dfa692d0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-synquacer.txt
@@ -0,0 +1,27 @@
+* Socionext Synquacer HS-SPI bindings
+
+Required Properties:
+- compatible: should be "socionext,synquacer-spi"
+- reg: physical base address of the controller and length of memory mapped
+       region.
+- interrupts: should contain the "spi_rx", "spi_tx" and "spi_fault" interrupts.
+- clocks: core clock iHCLK. Optional rate clock iPCLK (default is iHCLK)
+- clock-names: Shall be "iHCLK" and "iPCLK" respectively
+
+Optional Properties:
+- socionext,use-rtm: boolean, if required to use "retimed clock" for RX
+- socionext,set-aces: boolean, if same active clock edges field to be set.
+
+Example:
+
+	spi0: spi@ff110000 {
+		compatible = "socionext,synquacer-spi";
+		reg = <0xff110000 0x1000>;
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_hsspi>;
+		clock-names = "iHCLK";
+		socionext,use-rtm;
+		socionext,set-aces;
+	};
-- 
2.14.2
