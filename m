From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 1/2] video: exynos_dp: Add parsing of gpios pins to exynos-dp driver
Date: Tue, 14 May 2013 18:25:51 +0530
Message-ID: <1368536152-13370-2-git-send-email-vikas.sajjan@linaro.org>
References: <1368536152-13370-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1368536152-13370-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

 Adds GPIO parsing functionality for "LCD backlight" and "LCD enable"
 GPIO pins of exynos dp controller.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/video/exynos/exynos_dp_core.c |   45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/video/exynos/exynos_dp_core.c b/drivers/video/exynos/exynos_dp_core.c
index de9d4da..242a708 100644
--- a/drivers/video/exynos/exynos_dp_core.c
+++ b/drivers/video/exynos/exynos_dp_core.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 
 #include <video/exynos_dp.h>
 
@@ -895,11 +896,51 @@ static void exynos_dp_hotplug(struct work_struct *work)
 }
 
 #ifdef CONFIG_OF
+
+static int exynos_parse_gpio(struct device *dev)
+{
+	int gpio = -1;
+	struct device_node *np = dev->of_node;
+	enum of_gpio_flags flags;
+	u32 value;
+	int ret = -1;
+
+	if (!of_find_property(np, "lcd_bl_gpio", &value)) {
+                dev_err(dev, "no bl gpio property found\n");
+		return -1;
+        }
+
+	gpio = of_get_named_gpio_flags(np, "lcd_bl_gpio", 0, &flags);
+        if (gpio_is_valid(gpio)) {
+                ret = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "exynos4-fb");
+                if (ret < 0) {
+                        return ret;
+		}
+        }
+	gpio_set_value(gpio, 1);
+
+	if (!of_find_property(np, "lcd_en_gpio", &value)) {
+                dev_err(dev, "no bl gpio property found\n");
+		return -1;
+        }
+        gpio = of_get_named_gpio_flags(np, "lcd_en_gpio", 0, &flags);
+        if (gpio_is_valid(gpio)) {
+                ret = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "exynos4-fb");
+                if (ret < 0) {
+                        return ret;
+		}
+        }
+	gpio_set_value(gpio, 1);
+
+	return 0;
+}
+
 static struct exynos_dp_platdata *exynos_dp_dt_parse_pdata(struct device *dev)
 {
 	struct device_node *dp_node = dev->of_node;
 	struct exynos_dp_platdata *pd;
 	struct video_info *dp_video_config;
+	int ret = -1;
 
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd) {
@@ -960,6 +1001,10 @@ static struct exynos_dp_platdata *exynos_dp_dt_parse_pdata(struct device *dev)
 		return ERR_PTR(-EINVAL);
 	}
 
+	ret = exynos_parse_gpio(dev);
+	if (ret != 0)
+		return NULL;
+
 	return pd;
 }
 
-- 
1.7.9.5
