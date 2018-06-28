From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH 1/2] regulator: bd71837: Editorial cleanups.
Date: Thu, 28 Jun 2018 14:22:23 +0300
Message-ID: <3f1f74f57cbe2d4af395219da841df63daedc1f7.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.shevchenko@gmail.com, axel.lin@ingics.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Address issues spotted by Andy Shevchenko during review of original patch
No functional changes intended

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd71837-regulator.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/bd71837-regulator.c b/drivers/regulator/bd71837-regulator.c
index f57f42ed7160..3a487255482c 100644
--- a/drivers/regulator/bd71837-regulator.c
+++ b/drivers/regulator/bd71837-regulator.c
@@ -2,19 +2,18 @@
 // Copyright (C) 2018 ROHM Semiconductors
 // bd71837-regulator.c ROHM BD71837MWV regulator driver
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio.h>
 #include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/bd71837.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/mfd/bd71837.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/slab.h>
 
 struct bd71837_pmic {
 	struct regulator_desc descs[BD71837_REGULATOR_CNT];
@@ -39,7 +38,7 @@ static int bd71837_buck1234_set_ramp_delay(struct regulator_dev *rdev,
 	int id = rdev->desc->id;
 	unsigned int ramp_value = BUCK_RAMPRATE_10P00MV;
 
-	dev_dbg(&(pmic->pdev->dev), "Buck[%d] Set Ramp = %d\n", id + 1,
+	dev_dbg(&pmic->pdev->dev, "Buck[%d] Set Ramp = %d\n", id + 1,
 		ramp_delay);
 	switch (ramp_delay) {
 	case 1 ... 1250:
@@ -544,8 +543,7 @@ static int bd71837_probe(struct platform_device *pdev)
 
 	int i, err;
 
-	pmic = devm_kzalloc(&pdev->dev, sizeof(struct bd71837_pmic),
-			    GFP_KERNEL);
+	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
 	if (!pmic)
 		return -ENOMEM;
 
@@ -569,8 +567,8 @@ static int bd71837_probe(struct platform_device *pdev)
 		dev_err(&pmic->pdev->dev, "Failed to unlock PMIC (%d)\n", err);
 		goto err;
 	} else {
-		dev_dbg(&pmic->pdev->dev, "%s: Unlocked lock register 0x%x\n",
-			__func__, BD71837_REG_REGLOCK);
+		dev_dbg(&pmic->pdev->dev, "Unlocked lock register 0x%x\n",
+			BD71837_REG_REGLOCK);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(pmic_regulator_inits); i++) {
@@ -615,8 +613,6 @@ static int bd71837_probe(struct platform_device *pdev)
 		pmic->rdev[i] = rdev;
 	}
 
-	return 0;
-
 err:
 	return err;
 }
@@ -624,7 +620,6 @@ static int bd71837_probe(struct platform_device *pdev)
 static struct platform_driver bd71837_regulator = {
 	.driver = {
 		.name = "bd71837-pmic",
-		.owner = THIS_MODULE,
 	},
 	.probe = bd71837_probe,
 };
-- 
2.14.3
