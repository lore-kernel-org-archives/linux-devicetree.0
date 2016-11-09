From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv2 2/2] gpio: xilinx: Add clock support
Date: Wed, 9 Nov 2016 10:39:51 +0530
Message-ID: <1478668191-26322-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1478668191-26322-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1478668191-26322-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: soren.brinkmann@xilinx.com, michal.simek@xilinx.com, shubhrajyoti.datta@gmail.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add basic clock support for xilinx gpio.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2 :
no change

 drivers/gpio/gpio-xilinx.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 14b2a62..923cab8 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -45,6 +46,7 @@
  * @gpio_state: GPIO state shadow register
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
+ * @clk: Clock resource for this controller
  */
 struct xgpio_instance {
 	struct of_mm_gpio_chip mmchip;
@@ -52,6 +54,7 @@ struct xgpio_instance {
 	u32 gpio_state[2];
 	u32 gpio_dir[2];
 	spinlock_t gpio_lock[2];
+	struct clk *clk;
 };
 
 static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
@@ -282,6 +285,7 @@ static int xgpio_remove(struct platform_device *pdev)
 	struct xgpio_instance *chip = platform_get_drvdata(pdev);
 
 	of_mm_gpiochip_remove(&chip->mmchip);
+	clk_disable_unprepare(chip->clk);
 
 	return 0;
 }
@@ -307,6 +311,23 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
+	/* Retrieve GPIO clock */
+	chip->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(chip->clk)) {
+		if (PTR_ERR(chip->clk) == -ENOENT) {
+			dev_info(&pdev->dev, "No clocks found for clk\n");
+			chip->clk = NULL;
+		} else {
+			dev_err(&pdev->dev, "axi clock error\n");
+			return PTR_ERR(chip->clk);
+		}
+	}
+	status = clk_prepare_enable(chip->clk);
+	if (status) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return status;
+	}
+
 	/* Update GPIO state shadow register with default value */
 	of_property_read_u32(np, "xlnx,dout-default", &chip->gpio_state[0]);
 
@@ -362,6 +383,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (status) {
 		pr_err("%s: error in probe function with status %d\n",
 		       np->full_name, status);
+		clk_disable_unprepare(chip->clk);
 		return status;
 	}
 
-- 
1.7.1

