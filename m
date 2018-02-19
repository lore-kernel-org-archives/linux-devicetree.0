Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49913 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932171AbeBSWgI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:36:08 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 6/6] MAINTAINERS: remove entry for deleted pxa3xx_nand driver
Date: Mon, 19 Feb 2018 23:35:57 +0100
Message-Id: <20180219223557.2458-7-miquel.raynal@bootlin.com>
In-Reply-To: <20180219223557.2458-1-miquel.raynal@bootlin.com>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The driver pxa3xx_nand.c has been replaced everywhere by its rework
called marvell_nand.c so this entry can now be removed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34b2e9ed6d3d..1efb94e6a8b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11327,12 +11327,6 @@ F:	include/sound/pxa2xx-lib.h
 F:	sound/arm/pxa*
 F:	sound/soc/pxa/
 
-PXA3xx NAND FLASH DRIVER
-M:	Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
-L:	linux-mtd@lists.infradead.org
-S:	Maintained
-F:	drivers/mtd/nand/raw/pxa3xx_nand.c
-
 QAT DRIVER
 M:	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
 L:	qat-linux@intel.com
-- 
2.14.1

