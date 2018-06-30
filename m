Return-Path: <SRS0=Ekl+=JQ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 7/7] mmc: pxamci: let mmc core handle regulators
Date: Sat, 30 Jun 2018 20:14:05 +0200
Message-Id: <20180630181405.17630-8-daniel@zonque.org>
In-Reply-To: <20180630181405.17630-1-daniel@zonque.org>
References: <20180630181405.17630-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Strip some code by letting the mmc core handle the regulators. The old
.gpio_power pdata handling is kept around for now.

This also set the voltage on the regulator and handles -EPROBE_DEFER
correctly.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mmc/host/pxamci.c | 54 ++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 1e7703116763..ed576809fae8 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -73,58 +73,46 @@ struct pxamci_host {
 	dma_cookie_t		dma_cookie;
 	unsigned int		dma_len;
 	unsigned int		dma_dir;
-
-	struct regulator	*vcc;
 };
 
-static inline void pxamci_init_ocr(struct pxamci_host *host)
+static int pxamci_init_ocr(struct pxamci_host *host)
 {
-#ifdef CONFIG_REGULATOR
-	host->vcc = devm_regulator_get_optional(mmc_dev(host->mmc), "vmmc");
-
-	if (IS_ERR(host->vcc))
-		host->vcc = NULL;
-	else {
-		host->mmc->ocr_avail = mmc_regulator_get_ocrmask(host->vcc);
-		if (host->pdata && host->pdata->ocr_mask)
-			dev_warn(mmc_dev(host->mmc),
-				"ocr_mask/setpower will not be used\n");
-	}
-#endif
-	if (host->vcc == NULL) {
+	struct mmc_host *mmc = host->mmc;
+	int ret;
+
+	ret = mmc_regulator_get_supply(mmc);
+	if (ret < 0)
+		return ret;
+
+	if (IS_ERR(mmc->supply.vmmc)) {
 		/* fall-back to platform data */
-		host->mmc->ocr_avail = host->pdata ?
+		mmc->ocr_avail = host->pdata ?
 			host->pdata->ocr_mask :
 			MMC_VDD_32_33 | MMC_VDD_33_34;
 	}
+
+	return 0;
 }
 
 static inline int pxamci_set_power(struct pxamci_host *host,
 				    unsigned char power_mode,
 				    unsigned int vdd)
 {
+	struct mmc_host *mmc = host->mmc;
+	struct regulator *supply = mmc->supply.vmmc;
 	int on;
 
-	if (host->vcc) {
-		int ret;
+	if (!IS_ERR(supply))
+		return mmc_regulator_set_ocr(mmc, supply, vdd);
 
-		if (power_mode == MMC_POWER_UP) {
-			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
-			if (ret)
-				return ret;
-		} else if (power_mode == MMC_POWER_OFF) {
-			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
-			if (ret)
-				return ret;
-		}
-	}
-	if (!host->vcc && host->pdata &&
+	if (host->pdata &&
 	    gpio_is_valid(host->pdata->gpio_power)) {
 		on = ((1 << vdd) & host->pdata->ocr_mask);
 		gpio_set_value(host->pdata->gpio_power,
 			       !!on ^ host->pdata->gpio_power_invert);
 	}
-	if (!host->vcc && host->pdata && host->pdata->setpower)
+
+	if (host->pdata && host->pdata->setpower)
 		return host->pdata->setpower(mmc_dev(host->mmc), vdd);
 
 	return 0;
@@ -691,7 +679,9 @@ static int pxamci_probe(struct platform_device *pdev)
 	mmc->f_min = (host->clkrate + 63) / 64;
 	mmc->f_max = (mmc_has_26MHz()) ? 26000000 : host->clkrate;
 
-	pxamci_init_ocr(host);
+	ret = pxamci_init_ocr(host);
+	if (ret < 0)
+		return ret;
 
 	mmc->caps = 0;
 	host->cmdat = 0;
-- 
2.17.1
