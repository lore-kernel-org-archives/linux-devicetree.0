Return-Path: <SRS0=CUwV=UD=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: Add DT bindings for Synquacer" to the spi tree
In-Reply-To: <20190604051257.14264-3-masahisa.kojima@linaro.org>
Message-Id: <20190604145910.341D0440049@finisterre.sirena.org.uk>
Date: Tue,  4 Jun 2019 15:59:10 +0100 (BST)
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: andy.shevchenko@gmail.com, ard.biesheuvel@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, geert@linux-m68k.org, Jassi Brar <jaswinder.singh@linaro.org>jaswinder.singh@linaro.org, linux-spi@vger.kernel.orgMarkBrownbroonie@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, okamoto.satoru@socionext.com, osaki.yoshitoyo@socionext.com, robh+dt@kernel.org, tpiepho@impinj.com
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: Add DT bindings for Synquacer

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 6d72a49ff3f6bb0932718c132b75351aedc9458e Mon Sep 17 00:00:00 2001
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Tue, 4 Jun 2019 14:12:56 +0900
Subject: [PATCH] spi: Add DT bindings for Synquacer

This patch adds documentation for Device-Tree bindings for the
Socionext Synquacer spi driver.

Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/spi/spi-synquacer.txt | 27 +++++++++++++++++++
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
2.20.1
