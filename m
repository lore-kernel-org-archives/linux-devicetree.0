From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 05/12] mtd: rawnand: ingenic: Use SPDX license notifiers
Date: Wed, 13 Mar 2019 23:22:52 +0100
Message-ID: <20190313222259.28704-5-paul@crapouillou.net>
References: <20190313222259.28704-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190313222259.28704-1-paul@crapouillou.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use SPDX license notifiers instead of GPLv2 license text in the headers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---

Notes:
    v2: No changes
    
    v3: No changes
    
    v4: No changes
    
    v5: No changes

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c  | 5 +----
 drivers/mtd/nand/raw/ingenic/jz4780_bch.h  | 5 +----
 drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index c5f74ed85862..fdf483a49f7b 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * JZ4780 BCH controller
  *
  * Copyright (c) 2015 Imagination Technologies
  * Author: Alex Smith <alex.smith@imgtec.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.h b/drivers/mtd/nand/raw/ingenic/jz4780_bch.h
index bf4718088a3a..451e0c770160 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.h
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * JZ4780 BCH controller
  *
  * Copyright (c) 2015 Imagination Technologies
  * Author: Alex Smith <alex.smith@imgtec.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #ifndef __DRIVERS_MTD_NAND_JZ4780_BCH_H__
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
index 22e58975f0d5..7f55358b860f 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * JZ4780 NAND driver
  *
  * Copyright (c) 2015 Imagination Technologies
  * Author: Alex Smith <alex.smith@imgtec.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #include <linux/delay.h>
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
