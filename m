From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 4/4] gpio: Add driver for Maxim MAX3191x industrial serializer
Date: Mon, 21 Aug 2017 15:12:00 +0200
Message-ID: <df530ae703fcfdf52d27a1b6d19b6d1a4724b103.1503319573.git.lukas@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The driver was developed for and tested with the MAX31913 built into
the Revolution Pi by KUNBUS, but should work with all members of the
MAX3191x family:

MAX31910: low power
MAX31911: LED drivers
MAX31912: LED drivers + 2nd voltage monitor + low power
MAX31913: LED drivers + 2nd voltage monitor
MAX31953: LED drivers + 2nd voltage monitor + isolation
MAX31963: LED drivers + 2nd voltage monitor + isolation + buck regulator

They are similar to but more versatile than the TI SN65HVS880/2/3/5
supported by gpio-pisosr.c as they clock out a CRC checksum to guard
against electromagnetic interference, as well as undervoltage and
overtemperature indicator bits.  If these features are not needed
they can be disabled by pulling the "modesel" pin high and then
gpio-pisosr.c can be used instead of the present driver.

Cc: Mathias Duckeck <m.duckeck@kunbus.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpio/Kconfig         |  10 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-max3191x.c | 482 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 493 insertions(+)
 create mode 100644 drivers/gpio/gpio-max3191x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fc9b75c9e3ba..c42e5e75353f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1246,6 +1246,16 @@ config GPIO_74X164
 	  shift registers. This driver can be used to provide access
 	  to more gpio outputs.
 
+config GPIO_MAX3191X
+	tristate "Maxim MAX3191x industrial serializer"
+	select CRC8
+	help
+	  GPIO driver for Maxim MAX31910, MAX31911, MAX31912, MAX31913,
+	  MAX31953 and MAX31963 industrial serializer, a daisy-chainable
+	  chip to make 8 digital 24V inputs available via SPI.  Supports
+	  CRC checksums to guard against electromagnetic interference,
+	  as well as undervoltage and overtemperature detection.
+
 config GPIO_MAX7301
 	tristate "Maxim MAX7301 GPIO expander"
 	select GPIO_MAX730X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 37f2029218cb..f1482ee7fd23 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_ARCH_LPC32XX)	+= gpio-lpc32xx.o
 obj-$(CONFIG_GPIO_LP873X)	+= gpio-lp873x.o
 obj-$(CONFIG_GPIO_LP87565)	+= gpio-lp87565.o
 obj-$(CONFIG_GPIO_LYNXPOINT)	+= gpio-lynxpoint.o
+obj-$(CONFIG_GPIO_MAX3191X)	+= gpio-max3191x.o
 obj-$(CONFIG_GPIO_MAX730X)	+= gpio-max730x.o
 obj-$(CONFIG_GPIO_MAX7300)	+= gpio-max7300.o
 obj-$(CONFIG_GPIO_MAX7301)	+= gpio-max7301.o
diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
new file mode 100644
index 000000000000..308a43b0acf0
--- /dev/null
+++ b/drivers/gpio/gpio-max3191x.c
@@ -0,0 +1,482 @@
+/*
+ * gpio-max3191x.c - GPIO driver for Maxim MAX3191x industrial serializer
+ *
+ * Copyright (C) 2017 KUNBUS GmbH
+ *
+ * The MAX3191x makes 8 digital 24V inputs available via SPI.
+ * Multiple chips can be daisy-chained, the spec does not impose
+ * a limit on the number of chips and neither does this driver.
+ *
+ * Either of two modes is selectable: In 8-bit mode, only the state
+ * of the inputs is clocked out to achieve high readout speeds;
+ * In 16-bit mode, an additional status byte is clocked out with
+ * a CRC and indicator bits for undervoltage and overtemperature.
+ * The driver returns an error instead of potentially bogus data
+ * if any of these fault conditions occur.  However it does allow
+ * readout of non-faulting chips in the same daisy-chain.
+ *
+ * MAX3191x supports four debounce settings and the driver is
+ * capable of configuring these differently for each chip in the
+ * daisy-chain.
+ *
+ * https://datasheets.maximintegrated.com/en/ds/MAX31910.pdf
+ * https://datasheets.maximintegrated.com/en/ds/MAX31911.pdf
+ * https://datasheets.maximintegrated.com/en/ds/MAX31912.pdf
+ * https://datasheets.maximintegrated.com/en/ds/MAX31913.pdf
+ * https://datasheets.maximintegrated.com/en/ds/MAX31953-MAX31963.pdf
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License (version 2) as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/crc8.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+
+enum max3191x_mode {
+	STATUS_BYTE_ENABLED,
+	STATUS_BYTE_DISABLED,
+};
+
+/**
+ * struct max3191x_chip - max3191x daisy-chain
+ * @gpio: GPIO controller struct
+ * @lock: protects read sequences
+ * @nchips: number of chips in the daisy-chain
+ * @has_vcc24v: whether the chips are powered through VCC24V or 5VOUT;
+ *	if 5VOUT, the chips will constantly signal undervoltage;
+ *	for simplicity, all chips in the daisy-chain are assumed
+ *	to be powered the same way
+ * @mode_hardwired: whether the modesel pin is hardwired or configurable
+ * @mode: current mode, 0 for 16-bit, 1 for 8-bit;
+ *	for simplicity, all chips in the daisy-chain are assumed
+ *	to use the same mode
+ * @modesel_pins: GPIO pins to configure modesel of each chip
+ * @fault_pins: GPIO pins to detect fault of each chip
+ * @db0_pins: GPIO pins to configure debounce of each chip
+ * @db1_pins: GPIO pins to configure debounce of each chip
+ * @mesg: SPI message to perform a readout
+ * @xfer: SPI transfer used by @mesg
+ * @crc_error: bitmap signaling CRC error for each chip
+ * @overtemp: bitmap signaling overtemperature alarm for each chip
+ * @undervolt1: bitmap signaling undervoltage alarm for each chip
+ * @undervolt2: bitmap signaling undervoltage warning for each chip
+ * @fault: bitmap signaling assertion of @fault_pins for each chip
+ */
+struct max3191x_chip {
+	struct gpio_chip gpio;
+	struct mutex lock;
+	u32 nchips;
+	bool has_vcc24v;
+	bool mode_hardwired;
+	enum max3191x_mode mode;
+	struct gpio_descs *modesel_pins;
+	struct gpio_descs *fault_pins;
+	struct gpio_descs *db0_pins;
+	struct gpio_descs *db1_pins;
+	struct spi_message mesg;
+	struct spi_transfer xfer;
+	unsigned long *crc_error;
+	unsigned long *overtemp;
+	unsigned long *undervolt1;
+	unsigned long *undervolt2;
+	unsigned long *fault;
+};
+
+#define MAX3191X_NGPIO 8
+#define MAX3191X_CRC8_POLYNOMIAL 0xa8 /* (x^5) + x^4 + x^2 + x^0 */
+
+DECLARE_CRC8_TABLE(max3191x_crc8);
+
+static int max3191x_get_direction(struct gpio_chip *gpio, unsigned int offset)
+{
+	return 1; /* always in */
+}
+
+static int max3191x_direction_input(struct gpio_chip *gpio, unsigned int offset)
+{
+	return 0;
+}
+
+static int max3191x_direction_output(struct gpio_chip *gpio,
+				     unsigned int offset, int value)
+{
+	return -EINVAL;
+}
+
+static void max3191x_set(struct gpio_chip *gpio, unsigned int offset, int value)
+{ }
+
+static void max3191x_set_multiple(struct gpio_chip *gpio, unsigned long *mask,
+				  unsigned long *bits)
+{ }
+
+static unsigned int max3191x_wordlen(struct max3191x_chip *max3191x)
+{
+	return max3191x->mode == STATUS_BYTE_ENABLED ? 2 : 1;
+}
+
+static int max3191x_readout_locked(struct max3191x_chip *max3191x)
+{
+	struct device *dev = max3191x->gpio.parent;
+	struct spi_device *spi = to_spi_device(dev);
+	int val, i, ot = 0, uv1 = 0;
+
+	val = spi_sync(spi, &max3191x->mesg);
+	if (val) {
+		dev_err_ratelimited(dev, "SPI receive error %d\n", val);
+		return val;
+	}
+
+	for (i = 0; i < max3191x->nchips; i++) {
+		if (max3191x->mode == STATUS_BYTE_ENABLED) {
+			u8 in	  = ((u8 *)max3191x->xfer.rx_buf)[i * 2];
+			u8 status = ((u8 *)max3191x->xfer.rx_buf)[i * 2 + 1];
+
+			val = (status & 0xf8) != crc8(max3191x_crc8, &in, 1, 0);
+			__assign_bit(val, i, max3191x->crc_error);
+			if (val)
+				dev_err_ratelimited(dev,
+					"chip %d: CRC error\n", i);
+
+			ot  = (status >> 1) & 1;
+			__assign_bit(ot, i, max3191x->overtemp);
+			if (ot)
+				dev_err_ratelimited(dev,
+					"chip %d: overtemperature\n", i);
+
+			if (max3191x->has_vcc24v) {
+				uv1 = !((status >> 2) & 1);
+				__assign_bit(uv1, i, max3191x->undervolt1);
+				if (uv1)
+					dev_err_ratelimited(dev,
+						"chip %d: undervoltage\n", i);
+
+				val = !(status & 1);
+				__assign_bit(val, i, max3191x->undervolt2);
+				if (val && !uv1)
+					dev_warn_ratelimited(dev,
+						"chip %d: voltage warn\n", i);
+			}
+		}
+
+		if (max3191x->fault_pins && max3191x->has_vcc24v) {
+			val = gpiod_get_value_cansleep(
+					max3191x->fault_pins->desc[i]);
+			if (val < 0) {
+				dev_err_ratelimited(dev,
+					"GPIO read error %d\n", val);
+				return val;
+			}
+			__assign_bit(val, i, max3191x->fault);
+			if (val && !uv1 && !ot)
+				dev_err_ratelimited(dev,
+					"chip %d: fault\n", i);
+		}
+	}
+
+	return 0;
+}
+
+static bool max3191x_chip_is_faulting(struct max3191x_chip *max3191x,
+				      u16 chipnum)
+{
+	/* without status byte the only diagnostic is the fault pin */
+	if (max3191x->has_vcc24v && test_bit(chipnum, max3191x->fault))
+		return true;
+
+	if (max3191x->mode == STATUS_BYTE_DISABLED)
+		return false;
+
+	return test_bit(chipnum, max3191x->crc_error) ||
+	       test_bit(chipnum, max3191x->overtemp)  ||
+	       (max3191x->has_vcc24v &&
+		test_bit(chipnum, max3191x->undervolt1));
+}
+
+static int max3191x_get(struct gpio_chip *gpio, unsigned int offset)
+{
+	struct max3191x_chip *max3191x = gpiochip_get_data(gpio);
+	int ret, chipnum, wordlen = max3191x_wordlen(max3191x);
+	u8 in;
+
+	mutex_lock(&max3191x->lock);
+	ret = max3191x_readout_locked(max3191x);
+	if (ret)
+		goto out_unlock;
+
+	chipnum = offset / MAX3191X_NGPIO;
+	if (max3191x_chip_is_faulting(max3191x, chipnum)) {
+		ret = -EIO;
+		goto out_unlock;
+	}
+
+	in = ((u8 *)max3191x->xfer.rx_buf)[chipnum * wordlen];
+	ret = (in >> (offset % MAX3191X_NGPIO)) & 1;
+
+out_unlock:
+	mutex_unlock(&max3191x->lock);
+	return ret;
+}
+
+static int max3191x_get_multiple(struct gpio_chip *gpio, unsigned long *mask,
+				 unsigned long *bits)
+{
+	struct max3191x_chip *max3191x = gpiochip_get_data(gpio);
+	int ret, i, wordlen = max3191x_wordlen(max3191x);
+
+	mutex_lock(&max3191x->lock);
+	ret = max3191x_readout_locked(max3191x);
+	if (ret)
+		goto out_unlock;
+
+	bitmap_andnot(bits, bits, mask, gpio->ngpio); /* clear desired bits */
+
+	for (i = 0; i < max3191x->nchips; i++) {
+		unsigned long *chipmask = mask + i / sizeof(long);
+		unsigned long *chipbits = bits + i / sizeof(long);
+		int shift = MAX3191X_NGPIO * (i % sizeof(long));
+		unsigned long in;
+
+		if (!((0xff << shift) & *chipmask))
+			continue; /* not interested in inputs of this chip */
+
+		if (max3191x_chip_is_faulting(max3191x, i)) {
+			ret = -EIO;
+			goto out_unlock;
+		}
+
+		in = ((u8 *)max3191x->xfer.rx_buf)[i * wordlen] << shift;
+		*chipbits |= in & *chipmask; /* set bits for "high" inputs */
+	}
+
+out_unlock:
+	mutex_unlock(&max3191x->lock);
+	return ret;
+}
+
+static int max3191x_set_config(struct gpio_chip *gpio, unsigned int offset,
+			       unsigned long config)
+{
+	struct max3191x_chip *max3191x = gpiochip_get_data(gpio);
+	u32 debounce, chipnum, db0_val, db1_val;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	if (!max3191x->db0_pins || !max3191x->db1_pins)
+		return -EINVAL;
+
+	debounce = pinconf_to_config_argument(config);
+	switch (debounce) {
+	case 0:
+		db0_val = 0;
+		db1_val = 0;
+		break;
+	case 1 ... 25:
+		db0_val = 0;
+		db1_val = 1;
+		break;
+	case 26 ... 750:
+		db0_val = 1;
+		db1_val = 0;
+		break;
+	case 751 ... 3000:
+		db0_val = 1;
+		db1_val = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&max3191x->lock);
+	chipnum = offset / MAX3191X_NGPIO;
+	gpiod_set_value_cansleep(max3191x->db0_pins->desc[chipnum], db0_val);
+	gpiod_set_value_cansleep(max3191x->db1_pins->desc[chipnum], db1_val);
+	mutex_unlock(&max3191x->lock);
+	return 0;
+}
+
+static void gpiod_set_array_single_value_cansleep(unsigned int ndescs,
+						  struct gpio_desc **desc,
+						  int value)
+{
+	int i, values[ndescs];
+
+	for (i = 0; i < ndescs; i++)
+		values[i] = value;
+
+	gpiod_set_array_value_cansleep(ndescs, desc, values);
+}
+
+static struct gpio_descs *devm_gpiod_get_array_optional_count(
+				struct device *dev, const char *con_id,
+				enum gpiod_flags flags, unsigned int expected)
+{
+	struct gpio_descs *descs;
+	int found = gpiod_count(dev, con_id);
+
+	if (found == -ENOENT)
+		return NULL;
+
+	if (found != expected) {
+		dev_err(dev, "ignoring %s-gpios: found %d, expected %u\n",
+			con_id, found, expected);
+		return NULL;
+	}
+
+	descs = devm_gpiod_get_array_optional(dev, con_id, flags);
+
+	if (IS_ERR(descs)) {
+		dev_err(dev, "failed to get %s-gpios: %ld\n",
+			con_id, PTR_ERR(descs));
+		return NULL;
+	}
+
+	return descs;
+}
+
+static int max3191x_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct max3191x_chip *max3191x;
+	int n, ret;
+	u32 mode;
+
+	max3191x = devm_kzalloc(dev, sizeof(*max3191x), GFP_KERNEL);
+	if (!max3191x)
+		return -ENOMEM;
+	spi_set_drvdata(spi, max3191x);
+
+	max3191x->nchips = 1;
+	device_property_read_u32(dev, "maxim,nchips", &max3191x->nchips);
+
+	n = BITS_TO_LONGS(max3191x->nchips);
+	max3191x->crc_error   = devm_kcalloc(dev, n, sizeof(long), GFP_KERNEL);
+	max3191x->undervolt1  = devm_kcalloc(dev, n, sizeof(long), GFP_KERNEL);
+	max3191x->undervolt2  = devm_kcalloc(dev, n, sizeof(long), GFP_KERNEL);
+	max3191x->overtemp    = devm_kcalloc(dev, n, sizeof(long), GFP_KERNEL);
+	max3191x->fault       = devm_kcalloc(dev, n, sizeof(long), GFP_KERNEL);
+	max3191x->xfer.rx_buf = devm_kcalloc(dev, max3191x->nchips,
+								2, GFP_KERNEL);
+	if (!max3191x->crc_error || !max3191x->undervolt1 ||
+	    !max3191x->overtemp  || !max3191x->undervolt2 ||
+	    !max3191x->fault     || !max3191x->xfer.rx_buf)
+		return -ENOMEM;
+
+	max3191x->modesel_pins = devm_gpiod_get_array_optional_count(dev,
+				 "modesel", GPIOD_ASIS, max3191x->nchips);
+	max3191x->fault_pins   = devm_gpiod_get_array_optional_count(dev,
+				 "fault", GPIOD_IN, max3191x->nchips);
+	max3191x->db0_pins     = devm_gpiod_get_array_optional_count(dev,
+				 "db0", GPIOD_OUT_LOW, max3191x->nchips);
+	max3191x->db1_pins     = devm_gpiod_get_array_optional_count(dev,
+				 "db1", GPIOD_OUT_LOW, max3191x->nchips);
+
+	max3191x->mode = STATUS_BYTE_ENABLED;
+	if (!device_property_read_u32(dev, "maxim,modesel", &mode)) {
+		if (mode == STATUS_BYTE_ENABLED ||
+		    mode == STATUS_BYTE_DISABLED) {
+			max3191x->mode = mode;
+			max3191x->mode_hardwired = true;
+		} else {
+			dev_err(dev, "ignoring invalid maxim,modesel %d\n",
+				mode);
+		}
+	}
+	if (max3191x->modesel_pins)
+		gpiod_set_array_single_value_cansleep(
+			max3191x->modesel_pins->ndescs,
+			max3191x->modesel_pins->desc, max3191x->mode);
+
+	max3191x->has_vcc24v = !device_property_read_bool(dev,
+							  "maxim,no-vcc24v");
+
+	max3191x->xfer.len = max3191x->nchips * max3191x_wordlen(max3191x);
+	spi_message_init_with_transfers(&max3191x->mesg, &max3191x->xfer, 1);
+
+	max3191x->gpio.label = spi->modalias;
+	max3191x->gpio.owner = THIS_MODULE;
+	max3191x->gpio.parent = dev;
+	max3191x->gpio.base = -1;
+	max3191x->gpio.ngpio = max3191x->nchips * MAX3191X_NGPIO;
+	max3191x->gpio.can_sleep = true;
+
+	max3191x->gpio.get_direction = max3191x_get_direction;
+	max3191x->gpio.direction_input = max3191x_direction_input;
+	max3191x->gpio.direction_output = max3191x_direction_output;
+	max3191x->gpio.set = max3191x_set;
+	max3191x->gpio.set_multiple = max3191x_set_multiple;
+	max3191x->gpio.get = max3191x_get;
+	max3191x->gpio.get_multiple = max3191x_get_multiple;
+	max3191x->gpio.set_config = max3191x_set_config;
+
+	mutex_init(&max3191x->lock);
+
+	ret = gpiochip_add_data(&max3191x->gpio, max3191x);
+	if (ret) {
+		mutex_destroy(&max3191x->lock);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int max3191x_remove(struct spi_device *spi)
+{
+	struct max3191x_chip *max3191x = spi_get_drvdata(spi);
+
+	gpiochip_remove(&max3191x->gpio);
+	mutex_destroy(&max3191x->lock);
+
+	return 0;
+}
+
+static int __init max3191x_register_driver(struct spi_driver *sdrv)
+{
+	crc8_populate_msb(max3191x_crc8, MAX3191X_CRC8_POLYNOMIAL);
+	return spi_register_driver(sdrv);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id max3191x_of_id[] = {
+	{ .compatible = "maxim,max31910" },
+	{ .compatible = "maxim,max31911" },
+	{ .compatible = "maxim,max31912" },
+	{ .compatible = "maxim,max31913" },
+	{ .compatible = "maxim,max31953" },
+	{ .compatible = "maxim,max31963" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max3191x_of_id);
+#endif
+
+static const struct spi_device_id max3191x_spi_id[] = {
+	{ "max31910" },
+	{ "max31911" },
+	{ "max31912" },
+	{ "max31913" },
+	{ "max31953" },
+	{ "max31963" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
+
+static struct spi_driver max3191x_driver = {
+	.driver = {
+		.name		= "max3191x",
+		.of_match_table	= of_match_ptr(max3191x_of_id),
+	},
+	.probe	  = max3191x_probe,
+	.remove	  = max3191x_remove,
+	.id_table = max3191x_spi_id,
+};
+module_driver(max3191x_driver, max3191x_register_driver, spi_unregister_driver);
+
+MODULE_AUTHOR("Lukas Wunner <lukas@wunner.de>");
+MODULE_DESCRIPTION("GPIO driver for Maxim MAX3191x industrial serializer");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

