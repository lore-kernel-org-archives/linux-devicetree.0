From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v4 5/8] extcon: arizona: Convert to gpiod
Date: Fri, 19 Jun 2015 13:37:33 +0100
Message-ID: <1434717456-31995-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Convert to using the newer gpiod interface for the micd_pol_gpio.
Although we still carry support for the old gpio interface from pdata.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |   41 ++++++++++++++++++++++++++++++++++----
 1 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 0e1d9c6..f30ae57 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
@@ -95,6 +96,8 @@ struct arizona_extcon_info {
 	int hpdet_ip_version;
 
 	struct extcon_dev *edev;
+
+	struct gpio_desc *micd_pol_gpio;
 };
 
 static const struct arizona_micd_config micd_default_modes[] = {
@@ -205,6 +208,10 @@ static void arizona_extcon_set_mode(struct arizona_extcon_info *info, int mode)
 	if (arizona->pdata.micd_pol_gpio > 0)
 		gpio_set_value_cansleep(arizona->pdata.micd_pol_gpio,
 					info->micd_modes[mode].gpio);
+	else
+		gpiod_set_value_cansleep(info->micd_pol_gpio,
+					 info->micd_modes[mode].gpio);
+
 	regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 			   ARIZONA_MICD_BIAS_SRC_MASK,
 			   info->micd_modes[mode].bias <<
@@ -1260,6 +1267,27 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 				arizona->pdata.micd_pol_gpio, ret);
 			goto err_register;
 		}
+	} else {
+		if (gpio_initial_level)
+			mode = GPIOD_OUT_HIGH;
+		else
+			mode = GPIOD_OUT_LOW;
+
+		/* We can't use devm here because we need to do the get
+		 * against the MFD device, as that is where the of_node
+		 * will reside, but if we devm against that the GPIO
+		 * will not be freed if the extcon driver is unloaded.
+		 */
+		info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
+							 "wlf,micd-pol",
+							 GPIOD_OUT_LOW);
+		if (IS_ERR(info->micd_pol_gpio)) {
+			ret = PTR_ERR(info->micd_pol_gpio);
+			dev_err(arizona->dev,
+				"Failed to get microphone polarity GPIO: %d\n",
+				ret);
+			goto err_register;
+		}
 	}
 
 	if (arizona->pdata.hpdet_id_gpio > 0) {
@@ -1270,7 +1298,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		if (ret != 0) {
 			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
 				arizona->pdata.hpdet_id_gpio, ret);
-			goto err_register;
+			goto err_gpio;
 		}
 	}
 
@@ -1322,7 +1350,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 				dev_err(arizona->dev,
 					"MICD ranges must be sorted\n");
 				ret = -EINVAL;
-				goto err_input;
+				goto err_gpio;
 			}
 		}
 	}
@@ -1341,7 +1369,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 			dev_err(arizona->dev, "Unsupported MICD level %d\n",
 				info->micd_ranges[i].max);
 			ret = -EINVAL;
-			goto err_input;
+			goto err_gpio;
 		}
 
 		dev_dbg(arizona->dev, "%d ohms for MICD threshold %d\n",
@@ -1414,7 +1442,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to get JACKDET rise IRQ: %d\n",
 			ret);
-		goto err_input;
+		goto err_gpio;
 	}
 
 	ret = arizona_set_irq_wake(arizona, jack_irq_rise, 1);
@@ -1485,7 +1513,8 @@ err_rise_wake:
 	arizona_set_irq_wake(arizona, jack_irq_rise, 0);
 err_rise:
 	arizona_free_irq(arizona, jack_irq_rise, info);
-err_input:
+err_gpio:
+	gpiod_put(info->micd_pol_gpio);
 err_register:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
@@ -1497,6 +1526,8 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 	struct arizona *arizona = info->arizona;
 	int jack_irq_rise, jack_irq_fall;
 
+	gpiod_put(info->micd_pol_gpio);
+
 	pm_runtime_disable(&pdev->dev);
 
 	regmap_update_bits(arizona->regmap,
-- 
1.7.2.5
