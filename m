From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] pintrl: meson: add interrupts to pinctrl data
Date: Fri, 12 May 2017 08:08:12 +0200
Message-ID: <18ad8094-4e17-3487-7ef2-497d5c7ab9dc@gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
 <3b4990ef-bfb4-c62c-f823-431adedc17f1@gmail.com>
 <CACRpkdYx0j4Sjv8MhXRSuiF1TyW2Ht47r0+G1ga8mXW5LC7c=g@mail.gmail.com>
 <1494518886.2375.15.camel@baylibre.com>
 <7ed5a88a-43dd-f7ab-2794-48ceb5a62a93@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ed5a88a-43dd-f7ab-2794-48ceb5a62a93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 11.05.2017 um 21:33 schrieb Heiner Kallweit:
> Am 11.05.2017 um 18:08 schrieb Jerome Brunet:
>> On Thu, 2017-05-11 at 16:50 +0200, Linus Walleij wrote:
>>> On Sun, May 7, 2017 at 6:34 PM, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>> From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> Add GPIO interrupt information to pinctrl data. Added to the original
>>>> version from Jerome was data for Meson GXL.
>>>>
>>>> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> So what this does is:
>>>
>>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h
>>>> b/drivers/pinctrl/meson/pinctrl-meson.h
>>>> index 1aa871d5..890f296f 100644
>>>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>>>> @@ -81,6 +81,7 @@ enum meson_reg_type {
>>>>   * @name:      bank name
>>>>   * @first:     first pin of the bank
>>>>   * @last:      last pin of the bank
>>>> + * @irq:       hwirq base number of the bank
>>>>   * @regs:      array of register descriptors
>>>>   *
>>>>   * A bank represents a set of pins controlled by a contiguous set of
>>>> @@ -92,6 +93,8 @@ struct meson_bank {
>>>>         const char *name;
>>>>         unsigned int first;
>>>>         unsigned int last;
>>>> +       int irq_first;
>>>> +       int irq_last;
>>>>         struct meson_reg_desc regs[NUM_REG];
>>>>  };
>>>
>>> ... adds a per-bank parent IRQ.
>>
>> Hi Linus,
>>
>> It does not add a per-bank parent IRQ. The meson gpio irq is an IP independent
>> of the gpio/pinctrl subsystem. In a nutshell, we have 8 interrupts on the GIC
>> and we can route the signal of almost any pin of any bank to these parent irqs.
>> The fact that there 1 gpio-irq controller and several gpio controller make the
>> design a bit tricky
>>
>> We already talked about this IP, here is the discussion :https://patchwork.ozlab
>> s.org/patch/684208/
>>
>> At the time, the problem was that I was creating the mapping within the
>> gpio_to_irq callback, which is wrong.
>>
>> irq_first, irq_last were introduced because there is no way to have direct
>> mapping between the gpio number and the hw interrupt number. (details are in our
>> previous discussion). If a more generic solution can be used for this, it would
>> be nice :)
>>
>> While I think having a irqdomain in the gpio driver and using the
>> request_resources callback to create the mapping in the underlying domain might
>> be a solution to ressouce allocation problem we had, I think the meson-gpio-irq
>> should be implemented has an independent driver because  it is an independent
>> device.
> 
> This kind of GPIO IRQ multiplexer doesn't really seem to match any use case
> covered by the GPIO / IRQ subsystems. Especially the needed dynamic mapping
> from the GPIOs to one of the eight GPIO GIC IRQs is tricky.
> 
> After Jerome's attempt from last year (using hierarchical IRQ domains) didn't
> make it due to concerns of the maintainers, I decided to go another way.
> I'm not stating at all that this is the right one ..
> 
> To re-use existing stuff as far as possible I go with GPIOLIB_IRQCHIP.
> So far I use one irqchip per gpiochip (we have two of them).
> I'll check whether I can use just one irqchip for both gpiochips.
> 
>> Eventually, this device should be the parent irq controller of the gpio
>> controller.
> 
> I think this is one of the central questions here, whether this device
> can be considered an irq controller.
> It just manages routing of IRQs, so I'd tend to say that the gpio controller
> is the irq controller with the GIC as parent.
> 
Following Jerome's suggestion I prepared a version making the irq multiplexer
an own device. Nice here is that with this approach basically only one line of
code needs to be changed in the existing pinctrl driver.

As discussion basis I add it here w/o submitting a v2 of patch 5.

---
 drivers/pinctrl/Kconfig                   |   1 +
 drivers/pinctrl/meson/Makefile            |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-irq.c | 393 ++++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c     |   8 +-
 drivers/pinctrl/meson/pinctrl-meson.h     |   1 +
 5 files changed, 403 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-irq.c

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
 
diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
index 27c5b512..827e416d 100644
--- a/drivers/pinctrl/meson/Makefile
+++ b/drivers/pinctrl/meson/Makefile
@@ -1,3 +1,3 @@
 obj-y	+= pinctrl-meson8.o pinctrl-meson8b.o
 obj-y	+= pinctrl-meson-gxbb.o pinctrl-meson-gxl.o
-obj-y	+= pinctrl-meson.o
+obj-y	+= pinctrl-meson.o pinctrl-meson-irq.o
diff --git a/drivers/pinctrl/meson/pinctrl-meson-irq.c b/drivers/pinctrl/meson/pinctrl-meson-irq.c
new file mode 100644
index 00000000..dfc3af77
--- /dev/null
+++ b/drivers/pinctrl/meson/pinctrl-meson-irq.c
@@ -0,0 +1,393 @@
+/*
+ * Amlogic Meson GPIO IRQ driver
+ *
+ * Copyright 2017 Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ * Based on a first version by Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation, version 2.
+ */
+
+#include <linux/device.h>
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include "pinctrl-meson.h"
+
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
+struct meson_gpio_irq_slot {
+	int irq;
+	int owner;
+};
+
+static struct regmap *meson_gpio_irq_regmap;
+static struct meson_gpio_irq_slot
+		meson_gpio_irq_slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
+static int meson_gpio_num_irq_slots;
+static DEFINE_MUTEX(meson_gpio_irq_slot_mutex);
+static DECLARE_BITMAP(meson_gpio_irq_locked, 256);
+
+/**
+ * meson_get_bank() - find the bank containing a given pin
+ *
+ * @pc:		the pinctrl instance
+ * @pin:	the pin number
+ * @bank:	the found bank
+ *
+ * Return:	0 on success, a negative value on error
+ */
+static int meson_get_bank(struct meson_pinctrl *pc, unsigned int pin,
+			  struct meson_bank **bank)
+{
+	int i;
+
+	for (i = 0; i < pc->data->num_banks; i++) {
+		if (pin >= pc->data->banks[i].first &&
+		    pin <= pc->data->banks[i].last) {
+			*bank = &pc->data->banks[i];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
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
+static void meson_gpio_irq_shutdown(struct irq_data *data)
+{
+	meson_gpio_irq_mask(data);
+	meson_gpio_free_irq_slot(data);
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
+static struct irq_chip meson_gpio_irq_chip = {
+	.name = "GPIO",
+	.irq_set_type = meson_gpio_irq_set_type,
+	.irq_mask = meson_gpio_irq_mask,
+	.irq_unmask = meson_gpio_irq_unmask,
+	.irq_shutdown = meson_gpio_irq_shutdown,
+	.irq_bus_lock = meson_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = meson_gpio_irq_bus_sync_unlock,
+};
+
+static int meson_gpio_get_irqs(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	int irq, i;
+
+	for (i = 0; i < MESON_GPIO_MAX_PARENT_IRQ_NUM; i++) {
+		irq = irq_of_parse_and_map(np, i);
+		if (!irq)
+			break;
+		meson_gpio_irq_slots[i].irq = irq;
+	}
+
+	meson_gpio_num_irq_slots = i;
+
+	return meson_gpio_num_irq_slots ? 0 : -EINVAL;
+}
+
+static const struct regmap_config meson_gpio_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register	= REG_FILTER_SEL,
+};
+
+static int meson_gpio_irq_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *io_base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	io_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
+
+	meson_gpio_irq_regmap = devm_regmap_init_mmio(&pdev->dev, io_base, &meson_gpio_regmap_config);
+	if (IS_ERR(meson_gpio_irq_regmap))
+		return PTR_ERR(meson_gpio_irq_regmap);
+
+	/* initialize to IRQ_TYPE_LEVEL_HIGH */
+	regmap_write(meson_gpio_irq_regmap, REG_EDGE_POL, 0);
+	/* disable all GPIO interrupt sources */
+	regmap_write(meson_gpio_irq_regmap, REG_PIN_03_SEL, 0xffffffff);
+	regmap_write(meson_gpio_irq_regmap, REG_PIN_47_SEL, 0xffffffff);
+	/* disable filtering */
+	regmap_write(meson_gpio_irq_regmap, REG_FILTER_SEL, 0);
+
+	ret = meson_gpio_get_irqs(pdev);
+	if (ret)
+		return ret;
+
+	meson_pinctrl_irq_chip = &meson_gpio_irq_chip;
+
+	return 0;
+}
+
+static const struct of_device_id meson_gpio_irq_dt_match[] = {
+	{ .compatible = "amlogic,meson-gpio-interrupt" },
+	{ },
+};
+
+static struct platform_driver meson_gpio_irq_driver = {
+	.probe		= meson_gpio_irq_probe,
+	.driver = {
+		.name	= "meson-gpio-interrupt",
+		.of_match_table = meson_gpio_irq_dt_match,
+	},
+};
+builtin_platform_driver(meson_gpio_irq_driver);
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 66ed70c1..3907e032 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -62,6 +62,8 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-meson.h"
 
+struct irq_chip *meson_pinctrl_irq_chip;
+
 /**
  * meson_get_bank() - find the bank containing a given pin
  *
@@ -558,7 +560,8 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 		return ret;
 	}
 
-	return 0;
+	return gpiochip_irqchip_add(&pc->chip, meson_pinctrl_irq_chip, 0,
+				    handle_simple_irq, IRQ_TYPE_NONE);
 }
 
 static struct regmap_config meson_regmap_config = {
@@ -647,6 +650,9 @@ static int meson_pinctrl_probe(struct platform_device *pdev)
 	struct meson_pinctrl *pc;
 	int ret;
 
+	if (!meson_pinctrl_irq_chip)
+		return -EPROBE_DEFER;
+
 	pc = devm_kzalloc(dev, sizeof(struct meson_pinctrl), GFP_KERNEL);
 	if (!pc)
 		return -ENOMEM;
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 890f296f..35a5da09 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -176,3 +176,4 @@ extern struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data;
 extern struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data;
 extern struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data;
 extern struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data;
+extern struct irq_chip *meson_pinctrl_irq_chip;
-- 
2.12.2




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
