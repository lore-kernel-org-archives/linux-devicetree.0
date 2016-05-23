From: Mark Brown <broonie@kernel.org>
Subject: Applied "regmap: Add file patterns for regmap device tree bindings" to the regmap tree
Date: Mon, 23 May 2016 18:50:39 +0100
Message-ID: <E1b4tzz-0006fK-IS@debutante>
References: <1463907991-7916-41-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-41-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.orgMark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   regmap: Add file patterns for regmap device tree bindings

has been applied to the regmap tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git 

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

>From 9398a639c8b175460828ee7c45e6b7a4c3f586b9 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 22 May 2016 11:06:17 +0200
Subject: [PATCH] regmap: Add file patterns for regmap device tree bindings

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a727d9959ecd..94a9af5d7f7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9318,6 +9318,7 @@ M:	Mark Brown <broonie@kernel.org>
 L:	linux-kernel@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
 S:	Supported
+F:	Documentation/devicetree/bindings/regmap/
 F:	drivers/base/regmap/
 F:	include/linux/regmap.h
 
-- 
2.8.1
