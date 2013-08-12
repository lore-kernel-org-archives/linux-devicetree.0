Return-Path: <devicetree-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:55288 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757243Ab3HLRPP (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 12 Aug 2013 13:15:15 -0400
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v4 01/14] mtd: nand: pxa3xx: Remove unneeded ifdef CONFIG_OF
Date: Mon, 12 Aug 2013 14:14:46 -0300
Message-Id: <1376327699-7973-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

There's no need to enclose this code within idef CONFIG_OF,
because the OF framework provides no-op stubs if CONFIG_OF=n.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 501e380..02f214d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1190,7 +1190,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static struct of_device_id pxa3xx_nand_dt_ids[] = {
 	{ .compatible = "marvell,pxa3xx-nand" },
 	{}
@@ -1221,12 +1220,6 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 
 	return 0;
 }
-#else
-static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
-{
-	return 0;
-}
-#endif
 
 static int pxa3xx_nand_probe(struct platform_device *pdev)
 {
-- 
1.8.1.5

