From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v5 2/7] extcon: arizona: Update to use the new device properties API
Date: Fri, 19 Jun 2015 17:23:29 +0100
Message-ID: <1434731014-19980-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

The device properties API will load data from both device tree and ACPI,
update the binding to use this API instead of the OF API.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 1fbe3b4..57755e8 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -24,6 +24,7 @@
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/extcon.h>
 
@@ -1110,12 +1111,12 @@ static void arizona_micd_set_level(struct arizona *arizona, int index,
 	regmap_update_bits(arizona->regmap, reg, mask, level);
 }
 
-static int arizona_extcon_of_get_pdata(struct arizona *arizona)
+static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
 
-	of_property_read_u32(arizona->dev->of_node, "wlf,hpdet-channel", &val);
+	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
 	switch (val) {
 	case ARIZONA_ACCDET_MODE_HPL:
 	case ARIZONA_ACCDET_MODE_HPR:
@@ -1147,10 +1148,8 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev))
-			arizona_extcon_of_get_pdata(arizona);
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_extcon_device_get_pdata(arizona);
 
 	info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
 	if (IS_ERR(info->micvdd)) {
-- 
1.7.2.5
