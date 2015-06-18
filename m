From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/5] extcon: arizona: Update to use the new device properties API
Date: Thu, 18 Jun 2015 13:52:25 +0100
Message-ID: <1434631949-28594-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434631949-28594-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434631949-28594-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

The device properties API will load data from both device tree and ACPI,
update the binding to use this API instead of the OF API.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 9262b45..3b41905 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -23,6 +23,7 @@
 #include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pm_runtime.h>
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
@@ -1149,7 +1150,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 	if (IS_ENABLED(CONFIG_OF)) {
 		if (!dev_get_platdata(arizona->dev))
-			arizona_extcon_of_get_pdata(arizona);
+			arizona_extcon_device_get_pdata(arizona);
 	}
 
 	info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
-- 
1.7.2.5
