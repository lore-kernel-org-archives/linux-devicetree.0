Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:50923 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754604Ab3IKLPK (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 11 Sep 2013 07:15:10 -0400
MIME-Version: 1.0
Date: Wed, 11 Sep 2013 19:15:08 +0800
Message-ID: <CAPgLHd8gJpytHLNUyzKGmsOVe-1pnCORCvXMJY6q7ikMzQXmMw@mail.gmail.com>
Subject: [PATCH] spi: fix return value check in dspi_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function devm_ioremap_resource() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/spi/spi-fsl-dspi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 6cd07d1..4e44575 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -476,15 +476,9 @@ static int dspi_probe(struct platform_device *pdev)
 	master->bus_num = bus_num;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "can't get platform resource\n");
-		ret = -EINVAL;
-		goto out_master_put;
-	}
-
 	dspi->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!dspi->base) {
-		ret = -EINVAL;
+	if (IS_ERR(dspi->base)) {
+		ret = PTR_ERR(dspi->base);
 		goto out_master_put;
 	}
 

