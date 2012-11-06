From: Qing Xu <qingx@marvell.com>
Subject: [PATCH 2/7] mfd: max8925: fix mfd device register failure
Date: Tue,  6 Nov 2012 15:38:18 +0800
Message-ID: <1352187498-9754-1-git-send-email-qingx@marvell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: qingx@marvell.com, sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, haojian.zhuang@gmail.com, cxie4@marvell.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Qing Xu <qingx@marvell.com>

we encounter rtc/power/touch driver registry failure, root cause
it is resources confilict in insert_resouce, solved by changing
mfd_add_devices 5th parameter to NULL

Signed-off-by: Qing Xu <qingx@marvell.com>
---
 drivers/mfd/max8925-core.c |   22 ++++++++++------------
 1 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index dcc218a..b1eacae 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -873,7 +873,7 @@ int __devinit max8925_device_init(struct max8925_chip *chip,
 
 	ret = mfd_add_devices(chip->dev, 0, &rtc_devs[0],
 			      ARRAY_SIZE(rtc_devs),
-			      &rtc_resources[0], chip->irq_base, NULL);
+			      NULL, chip->irq_base, NULL);
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to add rtc subdev\n");
 		goto out;
@@ -881,7 +881,7 @@ int __devinit max8925_device_init(struct max8925_chip *chip,
 
 	ret = mfd_add_devices(chip->dev, 0, &onkey_devs[0],
 			      ARRAY_SIZE(onkey_devs),
-			      &onkey_resources[0], 0, NULL);
+			      NULL, 0, NULL);
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to add onkey subdev\n");
 		goto out_dev;
@@ -900,21 +900,19 @@ int __devinit max8925_device_init(struct max8925_chip *chip,
 		goto out_dev;
 	}
 
-	if (pdata && pdata->power) {
-		ret = mfd_add_devices(chip->dev, 0, &power_devs[0],
-					ARRAY_SIZE(power_devs),
-					&power_supply_resources[0], 0, NULL);
-		if (ret < 0) {
-			dev_err(chip->dev, "Failed to add power supply "
-				"subdev\n");
-			goto out_dev;
-		}
+	ret = mfd_add_devices(chip->dev, 0, &power_devs[0],
+				ARRAY_SIZE(power_devs),
+				NULL, 0, NULL);
+	if (ret < 0) {
+		dev_err(chip->dev, "Failed to add power supply "
+			"subdev, err = %d\n", ret);
+		goto out_dev;
 	}
 
 	if (pdata && pdata->touch) {
 		ret = mfd_add_devices(chip->dev, 0, &touch_devs[0],
 				      ARRAY_SIZE(touch_devs),
-				      &touch_resources[0], 0, NULL);
+				      NULL, chip->tsc_irq_base, NULL);
 		if (ret < 0) {
 			dev_err(chip->dev, "Failed to add touch subdev\n");
 			goto out_dev;
-- 
1.7.0.4
