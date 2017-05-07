From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] pintrl: meson: add support for GPIO interrupts
Date: Sun, 7 May 2017 18:34:57 +0200
Message-ID: <e0fd5c2a-ef88-6c09-63d4-67a54091b9a7@gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a4ca587b-d3e8-a22d-4d25-289871d2d095-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for GPIO interrupts on Amlogic Meson SoC's.

There's a limit of 8 parent interupts which can be used in total.
Note that IRQ_TYPE_EDGE_BOTH interrupts reserve two parent IRQ's,
one for each edge.

Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/pinctrl/Kconfig               |   1 +
 drivers/pinctrl/meson/pinctrl-meson.c | 338 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h |  12 ++
 3 files changed, 350 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 37af5e30..f8f401a0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -153,6 +153,7 @@ config PINCTRL_MESON
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	select OF_GPIO
 	select REGMAP_MMIO
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 66ed70c1..525879f2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -46,9 +46,12 @@
 
 #include <linux/device.h>
 #include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -57,11 +60,30 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/mfd/syscon.h>
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
 #include "pinctrl-meson.h"
 
+#define REG_EDGE_POL		0x00
+#define REG_PIN_03_SEL		0x04
+#define REG_PIN_47_SEL		0x08
+#define REG_FILTER_SEL		0x0c
+
+#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
+#define REG_EDGE_POL_EDGE(x)	BIT(x)
+#define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
+
+#define MESON_GPIO_MAX_PARENT_IRQ_NUM	8
+
+static struct regmap *meson_gpio_irq_regmap;
+static struct meson_gpio_irq_slot
+		meson_gpio_irq_slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
+static int meson_gpio_num_irq_slots;
+static DEFINE_MUTEX(meson_gpio_irq_slot_mutex);
+static DECLARE_BITMAP(meson_gpio_irq_locked, 256);
+
 /**
  * meson_get_bank() - find the bank containing a given pin
  *
@@ -533,6 +555,275 @@ static const struct of_device_id meson_pinctrl_dt_match[] = {
 	{ },
 };
 
+static struct meson_pinctrl *meson_gpio_data_to_pc(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+	return gpiochip_get_data(chip);
+}
+
+static int meson_gpio_to_hwirq(struct meson_bank *bank, unsigned int offset)
+{
+	int hwirq;
+
+	if (bank->irq_first < 0)
+		/* this bank cannot generate irqs */
+		return -EINVAL;
+
+	hwirq = offset - bank->first + bank->irq_first;
+
+	if (hwirq > bank->irq_last)
+		/* this pin cannot generate irqs */
+		return -EINVAL;
+
+	return hwirq;
+}
+
+static int meson_gpio_to_irq(struct meson_pinctrl *pc, unsigned int offset)
+{
+	struct meson_bank *bank;
+	int ret;
+
+	offset += pc->data->pin_base;
+
+	ret = meson_get_bank(pc, offset, &bank);
+	if (ret)
+		return ret;
+
+	ret = meson_gpio_to_hwirq(bank, offset);
+	if (ret < 0) {
+		dev_dbg(pc->dev, "no interrupt for pin %u\n", offset);
+		return 0;
+	}
+
+	return ret;
+}
+
+static int meson_gpio_data_to_hwirq(struct irq_data *data)
+{
+	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
+	unsigned gpio = irqd_to_hwirq(data);
+
+	return meson_gpio_to_irq(pc, gpio);
+}
+
+static irqreturn_t meson_gpio_irq_handler(int irq, void *data)
+{
+	struct irq_data *gpio_irqdata = data;
+	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
+	int hwirq = meson_gpio_data_to_hwirq(gpio_irqdata);
+
+	/*
+	 * For some strange reason spurious interrupts created by the chip when
+	 * the interrupt source registers are written cause a deadlock here.
+	 * generic_handle_irq calls handle_simple_irq which tries to get
+	 * spinlock desc->lock. This interrupt handler is called whilst
+	 * __setup_irq holds desc->lock.
+	 * The deadlock means that both are running on the same CPU what should
+	 * not happen as __setup_irq called raw_spin_lock_irqsave thus disabling
+	 * interrupts on this CPU.
+	 * Work around this by ignoring interrupts in code protected by
+	 * chip_bus_lock (__setup_irq/__free_irq for the respective GPIO hwirq).
+	 */
+	if (test_bit(hwirq, meson_gpio_irq_locked))
+		dev_dbg(pc->dev, "spurious interrupt detected!\n");
+	else
+		generic_handle_irq(gpio_irqdata->irq);
+
+	return IRQ_HANDLED;
+}
+
+static int meson_gpio_alloc_irq_slot(struct irq_data *data, int num_slots,
+				     int *slots)
+{
+	int i, cnt = 0;
+
+	mutex_lock(&meson_gpio_irq_slot_mutex);
+
+	for (i = 0; i < meson_gpio_num_irq_slots; i++)
+		if (!meson_gpio_irq_slots[i].owner) {
+			meson_gpio_irq_slots[i].owner = data->irq;
+			slots[cnt++] = i;
+			if (cnt == num_slots)
+				break;
+		}
+
+	if (cnt < num_slots)
+		for (i = 0; i < cnt; i++)
+			meson_gpio_irq_slots[i].owner = 0;
+
+	mutex_unlock(&meson_gpio_irq_slot_mutex);
+
+	return cnt == num_slots ? 0 : -ENOSPC;
+}
+
+static void meson_gpio_free_irq_slot(struct irq_data *data)
+{
+	int i;
+
+	mutex_lock(&meson_gpio_irq_slot_mutex);
+
+	for (i = 0; i < meson_gpio_num_irq_slots; i++)
+		if (meson_gpio_irq_slots[i].owner == data->irq) {
+			free_irq(meson_gpio_irq_slots[i].irq, data);
+			meson_gpio_irq_slots[i].owner = 0;
+		}
+
+	mutex_unlock(&meson_gpio_irq_slot_mutex);
+}
+
+static int meson_gpio_find_irq_slot(struct irq_data *data, int *slots)
+{
+	int i, cnt = 0;
+
+	mutex_lock(&meson_gpio_irq_slot_mutex);
+
+	for (i = 0; i < meson_gpio_num_irq_slots; i++)
+		if (meson_gpio_irq_slots[i].owner == data->irq)
+			slots[cnt++] = i;
+
+	mutex_unlock(&meson_gpio_irq_slot_mutex);
+
+	return cnt ?: -EINVAL;
+}
+
+static int meson_gpio_irq_request_resources(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned gpio = irqd_to_hwirq(data);
+
+	return gpiochip_lock_as_irq(chip, gpio);
+}
+
+static void meson_gpio_irq_release_resources(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned gpio = irqd_to_hwirq(data);
+
+	meson_gpio_free_irq_slot(data);
+	gpiochip_unlock_as_irq(chip, gpio);
+}
+
+static void meson_gpio_set_hwirq(int idx, int hwirq)
+{
+	int reg = idx > 3 ? REG_PIN_47_SEL : REG_PIN_03_SEL;
+	int shift = 8 * (idx % 4);
+
+	regmap_update_bits(meson_gpio_irq_regmap, reg, 0xff << shift,
+			   hwirq << shift);
+}
+
+static void meson_gpio_irq_set_hwirq(struct irq_data *data, int hwirq)
+{
+	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
+	int i, cnt, slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
+
+	cnt = meson_gpio_find_irq_slot(data, slots);
+	if (cnt < 0) {
+		dev_err(pc->dev, "didn't find gpio irq slot\n");
+		return;
+	}
+
+	for (i = 0; i < cnt; i++)
+		meson_gpio_set_hwirq(slots[i], hwirq);
+}
+
+static void meson_gpio_irq_unmask(struct irq_data *data)
+{
+	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
+	unsigned gpio = irqd_to_hwirq(data);
+	int hwirq = meson_gpio_to_irq(pc, gpio);
+
+	meson_gpio_irq_set_hwirq(data, hwirq);
+}
+
+static void meson_gpio_irq_mask(struct irq_data *data)
+{
+	meson_gpio_irq_set_hwirq(data, 0xff);
+}
+
+static int meson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	int i, ret, irq, num_slots, slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
+	unsigned int val = 0;
+
+	num_slots = (type == IRQ_TYPE_EDGE_BOTH) ? 2 : 1;
+	ret = meson_gpio_alloc_irq_slot(data, num_slots, slots);
+	if (ret)
+		return ret;
+
+	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+		val |= REG_EDGE_POL_EDGE(slots[0]);
+
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+		val |= REG_EDGE_POL_LOW(slots[0]);
+
+	regmap_update_bits(meson_gpio_irq_regmap, REG_EDGE_POL,
+			   REG_EDGE_POL_MASK(slots[0]), val);
+
+	/*
+	 * The chip can create an interrupt for either rising or falling edge
+	 * only. Therefore use two interrupts in case of IRQ_TYPE_EDGE_BOTH,
+	 * first for falling edge and second one for rising edge.
+	 */
+	if (num_slots > 1) {
+		val = REG_EDGE_POL_EDGE(slots[1]);
+		regmap_update_bits(meson_gpio_irq_regmap, REG_EDGE_POL,
+				   REG_EDGE_POL_MASK(slots[1]), val);
+	}
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		val = IRQ_TYPE_EDGE_RISING;
+	else
+		val = IRQ_TYPE_LEVEL_HIGH;
+
+	for (i = 0; i < num_slots; i++) {
+		irq = meson_gpio_irq_slots[slots[i]].irq;
+		ret = irq_set_irq_type(irq, val);
+		if (ret)
+			break;
+		ret = request_irq(irq, meson_gpio_irq_handler, 0,
+				  "GPIO parent", data);
+		if (ret)
+			break;
+	}
+
+	if (ret)
+		while (--i >= 0)
+			free_irq(meson_gpio_irq_slots[slots[i]].irq, data);
+
+	return ret;
+}
+
+static void meson_gpio_irq_bus_lock(struct irq_data *data)
+{
+	int hwirq = meson_gpio_data_to_hwirq(data);
+
+	set_bit(hwirq, meson_gpio_irq_locked);
+}
+
+static void meson_gpio_irq_bus_sync_unlock(struct irq_data *data)
+{
+	int hwirq = meson_gpio_data_to_hwirq(data);
+
+	clear_bit(hwirq, meson_gpio_irq_locked);
+}
+
+static void meson_gpiolib_init_irq_chip(struct meson_pinctrl *pc)
+{
+	static atomic_t irqchip_idx = ATOMIC_INIT(-1);
+	int idx = atomic_inc_return(&irqchip_idx);
+
+	pc->irq_chip.name = devm_kasprintf(pc->dev, GFP_KERNEL, "GPIO%d", idx);
+	pc->irq_chip.irq_request_resources = meson_gpio_irq_request_resources;
+	pc->irq_chip.irq_release_resources = meson_gpio_irq_release_resources;
+	pc->irq_chip.irq_set_type = meson_gpio_irq_set_type;
+	pc->irq_chip.irq_mask = meson_gpio_irq_mask;
+	pc->irq_chip.irq_unmask = meson_gpio_irq_unmask;
+	pc->irq_chip.irq_bus_lock = meson_gpio_irq_bus_lock;
+	pc->irq_chip.irq_bus_sync_unlock = meson_gpio_irq_bus_sync_unlock;
+}
+
 static int meson_gpiolib_register(struct meson_pinctrl *pc)
 {
 	int ret;
@@ -558,7 +849,8 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 		return ret;
 	}
 
-	return 0;
+	return gpiochip_irqchip_add(&pc->chip, &pc->irq_chip, 0,
+				    handle_simple_irq, IRQ_TYPE_NONE);
 }
 
 static struct regmap_config meson_regmap_config = {
@@ -640,6 +932,29 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 	return 0;
 }
 
+static int meson_gpio_get_parent_irqs(void)
+{
+	struct device_node *np;
+	int irq, i;
+
+	np = of_find_compatible_node(NULL, NULL,
+				     "amlogic,meson-gpio-interrupt");
+	if (!np)
+		return -EINVAL;
+
+	for (i = 0; i < MESON_GPIO_MAX_PARENT_IRQ_NUM; i++) {
+		irq = irq_of_parse_and_map(np, i);
+		if (!irq)
+			break;
+		meson_gpio_irq_slots[i].irq = irq;
+	}
+
+	of_node_put(np);
+	meson_gpio_num_irq_slots = i;
+
+	return meson_gpio_num_irq_slots ? 0 : -EINVAL;
+}
+
 static int meson_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -647,6 +962,25 @@ static int meson_pinctrl_probe(struct platform_device *pdev)
 	struct meson_pinctrl *pc;
 	int ret;
 
+	if (!meson_gpio_irq_regmap) {
+		meson_gpio_irq_regmap = syscon_regmap_lookup_by_compatible(
+						"amlogic,meson-gpio-interrupt");
+		if (IS_ERR(meson_gpio_irq_regmap))
+			return PTR_ERR(meson_gpio_irq_regmap);
+
+		/* initialize to IRQ_TYPE_LEVEL_HIGH */
+		regmap_write(meson_gpio_irq_regmap, REG_EDGE_POL, 0);
+		/* disable all GPIO interrupt sources */
+		regmap_write(meson_gpio_irq_regmap, REG_PIN_03_SEL, 0xffffffff);
+		regmap_write(meson_gpio_irq_regmap, REG_PIN_47_SEL, 0xffffffff);
+		/* disable filtering */
+		regmap_write(meson_gpio_irq_regmap, REG_FILTER_SEL, 0);
+
+		ret = meson_gpio_get_parent_irqs();
+		if(ret)
+			return ret;
+	}
+
 	pc = devm_kzalloc(dev, sizeof(struct meson_pinctrl), GFP_KERNEL);
 	if (!pc)
 		return -ENOMEM;
@@ -673,6 +1007,8 @@ static int meson_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pc->pcdev);
 	}
 
+	meson_gpiolib_init_irq_chip(pc);
+
 	return meson_gpiolib_register(pc);
 }
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 890f296f..4792e769 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -17,6 +17,17 @@
 #include <linux/types.h>
 
 /**
+ * struct meson_gpio_irq_slot - a gpio irq slot descriptor
+ *
+ * @irq:	virq of the parent irq
+ * @owner:	owning gpio hwirq
+ */
+struct meson_gpio_irq_slot {
+	int irq;
+	int owner;
+};
+
+/**
  * struct meson_pmx_group - a pinmux group
  *
  * @name:	group name
@@ -121,6 +132,7 @@ struct meson_pinctrl {
 	struct regmap *reg_pull;
 	struct regmap *reg_gpio;
 	struct gpio_chip chip;
+	struct irq_chip irq_chip;
 	struct device_node *of_node;
 };
 
-- 
2.12.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
