Return-Path: <SRS0=oCC0=MH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 3/3] Input: add generic gpio brownout driver
Date: Tue, 25 Sep 2018 11:42:30 +0200
Message-Id: <20180925094230.32679-4-m.felsch@pengutronix.de>
In-Reply-To: <20180925094230.32679-1-m.felsch@pengutronix.de>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

A brownout can be detected in several ways e.g. a deticated pin on the
soc, a external pmic or by another external hardware which informs the
host via a gpio line.

This patch adds the support for a generic gpio-based brownout
detection. Upon a brownout the host system gets informed and the driver
sends a keycode signal to the userspace. Per default this signal is
mapped to KEY_POWER, so the system will shoutdown.

Additional the driver supports releasing registered devices from their
drivers, see Documentation/devicetree/bindings/input/gpio-brownout.txt
for more details.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/input/gpio-brownout.txt          |  36 ++++
 drivers/input/misc/Kconfig                    |  12 ++
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/gpio-brownout.c            | 166 ++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/gpio-brownout.txt
 create mode 100644 drivers/input/misc/gpio-brownout.c

diff --git a/Documentation/devicetree/bindings/input/gpio-brownout.txt b/Documentation/devicetree/bindings/input/gpio-brownout.txt
new file mode 100644
index 000000000000..55fbe2aa52a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-brownout.txt
@@ -0,0 +1,36 @@
+Device-Tree bindings for input/gpio_brownout.c driver
+
+Required properties:
+- compatible: Must be "gpio-brownout"
+- interrupt-parent: The phandle to the interrupt controller. For more details
+  see ../interrupt-controller/interrupts.txt.
+- interrupts: The interrupt line for a brownout detection. For more details
+  see ../interrupt-controller/interrupts.txt.
+
+Optional properties:
+- linux,code: Keycode to emit upon a brownout detection, default: KEY_POWER.
+- release-devices: A list of i2c or spi device phandles. All listed devices
+  will be released from their drivers in the order they listed upon a brownout
+  detection. This can be helpful to avoid a interrupt flood, because some
+  system designs power off all external devices immediately and keep the host
+  on for a certain time.
+
+Example:
+
+i2c3 {
+	temp_core: lm75@48 { };
+	temp_chassis: lm75@49 { };
+};
+
+spi1 {
+	ts: ad7879@1 { };
+};
+
+/ {
+	gpio_brownout_det {
+		compatible = "gpio-brownout";
+		interrupts-parent = <&gpio3>;
+		interrupts = <3 IRQ_TYPE_EDGE_LOW>:
+		release-devices = <&temp_core &ts>;
+	};
+};
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index ca59a2be9bc5..6b49e681cca7 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -268,6 +268,18 @@ config INPUT_GPIO_BEEPER
 	  To compile this driver as a module, choose M here: the
 	  module will be called gpio-beeper.
 
+config INPUT_GPIO_BROWNOUT
+	tristate "Generic GPIO Brownout detection support"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y here if you have a brownout signal connected to a GPIO pin
+	  and want to report a keycode signal on a brownout detection.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gpio-brownout.
+
 config INPUT_GPIO_DECODER
 	tristate "Polled GPIO Decoder Input driver"
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 9d0f9d1ff68f..8b872b5fc84a 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_INPUT_DRV2665_HAPTICS)	+= drv2665.o
 obj-$(CONFIG_INPUT_DRV2667_HAPTICS)	+= drv2667.o
 obj-$(CONFIG_INPUT_GP2A)		+= gp2ap002a00f.o
 obj-$(CONFIG_INPUT_GPIO_BEEPER)		+= gpio-beeper.o
+obj-$(CONFIG_INPUT_GPIO_BROWNOUT)	+= gpio-brownout.o
 obj-$(CONFIG_INPUT_GPIO_DECODER)	+= gpio_decoder.o
 obj-$(CONFIG_INPUT_HISI_POWERKEY)	+= hisi_powerkey.o
 obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
diff --git a/drivers/input/misc/gpio-brownout.c b/drivers/input/misc/gpio-brownout.c
new file mode 100644
index 000000000000..23992b9e2814
--- /dev/null
+++ b/drivers/input/misc/gpio-brownout.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * gpio-brownout.c - Generic power fail driver
+ *
+ * Copyright (C) 2018 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+
+#define GPIO_BROWNOUT_MOD_NAME "gpio-brownout"
+
+struct gpio_brownout_device {
+	struct list_head  list;
+	struct device *dev;
+};
+
+struct gpio_brownout {
+	struct device *dev;
+	struct input_dev *idev;
+	unsigned short kcode;
+	struct list_head devices;
+};
+
+static irqreturn_t gpio_brownout_isr(int irq, void *dev_id)
+{
+	struct gpio_brownout *gb = dev_id;
+	struct input_dev *idev = gb->idev;
+	struct gpio_brownout_device *bout_dev, *tmp;
+
+	/* first inform userspace */
+	input_report_key(idev, gb->kcode, 1);
+	input_sync(idev);
+
+	/* now unregister registered drivers */
+	list_for_each_entry_safe(bout_dev, tmp, &gb->devices, list) {
+		device_release_driver(bout_dev->dev);
+		list_del(&bout_dev->list);
+	}
+
+	return IRQ_HANDLED;
+}
+
+#ifdef CONFIG_OF
+static int gpio_brownout_probe_dt(struct gpio_brownout *gb)
+{
+	struct device_node *np = gb->dev->of_node;
+	struct of_phandle_iterator it;
+	unsigned int kcode;
+	int ret;
+
+	/* all dt-properties are optional */
+	of_property_read_u32(np, "linux,code", &kcode);
+	gb->kcode = kcode;
+
+	/*
+	 * Register all devices which should be unbinded upon a brownout
+	 * detection. At the moment only i2c and spi devices are supported
+	 */
+	of_for_each_phandle(&it, ret, np, "release-devices", NULL, 0) {
+		struct gpio_brownout_device *elem;
+		struct i2c_client *i2c_c;
+		struct spi_device *spi_c;
+
+		i2c_c = of_find_i2c_device_by_node(it.node);
+		spi_c = of_find_spi_device_by_node(it.node);
+
+		if (!i2c_c && !spi_c)
+			return -EPROBE_DEFER;
+		else if (i2c_c && spi_c)
+			return -EINVAL;
+
+		elem = devm_kzalloc(gb->dev, sizeof(*elem), GFP_KERNEL);
+		if (!elem)
+			return -ENOMEM;
+
+		elem->dev = i2c_c ? &i2c_c->dev : &spi_c->dev;
+
+		INIT_LIST_HEAD(&elem->list);
+		list_add_tail(&elem->list, &gb->devices);
+	}
+
+	return 0;
+}
+#endif
+
+static int gpio_brownout_probe(struct platform_device *pdev)
+{
+	struct gpio_brownout *gb;
+	struct input_dev *idev;
+	int ret, irq;
+
+	gb = devm_kzalloc(&pdev->dev, sizeof(*gb), GFP_KERNEL);
+	if (!gb)
+		return -ENOMEM;
+
+	idev = devm_input_allocate_device(&pdev->dev);
+	if (!idev)
+		return -ENOMEM;
+
+	gb->dev = &pdev->dev;
+	gb->idev = idev;
+	INIT_LIST_HEAD(&gb->devices);
+
+	if (IS_ENABLED(CONFIG_OF)) {
+		ret = gpio_brownout_probe_dt(gb);
+		if (ret) {
+			dev_err(&pdev->dev, "probe_dt failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	idev->name = pdev->name;
+	gb->kcode = gb->kcode == KEY_RESERVED ? KEY_POWER : gb->kcode;
+
+	input_set_capability(idev, EV_KEY, gb->kcode);
+
+	irq = platform_get_irq(pdev, 0);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					gpio_brownout_isr, IRQF_ONESHOT,
+					GPIO_BROWNOUT_MOD_NAME, gb);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "IRQ request failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = input_register_device(idev);
+	if (ret) {
+		dev_err(&pdev->dev, "Input register failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_brownout_of_match[] = {
+	{ .compatible = GPIO_BROWNOUT_MOD_NAME, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, arm_gpio_brownout_of_match);
+#endif
+
+static struct platform_driver gpio_brownout_driver = {
+	.driver = {
+		.name = GPIO_BROWNOUT_MOD_NAME,
+		.of_match_table = of_match_ptr(gpio_brownout_of_match)
+	},
+	.probe = gpio_brownout_probe,
+};
+
+module_platform_driver(gpio_brownout_driver);
+
+MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("GPIO Brownout Detection");
+MODULE_LICENSE("GPL v2");
-- 
2.19.0
