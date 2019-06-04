Return-Path: <SRS0=CUwV=UD=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "MAINTAINERS: Add entry for Synquacer SPI driver" to the spi tree
In-Reply-To: <20190604051257.14264-2-masahisa.kojima@linaro.org>
Message-Id: <20190604145910.B119D440046@finisterre.sirena.org.uk>
Date: Tue,  4 Jun 2019 15:59:10 +0100 (BST)
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: andy.shevchenko@gmail.com, ard.biesheuvel@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, geert@linux-m68k.org, Jassi Brar <jaswinder.singh@linaro.org>jaswinder.singh@linaro.org, linux-spi@vger.kernel.orgMarkBrownbroonie@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, okamoto.satoru@socionext.com, osaki.yoshitoyo@socionext.com, robh+dt@kernel.org, tpiepho@impinj.com
List-ID: <devicetree@vger.kernel.org>

The patch

   MAINTAINERS: Add entry for Synquacer SPI driver

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

>From 6acf0ed57b8c30f57cba1e3d4fd56e37480affc3 Mon Sep 17 00:00:00 2001
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Tue, 4 Jun 2019 14:12:55 +0900
Subject: [PATCH] MAINTAINERS: Add entry for Synquacer SPI driver

Add entry for the Synquacer spi driver and DT bindings.

Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4ce575..66738ccc1257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14599,6 +14599,14 @@ S:	Maintained
 F:	drivers/net/ethernet/socionext/netsec.c
 F:	Documentation/devicetree/bindings/net/socionext-netsec.txt
 
+SOCIONEXT (SNI) Synquacer SPI DRIVER
+M:	Masahisa Kojima <masahisa.kojima@linaro.org>
+M:	Jassi Brar <jaswinder.singh@linaro.org>
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	drivers/spi/spi-synquacer.c
+F:	Documentation/devicetree/bindings/spi/spi-synquacer.txt
+
 SOLIDRUN CLEARFOG SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 S:	Maintained
-- 
2.20.1
