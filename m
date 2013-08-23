Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:56668 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753359Ab3HWC7R (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 22:59:17 -0400
MIME-Version: 1.0
Date: Fri, 23 Aug 2013 10:59:15 +0800
Message-ID: <CAPgLHd_uc8t_Q7QAq+FzdMZjo0VRYfqXMfk=zy5O+LwWhhGsTQ@mail.gmail.com>
Subject: [PATCH -next] dma: cppi41: fix error return code in cppi41_dma_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return -EINVAL in the irq parse and map error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/dma/cppi41.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/cppi41.c b/drivers/dma/cppi41.c
index 5dcebca..49ea05a 100644
--- a/drivers/dma/cppi41.c
+++ b/drivers/dma/cppi41.c
@@ -973,8 +973,10 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 		goto err_chans;
 
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq)
+	if (!irq) {
+		ret = -EINVAL;
 		goto err_irq;
+	}
 
 	cppi_writel(USBSS_IRQ_PD_COMP, cdd->usbss_mem + USBSS_IRQ_ENABLER);
 

