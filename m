Return-Path: <SRS0=1b4G=JP=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/7] mmc: pxamci: remove irq from private context
Date: Fri, 29 Jun 2018 16:47:32 +0200
Message-Id: <20180629144738.446-2-daniel@zonque.org>
In-Reply-To: <20180629144738.446-1-daniel@zonque.org>
References: <20180629144738.446-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This seems to be a left-over from times before the IRQ was handled by devm
functions. Remove it.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mmc/host/pxamci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 6c94474e36f4..f0968882dbd3 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -58,7 +58,6 @@ struct pxamci_host {
 	void __iomem		*base;
 	struct clk		*clk;
 	unsigned long		clkrate;
-	int			irq;
 	unsigned int		clkrt;
 	unsigned int		cmdat;
 	unsigned int		imask;
@@ -711,7 +710,6 @@ static int pxamci_probe(struct platform_device *pdev)
 
 	spin_lock_init(&host->lock);
 	host->res = r;
-	host->irq = irq;
 	host->imask = MMC_I_MASK_ALL;
 
 	host->base = devm_ioremap_resource(&pdev->dev, r);
@@ -729,7 +727,7 @@ static int pxamci_probe(struct platform_device *pdev)
 	writel(64, host->base + MMC_RESTO);
 	writel(host->imask, host->base + MMC_I_MASK);
 
-	ret = devm_request_irq(&pdev->dev, host->irq, pxamci_irq, 0,
+	ret = devm_request_irq(&pdev->dev, irq, pxamci_irq, 0,
 			       DRIVER_NAME, host);
 	if (ret)
 		goto out;
-- 
2.17.1
