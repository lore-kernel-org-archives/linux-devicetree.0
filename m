From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: bd71837: Editorial cleanups." to the regulator tree
Date: Thu, 28 Jun 2018 12:46:53 +0100
Message-ID: <E1fYVO1-0006fS-Im@debutante>
References: <3f1f74f57cbe2d4af395219da841df63daedc1f7.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3f1f74f57cbe2d4af395219da841df63daedc1f7.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.combroonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.shevchenko@gmail.com, axel.lin@ingics.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: bd71837: Editorial cleanups.

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From c9dc4cfa10a1266376dde151485f7b493447258b Mon Sep 17 00:00:00 2001
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Date: Thu, 28 Jun 2018 14:22:23 +0300
Subject: [PATCH] regulator: bd71837: Editorial cleanups.

Address issues spotted by Andy Shevchenko during review of original patch
No functional changes intended

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.18.0.rc2
