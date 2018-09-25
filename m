Return-Path: <SRS0=oCC0=MH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/3] spi: switch to SPDX license identifier
Date: Tue, 25 Sep 2018 11:42:28 +0200
Message-Id: <20180925094230.32679-2-m.felsch@pengutronix.de>
In-Reply-To: <20180925094230.32679-1-m.felsch@pengutronix.de>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Use the appropriate SPDX license identifier and drop the previous
license text.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/spi/spi.c       | 11 +----------
 include/linux/spi/spi.h | 13 ++-----------
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ec395a6baf9c..3a8f1224edfc 100644
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
index a64235e05321..95c0243dc74a 100644
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
