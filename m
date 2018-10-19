Return-Path: <SRS0=sKk7=M7=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: sh-msiof: document R8A779{7|8}0 bindings" to the spi tree
In-Reply-To: <62919a6e-4206-0caa-deb0-6bf67b77eff1@cogentembedded.com>
Message-Id: <20181019123005.E655B1122548@debutante.sirena.org.uk>
Date: Fri, 19 Oct 2018 13:30:05 +0100 (BST)
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: sh-msiof: document R8A779{7|8}0 bindings

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

>From a27ee74d0d51697ce1664faefc5834fade4fef49 Mon Sep 17 00:00:00 2001
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 16 Oct 2018 22:22:05 +0300
Subject: [PATCH] spi: sh-msiof: document R8A779{7|8}0 bindings

Document the R-Car V3{M|H} (R8A779{7|8}0) SoCs in the Renesas MSIOF
bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 49fd806b3689..4b836ad17b19 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -13,6 +13,8 @@ Required properties:
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-r8a77965" (R-Car M3-N)
+			 "renesas,msiof-r8a77970" (R-Car V3M)
+			 "renesas,msiof-r8a77980" (R-Car V3H)
 			 "renesas,msiof-r8a77990" (R-Car E3)
 			 "renesas,msiof-r8a77995" (R-Car D3)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
-- 
2.19.0.rc2
