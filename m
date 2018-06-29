Return-Path: <SRS0=1b4G=JP=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 3/7] mmc: pxamci: remove dead code from pxamci_remove()
Date: Fri, 29 Jun 2018 16:47:34 +0200
Message-Id: <20180629144738.446-4-daniel@zonque.org>
In-Reply-To: <20180629144738.446-1-daniel@zonque.org>
References: <20180629144738.446-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

These gpio assignments don't make sense, as they are not used anywhere.
Remove the dead code.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mmc/host/pxamci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index a826c0e8a096..ee1c32862ef8 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -806,18 +806,12 @@ static int pxamci_probe(struct platform_device *pdev)
 static int pxamci_remove(struct platform_device *pdev)
 {
 	struct mmc_host *mmc = platform_get_drvdata(pdev);
-	int gpio_cd = -1, gpio_ro = -1, gpio_power = -1;
 
 	if (mmc) {
 		struct pxamci_host *host = mmc_priv(mmc);
 
 		mmc_remove_host(mmc);
 
-		if (host->pdata) {
-			gpio_cd = host->pdata->gpio_card_detect;
-			gpio_ro = host->pdata->gpio_card_ro;
-			gpio_power = host->pdata->gpio_power;
-		}
 		if (host->pdata && host->pdata->exit)
 			host->pdata->exit(&pdev->dev, mmc);
 
@@ -833,6 +827,7 @@ static int pxamci_remove(struct platform_device *pdev)
 
 		mmc_free_host(mmc);
 	}
+
 	return 0;
 }
 
-- 
2.17.1
