Return-Path: <SRS0=rTDR=GS=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: sh-msiof: Document R-Car M3-N support" to the spi tree
In-Reply-To: <1521795785-23825-1-git-send-email-geert+renesas@glider.be>
Message-Id: <20180328022222.120ED44007A@finisterre.ee.mobilebroadband>
Date: Wed, 28 Mar 2018 03:22:22 +0100 (BST)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.orglinux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: sh-msiof: Document R-Car M3-N support

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

>From 7bb5e54515dbcef7c390506c1339bff6bf220b1c Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 27 Mar 2018 15:04:25 +0200
Subject: [PATCH] spi: sh-msiof: Document R-Car M3-N support

Document support for the MSIOF module in the Renesas M3-N (r8a77965) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 80710f0f0448..39806329c193 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -10,6 +10,7 @@ Required properties:
 			 "renesas,msiof-r8a7794" (R-Car E2)
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
+			 "renesas,msiof-r8a77965" (R-Car M3-N)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
 			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
-- 
2.16.2
