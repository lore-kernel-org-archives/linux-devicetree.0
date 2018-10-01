Return-Path: <SRS0=0FWW=MN=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: spi: rspi: Add r8a7744 to the compatible list" to the spi tree
In-Reply-To: <1538139184-53756-1-git-send-email-biju.das@bp.renesas.com>
Message-Id: <20181001160628.477F91121CA5@debutante.sirena.org.uk>
Date: Mon,  1 Oct 2018 17:06:28 +0100 (BST)
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.orglinux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   dt-bindings: spi: rspi: Add r8a7744 to the compatible list

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

>From 6cee4afdec51b04b56e0942fd008006bf1b17497 Mon Sep 17 00:00:00 2001
From: Biju Das <biju.das@bp.renesas.com>
Date: Fri, 28 Sep 2018 13:53:04 +0100
Subject: [PATCH] dt-bindings: spi: rspi: Add r8a7744 to the compatible list

Document RZ/G1N (r8a7744) SoC specific bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/spi-rspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rspi.txt b/Documentation/devicetree/bindings/spi/spi-rspi.txt
index dd5c36a0b9ac..fc97ad64fbf2 100644
--- a/Documentation/devicetree/bindings/spi/spi-rspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-rspi.txt
@@ -13,6 +13,7 @@ Required properties:
 			- "renesas,rspi-r7s72100" (RZ/A1H)
 			- "renesas,rspi-r7s9210" (RZ/A2)
 			- "renesas,qspi-r8a7743" (RZ/G1M)
+			- "renesas,qspi-r8a7744" (RZ/G1N)
 			- "renesas,qspi-r8a7745" (RZ/G1E)
 			- "renesas,qspi-r8a7790" (R-Car H2)
 			- "renesas,qspi-r8a7791" (R-Car M2-W)
-- 
2.19.0.rc2
