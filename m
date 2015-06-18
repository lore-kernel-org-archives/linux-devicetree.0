From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2 1/5] extcon: arizona: Update to use the new device properties API
Date: Thu, 18 Jun 2015 15:43:47 +0100
Message-ID: <1434638631-16451-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434638631-16451-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

The device properties API will load data from both device tree and ACPI,
update the binding to use this API instead of the OF API.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/extcon/extcon-arizona.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 9262b45..1153929 100644
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
@@ -1149,7 +1150,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 	if (IS_ENABLED(CONFIG_OF)) {
 		if (!dev_get_platdata(arizona->dev))
-			arizona_extcon_of_get_pdata(arizona);
+			arizona_extcon_device_get_pdata(arizona);
 	}
 
 	info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
