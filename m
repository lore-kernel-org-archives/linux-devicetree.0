From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 3/4] mfd: arizona: Switch to using clock driver for 32k clock
Date: Tue, 5 Jan 2016 15:41:41 +0000
Message-ID: <1452008502-3749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1452008502-3749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452008502-3749-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now we have a clock driver that can control the 32k clock use this
rather than directly controlling the 32k clock from the MFD device.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/mfd/Kconfig              |   1 +
 drivers/mfd/arizona-core.c       | 104 +++++++++------------------------------
 include/linux/mfd/arizona/core.h |   7 +--
 3 files changed, 26 insertions(+), 86 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 4d92df6..85aa33e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1367,6 +1367,7 @@ config MFD_ARIZONA
 	select REGMAP
 	select REGMAP_IRQ
 	select MFD_CORE
+	select COMMON_CLK_ARIZONA
 	bool
 
 config MFD_ARIZONA_I2C
diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index d474732..5a55dd6 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -36,63 +36,6 @@ static const char * const wm5102_core_supplies[] = {
 	"DBVDD1",
 };
 
-int arizona_clk32k_enable(struct arizona *arizona)
-{
-	int ret = 0;
-
-	mutex_lock(&arizona->clk_lock);
-
-	arizona->clk32k_ref++;
-
-	if (arizona->clk32k_ref == 1) {
-		switch (arizona->pdata.clk32k_src) {
-		case ARIZONA_32KZ_MCLK1:
-			ret = pm_runtime_get_sync(arizona->dev);
-			if (ret != 0)
-				goto out;
-			break;
-		}
-
-		ret = regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
-					 ARIZONA_CLK_32K_ENA,
-					 ARIZONA_CLK_32K_ENA);
-	}
-
-out:
-	if (ret != 0)
-		arizona->clk32k_ref--;
-
-	mutex_unlock(&arizona->clk_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(arizona_clk32k_enable);
-
-int arizona_clk32k_disable(struct arizona *arizona)
-{
-	mutex_lock(&arizona->clk_lock);
-
-	BUG_ON(arizona->clk32k_ref <= 0);
-
-	arizona->clk32k_ref--;
-
-	if (arizona->clk32k_ref == 0) {
-		regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
-				   ARIZONA_CLK_32K_ENA, 0);
-
-		switch (arizona->pdata.clk32k_src) {
-		case ARIZONA_32KZ_MCLK1:
-			pm_runtime_put_sync(arizona->dev);
-			break;
-		}
-	}
-
-	mutex_unlock(&arizona->clk_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(arizona_clk32k_disable);
-
 static irqreturn_t arizona_clkgen_err(int irq, void *data)
 {
 	struct arizona *arizona = data;
@@ -874,6 +817,7 @@ static inline int arizona_of_get_core_pdata(struct arizona *arizona)
 
 static const struct mfd_cell early_devs[] = {
 	{ .name = "arizona-ldo1" },
+	{ .name = "arizona-clk" },
 };
 
 static const char * const wm5102_supplies[] = {
@@ -970,7 +914,6 @@ int arizona_dev_init(struct arizona *arizona)
 	int n_subdevs, ret, i;
 
 	dev_set_drvdata(arizona->dev, arizona);
-	mutex_init(&arizona->clk_lock);
 
 	if (dev_get_platdata(arizona->dev))
 		memcpy(&arizona->pdata, dev_get_platdata(arizona->dev),
@@ -1261,28 +1204,6 @@ int arizona_dev_init(struct arizona *arizona)
 	}
 
 	/* Chip default */
-	if (!arizona->pdata.clk32k_src)
-		arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK2;
-
-	switch (arizona->pdata.clk32k_src) {
-	case ARIZONA_32KZ_MCLK1:
-	case ARIZONA_32KZ_MCLK2:
-		regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
-				   ARIZONA_CLK_32K_SRC_MASK,
-				   arizona->pdata.clk32k_src - 1);
-		arizona_clk32k_enable(arizona);
-		break;
-	case ARIZONA_32KZ_NONE:
-		regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
-				   ARIZONA_CLK_32K_SRC_MASK, 2);
-		break;
-	default:
-		dev_err(arizona->dev, "Invalid 32kHz clock source: %d\n",
-			arizona->pdata.clk32k_src);
-		ret = -EINVAL;
-		goto err_reset;
-	}
-
 	for (i = 0; i < ARIZONA_MAX_MICBIAS; i++) {
 		if (!arizona->pdata.micbias[i].mV &&
 		    !arizona->pdata.micbias[i].bypass)
@@ -1387,10 +1308,25 @@ int arizona_dev_init(struct arizona *arizona)
 	pm_runtime_set_active(arizona->dev);
 	pm_runtime_enable(arizona->dev);
 
+	arizona->clk32k = devm_clk_get(arizona->dev, "arizona-32k");
+	if (IS_ERR(arizona->clk32k)) {
+		ret = PTR_ERR(arizona->clk32k);
+		if (ret == -ENOENT)
+			ret = -EPROBE_DEFER;
+		dev_err(arizona->dev, "Failed to get 32k clock: %d\n", ret);
+		goto err_pm;
+	}
+
+	ret = clk_prepare_enable(arizona->clk32k);
+	if (ret < 0) {
+		dev_err(arizona->dev, "Failed to enable 32k clock: %d\n", ret);
+		goto err_pm;
+	}
+
 	/* Set up for interrupts */
 	ret = arizona_irq_init(arizona);
 	if (ret != 0)
-		goto err_reset;
+		goto err_clock;
 
 	pm_runtime_set_autosuspend_delay(arizona->dev, 100);
 	pm_runtime_use_autosuspend(arizona->dev);
@@ -1414,6 +1350,10 @@ int arizona_dev_init(struct arizona *arizona)
 
 err_irq:
 	arizona_irq_exit(arizona);
+err_clock:
+	clk_disable_unprepare(arizona->clk32k);
+err_pm:
+	pm_runtime_disable(arizona->dev);
 err_reset:
 	arizona_enable_reset(arizona);
 	regulator_disable(arizona->dcvdd);
@@ -1430,6 +1370,8 @@ EXPORT_SYMBOL_GPL(arizona_dev_init);
 
 int arizona_dev_exit(struct arizona *arizona)
 {
+	clk_disable_unprepare(arizona->clk32k);
+
 	pm_runtime_disable(arizona->dev);
 
 	regulator_disable(arizona->dcvdd);
diff --git a/include/linux/mfd/arizona/core.h b/include/linux/mfd/arizona/core.h
index 79e607e..b9a1da4 100644
--- a/include/linux/mfd/arizona/core.h
+++ b/include/linux/mfd/arizona/core.h
@@ -13,6 +13,7 @@
 #ifndef _WM_ARIZONA_CORE_H
 #define _WM_ARIZONA_CORE_H
 
+#include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -133,8 +134,7 @@ struct arizona {
 	bool hpdet_clamp;
 	unsigned int hp_ena;
 
-	struct mutex clk_lock;
-	int clk32k_ref;
+	struct clk *clk32k;
 
 	bool ctrlif_error;
 
@@ -148,9 +148,6 @@ struct arizona {
 	struct mutex dac_comp_lock;
 };
 
-int arizona_clk32k_enable(struct arizona *arizona);
-int arizona_clk32k_disable(struct arizona *arizona);
-
 int arizona_request_irq(struct arizona *arizona, int irq, char *name,
 			irq_handler_t handler, void *data);
 void arizona_free_irq(struct arizona *arizona, int irq, void *data);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
