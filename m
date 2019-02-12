Return-Path: <SRS0=nY8h=QT=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: spi: imx: Add an entry for the i.MX8QM compatible" to the spi tree
In-Reply-To: <20190126213011.15738-1-festevam@gmail.com>
Message-Id: <20190212165905.96D781128113@debutante.sirena.org.uk>
Date: Tue, 12 Feb 2019 16:59:05 +0000 (GMT)
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.orglinux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   dt-bindings: spi: imx: Add an entry for the i.MX8QM compatible

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

>From 97a6a2ddc2ea684fadd1021dd350c27d03113397 Mon Sep 17 00:00:00 2001
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Jan 2019 19:30:11 -0200
Subject: [PATCH] dt-bindings: spi: imx: Add an entry for the i.MX8QM
 compatible

Add an entry for the "fsl,imx8mq-ecspi" compatible to describe
the ECSPI version present on i.MX8M.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
index e3c48b20b1a6..2d3264140cc5 100644
--- a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
+++ b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
@@ -10,6 +10,7 @@ Required properties:
   - "fsl,imx35-cspi" for SPI compatible with the one integrated on i.MX35
   - "fsl,imx51-ecspi" for SPI compatible with the one integrated on i.MX51
   - "fsl,imx53-ecspi" for SPI compatible with the one integrated on i.MX53 and later Soc
+  - "fsl,imx8mq-ecspi" for SPI compatible with the one integrated on i.MX8M
 - reg : Offset and length of the register set for the device
 - interrupts : Should contain CSPI/eCSPI interrupt
 - clocks : Clock specifiers for both ipg and per clocks.
-- 
2.20.1
