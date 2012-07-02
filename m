From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] regulator: fixed: use devm_* for gpio request
Date: Mon, 2 Jul 2012 15:37:24 +0530
Message-ID: <1341223645-7817-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lrg@ti.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Use devm_* version of gpio APIs gpio_request_one() for
requesting gpios.
This avoid extra code for freeing gpios.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/regulator/fixed.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 8bda365..0a0baf3 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -235,7 +235,7 @@ static int __devinit reg_fixed_voltage_probe(struct platform_device *pdev)
 		if (config->gpio_is_open_drain)
 			gpio_flag |= GPIOF_OPEN_DRAIN;
 
-		ret = gpio_request_one(config->gpio, gpio_flag,
+		ret = devm_gpio_request_one(&pdev->dev, config->gpio, gpio_flag,
 						config->supply_name);
 		if (ret) {
 			dev_err(&pdev->dev,
@@ -259,7 +259,7 @@ static int __devinit reg_fixed_voltage_probe(struct platform_device *pdev)
 	if (IS_ERR(drvdata->dev)) {
 		ret = PTR_ERR(drvdata->dev);
 		dev_err(&pdev->dev, "Failed to register regulator: %d\n", ret);
-		goto err_gpio;
+		goto err_name;
 	}
 
 	platform_set_drvdata(pdev, drvdata);
@@ -269,9 +269,6 @@ static int __devinit reg_fixed_voltage_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_gpio:
-	if (gpio_is_valid(config->gpio))
-		gpio_free(config->gpio);
 err_name:
 	kfree(drvdata->desc.name);
 err:
@@ -283,8 +280,6 @@ static int __devexit reg_fixed_voltage_remove(struct platform_device *pdev)
 	struct fixed_voltage_data *drvdata = platform_get_drvdata(pdev);
 
 	regulator_unregister(drvdata->dev);
-	if (gpio_is_valid(drvdata->gpio))
-		gpio_free(drvdata->gpio);
 	kfree(drvdata->desc.name);
 
 	return 0;
-- 
1.7.1.1
