From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 4/6] gpio: cbc-presence: Add CBC presence detect as GPIO driver
Date: Fri,  7 Oct 2016 18:20:12 +0300
Message-ID: <1475853614-22409-5-git-send-email-pantelis.antoniou@konsulko.com>
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

This driver exports the CB FPGA presence detect bits from a
single 32bit CB register as GPIOs.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/gpio/Kconfig             |  12 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-cbc-presence.c | 460 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 473 insertions(+)
 create mode 100644 drivers/gpio/gpio-cbc-presence.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b29f521..ef8f408 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -158,6 +158,18 @@ config GPIO_CBC
 	  This driver can also be built as a module.  If so, the module
 	  will be called gpio-cbc.
 
+config GPIO_CBC_PRESENCE
+	tristate "Juniper Networks PTX1K CBC presence detect as GPIO"
+	depends on MFD_JUNIPER_CBC && OF
+	default y if JNX_CONNECTOR
+	help
+	  This driver exports the CH_PRS and OTHER_CH_PRS presence detect
+	  bits of the PTX1K RCB CBC FPGA as GPIOs on the relevant Juniper
+	  platforms. Select if JNX_CONNECTOR is selected.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called gpio-cbc-presence.
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 78dd0d4..825c2636 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CBC)		+= gpio-cbc.o
+obj-$(CONFIG_GPIO_CBC_PRESENCE)	+= gpio-cbc-presence.o
 obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_CRYSTAL_COVE)	+= gpio-crystalcove.o
diff --git a/drivers/gpio/gpio-cbc-presence.c b/drivers/gpio/gpio-cbc-presence.c
new file mode 100644
index 0000000..ab16c0b
--- /dev/null
+++ b/drivers/gpio/gpio-cbc-presence.c
@@ -0,0 +1,460 @@
+/*
+ * Juniper Networks PTX1K CBC presence detect as GPIO driver
+ *
+ * Copyright (c) 2014, Juniper Networks
+ * Author: Georgi Vlaev <gvlaev@juniper.net>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/pci.h>
+#include <linux/gpio.h>
+#include <linux/errno.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_gpio.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/cbc-core.h>
+
+/*
+ * PTX1K RCB CBC:
+ * We have 26 presence bits in 2 regs.
+ * Interrupts are raised per bit change in a reg (2 ints)
+ *
+ * CBC_TOP_REGS_CH_PRS:
+ * FPC[7:0] -> FPC[7:0]
+ * FAN[16] -> FAN[0]
+ * CB[22:21] -> CB[1:0]
+ * FPD[23]
+ * OTHER_RE[26]
+ *
+ * CBC_TOP_REGS_OTHER_CH_PRS:
+ * PSM[4:0]
+ * SIB[10:5] -> SIB[5:0]
+ * SFPP[21:20] -> SFPP[1:0]
+ */
+
+/*
+ * struct cbc_presence_gpio - GPIO private data structure.
+ * @base: PCI base address of Memory mapped I/O register.
+ * @dev: Pointer to device structure.
+ * @gpio: Data for GPIO infrastructure.
+ */
+struct cbc_presence_gpio {
+	void __iomem *base;
+	struct device *dev;
+	struct gpio_chip gpio;
+	struct mutex irq_lock;
+	struct mutex work_lock;
+	struct irq_domain *domain;
+	int irq;
+	u32 reg;
+	unsigned long presence_cache;
+	unsigned long presence_irq_enabled;
+	unsigned long mask;
+	unsigned long always_present;
+	unsigned long poll_interval;
+	u8 irq_type[32];
+	struct delayed_work work;
+};
+
+static u32 cbc_presence_read(struct cbc_presence_gpio *cpg)
+{
+	return ioread32(cpg->base + cpg->reg) | cpg->always_present;
+}
+
+static int cbc_presence_gpio_get(struct gpio_chip *gc, unsigned int nr)
+{
+	struct cbc_presence_gpio *cpg =
+			container_of(gc, struct cbc_presence_gpio, gpio);
+	unsigned long data, pos, ord = 0;
+
+	data = cbc_presence_read(cpg);
+	for_each_set_bit(pos, &cpg->mask, fls(cpg->mask)) {
+		if (ord == nr)
+			return !!test_bit(ord, &data);
+		ord++;
+	}
+	return 0;
+}
+
+static int cbc_presence_gpio_direction_input(struct gpio_chip *gc,
+					     unsigned int nr)
+{
+	/* all pins are input pins */
+	return 0;
+}
+
+static int cbc_presence_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct cbc_presence_gpio *cpg = container_of(gc,
+						struct cbc_presence_gpio, gpio);
+
+	return irq_create_mapping(cpg->domain, offset);
+}
+
+static void cbc_presence_irq_mask(struct irq_data *data)
+{
+	struct cbc_presence_gpio *cpg = irq_data_get_irq_chip_data(data);
+
+	clear_bit(data->hwirq, &cpg->presence_irq_enabled);
+}
+
+static void cbc_presence_irq_unmask(struct irq_data *data)
+{
+	struct cbc_presence_gpio *cpg = irq_data_get_irq_chip_data(data);
+
+	set_bit(data->hwirq, &cpg->presence_irq_enabled);
+}
+
+static int cbc_presence_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct cbc_presence_gpio *cpg = irq_data_get_irq_chip_data(data);
+
+	cpg->irq_type[data->hwirq] = type & 0x0f;
+
+	return 0;
+}
+
+static void cbc_presence_irq_bus_lock(struct irq_data *data)
+{
+	struct cbc_presence_gpio *cpg = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&cpg->irq_lock);
+}
+
+static void cbc_presence_irq_bus_unlock(struct irq_data *data)
+{
+	struct cbc_presence_gpio *cpg = irq_data_get_irq_chip_data(data);
+
+	/* Synchronize interrupts to chip */
+
+	mutex_unlock(&cpg->irq_lock);
+}
+
+static struct irq_chip cbc_presence_irq_chip = {
+	.name = "gpio-cbc-presence",
+	.irq_mask = cbc_presence_irq_mask,
+	.irq_unmask = cbc_presence_irq_unmask,
+	.irq_set_type = cbc_presence_irq_set_type,
+	.irq_bus_lock = cbc_presence_irq_bus_lock,
+	.irq_bus_sync_unlock = cbc_presence_irq_bus_unlock,
+};
+
+static int cbc_presence_gpio_irq_map(struct irq_domain *domain,
+				unsigned int irq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_data(irq, domain->host_data);
+	irq_set_chip(irq, &cbc_presence_irq_chip);
+	irq_set_nested_thread(irq, true);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops cbc_presence_gpio_irq_domain_ops = {
+	.map = cbc_presence_gpio_irq_map,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static void cbc_presence_gpio_irq_work(struct cbc_presence_gpio *cpg)
+{
+	unsigned long data, pos, ord = 0;
+
+	data = cbc_presence_read(cpg);
+
+	mutex_lock(&cpg->work_lock);
+	for_each_set_bit(pos, &cpg->mask, fls(cpg->mask)) {
+		int type, bit;
+
+		if (!test_bit(ord, &cpg->presence_irq_enabled)) {
+			ord++;
+			continue;
+		}
+
+		bit = test_bit(pos, &data);
+		if (bit == test_bit(pos, &cpg->presence_cache)) {
+			ord++;
+			continue;
+		}
+
+		type = cpg->irq_type[ord];
+		/*
+		 * check irq->type for match. Only handle edge triggered
+		 * interrupts; anything else doesn't make sense here.
+		 */
+		if (((type & IRQ_TYPE_EDGE_RISING) && bit) ||
+		    ((type & IRQ_TYPE_EDGE_FALLING) && !bit)) {
+			int virq = irq_find_mapping(cpg->domain, ord);
+
+			handle_nested_irq(virq);
+		}
+		ord++;
+	}
+	cpg->presence_cache = data;
+	mutex_unlock(&cpg->work_lock);
+}
+
+static irqreturn_t cbc_presence_gpio_irq_handler(int irq, void *data)
+{
+	struct cbc_presence_gpio *cpg = data;
+
+	cbc_presence_gpio_irq_work(cpg);
+
+	return IRQ_HANDLED;
+}
+
+static void cbc_presence_gpio_worker(struct work_struct *work)
+{
+	struct cbc_presence_gpio *cpg =
+		container_of(work, struct cbc_presence_gpio, work.work);
+
+	cbc_presence_gpio_irq_work(cpg);
+	schedule_delayed_work(&cpg->work,
+				msecs_to_jiffies(cpg->poll_interval));
+}
+
+static int cbc_presence_gpio_irq_setup(struct device *dev,
+					struct cbc_presence_gpio *cpg)
+{
+	int ret;
+
+	cpg->domain = irq_domain_add_linear(dev->of_node,
+				hweight_long(cpg->mask),
+				&cbc_presence_gpio_irq_domain_ops,
+				cpg);
+
+	if (cpg->domain == NULL)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&cpg->work, cbc_presence_gpio_worker);
+
+	if (cpg->irq) {
+		dev_info(dev, "Setting up interrupt %d\n", cpg->irq);
+		ret = devm_request_threaded_irq(dev, cpg->irq, NULL,
+						cbc_presence_gpio_irq_handler,
+						IRQF_ONESHOT,
+						dev_name(dev), cpg);
+		if (ret)
+			goto out_remove_domain;
+	} else {
+		schedule_delayed_work(&cpg->work, 1);
+	}
+
+	cpg->gpio.to_irq = cbc_presence_gpio_to_irq;
+
+	return 0;
+
+out_remove_domain:
+	irq_domain_remove(cpg->domain);
+	return ret;
+}
+
+static void cbc_presence_gpio_irq_teardown(struct device *dev,
+					struct cbc_presence_gpio *cpg)
+{
+	int i;
+
+	if (!cpg->irq)
+		cancel_delayed_work_sync(&cpg->work);
+
+	for (i = 0; i < cpg->gpio.ngpio; i++) {
+		int irq = irq_find_mapping(cpg->domain, i);
+
+		if (irq > 0)
+			irq_dispose_mapping(irq);
+	}
+	irq_domain_remove(cpg->domain);
+}
+
+static int cbc_presence_gpio_of_xlate(struct gpio_chip *gpio,
+				  const struct of_phandle_args *gpiospec,
+				  u32 *flags)
+{
+	if (WARN_ON(gpio->of_gpio_n_cells < 2))
+		return -EINVAL;
+
+	if (WARN_ON(gpiospec->args_count < gpio->of_gpio_n_cells))
+		return -EINVAL;
+
+	if (gpiospec->args[0] > gpio->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[1] >> 16;
+
+	return gpiospec->args[0];
+}
+
+static void cbc_presence_gpio_setup(struct cbc_presence_gpio *cpg)
+{
+	struct gpio_chip *gpio = &cpg->gpio;
+
+	gpio->label = dev_name(cpg->dev);
+	gpio->owner = THIS_MODULE;
+	gpio->get = cbc_presence_gpio_get;
+	gpio->direction_input = cbc_presence_gpio_direction_input;
+	gpio->dbg_show = NULL;
+	gpio->base = -1;
+	gpio->ngpio = hweight_long(cpg->mask);
+	gpio->can_sleep = 0;
+	gpio->of_node = cpg->dev->of_node;
+	gpio->of_xlate = cbc_presence_gpio_of_xlate;
+	gpio->of_gpio_n_cells = 2;
+}
+
+static int cbc_presence_of_setup(struct cbc_presence_gpio *cpg)
+{
+	struct device *dev = cpg->dev;
+	struct device_node *node = dev->of_node;
+	u32 value;
+	int ret;
+
+	/* reg := CBC_TOP_REGS_CH_PRS | CBC_TOP_REGS_OTHER_CH_PRS */
+	ret = of_property_read_u32(node, "reg", &value);
+	if (ret) {
+		dev_err(dev, "failed to read the <reg> property.\n");
+		return ret;
+	}
+	cpg->reg = value;
+
+	/* mask := valid presence bits in <reg> */
+	ret = of_property_read_u32(node, "mask", &value);
+	if (ret)
+		value = 0xffffffff;
+	cpg->mask = value;
+
+	/*
+	 * always-present := some frus are always present, but not reported
+	 * e.g MP/BP on PTX1K & PTX3K
+	 */
+	ret = of_property_read_u32(node, "always-present", &value);
+	if (ret)
+		value = 0;
+	cpg->always_present = value;
+
+	/*
+	 * poll-interval := some CBC releses don't support interrupts.
+	 * Default poll interval is 1000 msec
+	 */
+	ret = of_property_read_u32(node, "poll-interval", &value);
+	if (ret)
+		value = 1000;
+	cpg->poll_interval = value;
+
+	return 0;
+}
+
+static int cbc_presence_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cbc_presence_gpio *cpg;
+	struct resource *res;
+	int ret;
+
+	cpg = devm_kzalloc(dev, sizeof(struct cbc_presence_gpio),
+			GFP_KERNEL);
+	if (cpg == NULL)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	cpg->base = devm_ioremap_nocache(dev, res->start, resource_size(res));
+	if (IS_ERR(cpg->base))
+		return -ENOMEM;
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret > 0)
+		cpg->irq = ret;
+
+	cpg->dev = dev;
+	mutex_init(&cpg->irq_lock);
+	mutex_init(&cpg->work_lock);
+
+	ret = cbc_presence_of_setup(cpg);
+	if (ret)
+		return -ENODEV;
+
+	cbc_presence_gpio_setup(cpg);
+
+	/* cache the current presence */
+	cpg->presence_cache = cbc_presence_read(cpg);
+
+	ret = cbc_presence_gpio_irq_setup(dev, cpg);
+	if (ret < 0) {
+		dev_err(dev, "Failed to setup CBC presence irqs\n");
+		return ret;
+	}
+
+	ret = gpiochip_add(&cpg->gpio);
+	if (ret) {
+		dev_err(dev, "Failed to register CBC presence gpio\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, cpg);
+
+	return 0;
+err:
+	gpiochip_remove(&cpg->gpio);
+
+	if (cpg->domain)
+		cbc_presence_gpio_irq_teardown(dev, cpg);
+
+	return ret;
+}
+
+static int cbc_presence_gpio_remove(struct platform_device *pdev)
+{
+	struct cbc_presence_gpio *cpg = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&cpg->work);
+	if (cpg->domain)
+		cbc_presence_gpio_irq_teardown(&pdev->dev, cpg);
+
+	gpiochip_remove(&cpg->gpio);
+
+	return 0;
+}
+
+static const struct of_device_id cbc_presence_gpio_ids[] = {
+	{ .compatible = "jnx,gpio-cbc-presence", },
+	/*
+	 * These are the same devices ... MFD OF hackery to
+	 * get around the single of_node compatible match
+	 * mfd_add_device() for the OTHER_CH_PRESENCE
+	 */
+	{ .compatible = "jnx,gpio-cbc-presence-other", },
+	{ .compatible = "jnx,gpio-cbc-presence-sib", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cbc_presence_gpio_ids);
+
+static struct platform_driver cbc_presence_gpio_driver = {
+	.driver = {
+		.name = "gpio-cbc-presence",
+		.owner  = THIS_MODULE,
+		.of_match_table = cbc_presence_gpio_ids,
+	},
+	.probe = cbc_presence_gpio_probe,
+	.remove = cbc_presence_gpio_remove,
+};
+module_platform_driver(cbc_presence_gpio_driver);
+
+MODULE_DESCRIPTION("Juniper Networks CB presence detect as GPIO driver");
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");
+MODULE_LICENSE("GPL");
-- 
1.9.1
