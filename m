Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:55161 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192Ab3HRILN (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 18 Aug 2013 04:11:13 -0400
MIME-Version: 1.0
Date: Sun, 18 Aug 2013 16:11:12 +0800
Message-ID: <CAPgLHd_XJpihjFyozW0f01zj03mJQTzPN02=pdBuYfwckDWvGg@mail.gmail.com>
Subject: [PATCH -next] spi: spi-efm32: remove redundant dev_err call in efm32_spi_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/spi/spi-efm32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-efm32.c b/drivers/spi/spi-efm32.c
index ba38452..dbfef3d 100644
--- a/drivers/spi/spi-efm32.c
+++ b/drivers/spi/spi-efm32.c
@@ -396,7 +396,6 @@ static int efm32_spi_probe(struct platform_device *pdev)
 	ddata->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(ddata->base)) {
 		ret = PTR_ERR(ddata->base);
-		dev_err(&pdev->dev, "failed to remap memory\n");
 		goto err;
 	}
 

