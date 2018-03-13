Return-Path: <SRS0=tMPn=GD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:55204 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750860AbeCMMqG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 13 Mar 2018 08:46:06 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v3] leds: add LED driver for CR0014114 board
Date: Tue, 13 Mar 2018 14:45:48 +0200
Message-Id: <20180313124548.12074-1-oleg@kaa.org.ua>
In-Reply-To: <20180312155829.12365-1-oleg@kaa.org.ua>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
List-ID: <devicetree@vger.kernel.org>

This patch adds a LED class driver for the RGB LEDs found on
the Crane Merchandising System CR0014114 LEDs board.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    |  46 ++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/leds/Kconfig                               |  13 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-cr0014114.c                      | 292 +++++++++++++++++++++
 5 files changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
 create mode 100644 drivers/leds/leds-cr0014114.c

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
new file mode 100644
index 000000000000..977a9929b04f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
@@ -0,0 +1,46 @@
+Crane Merchandising System - cr0014114 LED driver
+-------------------------------------------------
+
+This LED Board is widely used in vending machines produced
+by Crane Merchandising Systems.
+
+Required properties:
+- compatible: "cms,cr0014114"
+- reg: chip select address for the device
+- spi-cpha: shifted clock phase mode is required
+
+LED sub-node properties:
+- label : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+
+Example
+-------
+
+cr0014114@0 {
+	compatible = "crane,cr0014114";
+	reg = <0>;
+	spi-max-frequency = <50000>;
+	spi-cpha;
+
+	led0 {
+		label = "cr0:red:";
+	};
+	led1 {
+		label = "cr0:green:";
+	};
+	led2 {
+		label = "cr0:blue:";
+	};
+	led3 {
+		label = "cr1:red:";
+	};
+	led4 {
+		label = "cr1:green:";
+	};
+	led5 {
+		label = "cr1:blue:";
+	};
+	...
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ae850d6c0ad3..f17949c365f5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
 compulab	CompuLab Ltd.
 cortina	Cortina Systems, Inc.
 cosmic	Cosmic Circuits
+crane	Crane Connectivity Solutions
 creative	Creative Technology Ltd
 crystalfontz	Crystalfontz America, Inc.
 cubietech	Cubietech, Ltd.
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2c896c0e69e1..5831814d01d0 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -104,6 +104,19 @@ config LEDS_CPCAP
 	  This option enables support for LEDs offered by Motorola's
 	  CPCAP PMIC.
 
+config LEDS_CR0014114
+	tristate "LED Support for Crane CR0014114"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF
+	help
+	  This option enables support for CR0014114 LED Board which
+	  is widely used in vending machines produced by
+	  Crane Merchandising Systems.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-cr0014114.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 91eca81cae82..0176e7335994 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
 
 # LED SPI Drivers
+obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 
 # LED Userspace Drivers
diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
new file mode 100644
index 000000000000..ef536a67dceb
--- /dev/null
+++ b/drivers/leds/leds-cr0014114.c
@@ -0,0 +1,292 @@
+/*
+ * LEDs driver for Crane CR0014114
+ *
+ * Copyright (C) 2018 Oleh Kravchenko <oleg@kaa.org.ua>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/delay.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <linux/workqueue.h>
+
+/* CR0014114 SPI commands */
+#define CR_SET_BRIGHTNESS	0x80
+#define CR_INIT_REENUMERATE	0x81
+#define CR_NEXT_REENUMERATE	0x82
+
+/* CR0014114 default settings */
+#define CR_MAX_BRIGHTNESS	GENMASK(6, 0)
+#define CR_FW_DELAY_MSEC	10
+#define CR_RECOUNT_DELAY	(HZ * 3600)
+
+struct cr0014114_led {
+	const char		*name;
+	struct cr0014114	*priv;
+	struct led_classdev	ldev;
+	u8			brightness;
+};
+
+struct cr0014114 {
+	bool			do_recount;
+	size_t			count;
+	struct device		*dev;
+	struct mutex		lock;
+	struct spi_device	*spi;
+	struct timer_list	timer;
+	struct work_struct	work;
+	unsigned long		delay;
+	struct cr0014114_led	leds[];
+};
+
+static void cr0014114_calc_crc(u8 *buf, const size_t len)
+{
+	size_t	i;
+	u8	crc;
+
+	for (i = 1, crc = 1; i < len - 1; i++)
+		crc += buf[i];
+	crc |= BIT(7);
+
+	/* special case when CRC matches the SPI commands */
+	if (crc == CR_SET_BRIGHTNESS ||
+	    crc == CR_INIT_REENUMERATE ||
+	    crc == CR_NEXT_REENUMERATE)
+		crc = 0xfe;
+
+	buf[len - 1] = crc;
+}
+
+static int cr0014114_recount(struct cr0014114 *priv)
+{
+	int	ret;
+	size_t	i;
+	u8	cmd;
+
+	dev_dbg(priv->dev, "recount of LEDs is started\n");
+
+	do {
+		cmd = CR_INIT_REENUMERATE;
+		ret = spi_write(priv->spi, &cmd, sizeof(cmd));
+		if (ret)
+			break;
+
+		cmd = CR_NEXT_REENUMERATE;
+		for (i = 0; i < priv->count; i++) {
+			msleep(CR_FW_DELAY_MSEC);
+
+			ret = spi_write(priv->spi, &cmd, sizeof(cmd));
+			if (ret)
+				break;
+		}
+	} while (0);
+
+	dev_dbg(priv->dev, "recount of LEDs is complete, error: %d\n", ret);
+
+	return ret;
+}
+
+static int cr0014114_sync(struct cr0014114 *priv)
+{
+	int		ret;
+	size_t		i;
+	u8		data[priv->count + 2];
+	unsigned long	udelay, now = jiffies;
+
+	/* to avoid SPI mistiming with firmware we should wait some time */
+	if (time_after(priv->delay, now)) {
+		udelay = jiffies_to_usecs(priv->delay - now);
+		usleep_range(udelay, udelay + 1);
+	}
+
+	do {
+		if (unlikely(priv->do_recount)) {
+			ret = cr0014114_recount(priv);
+			if (ret)
+				break;
+
+			priv->do_recount = false;
+		}
+
+		data[0] = CR_SET_BRIGHTNESS;
+		for (i = 0; i < priv->count; i++)
+			data[i + 1] = priv->leds[i].brightness;
+		cr0014114_calc_crc(data, sizeof(data));
+
+		ret = spi_write(priv->spi, data, sizeof(data));
+		if (ret)
+			break;
+	} while (0);
+
+	priv->delay = jiffies + msecs_to_jiffies(CR_FW_DELAY_MSEC);
+
+	return ret;
+}
+
+static void cr0014114_recount_work(struct work_struct *work)
+{
+	int			ret;
+	struct cr0014114	*priv = container_of(work, struct cr0014114,
+						     work);
+
+	mutex_lock(&priv->lock);
+	priv->do_recount = true;
+	ret = cr0014114_sync(priv);
+	mutex_unlock(&priv->lock);
+
+	if (ret)
+		dev_warn(priv->dev, "recount LEDs failed %d\n", ret);
+}
+
+static int cr0014114_set_sync(struct led_classdev *ldev,
+			      enum led_brightness brightness)
+{
+	int			ret;
+	struct cr0014114_led    *led = container_of(ldev,
+						    struct cr0014114_led,
+						    ldev);
+
+	mutex_lock(&led->priv->lock);
+	led->brightness = (u8)brightness;
+	ret = cr0014114_sync(led->priv);
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static void cr0014114_recount_timer(struct timer_list *t)
+{
+	struct cr0014114 *priv = from_timer(priv, t, timer);
+
+	schedule_work(&priv->work);
+	mod_timer(&priv->timer, jiffies + CR_RECOUNT_DELAY);
+}
+
+static int cr0014114_probe_dt(struct cr0014114 *priv)
+{
+	size_t			i = 0;
+	struct cr0014114_led	*led;
+	struct fwnode_handle	*child;
+	struct device_node	*np;
+	int			ret;
+
+	device_for_each_child_node(priv->dev, child) {
+		np = to_of_node(child);
+		led = &priv->leds[i];
+
+		ret = fwnode_property_read_string(child, "label",
+						  &led->name);
+		if (ret && IS_ENABLED(CONFIG_OF) && np)
+			led->name = np->name;
+
+		if (!led->name) {
+			fwnode_handle_put(child);
+			return -EINVAL;
+		}
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->ldev.default_trigger);
+
+		led->priv			  = priv;
+		led->ldev.name			  = led->name;
+		led->ldev.brightness		  = LED_OFF;
+		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
+		led->ldev.brightness_set_blocking = cr0014114_set_sync;
+
+		ret = devm_of_led_classdev_register(priv->dev, np,
+						    &led->ldev);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
+
+		led->ldev.dev->of_node = np;
+
+		i++;
+	}
+
+	return 0;
+}
+
+static int cr0014114_probe(struct spi_device *spi)
+{
+	struct cr0014114	*priv;
+	size_t			count;
+	int			ret;
+
+	count = device_get_child_node_count(&spi->dev);
+	if (!count) {
+		dev_err(&spi->dev, "LEDs are not defined in device tree");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&spi->dev,
+			    sizeof(*priv) + sizeof(*priv->leds) * count,
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+	INIT_WORK(&priv->work, cr0014114_recount_work);
+	priv->do_recount	= true;
+	priv->count		= count;
+	priv->dev		= &spi->dev;
+	priv->spi		= spi;
+
+	ret = cr0014114_probe_dt(priv);
+	if (ret)
+		return ret;
+
+	ret = cr0014114_sync(priv);
+	if (ret)
+		return ret;
+
+	/* setup recount timer to workaround buggy firmware */
+	timer_setup(&priv->timer, cr0014114_recount_timer, 0);
+	mod_timer(&priv->timer, jiffies + CR_RECOUNT_DELAY);
+
+	spi_set_drvdata(spi, priv);
+
+	return 0;
+}
+
+static int cr0014114_remove(struct spi_device *spi)
+{
+	struct cr0014114 *priv = spi_get_drvdata(spi);
+
+	cancel_work_sync(&priv->work);
+	del_timer_sync(&priv->timer);
+
+	return 0;
+}
+
+static const struct of_device_id cr0014114_dt_ids[] = {
+	{ .compatible = "crane,cr0014114", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, cr0014114_dt_ids);
+
+static struct spi_driver cr0014114_driver = {
+	.probe		= cr0014114_probe,
+	.remove		= cr0014114_remove,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= cr0014114_dt_ids,
+	},
+};
+
+module_spi_driver(cr0014114_driver);
+
+MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
+MODULE_DESCRIPTION("cr0014114 LED driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("spi:cr0014114");
-- 
2.13.6

