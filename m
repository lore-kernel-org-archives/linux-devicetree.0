Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:39917 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754583Ab3HWCuh (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 22:50:37 -0400
Received: by mail-bk0-f49.google.com with SMTP id r7so30317bkg.8
        for <devicetree@vger.kernel.org>; Thu, 22 Aug 2013 19:50:36 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Aug 2013 10:50:36 +0800
Message-ID: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
Subject: [PATCH -next] mtd: atmel_nand: fix error return code in atmel_nand_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, artem.bityutskiy@linux.intel.com, josh.wu@atmel.com, plagnioj@jcrosoft.com, jg1.han@samsung.com
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/atmel_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 65b302c..093bcf8 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2047,6 +2047,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0) {
 			dev_err(host->dev, "Cannot get HSMC irq!\n");
+			res = irq;
 			goto err_nand_ioremap;
 		}
 

