Return-Path: <SRS0=Ekl+=JQ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 5/7] mmc: pxamci: call mmc_of_parse()
Date: Sat, 30 Jun 2018 20:14:03 +0200
Message-Id: <20180630181405.17630-6-daniel@zonque.org>
In-Reply-To: <20180630181405.17630-1-daniel@zonque.org>
References: <20180630181405.17630-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Call into mmc_of_parse() from pxamci_of_init(). As it needs a pointer to a
struct mmc_host, refactor the code a bit.

This allows all generic MMC properties to be set that are described in
Documentation/devicetree/bindings/mmc/mmc.txt. Reword the documentation
a bit to make that clear.

The "cd" and "wp" gpio lookups are removed as the lookup will now be
done by mmc_of_parse().

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 .../devicetree/bindings/mmc/pxa-mmc.txt       |  4 ++--
 drivers/mmc/host/pxamci.c                     | 24 ++++++++++---------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
index b7025de7dced..f2687752597e 100644
--- a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
@@ -10,8 +10,8 @@ Optional properties:
 - marvell,detect-delay-ms: sets the detection delay timeout in ms.
 - marvell,gpio-power: GPIO spec for the card power enable pin
 
-This file documents differences between the core properties in mmc.txt
-and the properties used by the pxa-mmc driver.
+In addition to the properties described in this docuent, the details
+described in mmc.txt are supported.
 
 Examples:
 
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 3df60c7babce..e046e684b3f9 100644
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
@@ -604,11 +606,6 @@ static int pxamci_of_init(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->gpio_card_detect =
-		of_get_named_gpio(np, "cd-gpios", 0);
-	pdata->gpio_card_ro =
-		of_get_named_gpio(np, "wp-gpios", 0);
-
 	/* pxa-mmc specific */
 	pdata->gpio_power =
 		of_get_named_gpio(np, "pxa-mmc,gpio-power", 0);
@@ -616,12 +613,17 @@ static int pxamci_of_init(struct platform_device *pdev)
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
@@ -634,10 +636,6 @@ static int pxamci_probe(struct platform_device *pdev)
 	struct resource *r;
 	int ret, irq, gpio_cd = -1, gpio_ro = -1, gpio_power = -1;
 
-	ret = pxamci_of_init(pdev);
-	if (ret)
-		return ret;
-
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -672,6 +670,10 @@ static int pxamci_probe(struct platform_device *pdev)
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
