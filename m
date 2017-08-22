From: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Subject: [PATCH 2/2] rtc: v3020: DT bindings
Date: Tue, 22 Aug 2017 17:06:29 -0400
Message-ID: <3b378a63-713c-63f2-9825-95da716888c7@mothictech.com>
References: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b832db93-9885-adfe-39b4-1950851b391d-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT bindings for rtc-v3020 and remove platform_data configuration
for GPIO attachment as it is no longer used by anything in-tree.
platform_data for MMIO attachment is retained as some in-tree boards
still use it.

Convert to devm managed resources for GPIO and IOMEM.  Kernel memory
was already using devm.

Signed-off-by: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
---
 drivers/rtc/rtc-v3020.c | 152 ++++++++++++++++++++++++++----------------------
 1 file changed, 81 insertions(+), 71 deletions(-)

diff --git a/drivers/rtc/rtc-v3020.c b/drivers/rtc/rtc-v3020.c
index 1f3117b5a83c..ce82b4cf3a3c 100644
--- a/drivers/rtc/rtc-v3020.c
+++ b/drivers/rtc/rtc-v3020.c
@@ -1,5 +1,6 @@
 /* drivers/rtc/rtc-v3020.c
  *
+ * Copyright (C) 2017 Mothic Technologies LLC
  * Copyright (C) 2006 8D Technologies inc.
  * Copyright (C) 2004 Compulab Ltd.
  *
@@ -11,6 +12,10 @@
  *
  * Changelog:
  *
+ *  17-Aug-2017: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
+ *                             - Add DT support/gpio now DT-only
+ *                             - Use devm_* for gpio/iomem
+ *
  *  10-May-2006: Raphael Assenat <raph-04oEwi3R4qQ@public.gmane.org>
  *                             - Converted to platform driver
  *                             - Use the generic rtc class
@@ -29,6 +34,7 @@
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 #include <linux/io.h>
 
@@ -39,15 +45,18 @@ struct v3020;
 struct v3020_chip_ops {
        int (*map_io)(struct v3020 *chip, struct platform_device *pdev,
                      struct v3020_platform_data *pdata);
-       void (*unmap_io)(struct v3020 *chip);
        unsigned char (*read_bit)(struct v3020 *chip);
        void (*write_bit)(struct v3020 *chip, unsigned char bit);
 };
 
-#define V3020_CS       0
-#define V3020_WR       1
-#define V3020_RD       2
-#define V3020_IO       3
+enum v3020_gpios {
+       V3020_CS,
+       V3020_WR,
+       V3020_RD,
+       V3020_IO,
+
+       V3020_GPIO_MAX
+};
 
 struct v3020 {
        /* MMIO access */
@@ -55,7 +64,7 @@ struct v3020 {
        int leftshift;
 
        /* GPIO access */
-       struct gpio *gpio;
+       struct gpio_desc *gpiod[V3020_GPIO_MAX];
 
        const struct v3020_chip_ops *ops;
 
@@ -72,19 +81,23 @@ static int v3020_mmio_map(struct v3020 *chip, struct platform_device *pdev,
        if (pdev->resource[0].flags != IORESOURCE_MEM)
                return -EBUSY;
 
-       chip->leftshift = pdata->leftshift;
-       chip->ioaddress = ioremap(pdev->resource[0].start, 1);
+       if (pdev->dev.of_node) {
+               if (of_property_read_u32(pdev->dev.of_node,
+                                       "emmicro,mmio-left-shift",
+                                       &chip->leftshift) != 0) {
+                       chip->leftshift = 0;
+               }
+       } else {
+               chip->leftshift = pdata->leftshift;
+       }
+
+       chip->ioaddress = devm_ioremap(&pdev->dev, pdev->resource[0].start, 1);
        if (chip->ioaddress == NULL)
                return -EBUSY;
 
        return 0;
 }
 
-static void v3020_mmio_unmap(struct v3020 *chip)
-{
-       iounmap(chip->ioaddress);
-}
-
 static void v3020_mmio_write_bit(struct v3020 *chip, unsigned char bit)
 {
        writel(bit << chip->leftshift, chip->ioaddress);
@@ -97,70 +110,60 @@ static unsigned char v3020_mmio_read_bit(struct v3020 *chip)
 
 static const struct v3020_chip_ops v3020_mmio_ops = {
        .map_io         = v3020_mmio_map,
-       .unmap_io       = v3020_mmio_unmap,
        .read_bit       = v3020_mmio_read_bit,
        .write_bit      = v3020_mmio_write_bit,
 };
 
-static struct gpio v3020_gpio[] = {
-       { 0, GPIOF_OUT_INIT_HIGH, "RTC CS"},
-       { 0, GPIOF_OUT_INIT_HIGH, "RTC WR"},
-       { 0, GPIOF_OUT_INIT_HIGH, "RTC RD"},
-       { 0, GPIOF_OUT_INIT_HIGH, "RTC IO"},
-};
-
 static int v3020_gpio_map(struct v3020 *chip, struct platform_device *pdev,
                          struct v3020_platform_data *pdata)
 {
-       int err;
+       chip->gpiod[V3020_CS] = devm_gpiod_get(&pdev->dev, "cs", GPIOD_OUT_HIGH);
+       if (IS_ERR(chip->gpiod[V3020_CS]))
+               return PTR_ERR(chip->gpiod[V3020_CS]);
 
-       v3020_gpio[V3020_CS].gpio = pdata->gpio_cs;
-       v3020_gpio[V3020_WR].gpio = pdata->gpio_wr;
-       v3020_gpio[V3020_RD].gpio = pdata->gpio_rd;
-       v3020_gpio[V3020_IO].gpio = pdata->gpio_io;
+       chip->gpiod[V3020_WR] = devm_gpiod_get(&pdev->dev, "wr", GPIOD_OUT_HIGH);
+       if (IS_ERR(chip->gpiod[V3020_WR]))
+               return PTR_ERR(chip->gpiod[V3020_WR]);
 
-       err = gpio_request_array(v3020_gpio, ARRAY_SIZE(v3020_gpio));
+       chip->gpiod[V3020_RD] = devm_gpiod_get(&pdev->dev, "rd", GPIOD_OUT_HIGH);
+       if (IS_ERR(chip->gpiod[V3020_RD]))
+               return PTR_ERR(chip->gpiod[V3020_RD]);
 
-       if (!err)
-               chip->gpio = v3020_gpio;
+       chip->gpiod[V3020_IO] = devm_gpiod_get(&pdev->dev, "io", GPIOD_OUT_HIGH);
+       if (IS_ERR(chip->gpiod[V3020_IO]))
+               return PTR_ERR(chip->gpiod[V3020_IO]);
 
-       return err;
-}
-
-static void v3020_gpio_unmap(struct v3020 *chip)
-{
-       gpio_free_array(v3020_gpio, ARRAY_SIZE(v3020_gpio));
+       return 0;
 }
 
 static void v3020_gpio_write_bit(struct v3020 *chip, unsigned char bit)
 {
-       gpio_direction_output(chip->gpio[V3020_IO].gpio, bit);
-       gpio_set_value(chip->gpio[V3020_CS].gpio, 0);
-       gpio_set_value(chip->gpio[V3020_WR].gpio, 0);
+       gpiod_direction_output(chip->gpiod[V3020_IO], bit);
+       gpiod_set_value(chip->gpiod[V3020_CS], 0);
+       gpiod_set_value(chip->gpiod[V3020_WR], 0);
        udelay(1);
-       gpio_set_value(chip->gpio[V3020_WR].gpio, 1);
-       gpio_set_value(chip->gpio[V3020_CS].gpio, 1);
+       gpiod_set_value(chip->gpiod[V3020_WR], 1);
+       gpiod_set_value(chip->gpiod[V3020_CS], 1);
 }
 
 static unsigned char v3020_gpio_read_bit(struct v3020 *chip)
 {
        int bit;
 
-       gpio_direction_input(chip->gpio[V3020_IO].gpio);
-       gpio_set_value(chip->gpio[V3020_CS].gpio, 0);
-       gpio_set_value(chip->gpio[V3020_RD].gpio, 0);
+       gpiod_direction_input(chip->gpiod[V3020_IO]);
+       gpiod_set_value(chip->gpiod[V3020_CS], 0);
+       gpiod_set_value(chip->gpiod[V3020_RD], 0);
        udelay(1);
-       bit = !!gpio_get_value(chip->gpio[V3020_IO].gpio);
+       bit = !!gpiod_get_value(chip->gpiod[V3020_IO]);
        udelay(1);
-       gpio_set_value(chip->gpio[V3020_RD].gpio, 1);
-       gpio_set_value(chip->gpio[V3020_CS].gpio, 1);
+       gpiod_set_value(chip->gpiod[V3020_RD], 1);
+       gpiod_set_value(chip->gpiod[V3020_CS], 1);
 
        return bit;
 }
 
 static const struct v3020_chip_ops v3020_gpio_ops = {
        .map_io         = v3020_gpio_map,
-       .unmap_io       = v3020_gpio_unmap,
        .read_bit       = v3020_gpio_read_bit,
        .write_bit      = v3020_gpio_write_bit,
 };
@@ -289,19 +292,31 @@ static int rtc_probe(struct platform_device *pdev)
        int retval = -EBUSY;
        int i;
        int temp;
+       bool use_gpio;
 
        chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
        if (!chip)
                return -ENOMEM;
 
-       if (pdata->use_gpio)
-               chip->ops = &v3020_gpio_ops;
+       if (pdev->dev.of_node)
+               use_gpio = of_property_read_bool(pdev->dev.of_node,
+                               "emmicro,use-gpio");
        else
+               use_gpio = false;
+
+       if (use_gpio) {
+               chip->ops = &v3020_gpio_ops;
+               dev_dbg(&pdev->dev, "using gpio");
+       } else {
                chip->ops = &v3020_mmio_ops;
+               dev_dbg(&pdev->dev, "using mmio");
+       }
 
        retval = chip->ops->map_io(chip, pdev, pdata);
-       if (retval)
+       if (retval) {
+               dev_err(&pdev->dev, "map_io failed: %d", retval);
                return retval;
+       }
 
        /* Make sure the v3020 expects a communication cycle
         * by reading 8 times */
@@ -312,19 +327,21 @@ static int rtc_probe(struct platform_device *pdev)
         * to the chip ram */
        v3020_set_reg(chip, V3020_SECONDS, 0x33);
        if (v3020_get_reg(chip, V3020_SECONDS) != 0x33) {
-               retval = -ENODEV;
-               goto err_io;
+               dev_err(&pdev->dev, "Chip r/w test failed");
+               return -ENODEV;
        }
 
        /* Make sure frequency measurement mode, test modes, and lock
         * are all disabled */
        v3020_set_reg(chip, V3020_STATUS_0, 0x0);
 
-       if (pdata->use_gpio)
+       if (use_gpio)
                dev_info(&pdev->dev, "Chip available at GPIOs "
                         "%d, %d, %d, %d\n",
-                        chip->gpio[V3020_CS].gpio, chip->gpio[V3020_WR].gpio,
-                        chip->gpio[V3020_RD].gpio, chip->gpio[V3020_IO].gpio);
+                        desc_to_gpio(chip->gpiod[V3020_CS]),
+                        desc_to_gpio(chip->gpiod[V3020_WR]),
+                        desc_to_gpio(chip->gpiod[V3020_RD]),
+                        desc_to_gpio(chip->gpiod[V3020_IO]));
        else
                dev_info(&pdev->dev, "Chip available at "
                         "physical address 0x%llx,"
@@ -337,32 +354,25 @@ static int rtc_probe(struct platform_device *pdev)
        chip->rtc = devm_rtc_device_register(&pdev->dev, "v3020",
                                        &v3020_rtc_ops, THIS_MODULE);
        if (IS_ERR(chip->rtc)) {
-               retval = PTR_ERR(chip->rtc);
-               goto err_io;
+               return PTR_ERR(chip->rtc);
        }
 
        return 0;
-
-err_io:
-       chip->ops->unmap_io(chip);
-
-       return retval;
 }
 
-static int rtc_remove(struct platform_device *dev)
-{
-       struct v3020 *chip = platform_get_drvdata(dev);
-
-       chip->ops->unmap_io(chip);
-
-       return 0;
-}
+#if defined(CONFIG_OF)
+static const struct of_device_id v3020_of_match[] = {
+       { .compatible = "emmicro,v3020" },
+       {},
+};
+MODULE_DEVICE_TABLE(of, v3020_of_match);
+#endif
 
 static struct platform_driver rtc_device_driver = {
        .probe  = rtc_probe,
-       .remove = rtc_remove,
        .driver = {
                .name   = "v3020",
+               .of_match_table = of_match_ptr(v3020_of_match),
        },
 };
 
-- 
2.11.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
