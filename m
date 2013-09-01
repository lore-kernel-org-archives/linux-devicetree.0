Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f43.google.com ([209.85.214.43]:44157 "EHLO
	mail-bk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754146Ab3IABBD (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 31 Aug 2013 21:01:03 -0400
MIME-Version: 1.0
Date: Sun, 1 Sep 2013 09:01:00 +0800
Message-ID: <CAPgLHd90UyPGVLUdMV2domFKKDG5inKsXKxcOpvCDbVt-A_t-w@mail.gmail.com>
Subject: [PATCH -next] spi/qspi: fix missing unlock on error in ti_qspi_start_transfer_one()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add the missing unlock before return from function ti_qspi_start_transfer_one()
in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/spi/spi-ti-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 136d71e..e12d962 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -376,6 +376,7 @@ static int ti_qspi_start_transfer_one(struct spi_master *master,
 		ret = qspi_transfer_msg(qspi, t);
 		if (ret) {
 			dev_dbg(qspi->dev, "transfer message failed\n");
+			mutex_unlock(&qspi->list_lock);
 			return -EINVAL;
 		}
 

