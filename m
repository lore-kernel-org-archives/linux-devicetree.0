Return-Path: <SRS0=x/N+=MJ=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: switch to SPDX license identifier" to the spi tree
In-Reply-To: <20180925094230.32679-2-m.felsch@pengutronix.de>
Message-Id: <20180927224018.67465440078@finisterre.ee.mobilebroadband>
Date: Thu, 27 Sep 2018 23:40:18 +0100 (BST)
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, dmitry.torokhov@gmail.combroonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.delinux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: switch to SPDX license identifier

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

>From b445bfcb9081ae90fec90b828f3aacc565776901 Mon Sep 17 00:00:00 2001
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 25 Sep 2018 11:42:28 +0200
Subject: [PATCH] spi: switch to SPDX license identifier

Use the appropriate SPDX license identifier and drop the previous
license text.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       | 11 +----------
 include/linux/spi/spi.h | 13 ++-----------
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a358acdd98d3..2cfc3df821f6 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1,18 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * SPI init/core code
  *
  * Copyright (C) 2005 David Brownell
  * Copyright (C) 2008 Secret Lab Technologies Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 7bb36145e2ba..f08824ea1968 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1,15 +1,6 @@
-/*
- * Copyright (C) 2005 David Brownell
+/* SPDX-License-Identifier: GPL-2.0-or-later
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * Copyright (C) 2005 David Brownell
  */
 
 #ifndef __LINUX_SPI_H
-- 
2.19.0
