Return-Path: <SRS0=4oRJ=LS=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: sh-msiof: Document R-Car E3 support" to the spi tree
In-Reply-To: <20180903172512.6242-3-geert+renesas@glider.be>
Message-Id: <20180904162253.4D07411227D8@debutante.sirena.org.uk>
Date: Tue,  4 Sep 2018 17:22:53 +0100 (BST)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli+renesas@fpond.eu>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.orglinux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: sh-msiof: Document R-Car E3 support

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

>From 3806112c9ecb4c958581808e0a4040d5de47216a Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 3 Sep 2018 19:25:12 +0200
Subject: [PATCH] spi: sh-msiof: Document R-Car E3 support

Document support for the MSIOF module in the Renesas R-Car E3 (r8a77990)
SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 8b53e986eef6..27b48f07ca97 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -12,6 +12,7 @@ Required properties:
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-r8a77965" (R-Car M3-N)
+			 "renesas,msiof-r8a77990" (R-Car E3)
 			 "renesas,msiof-r8a77995" (R-Car D3)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
-- 
2.19.0.rc1
