Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:45163 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182Ab3IKLPl (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 11 Sep 2013 07:15:41 -0400
MIME-Version: 1.0
Date: Wed, 11 Sep 2013 19:15:39 +0800
Message-ID: <CAPgLHd-RK8nDVDAps549BKB5A_yoPSA3JQB-oJFDB0itSC7sYg@mail.gmail.com>
Subject: [PATCH] spi: mpc512x: fix error return code in mpc512x_psc_spi_do_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/spi/spi-mpc512x-psc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index dbc5e99..6adf4e3 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -522,8 +522,10 @@ static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 	psc_num = master->bus_num;
 	snprintf(clk_name, sizeof(clk_name), "psc%d_mclk", psc_num);
 	clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto free_irq;
+	}
 	ret = clk_prepare_enable(clk);
 	if (ret)
 		goto free_irq;

