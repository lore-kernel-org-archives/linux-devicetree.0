From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 2/6] gpio: Add support for PTX1K CBC FPGA spare GPIOs
Date: Fri,  7 Oct 2016 18:20:10 +0300
Message-ID: <1475853614-22409-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Debjit Ghosh <dghosh@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

From: Georgi Vlaev <gvlaev@juniper.net>

Add support for the GPIO block in Juniper's CBC FPGA.

A number of GPIOs exported by different kind of boards
is supported.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/gpio/Kconfig    |  11 +++
 drivers/gpio/Makefile   |   1 +
 drivers/gpio/gpio-cbc.c | 236 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 drivers/gpio/gpio-cbc.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 281029b..b29f521 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -147,6 +147,17 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
 
+config GPIO_CBC
+	tristate "Juniper Networks PTX1K CBC GPIO support"
+	depends on MFD_JUNIPER_CBC
+	default y if MFD_JUNIPER_CBC
+	help
+	  This driver supports the spare GPIO interfaces on the Juniper
+	  PTX1K CBC.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called gpio-cbc.
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ec890c7..78dd0d4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_GPIO_AXP209)	+= gpio-axp209.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
+obj-$(CONFIG_GPIO_CBC)		+= gpio-cbc.o
 obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_CRYSTAL_COVE)	+= gpio-crystalcove.o
diff --git a/drivers/gpio/gpio-cbc.c b/drivers/gpio/gpio-cbc.c
new file mode 100644
index 0000000..d698f00
--- /dev/null
+++ b/drivers/gpio/gpio-cbc.c
@@ -0,0 +1,236 @@
+/*
+ * Polaris CBC 8614, 8112, SIB, FPC, FTC Spare GPIO driver
+ *
+ * Copyright 2014 Juniper Networks
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2
+ * as published by the Free Software Foundation.
+ */
+
+#include <linux/bitops.h>
+#include <linux/init.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_gpio.h>
+#include <linux/io.h>
+#include <linux/gpio.h>
+#include <linux/slab.h>
+#include <linux/mfd/cbc-core.h>
+
+#define CBC_GPIO_DIR		0x00
+#define CBC_GPIO_OUTPUT		0x04
+#define CBC_GPIO_INPUT		0x08
+
+struct cbc_gpio {
+	u32 reg;	/* start register offset */
+	u32 ngpio;	/* number of GPIOs */
+	u32 offset;	/* start offset of the fisrt GPIO */
+};
+
+#define CBC_GPIO(r, n, o) { .reg = r, .ngpio = n, .offset = o }
+
+static struct cbc_gpio cbc_gpios[] = {
+	CBC_GPIO(CBC_TOP_REGS_GPIO_CTRL, 12, 0), /* GPIO_8614-GPIO_8112 */
+	CBC_GPIO(CBC_TOP_REGS_SIB_SPARE_OUTPUTENABLE, 18, 0), /* SIB_SPARE */
+	CBC_GPIO(CBC_TOP_REGS_FPC_SPARE_OUTPUTENABLE, 32, 0), /* FPC_SPARE */
+	CBC_GPIO(CBC_TOP_REGS_OTHER_SPARE_OUTPUTENABLE, 10, 1) /* OTHER_SPARE */
+};
+
+/*
+ * struct cbc_gpio_chip
+ */
+struct cbc_gpio_chip {
+	void __iomem *base;
+	struct device *dev;
+	struct gpio_chip chip;
+	u32 gpio_state;
+	u32 gpio_dir;
+	u32 offset;
+	spinlock_t gpio_lock;
+};
+
+/*
+ * cbc_gpio_get - Read the specified signal of the GPIO device.
+ */
+static int cbc_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct cbc_gpio_chip *chip =
+	    container_of(gc, struct cbc_gpio_chip, chip);
+
+	return !!(ioread32(chip->base + CBC_GPIO_INPUT) &
+		BIT(gpio));
+}
+
+/*
+ * cbc_gpio_set - Write the specified signal of the GPIO device.
+ */
+static void cbc_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	unsigned long flags;
+	struct cbc_gpio_chip *chip =
+	    container_of(gc, struct cbc_gpio_chip, chip);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	/* Write to GPIO signal and set its direction to output */
+	if (val)
+		chip->gpio_state |= BIT(gpio);
+	else
+		chip->gpio_state &= ~BIT(gpio);
+
+	iowrite32(chip->gpio_state, chip->base + CBC_GPIO_OUTPUT);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+/*
+ * cbc_gpio_dir_in - Set the direction of the specified GPIO signal as input.
+ */
+static int cbc_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long flags;
+	struct cbc_gpio_chip *chip =
+	    container_of(gc, struct cbc_gpio_chip, chip);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	chip->gpio_dir &= ~BIT(gpio);
+	iowrite32(chip->gpio_dir, chip->base + CBC_GPIO_DIR);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
+}
+
+/*
+ * cbc_gpio_dir_out - Set the direction of the specified GPIO signal as output.
+ */
+static int cbc_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	unsigned long flags;
+	struct cbc_gpio_chip *chip =
+	    container_of(gc, struct cbc_gpio_chip, chip);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	chip->gpio_dir |= BIT(gpio);
+	iowrite32(chip->gpio_dir, chip->base +  CBC_GPIO_DIR);
+
+	if (val)
+		chip->gpio_state |= BIT(gpio);
+	else
+		chip->gpio_state &= ~BIT(gpio);
+	iowrite32(chip->gpio_state, chip->base + CBC_GPIO_OUTPUT);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
+}
+
+/*
+ * cbc_gpio_setup_one - Setup single bank as gpio_chip
+ */
+static void cbc_gpio_setup_one(struct cbc_gpio_chip *cgc, int ngpio)
+{
+	struct gpio_chip *gpio = &cgc->chip;
+
+	gpio->label = dev_name(cgc->dev);
+	gpio->owner = THIS_MODULE;
+	gpio->direction_input = cbc_gpio_dir_in;
+	gpio->get = cbc_gpio_get;
+	gpio->direction_output = cbc_gpio_dir_out;
+	gpio->set = cbc_gpio_set;
+	gpio->dbg_show = NULL;
+	gpio->base = -1;
+	gpio->ngpio = ngpio;
+	gpio->can_sleep = 0;
+#ifdef CONFIG_OF_GPIO
+	gpio->of_node = cgc->dev->of_node;
+#endif
+}
+
+static int cbc_gpio_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	struct cbc_gpio_chip *chips, *c;
+	struct resource *res;
+	void __iomem *base;
+	struct device *dev = &pdev->dev;
+
+	chips = devm_kzalloc(dev, sizeof(struct cbc_gpio_chip) *
+		ARRAY_SIZE(cbc_gpios), GFP_KERNEL);
+	if (chips == NULL)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return -ENOMEM;
+
+
+	platform_set_drvdata(pdev, chips);
+
+	/* For each GPIO bank, register a GPIO chip. */
+	for (i = 0; i < ARRAY_SIZE(cbc_gpios); i++) {
+		c = &chips[i];
+
+		c->dev = dev;
+		c->base = base;
+		spin_lock_init(&c->gpio_lock);
+		c->offset = cbc_gpios[i].offset;
+		cbc_gpio_setup_one(c, cbc_gpios[i].ngpio);
+
+		ret = gpiochip_add(&c->chip);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to register CBC gpiochip %d: %d\n",
+				i, ret);
+			goto err_gpiochip;
+		}
+	}
+	return 0;
+
+err_gpiochip:
+	for (i = i - 1; i >= 0; i--)
+		gpiochip_remove(&chips[i].chip);
+
+	return ret;
+}
+
+static int cbc_gpio_remove(struct platform_device *pdev)
+{
+	int i;
+	struct cbc_gpio_chip *chips = platform_get_drvdata(pdev);
+
+	for (i = 0; i < ARRAY_SIZE(cbc_gpios); i++)
+		gpiochip_remove(&chips[i].chip);
+
+	return 0;
+}
+
+static const struct of_device_id cbc_gpio_ids[] = {
+	{ .compatible = "jnx,gpio-cbc", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cbc_gpio_ids);
+
+static struct platform_driver cbc_gpio_driver = {
+	.driver = {
+		.name = "gpio-cbc",
+		.owner  = THIS_MODULE,
+		.of_match_table = cbc_gpio_ids,
+	},
+	.probe = cbc_gpio_probe,
+	.remove = cbc_gpio_remove,
+};
+module_platform_driver(cbc_gpio_driver);
+
+MODULE_DESCRIPTION("Juniper Networks CBC GPIO Driver");
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");
+MODULE_LICENSE("GPL");
-- 
1.9.1
