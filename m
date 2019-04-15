Return-Path: <SRS0=T9D/=SR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35924 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfDOIxp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Apr 2019 04:53:45 -0400
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: sh-msiof: Document r8a77470 bindings" to the spi tree
In-Reply-To: <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
Message-Id: <20190415085333.91F9A1127B60@debutante.sirena.org.uk>
Date: Mon, 15 Apr 2019 09:53:33 +0100 (BST)
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: biju.das@bp.renesas.com, broonie@kernel.org, devicetree@vger.kernel.org, geert+renesas@glider.be, h-inayoshi@jinso.co.jp, horms+renesas@verge.net.au, kuninori.morimoto.gx@renesas.com, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.orgMarkBrownbroonie@kernel.org, na-hoan@jinso.co.jp, nv-dung@jinso.co.jp, yoshihiro.shimoda.uh@renesas.com
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: sh-msiof: Document r8a77470 bindings

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.2

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

>From efc3d5b2e79bd5470fa4a333933867d7b934a3e6 Mon Sep 17 00:00:00 2001
From: Cao Van Dong <cv-dong@jinso.co.jp>
Date: Thu, 11 Apr 2019 16:54:21 +0900
Subject: [PATCH] spi: sh-msiof: Document r8a77470 bindings

Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 37cf69586d10..18e14ee257b2 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
 			 "renesas,msiof-r8a7744" (RZ/G1N)
 			 "renesas,msiof-r8a7745" (RZ/G1E)
+			 "renesas,msiof-r8a77470" (RZ/G1C)
 			 "renesas,msiof-r8a774a1" (RZ/G2M)
 			 "renesas,msiof-r8a774c0" (RZ/G2E)
 			 "renesas,msiof-r8a7790" (R-Car H2)
-- 
2.20.1
