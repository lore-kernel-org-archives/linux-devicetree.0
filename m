Return-Path: <SRS0=1b4G=JP=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 5/7] mmc: pxamci: call mmc_of_parse()
Date: Fri, 29 Jun 2018 16:47:36 +0200
Message-Id: <20180629144738.446-6-daniel@zonque.org>
In-Reply-To: <20180629144738.446-1-daniel@zonque.org>
References: <20180629144738.446-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Call into mmc_of_parse() from pxamci_of_init(). As it needs a pointer to a
struct mmc_host, refactor the code a bit.

This allows all generic MMC properties to be set that are described in
Documentation/devicetree/bindings/mmc/mmc.txt.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mmc/host/pxamci.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 3df60c7babce..e15708aa77a2 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -591,11 +591,13 @@ static const struct of_device_id pxa_mmc_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, pxa_mmc_dt_ids);
 
-static int pxamci_of_init(struct platform_device *pdev)
+static int pxamci_of_init(struct platform_device *pdev,
+			  struct mmc_host *mmc)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct pxamci_platform_data *pdata;
 	u32 tmp;
+	int ret;
 
 	if (!np)
 		return 0;
@@ -616,12 +618,17 @@ static int pxamci_of_init(struct platform_device *pdev)
 	if (of_property_read_u32(np, "pxa-mmc,detect-delay-ms", &tmp) == 0)
 		pdata->detect_delay_ms = tmp;
 
+	ret = mmc_of_parse(mmc);
+	if (ret < 0)
+		return ret;
+
 	pdev->dev.platform_data = pdata;
 
 	return 0;
 }
 #else
-static int pxamci_of_init(struct platform_device *pdev)
+static int pxamci_of_init(struct platform_device *pdev,
+			  struct mmc_host *mmc)
 {
         return 0;
 }
@@ -634,10 +641,6 @@ static int pxamci_probe(struct platform_device *pdev)
 	struct resource *r;
 	int ret, irq, gpio_cd = -1, gpio_ro = -1, gpio_power = -1;
 
-	ret = pxamci_of_init(pdev);
-	if (ret)
-		return ret;
-
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -672,6 +675,10 @@ static int pxamci_probe(struct platform_device *pdev)
 	 */
 	mmc->max_blk_count = 65535;
 
+	ret = pxamci_of_init(pdev, mmc);
+	if (ret)
+		return ret;
+
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
 	host->pdata = pdev->dev.platform_data;
-- 
2.17.1
